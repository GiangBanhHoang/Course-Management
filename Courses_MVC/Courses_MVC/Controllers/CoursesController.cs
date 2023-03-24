using Courses_MVC.Data;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;

namespace Courses_MVC.Controllers
{
    public class CoursesController : Controller
    {
        private readonly CoursesContext _context;
        private readonly UserManager<AppUser> _userManager;

        public CoursesController(CoursesContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        [TempData]
        public string StatusMessage { get; set; }
        public IActionResult DanhSachHienThi()
        {
            var user = _userManager.GetUserId(User);
            var listTopic = _context.Topic.ToList();
            ViewBag.listTopic = listTopic;
            var listCourseOfUser = _context.Registers.Include(l => l.AppUser).Include(l => l.Course).Where(l => l.AppUser.Id == user).ToList();
            ViewBag.listCourseOfUser = listCourseOfUser;
            var listCourse = _context.Courses.Include(c => c.Discount).Include(c => c.Topic);
            return View(listCourse.ToList());
        }

        [HttpPost]
        public IActionResult DanhSachHienThi(string? courestitle)
        {
            var listTopic = _context.Topic.ToList();
            ViewBag.listTopic = listTopic;
            var coursesContext = (from cs in _context.Courses
                                  select cs);
            if (!string.IsNullOrEmpty(courestitle))
            {
                coursesContext = coursesContext.Where(c => c.courseName.Contains(courestitle)).Include(c => c.Discount).Include(c => c.Topic);
            }
            else
            {
                StatusMessage = $"Không tìm thấy";
                coursesContext = coursesContext.Include(c => c.Discount).Include(c => c.Topic);
            }
            
            return View(coursesContext.ToList());
        }

        [Authorize(Policy = "QuanTriVien")]
        public async Task<IActionResult> listCourseAdmin()
        {
            var listCourse = _context.Courses
                            .Include(d => d.Discount).Include(t => t.Topic)
                            ;
            var Total = listCourse.Count();
            ViewData["count"] = Total;
            return View(await listCourse.ToListAsync());
        }

        [Authorize(Policy = "QuanTriVien")]
        [HttpPost]

        public async Task<IActionResult> listCourseAdmin(string? searchString)
        {
            var listCourse = (from cs in _context.Courses
                              select cs);
            var Total = listCourse.Count();

            if (!string.IsNullOrEmpty(searchString))
            {
                listCourse = listCourse.Where(c => c.courseName.Contains(searchString)).Include(d => d.Discount).Include(t => t.Topic);
                Total = listCourse.Count();
            }
            else
            {
                listCourse = _context.Courses.Include(d => d.Discount).Include(t => t.Topic);
            }
            ViewData["count"] = Total;
            return View(await listCourse.ToArrayAsync());
        }

        [Authorize(Policy = "QuanTriVien")]
        // GET: Courses/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var course = (from cs in _context.Courses
                          join tp in _context.Topic on cs.topicId equals tp.topicId
                          join dc in _context.Discounts on cs.discountId equals dc.discountId
                          select cs)
                         .Include(c => c.Topic)
                         .Include(c => c.Discount)
                         .FirstOrDefaultAsync(c => c.courseId == id);
            if (course == null)
            {
                return NotFound();
            }

            return View(await course);
        }

        // GET: Courses/Create
        [Authorize(Policy = "QuanTriVien")]
        public IActionResult CreateCourse()
        {
            ViewData["discountId"] = new SelectList(_context.Discounts, "discountId", "discription");
            ViewData["topicId"] = new SelectList(_context.Topic, "topicId", "topicName");
            return View();
        }

        [Authorize(Policy = "QuanTriVien")]
        [HttpPost]
        public async Task<IActionResult> CreateCourse(Course course)
        {
            if (ModelState.IsValid)
            {
                _context.Add(course);
                await _context.SaveChangesAsync();
                StatusMessage = $"Thêm thành công";
                return RedirectToAction(nameof(listCourseAdmin));
            }
            else
            {
                StatusMessage = $"Thêm không thành công";
                return RedirectToAction(nameof(listCourseAdmin));
            }
            ViewData["discountId"] = new SelectList(_context.Discounts, "discountId", "discription", course.discountId);
            ViewData["topicId"] = new SelectList(_context.Topic, "topicId", "topicName", course.topicId);

            return View();
        }


        [Authorize(Policy = "QuanTriVien")]
        public async Task<IActionResult> UpdateCourse(int? id)
        {
            if (id == null)
            {
                return NoContent();
            }

            var courseUpdate = await _context.Courses
                               .FindAsync(id);
            if (courseUpdate == null)
            {
                return NotFound();
            }
            ViewData["discountId"] = new SelectList(_context.Discounts, "discountId", "discription", courseUpdate.discountId);
            ViewData["topicId"] = new SelectList(_context.Topic, "topicId", "topicName", courseUpdate.topicId);
            return View(courseUpdate);
        }

