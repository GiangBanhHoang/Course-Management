using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Courses_MVC.Data;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Authorization;

namespace Courses_MVC.Controllers
{
    public class LessonController : Controller
    {
        private readonly CoursesContext _context;

        public LessonController(CoursesContext context)
        {
            _context = context;
        }
       
        //Khánh Duy//
        [TempData]
        public string StatusMessage { get; set; }
        public IActionResult LessonCourse(int id)
        {
           
            var courseDetail = (_context.Lessons
                                .Where(l => l.courseId == id)
                                .Include(l => l.Course)
                                ).ToList();
            var listCmt = _context.Comments.Include(c => c.AppUser).Include(c => c.Course).Where(c=>c.courseId == id).ToList();
            ViewBag.listCmt = listCmt;
            var countCmt = listCmt.Count();
            ViewBag.countCmt = countCmt;
            if (courseDetail.ToArray().Length ==0)
            {
                StatusMessage = "Khóa học đang được phát triển";
                return Redirect("/Courses/DanhSachHienTHi");
            }    
            else
            {
                return View(courseDetail);
            }               
        }
        public IActionResult LessonDetail(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var lessonDetail = (_context.Lessons
                                .Include(l => l.Course)
                                ).FirstOrDefault(l => l.lessonId == id);
            if (lessonDetail == null)
            {
                return NotFound();
            }   
            var listLessonInCourseId = _context.Lessons
                                        .Include(l =>l.Course)
                                        .Where( c => c.courseId == lessonDetail.courseId)
                                        .ToList();
            ViewBag.listLesson = listLessonInCourseId.ToArray();                                                  
            var listExercise = _context.Exercises
                                .Where(e => e.lessonId == id)
                                .ToList();
            ViewBag.listExercise = listExercise;
            ViewBag.numberOfExercise = listExercise.Count();
            return View(lessonDetail);
        }

        [Authorize(Policy = "QuanTriVien")]
        public async Task<IActionResult> ListlessonAdmin()
        {
            var listlesson = _context.Lessons
                            .Include(l => l.Course);
            var count = listlesson.Count();
            ViewData["count"] = count;
            return View(await listlesson.ToListAsync()); 
            
        }

        [Authorize(Policy = "QuanTriVien")]
        [HttpPost]
        public async Task<IActionResult> ListlessonAdmin(string? searchString)
        {
            var listlesson = _context.Lessons
                            .Include(l => l.Course);
            var count = listlesson.Count();
            
            if (!string.IsNullOrEmpty(searchString))
            {
                listlesson = listlesson.Where(l => l.title.Contains(searchString)).Include(l => l.Course);
                count = listlesson.Count();
            }    
            else
            {
                listlesson = _context.Lessons
                            .Include(l => l.Course);
                count = listlesson.Count();
            }
            ViewData["count"] = count;
            return View(await listlesson.ToListAsync());
        }

        [Authorize(Policy = "QuanTriVien")]
        public IActionResult Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var lesson = _context.Lessons.Include(l => l.Course).FirstOrDefault(l => l.lessonId == id);
            if (lesson == null)
            {
                return NotFound();
            }
            return View(lesson);

        }

        [Authorize(Policy = "QuanTriVien")]
        public IActionResult CreateLesson()
        {
            ViewData["courseId"] = new SelectList(_context.Courses, "courseId", "courseName");
            return View();
        }

        [Authorize(Policy = "QuanTriVien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateLesson(Lesson lesson)
        {
            if (ModelState.IsValid)
            {
                _context.Lessons.Add(lesson);
                await _context.SaveChangesAsync();
                StatusMessage = $"Thêm thành công";
                return RedirectToAction(nameof(ListlessonAdmin));
            }
            else
            {
                StatusMessage = $"Thêm không thành công";
                return RedirectToAction(nameof(ListlessonAdmin));
            }

        }

        [Authorize(Policy = "QuanTriVien")]
        public async Task<IActionResult> Updatelesson(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var lessonNeedUpdate = await _context.Lessons.Include(l => l.Course).FirstOrDefaultAsync(l => l.lessonId == id);
            if (lessonNeedUpdate == null)
            {
                return NotFound();
            }
            ViewData["courseId"] = new SelectList(_context.Courses, "courseId", "courseName");
            return View(lessonNeedUpdate);
        }

        [Authorize(Policy = "QuanTriVien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Updatelesson(int id, Lesson lessonUpdate)
        {
            var lesson = await _context.Lessons.FirstOrDefaultAsync(l => l.lessonId == lessonUpdate.lessonId);
            if (ModelState.IsValid)
            {
                //lesson.lessonId = lessonUpdate.lessonId;
                lesson.title = lessonUpdate.title;
                lesson.content = lessonUpdate.content;
                lesson.description = lessonUpdate.description;
                lesson.courseId = lessonUpdate.courseId;
                _context.SaveChanges();
                StatusMessage = $"Cập nhật thành công";
                return RedirectToAction(nameof(ListlessonAdmin));
            }
            else
            {
                StatusMessage = $"Cập nhật không thành công";
                return RedirectToAction(nameof(ListlessonAdmin));
            }

        }

        [Authorize(Policy = "QuanTriVien")]
        public IActionResult DeleteLesson(int? id)
        {


            if (id == null)
            {
                return NotFound();
            }

            var lesson = _context.Lessons.Include(l => l.Course)
                                .FirstOrDefault(m => m.lessonId == id);
            if (lesson == null)
            {
                return NotFound();
            }

            return View(lesson);
        }

        [Authorize(Policy = "QuanTriVien")]
        [HttpPost, ActionName("DeleteLesson")]
        [ValidateAntiForgeryToken]

        public async Task<IActionResult> DeleteLessonConfirm(int? id)
        {
            var lesson = await _context.Lessons.FirstOrDefaultAsync(l => l.lessonId == id);
            if (lesson == null)
            {
                StatusMessage = $"Xóa không thành công";
                return RedirectToAction(nameof(ListlessonAdmin));
            }
            _context.Lessons.Remove(lesson);
            await _context.SaveChangesAsync();
            StatusMessage = $"Xóa thành công";
            return RedirectToAction(nameof(ListlessonAdmin));
        }

       

        private bool LessonExists(int id)
        {
            return _context.Lessons.Any(e => e.lessonId == id);
        }
    }
}
