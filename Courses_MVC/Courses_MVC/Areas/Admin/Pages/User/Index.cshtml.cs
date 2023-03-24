using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace Courses_MVC.Areas.Admin.Pages.User
{
    [Authorize(Policy = "QuanTriVien")]
    public class IndexModel : PageModel
    {
        private readonly UserManager<AppUser> _userManager;
        public IndexModel(UserManager<AppUser> userManager)
        {
            _userManager = userManager;
        }

        [TempData]
        public string StatusMessage { get; set; }

        public class UserAddRole : AppUser
        {
            public string RoleNames { get; set; }
        }
        public List<UserAddRole> users { get; set; }


        //public const int ITEMS_PER_PAGE = 10;

        //[BindProperty(SupportsGet = true, Name = "p")]
        //public int currentPage { get; set; }

        //public int countPage { get; set; }


        public async Task OnGet()
        {

            //user = await _userManager.Users.OrderBy(u => u.UserName).ToListAsync();

            //var qr = _userManager.Users.OrderBy(u => u.UserName);

            //int totalUser = await qr.CountAsync();
            //countPage = (int)Math.Ceiling((double)totalUser / ITEMS_PER_PAGE);

            //if (currentPage < 1)
            //    currentPage = 1;
            //if (currentPage > countPage)
            //    currentPage = countPage;

            //var qr1 = qr.Skip((currentPage - 1) * ITEMS_PER_PAGE)
            //    .Take(ITEMS_PER_PAGE);

            //user = await qr1.ToListAsync();
            var qr = _userManager.Users.OrderBy(u => u.UserName)
                .Select(u => new UserAddRole()
                {
                    Id = u.Id,
                    UserName = u.UserName,

                }) ;
            users = await qr.ToListAsync();
            foreach(var user in users)
            {
                var roles = await _userManager.GetRolesAsync(user);
                user.RoleNames = string.Join(", ", roles);

            }    
        }
        public void OnPost() => RedirectToPage();

    }
}
