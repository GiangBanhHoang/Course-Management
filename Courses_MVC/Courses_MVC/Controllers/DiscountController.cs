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
    public class DiscountController : Controller
    {
        private readonly CoursesContext _context;

        public DiscountController(CoursesContext context)
        {
            _context = context;
        }

        [TempData]
        public string StatusMessage { get; set; }

        // GET: Discount
        public async Task<IActionResult> DanhSachGiamGia()
        {
            var discountContext = _context.Discounts;
            var count = discountContext.Count();
            ViewData["count"] = count;
            return View(await discountContext.ToListAsync());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DanhSachGiamGia(string search)
        {

            var discountContext = from discount in _context.Discounts select discount;
            var count = discountContext.Count();
            if (!string.IsNullOrEmpty(search))
            {
                discountContext = discountContext.Where(c => c.discription.Contains(search));
                count = discountContext.Count();
            }
            
            ViewData["count"] = count;
            return View(await discountContext.ToListAsync());
        }

        // GET: Discount/Details/5
        public async Task<IActionResult> ChiTietGiamGia(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var discount = await _context.Discounts
                .FirstOrDefaultAsync(m => m.discountId == id);
            if (discount == null)
            {
                return NotFound();
            }

            return View(discount);
        }

        public async Task<IActionResult> CapNhatGiamGia(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var discount = await _context.Discounts
                .FirstOrDefaultAsync(m => m.discountId == id);
            if (discount == null)
            {
                return NotFound();
            }

            return View(discount);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CapNhatGiamGia(int id, Discount discount)
        {
            if(id == 0)
            {
                return NotFound();
            }
            var result = await _context.Discounts
                .FirstOrDefaultAsync(m => m.discountId == id);
            if (result != null)
            {
                result.discription = discount.discription;
                result.sale = discount.sale;
                result.time = discount.time;
                _context.SaveChanges(); ;
                StatusMessage = $"Cập nhật thành công";
                return RedirectToAction(nameof(DanhSachGiamGia));
            }
            else
            {
                StatusMessage = $"Cập nhật không thành công ";
                return RedirectToAction(nameof(DanhSachGiamGia));
            }
        }

        // GET: discount/Create
        public IActionResult ThemGiamGia()
        {
            return View();
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemGiamGia( Discount discount)
        {
            if (ModelState.IsValid)
            {
                _context.Discounts.Add(new Discount()
                {
                    time = discount.time,
                    sale = discount.sale,
                    discription = discount.discription

                });
                _context.SaveChanges();
                StatusMessage = $"Thêm thành công";
                return RedirectToAction(nameof(DanhSachGiamGia));
            }
            StatusMessage = $"Thêm không thành công";
            return RedirectToAction(nameof(DanhSachGiamGia));

        }

        
        public async Task<IActionResult> XoaGiamGia(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var discount = await _context.Discounts
                .FirstOrDefaultAsync(m => m.discountId == id);
            if (discount == null)
            {
                return NotFound();
            }
            _context.Discounts.Remove(discount);
            await _context.SaveChangesAsync();
            StatusMessage = $"Xóa thành công chương trình giảm giá {discount.discription}";
            return RedirectToAction(nameof(DanhSachGiamGia));
        }

        // POST: discount/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var discount = await _context.Discounts.FindAsync(id);
            _context.Discounts.Remove(discount);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool DiscountExists(int id)
        {
            return _context.Discounts.Any(e => e.discountId == id);
        }
    }
}
