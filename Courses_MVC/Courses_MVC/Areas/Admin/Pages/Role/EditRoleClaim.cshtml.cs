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
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;

namespace Courses_MVC.Areas.Admin.Pages.Role
{
    [Authorize(Policy = "QuanTriVien")]
    public class EditRoleClaimModel : RolePageModel
    {
        public EditRoleClaimModel(RoleManager<IdentityRole> roleManager, CoursesContext courseContext) : base(roleManager, courseContext)
        {

        }

        public class InputModel
        {
            [Display(Name = "Tên claim")]
            [Required(ErrorMessage = "Phải nhập {0}")]
            [StringLength(266, MinimumLength = 3, ErrorMessage = "{0} phải dài từ {2} đến {1} kí tự")]
            public string ClaimType { get; set; }

            [Display(Name = "Giá trị")]
            [Required(ErrorMessage = "Phải nhập {0}")]
            [StringLength(266, MinimumLength = 3, ErrorMessage = "{0} phải dài từ {2} đến {1} kí tự")]
            public string ClaimValue { get; set; }
        }
        [BindProperty]
        public InputModel Input { get; set; }

        public IdentityRole role { get; set; }

        public IdentityRoleClaim<string> claim { get; set;  }
        public async Task<IActionResult> OnGet(int? claimid)
        {
            if (claimid == null) return NotFound($"Không tìm thấy role, Id :{role.Name}");
            claim = _context.RoleClaims.Where(c => c.Id == claimid).FirstOrDefault();
            if (claim == null) return NotFound($"Không tìm thấy role, Id :{role.Name}");

            role = await _roleManager.FindByIdAsync(claim.RoleId);
            if (role == null) return NotFound($"Không tìm thấy role, Id :{role.Name}");

            Input = new InputModel()
            {
                ClaimType = claim.ClaimType,
                ClaimValue = claim.ClaimValue
            };

            return Page();
        }
        public async Task<IActionResult> OnPostAsync(int? claimid)
        {
            if (claimid == null) return NotFound($"Không tìm thấy role, Id :{role.Name}");
            claim = _context.RoleClaims.Where(c => c.Id == claimid).FirstOrDefault();
            if (claim == null) return NotFound($"Không tìm thấy role, Id :{role.Name}");

            role = await _roleManager.FindByIdAsync(claim.RoleId);
            if (role == null) return NotFound($"Không tìm thấy role, Id :{role.Name}");

            if (!ModelState.IsValid)
            {
                return Page();
            }

            if (_context.RoleClaims.Any(c => c.RoleId == role.Id && c.ClaimType == Input.ClaimType && c.ClaimValue == Input.ClaimValue && c.Id != claim.Id))
            {
                ModelState.AddModelError(string.Empty, "Claim này đã có trong role");
                return Page();
            }

            claim.ClaimType = Input.ClaimType;
            claim.ClaimValue = Input.ClaimValue;

            await _context.SaveChangesAsync();
            
            StatusMassage = "Vừa cập nhât claim ";
            return RedirectToPage("./Edit", new { roleId = role.Id });
        }

        public async Task<IActionResult> OnPostDeleteAsync(int? claimid)
        {
            if (claimid == null) return NotFound($"Không tìm thấy role, Id :{role.Name}");
            claim = _context.RoleClaims.Where(c => c.Id == claimid).FirstOrDefault();
            if (claim == null) return NotFound($"Không tìm thấy role, Id :{role.Name}");

            role = await _roleManager.FindByIdAsync(claim.RoleId);
            if (role == null) return NotFound($"Không tìm thấy role, Id :{role.Name}");


            await _roleManager.RemoveClaimAsync(role, new Claim(claim.ClaimType, claim.ClaimValue));

            StatusMassage = "Vừa xóa claim ";
            return RedirectToPage("./Edit", new { roleId = role.Id });
        }
    }
}
