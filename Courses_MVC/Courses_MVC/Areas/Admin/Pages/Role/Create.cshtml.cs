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
    public class CreateModel : RolePageModel
    {
        public CreateModel(RoleManager<IdentityRole> roleManager, CoursesContext courseContext) : base(roleManager, courseContext)
        {

        }
        
        public class InputModel
        {
            [Display(Name ="Tên của role")]
            [Required(ErrorMessage = "Phải nhập {0}")]
            [StringLength(266, MinimumLength = 3, ErrorMessage ="{0} phải dài từ {2} đến {1} kí tự")]
            public string name { get; set; }
        }
        [BindProperty]
        public InputModel Input { get; set; }

        public void OnGet()
        {
        }
        public async Task<IActionResult> OnPostAsync()
        {
            if(!ModelState.IsValid)
            {
                return Page();
            }    
            var newRole = new IdentityRole(Input.name);
            var result = await _roleManager.CreateAsync(newRole);
            if(result.Succeeded)
            {
                StatusMassage = $"Bạn vừa tạo role mới: {Input.name}";
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
