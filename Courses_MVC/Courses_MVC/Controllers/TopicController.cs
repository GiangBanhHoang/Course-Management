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
    [Authorize(Policy = "QuanTriVien")]
    public class TopicController : Controller
    {
        private readonly CoursesContext _context;

        public TopicController(CoursesContext context)
        {
            _context = context;
        }

        [TempData]
        public string StatusMessage { get; set; }

        // GET: Topic
        public async Task<IActionResult> DanhSachTopic()
        {
            var countTopic = _context.Topic.Count();
            ViewData["count"] = countTopic;
            var TopicContext = from topic in _context.Topic select topic;
            return View(await TopicContext.ToListAsync());
        }

        [HttpPost]
        public async Task<IActionResult> DanhSachTopic(string? search)
        {
            var TopicContext = from topic in _context.Topic select topic;
            var countTopic = TopicContext.Count();
            
            if (!string.IsNullOrEmpty(search))
            {
                TopicContext = TopicContext.Where(c => c.topicName.Contains(search));
                countTopic = TopicContext.Count();
            }
            ViewData["count"] = countTopic;
            return View(await TopicContext.ToListAsync());
        }


        public IActionResult ThemTopic()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ThemTopic(Topic topic)
        {
            if(topic == null)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                _context.Add(topic);
                _context.SaveChanges();
                StatusMessage = $"Thêm thành công chủ đề {topic.topicName}";
                return RedirectToAction(nameof(DanhSachTopic));
            }
            else
            {
                StatusMessage = $"Thêm không thành công";
                return RedirectToAction(nameof(DanhSachTopic));
            }
        }

        public IActionResult XoaTopic(int? id)
        {
            if(id == null)
            {
                return NotFound();
            }
            var topic = _context.Topic.FirstOrDefault(c => c.topicId == id);
            if(topic == null)
            {
                return NotFound();
            }
            _context.Remove(topic);
            _context.SaveChanges();
            StatusMessage = $"Xóa thành công chủ đề {topic.topicName}";
            return RedirectToAction(nameof(DanhSachTopic));
        }

        
        // GET: Topic/Details/5
        public IActionResult ChiTietTopic(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var topic = _context.Topic.FirstOrDefault(c => c.topicId == id);
            if (topic == null)
            {
                return NotFound();
            }

            return View(topic);
        }

        public IActionResult CapNhatTopic(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var topic = _context.Topic.FirstOrDefault(c => c.topicId == id);
            if (topic == null)
            {
                return NotFound();
            }

            return View(topic);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CapNhatTopic(int? id,Topic topic)
        {
            if (id == topic.topicId)
            {
                return NotFound();
            }
            var result = _context.Topic.FirstOrDefault(c => c.topicId == id);
            if (result == null)
            {
                return NotFound();
            }
            result.topicName = topic.topicName;
            _context.SaveChanges();
            StatusMessage = $"Cập nhập thành công {topic.topicName}";
            return RedirectToAction(nameof(DanhSachTopic));
        }
        private bool TopicExists(int id)
        {
            return _context.Topic.Any(e => e.topicId == id);
        }
    }
}
