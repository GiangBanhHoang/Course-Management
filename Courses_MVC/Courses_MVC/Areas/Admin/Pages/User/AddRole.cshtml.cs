using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Courses_MVC.Data;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace Courses_MVC.Areas.Admin.Pages.User
{
    [Authorize(Policy = "QuanTriVien")]
    public class AddRoleModel : PageModel
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly CoursesContext _context;
        public AddRoleModel(
            UserManager<AppUser> userManager,
            SignInManager<AppUser> signInManager,
            RoleManager<IdentityRole> roleManager,
            CoursesContext context)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _roleManager = roleManager;
            _context = context;
        }


        [TempData]
        public string StatusMessage { get; set; }

        [BindProperty]
        [DisplayName("Các role gán cho user")]
        public string[] roleNames { get; set; }

        public SelectList allRoles { get; set; }

        public List<IdentityRoleClaim<string>> claimInRole { get; set; }
        public List<IdentityUserClaim<string>> claimInUserClaim { get; set; }

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
            roleNames = (await _userManager.GetRolesAsync(user)).ToArray<string>();

            List<string> RoleNames = await _roleManager.Roles.Select(r => r.Name).ToListAsync();
            allRoles = new SelectList(RoleNames);

            //truy vấn linq lấy các claim của role 
            await GetClaims(id);

            return Page();
        }

        public async Task GetClaims(string id)
        {
            var listRoles = from r in _context.Roles
                            join ur in _context.UserRoles on r.Id equals ur.RoleId
                            where ur.UserId == id
                            select r;

            var _claimInRole = from c in _context.RoleClaims
                               join r in listRoles on c.RoleId equals r.Id
                               select c;

            claimInRole = await _claimInRole.ToListAsync();

            claimInUserClaim = await (from c in _context.UserClaims
                                where c.UserId == id
                                select c).ToListAsync();
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
                return NotFound($"Không thấy user, id =  '{id}'.");
            }

            //roleName
            await GetClaims(id);

            var OldRoleNames = (await _userManager.GetRolesAsync(user)).ToArray();

            var deleteRoles = OldRoleNames.Where(r => !roleNames.Contains(r));
            var addRoles = roleNames.Where(r => !OldRoleNames.Contains(r));

            List<string> RoleNames = await _roleManager.Roles.Select(r => r.Name).ToListAsync();
            allRoles = new SelectList(RoleNames);

            var resultDelete = await _userManager.RemoveFromRolesAsync(user, deleteRoles);
            if (!resultDelete.Succeeded)
            {
                resultDelete.Errors.ToList().ForEach(error =>
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                });
                return Page();
            }

            var resultAdd = await _userManager.AddToRolesAsync(user, addRoles);
            if (!resultAdd.Succeeded)
            {
                resultAdd.Errors.ToList().ForEach(error =>
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                });
                return Page();
            }

            

            StatusMessage = $"Vừa cập nhật role cho user: {user.UserName}";

            return RedirectToPage("./Index");
        }
    }
}
