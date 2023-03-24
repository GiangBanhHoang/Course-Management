using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Courses_MVC.Areas.Admin.Pages.User
{
    [Authorize(Policy = "QuanTriVien")]
    public class SetPasswordModel : PageModel
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;

        public SetPasswordModel(
            UserManager<AppUser> userManager,
            SignInManager<AppUser> signInManager)
        {
            _userManager = userManager;
            _signInManager = signInManager;
        }

        [BindProperty]
        public InputModel Input { get; set; }

        [TempData]
        public string StatusMessage { get; set; }

        public class InputModel
        {
            [Required(ErrorMessage = "Phải nhật mật khẩu")]
            [StringLength(100, ErrorMessage = "{0} phải dài từ {2} đến {1} kí tự.", MinimumLength = 6)]
            [DataType(DataType.Password)]
            [Display(Name = "Mật khẩu mới")]
            public string NewPassword { get; set; }

            [DataType(DataType.Password)]
            [Display(Name = "Xác nhận mật khẩu")]
            [Compare("NewPassword", ErrorMessage = "Lặp lại mật khẩu không đúng.")]
            public string ConfirmPassword { get; set; }
        }

        public AppUser user { get; set; }
        public async Task<IActionResult> OnGetAsync(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return NotFound($"Không có user.");
            }

            user = await _userManager.FindByIdAsync(id);
            if (user == null)
            {
                return NotFound($"Không thấy user, id =  '{_userManager.GetUserId(User)}'.");
            }

            //var hasPassword = await _userManager.HasPasswordAsync(user);

            //if (hasPassword)
            //{
            //    return RedirectToPage("./ChangePassword");
            //}

            return Page();
        }

        public async Task<IActionResult> OnPostAsync(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return NotFound($"Không có user.");
            }

            user = await _userManager.FindByIdAsync(id);

            if (user == null)
            {
                return NotFound($"Không thấy user, id =  '{_userManager.GetUserId(User)}'.");
            }
            if (!ModelState.IsValid)
            {
                return Page();
            }
            await _userManager.RemovePasswordAsync(user);
            var addPasswordResult = await _userManager.AddPasswordAsync(user, Input.NewPassword);
            if (!addPasswordResult.Succeeded)
            {
                foreach (var error in addPasswordResult.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }
                return Page();
            }

            StatusMessage = $"Vừa cập nhật mật khẩu cho user: {user.UserName}";

            return RedirectToPage("./Index");
        }
    }
}
