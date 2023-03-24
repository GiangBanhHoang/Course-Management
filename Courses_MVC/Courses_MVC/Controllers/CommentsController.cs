using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Courses_MVC.Data;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Identity;

namespace Courses_MVC.Controllers
{
    public class CommentsController : Controller
    {
        private readonly CoursesContext _context;
        private readonly UserManager<AppUser> _userManager;

        public CommentsController(CoursesContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        [TempData]
        public string StatusMessage { get; set; }

        // GET: Comments
        public async Task<IActionResult> DanhSachBinhLuan()
        {
            var cmtContext = _context.Comments.Include(c => c.AppUser).Include(c => c.Course);
            var count = cmtContext.Count();
            ViewData["count"] = count;
            return View(await cmtContext.ToListAsync());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DanhSachBinhLuan(string search)
        {
            var cmtContext = from cmt in _context.Comments select cmt;
            var count = cmtContext.Count();
            if (!string.IsNullOrEmpty(search))
            {
                cmtContext = cmtContext.Where(c => c.AppUser.UserName.Contains(search)).Include(c => c.AppUser).Include(c => c.Course);
                count = cmtContext.Count();
            }
            else
            {
                cmtContext = cmtContext.Include(c => c.AppUser).Include(c => c.Course);
            }
            ViewData["count"] = count;
            return View(await cmtContext.ToListAsync());
        }

        // GET: Comments/Details/5
        public async Task<IActionResult> ChiTietBinhLuan(int id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var comment = await _context.Comments
                .Include(c => c.AppUser)
                .Include(c => c.Course)
                .FirstOrDefaultAsync(m => m.cmtId == id);
            if (comment == null)
            {
                return NotFound();
            }

            return View(comment);
        }

        
        public async Task<IActionResult> CapNhatBinhLuan(int id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var comment = await _context.Comments
                .Include(c => c.AppUser)
                .Include(c => c.Course)
                .FirstOrDefaultAsync(m => m.cmtId == id);
            ViewData["user"] = new SelectList(_context.Users, "Id", "UserName", comment.userId);
            ViewData["course"] = new SelectList(_context.Courses, "courseId", "courseName", comment.courseId);
            if (comment == null)
            {
                return NotFound();
            }

            return View(comment);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CapNhatBinhLuan(int id, Comment comment)
        {
            if (comment.cmtId == null)
            {
                return NotFound();
            }

            var result = await _context.Comments
               .Where(c => c.cmtId == id).Include(e => e.AppUser).Include(e => e.Course).FirstOrDefaultAsync();

            if (result != null)
            {
                result.content = comment.content;
                result.evaluate = comment.evaluate;
                
                _context.SaveChanges(); ;
                StatusMessage = $"Cập nhật thành công";
                return RedirectToAction(nameof(DanhSachBinhLuan));
            }
            else
            {
                StatusMessage = $"Cập nhật thành công ";
                return RedirectToAction(nameof(DanhSachBinhLuan));
            }
        }
        // GET: Comments/Create
        public IActionResult ThemBinhLuan()
        {
            var user = _context.Users.ToList();
            user.Insert(0, new AppUser()
            {
                Id = "",
                UserName = ""
            });
            ViewData["user"] = new SelectList(user, "Id", "UserName");

            var course = _context.Courses.ToList();
            course.Insert(0, new Course()
            {
                courseId = -1,
                courseName = ""
            });
            ViewData["course"] = new SelectList(course, "courseId", "courseName");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemBinhLuan(Comment comment)
        {
            var user = _context.Users.ToList();
            user.Insert(0, new AppUser()
            {
                Id = "",
                UserName = ""
            });
            ViewData["user"] = new SelectList(user, "Id", "UserName");

            var course = _context.Courses.ToList();
            course.Insert(0, new Course()
            {
                courseId = -1,
                courseName = ""
            });
            ViewData["course"] = new SelectList(course, "courseId", "courseName");
            if (comment.userId.ToString() == "")
            {
                ModelState.AddModelError(string.Empty, "Phải chọn khách hàng");
            }
            if (comment.courseId == -1)
            {
                ModelState.AddModelError(string.Empty, "Phải chọn khóa học");
            }
            if (ModelState.IsValid)
            {

                _context.Comments.Add(new Comment()
                {
                    content = comment.content,
                    evaluate = comment.evaluate,
                    userId = comment.userId,
                    courseId = comment.courseId

                });
                _context.SaveChanges();
                StatusMessage = $"Thêm thành công";
                return RedirectToAction(nameof(DanhSachBinhLuan));
            }
            StatusMessage = $"Thêm không thành công ";
            return RedirectToAction(nameof(DanhSachBinhLuan));
        }

        

        
        // GET: Comments/Delete/5
        public async Task<IActionResult> XoaBinhLuan(int id)
        {
            if (id==null)
            {
                return NotFound();
            }

            var comment = await _context.Comments
                .Include(c => c.AppUser)
                .Include(c => c.Course)
                .FirstOrDefaultAsync(m => m.cmtId == id);
            if (comment == null)
            {
                StatusMessage = "Xóa không thành công";
                return RedirectToAction(nameof(DanhSachBinhLuan));
            }

            _context.Comments.Remove(comment);
            await _context.SaveChangesAsync();
            StatusMessage = "Xóa thành công";
            return RedirectToAction(nameof(DanhSachBinhLuan));
        }

        [HttpPost]
        public IActionResult ThemBinhLuanUI(int courseId, string content, float evaluate)
        {
            int currentPage = courseId;
            if(content == null && evaluate < 0 && evaluate > 10)
            {
                ModelState.AddModelError(string.Empty, "Không bình luận được");
            }
            
            var user = _userManager.GetUserId(User);
            if (ModelState.IsValid)
            {
                _context.Comments.Add(new Comment() { 
                    courseId = courseId,
                    userId = user,
                    content = content,
                    evaluate = evaluate
                });
                _context.SaveChanges();
                StatusMessage = "Cảm ơn ý kiến đóng góp của bạn! ";
                return RedirectToAction("LessonCourse", "Lesson", new { id = currentPage });
            }
            StatusMessage = "Bình luận không thành công! ";
            return RedirectToAction("LessonCourse", "Lesson", new { id = currentPage });
        }

        private bool CommentExists(int id)
        {
            return _context.Comments.Any(e => e.courseId == id);
        }
    }
}