        [Authorize(Policy = "QuanTriVien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdateCourse(int? id, Course updateCourse)
        {
            if (ModelState.IsValid)
            {
                Course Course = await _context.Courses.FirstOrDefaultAsync(c => c.courseId == updateCourse.courseId);
                Course.courseName = updateCourse.courseName;
                Course.discription = updateCourse.discription;
                Course.price = updateCourse.price;
                Course.topicId = updateCourse.topicId;
                Course.discountId = updateCourse.discountId;
                Course.totalTime = updateCourse.totalTime;
                Course.totalStudent = updateCourse.totalStudent;
                Course.imgCourse = updateCourse.imgCourse;
                Course.originalPrice = updateCourse.originalPrice;
                _context.SaveChanges();
                StatusMessage = $"Cập nhật thành công";
                return RedirectToAction(nameof(listCourseAdmin));
            }
            else
            {
                StatusMessage = $"Cập nhật không thành công";
                return RedirectToAction(nameof(listCourseAdmin));
            }


        }


        [Authorize(Policy = "QuanTriVien")]
        public async Task<IActionResult> DeleteCourse(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var courseDelete = await _context.Courses
                                    .Include(c => c.Topic)
                                    .Include(c => c.Discount)
                                    .FirstOrDefaultAsync(c => c.courseId == id);
            if (courseDelete == null)
            {
                return NotFound();
            }
            return View(courseDelete);
        }

        [Authorize(Policy = "QuanTriVien")]
        [HttpPost, ActionName("DeleteCourse")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteCoureConform(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var course = await _context.Courses
                        .Include(c => c.Topic)
                        .Include(c => c.Discount)
                        .FirstOrDefaultAsync(c => c.courseId == id);
            _context.Courses.Remove(course);
            await _context.SaveChangesAsync();
            StatusMessage = $"Xóa thành công";
            return RedirectToAction(nameof(listCourseAdmin));
        }

        private bool CourseExists(int id)
        {
            return _context.Courses.Any(e => e.courseId == id);
        }
        public const string CARTKEY = "cart";
        // Lấy cart từ Session (danh sách CartItem)
        List<CarItem> GetCartItems()
        {
            var session = HttpContext.Session;
            string jsoncart = session.GetString(CARTKEY);
            if (jsoncart != null)
            {
                return JsonConvert.DeserializeObject<List<CarItem>>(jsoncart);
            }
            return new List<CarItem>();
        }


        // Xóa cart khỏi session
        void ClearCart()
        {
            var session = HttpContext.Session;
            session.Remove(CARTKEY);
        }

        // Lưu Cart (Danh sách CartItem) vào session
        void SaveCartSession(List<CarItem> ls)
        {
            var session = HttpContext.Session;
            string jsoncart = JsonConvert.SerializeObject(ls);
            session.SetString(CARTKEY, jsoncart);
        }
        public IActionResult AddtoCart(int? courseId)
        {
            var course = _context.Courses.FirstOrDefault(l => l.courseId == courseId);
            if (course == null)
            {
                return NotFound("Không có khóa học");
            }
            var cart = GetCartItems();
            var cartItem = cart.Find(l => l.Course.courseId == courseId);
            if (cartItem != null)
            {
                cartItem.Quantity++;
            }
            else
            {
                cart.Add(new CarItem()
                {
                    Course = course,
                    Quantity = 1
                });
            }

            SaveCartSession(cart);
            return RedirectToAction(nameof(DanhSachHienThi));
        }
        public IActionResult AddtoCartInLesson(int? courseId)
        {
            var course = _context.Courses.FirstOrDefault(l => l.courseId == courseId);
            if (course == null)
            {
                return NotFound("Không có khóa học");
            }
            var cart = GetCartItems();
            var cartItem = cart.Find(l => l.Course.courseId == courseId);
            if (cartItem != null)
            {
                cartItem.Quantity++;
            }
            else
            {
                cart.Add(new CarItem()
                {
                    Course = course,
                    Quantity = 1
                });
            }

            SaveCartSession(cart);
            return RedirectToAction(nameof(CartDisplay));
        }
        public IActionResult CartDisplay()
        {
            return View(GetCartItems());
        }


        public IActionResult UpdateCart(int courseId, int quantity)
        {
            var cart = GetCartItems();
            var cartItem = cart.Find(c => c.Course.courseId == courseId);
            if (cartItem != null)
            {
                cartItem.Quantity = quantity;
            }
            SaveCartSession(cart);
            return Ok();
        }
        public IActionResult DeleteCart(int courseId)
        {
            var cart = GetCartItems();
            var cartItem = cart.Find(c => c.Course.courseId == courseId);
            if (cartItem != null)
            {
                cart.Remove(cartItem);
            }
            SaveCartSession(cart);
            return RedirectToAction(nameof(CartDisplay));
        }
        public IActionResult ClearCartAll()
        {
            ClearCart();
            return RedirectToAction(nameof(CartDisplay));
        }

        public IActionResult ClearAfterRegister(int status)
        {
            if (status == 1)
            {
                ClearCart();
                return RedirectToAction(nameof(DanhSachHienThi));
            }
            else
            {
                return RedirectToAction(nameof(DanhSachHienThi));
            }
        }
    }
}