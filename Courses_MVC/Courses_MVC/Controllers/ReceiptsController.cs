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
    public class ReceiptsController : Controller
    {
        private readonly CoursesContext _context;

        public ReceiptsController(CoursesContext context)
        {
            _context = context;
        }
        [TempData]
        public string StatusMessage { get; set; }
        // GET: Receipts
        public async Task<IActionResult> DanhSachHoaDon()
        {
            var receiptContext = _context.Receipts.Include(r => r.Register);
            var count = receiptContext.Count();
            ViewData["count"] = count;
            return View(await receiptContext.ToListAsync());
        }

        

        // GET: Receipts/Details/5
        public async Task<IActionResult> ChiTietHoaDon(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var receipt = await _context.Receipts
                .Include(r => r.Register)
                .FirstOrDefaultAsync(m => m.receiptId == id);
            if (receipt == null)
            {
                return NotFound();
            }

            return View(receipt);
        }

        public async Task<IActionResult> CapNhatHoaDon(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var receipt = await _context.Receipts
                .Include(r => r.Register)
                .FirstOrDefaultAsync(m => m.receiptId == id);
            if (receipt == null)
            {
                return NotFound();
            }

            return View(receipt);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CapNhatHoaDon(int? id, Receipt receipt)
        {
            if (id == null)
            {
                return NotFound();
            }

            var result = await _context.Receipts
                .Include(r => r.Register)
                .FirstOrDefaultAsync(m => m.receiptId == id);
            if (result != null)
            {
                
                result.totalPrice = receipt.totalPrice;
                result.timeReceipt = receipt.timeReceipt;
                _context.SaveChanges(); 
                StatusMessage = $"Cập nhật thành công";
                return RedirectToAction(nameof(DanhSachHoaDon));
            }
            else
            {
                StatusMessage = $"Cập nhật không thành công ";
                return RedirectToAction(nameof(DanhSachHoaDon));
            }
        }

        // GET: Receipts/Create
        public IActionResult ThemHoaDon()
        {
            ViewData["registerId"] = new SelectList(_context.Registers, "registerId", "registerId");
            return View();
        }

        // POST: Receipts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ThemHoaDon(Receipt receipt)
        {
            if (ModelState.IsValid)
            {
                _context.Add(receipt);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(DanhSachHoaDon));
            }
            ViewData["registerId"] = new SelectList(_context.Registers, "registerId", "registerId", receipt.registerId);
            StatusMessage = $"Thêm thành công hóa đơn";
            return View(receipt);
        }

        
        
        

        // GET: Receipts/Delete/5
        public async Task<IActionResult> XoaHoaDon(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var receipt = await _context.Receipts
                .Include(r => r.Register)
                .FirstOrDefaultAsync(m => m.receiptId == id);
            if (receipt == null)
            {
                StatusMessage = $"Xóa không thành công ";
                return RedirectToAction(nameof(DanhSachHoaDon));
            }
            _context.Receipts.Remove(receipt);
            await _context.SaveChangesAsync();
            StatusMessage = $"Xóa thành công hóa đơn có mã hóa đơn là {receipt.receiptId}";
            return RedirectToAction(nameof(DanhSachHoaDon));
        }

        
        private bool ReceiptExists(int id)
        {
            return _context.Receipts.Any(e => e.receiptId == id);
        }
    }
}
