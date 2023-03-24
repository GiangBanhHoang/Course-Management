using System;
using System.Collections.Generic;
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
    public class DeleteUserModel : PageModel
    {
        private readonly UserManager<AppUser> _userManager;
        public DeleteUserModel(UserManager<AppUser> userManager)
        {
            _userManager = userManager;
        }

        [TempData]
        public string StatusMessage { get; set; }

        public AppUser user { get; set; }
        public async Task<IActionResult> OnGet(string userId)
        {
            if (userId == null)
                return NotFound("Không tìm thấy role");
            user = await _userManager.FindByIdAsync(userId);
            if (user == null)
            {
                return NotFound("Không tìm thấy role");
            }
            return Page();
        }
        public async Task<IActionResult> OnPostAsync(string userId)
        {
            if (userId == null)
                return NotFound("Không tìm thấy role");
            user = await _userManager.FindByIdAsync(userId);
            if (user == null)
                return NotFound("Không tìm thấy role");


            var result = await _userManager.DeleteAsync(user);

            if (result.Succeeded)
            {
                StatusMessage = $"Bạn vừa xóa user có UserName: {user.UserName}";
                return RedirectToPage("./Index");
            }
            else
            {
                result.Errors.ToList().ForEach(error => {
                    ModelState.AddModelError(string.Empty, error.Description);
                });
            }
            return Page();
        }
    }
}
