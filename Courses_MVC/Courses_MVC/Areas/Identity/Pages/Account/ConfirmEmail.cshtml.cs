using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.WebUtilities;

namespace Courses_MVC.Areas.Identity.Pages.Account
{
    [AllowAnonymous]
    public class ConfirmEmailModel : PageModel
    {
        private readonly UserManager<AppUser> _userManager;

        private readonly SignInManager<AppUser> _signInManager;

        public ConfirmEmailModel(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager)
        {
            _userManager = userManager;
            _signInManager = signInManager;
        }

        [TempData]
        public string StatusMessage { get; set; }

        public async Task<IActionResult> OnGetAsync(string userId, string code)
        {
            if (userId == null || code == null)
            {
                return RedirectToPage("/Index");
            }

            var user = await _userManager.FindByIdAsync(userId);
            if (user == null)
            {
                return NotFound($"Không tìm thấy User Id =  '{userId}'.");
            }

            code = Encoding.UTF8.GetString(WebEncoders.Base64UrlDecode(code)); //Trường hợp có userID nhận được mã token của biến code trước khi gửi email đi thì biến code phải giải mã Base64UrlDecode
            var result = await _userManager.ConfirmEmailAsync(user, code); // giãi mã xong gọi phương thức ConfirmEmailAsync
            StatusMessage = result.Succeeded ? "Email đã được xác thực." : "Lỗi xác thực.";

            if (result.Succeeded)
            {
                await _signInManager.SignInAsync(user, false); // sau khi xác thực tiến hành đăng nhập ngay
                return RedirectToPage("/Index"); // chuyển hướng về trang index
            }
            else
            {
                return Content("Lỗi xác thực Email.");
            }
            //return Page();
        }
    }
}
