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
    public class ExercisesController : Controller
    {
        private readonly CoursesContext _context;

        public ExercisesController(CoursesContext context)
        {
            _context = context;
        }

        [TempData]
        public string StatusMessage { get; set; }

        [Authorize(Policy = "QuanTriVien")]
        public async Task<IActionResult> ListExerciseAdmin()
        {
            var listExercises = await _context.Exercises.Include(e => e.AppUser).Include(e => e.Lesson).ToListAsync();
            var count = listExercises.Count();
            ViewData["count"] = count;
            return View(listExercises);
        }

        [Authorize(Policy = "QuanTriVien")]
        [HttpPost]
        public async Task<IActionResult> ListExerciseAdmin(string? searchString)
        {
            var listExercises = _context.Exercises.Include(e => e.AppUser).Include(e => e.Lesson);
            var count = listExercises.Count();
            
            if (!string.IsNullOrEmpty(searchString))
            {
                listExercises = listExercises.Where(e => e.Lesson.title.Contains(searchString)).Include(e => e.AppUser).Include(e => e.Lesson);
                count = listExercises.Count();
            }
            else
            {
                StatusMessage = $"Không tìm thấy";
                listExercises = _context.Exercises.Include(e => e.AppUser).Include(e => e.Lesson);
                count = listExercises.Count();
            }
            ViewData["count"] = count;
            return View(await listExercises.ToListAsync());
        }

        // GET: Exercises/Details/5
        public async Task<IActionResult> DetailsInUI(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var exercise = await _context.Exercises
                .Include(e => e.AppUser)
                .Include(e => e.Lesson)
                .FirstOrDefaultAsync(m => m.exerciseId == id);
            if (exercise == null)
            {
                return NotFound();
            }
            var listId = _context.Exercises
                           .Include(e => e.Lesson)
                           .Include(e => e.AppUser)
                           .Where(e => e.lessonId == exercise.lessonId)
                           .ToList();
            ViewBag.listIdExercise = listId.ToArray();
            return View(exercise);
        }

        [Authorize(Policy = "QuanTriVien")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var exercise = await _context.Exercises
                .Include(e => e.AppUser)
                .Include(e => e.Lesson)
                .FirstOrDefaultAsync(m => m.exerciseId == id);
            if (exercise == null)
            {
                return NotFound();
            }

            return View(exercise);
        }

        [Authorize(Policy = "QuanTriVien")]
        public IActionResult CreateExercise()
        {
            ViewData["userId"] = new SelectList(_context.Users, "Id", "UserName");
            ViewData["lessonId"] = new SelectList(_context.Lessons, "lessonId", "title");
            return View();
        }
        [HttpPost]
        [Authorize(Policy = "QuanTriVien")]
        [ValidateAntiForgeryToken]
        public IActionResult CreateExercise(Exercise exer)
        {
            if (ModelState.IsValid)
            {
                _context.Exercises.Add(exer);
                _context.SaveChanges();
                StatusMessage = $"Thêm thành công";
                return RedirectToAction(nameof(ListExerciseAdmin));
            }
            else
            {
                StatusMessage = $"Thêm không thành công";
                return RedirectToAction(nameof(ListExerciseAdmin));
            }
            ViewData["userId"] = new SelectList(_context.Users, "Id", "UserName");
            ViewData["lessonId"] = new SelectList(_context.Lessons, "lessonId", "title");
            return View(exer);
        }

        [Authorize(Policy = "QuanTriVien")]
        public IActionResult UpdateExercise(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var exercise = _context.Exercises.FirstOrDefault(e => e.exerciseId == id);
            if (exercise == null)
            {
                return NotFound();
            }
            ViewData["userId"] = new SelectList(_context.Users, "Id", "UserName");
            ViewData["lessonId"] = new SelectList(_context.Lessons, "lessonId", "title");
            return View(exercise);
        }


        [HttpPost]
        [Authorize(Policy = "QuanTriVien")]
        [ValidateAntiForgeryToken]
        public IActionResult UpdateExercise(Exercise exercise)
        {
            if(exercise.exerciseId == 0)
            {
                return NotFound();
            }
            var exerUpdate = _context.Exercises.Include(c=>c.AppUser).FirstOrDefault(e => e.exerciseId == exercise.exerciseId);
            var idlesson = exercise.lessonId;
            if (exerUpdate != null)
            {
                exerUpdate.exerciseName = exercise.exerciseName;
                exerUpdate.content = exercise.content;
                exerUpdate.input = exercise.input;
                exerUpdate.output = exercise.output;
                exerUpdate.deadline = exercise.deadline;
                exerUpdate.userId = exercise.userId;
                exerUpdate.lessonId = exerUpdate.lessonId;

                _context.SaveChanges();
                StatusMessage = $"Cập nhật thành công";
                return RedirectToAction(nameof(ListExerciseAdmin));
            }
            else
            {
                StatusMessage = $"Cập nhật không thành công";
                return RedirectToAction(nameof(ListExerciseAdmin));
            }
        }

        [Authorize(Policy = "QuanTriVien")]
        public IActionResult DeleteExercise(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var exercise = _context.Exercises.Include(e => e.Lesson).Include(e => e.AppUser).FirstOrDefault(e => e.exerciseId == id);
            if (exercise == null)
            {
                return NotFound();
            }
            return View(exercise);
        }

        [HttpPost, ActionName("DeleteExercise")]
        [ValidateAntiForgeryToken]
        [Authorize(Policy = "QuanTriVien")]
        public IActionResult DeleteExerciseConfirm(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var execiseDelete = _context.Exercises.FirstOrDefault(e => e.exerciseId == id);
            _context.Exercises.Remove(execiseDelete);
            _context.SaveChanges();
            StatusMessage = $"Xóa thành công";
            return RedirectToAction(nameof(ListExerciseAdmin));

        }
  

        private bool ExerciseExists(int id)
        {
            return _context.Exercises.Any(e => e.exerciseId == id);
        }
    }
}
