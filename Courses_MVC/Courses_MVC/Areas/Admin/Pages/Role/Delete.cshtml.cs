using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Courses_MVC.Data;
using System.ComponentModel.DataAnnotations;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Authorization;

namespace Courses_MVC.Areas.Admin.Pages.Role
{
    [Authorize(Policy = "QuanTriVien")]
    public class DeleteModel : RolePageModel
    {

        public DeleteModel(RoleManager<IdentityRole> roleManager, CoursesContext courseContext) : base(roleManager, courseContext)
        {

        }

        public IdentityRole role;
        public async Task<IActionResult> OnGet(string roleId)
        {
            if (roleId == null)
                return NotFound("Không tìm thấy role");
            role = await _roleManager.FindByIdAsync(roleId);
            if (role == null)
            {
                return NotFound("Không tìm thấy role");
            }
            return Page();
        }
        public async Task<IActionResult> OnPostAsync(string roleId)
        {
            if (roleId == null)
                return NotFound("Không tìm thấy role");
            role = await _roleManager.FindByIdAsync(roleId);
            if (role == null)
                return NotFound("Không tìm thấy role");


            var result = await _roleManager.DeleteAsync(role);

            if (result.Succeeded)
            {
                StatusMassage = $"Bạn vừa xóa role: {role.Name}";
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
