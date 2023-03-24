using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Courses_MVC.Data;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Courses_MVC.Areas.Admin.Pages.User
{
    [Authorize(Policy = "QuanTriVien")]
    public class EditUserRoleClaimModel : PageModel
    {
        private readonly CoursesContext _context;
        private readonly UserManager<AppUser> _userManager;
        public EditUserRoleClaimModel(CoursesContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        [TempData]
        public string StatusMessage { get; set; }
        public NotFoundObjectResult OnGet() => NotFound("không được truy cập");

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

        public AppUser user { get; set; }

        public async Task<IActionResult> OnGetAddClaimAsync(string userid)
        {
            user = await _userManager.FindByIdAsync(userid);
            if (user == null)
                return NotFound($"Không tìm thấy user");
            return Page();
        }

        public async Task<IActionResult> OnPostAddClaimAsync(string userid)
        {
            user = await _userManager.FindByIdAsync(userid);
            if (user == null)
                return NotFound($"Không tìm thấy user");
            if (!ModelState.IsValid) return Page();
            var claims = _context.UserClaims.Where(c => c.UserId == user.Id);

            if(claims.Any(c => c.ClaimType == Input.ClaimType && c.ClaimValue == Input.ClaimValue))
            {
                ModelState.AddModelError(string.Empty, "Đặc tính này đã tồn tại");
                return Page();
            }
            await _userManager.AddClaimAsync(user, new Claim(Input.ClaimType, Input.ClaimValue));
            StatusMessage = "Đã thêm đặc tính cho user";
            return RedirectToPage("./AddRole", new { id = user.Id });
        }

        public IdentityUserClaim<string> userClaim { get; set; }

        public async Task<IActionResult> OnGetEditClaimAsync(int? claimid)
        {
            if (claimid == null)
                return NotFound($"Không tìm thấy user");

            userClaim = _context.UserClaims.Where(c => c.Id == claimid).FirstOrDefault();

            user = await _userManager.FindByIdAsync(userClaim.UserId);
            if (user == null)
                return NotFound($"Không tìm thấy user");

            Input = new InputModel()
            {
                ClaimType = userClaim.ClaimType,
                ClaimValue = userClaim.ClaimValue
            };
            return Page();
        }

        public async Task<IActionResult> OnPostEditClaimAsync(int? claimid)
        {
            if (claimid == null)
                return NotFound($"Không tìm thấy user");

            userClaim = _context.UserClaims.Where(c => c.Id == claimid).FirstOrDefault();

            user = await _userManager.FindByIdAsync(userClaim.UserId);
            if (user == null)
                return NotFound($"Không tìm thấy user");

            if (_context.UserClaims.Any(c => c.ClaimType == Input.ClaimType 
                && c.ClaimValue == Input.ClaimValue 
                && c.Id != userClaim.Id))
            {
                ModelState.AddModelError(string.Empty, "Claim này đã có");
                return Page();
            }

            userClaim.ClaimType = Input.ClaimType;
            userClaim.ClaimValue = Input.ClaimValue;


            await _context.SaveChangesAsync();
            StatusMessage = "Đã cập nhật claim cho user thành công";
            return RedirectToPage("./AddRole", new { id = user.Id });
        }

        public async Task<IActionResult> OnPostDeleteAsync(int? claimid)
        {
            if (claimid == null)
                return NotFound($"Không tìm thấy user");

            userClaim = _context.UserClaims.Where(c => c.Id == claimid).FirstOrDefault();

            user = await _userManager.FindByIdAsync(userClaim.UserId);
            if (user == null)
                return NotFound($"Không tìm thấy user");

            await _userManager.RemoveClaimAsync(user, new Claim(userClaim.ClaimType, userClaim.ClaimValue));

            
            StatusMessage = "Bạn đã xóa thành công";

            return RedirectToPage("./AddRole", new { id = user.Id });
        }
    }
}
