using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Courses_MVC.Data;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace Courses_MVC.Areas.Admin.Pages.Role
{
    [Authorize(Policy = "QuanTriVien")]
    public class IndexModel : RolePageModel
    {
        public IndexModel(RoleManager<IdentityRole> roleManager, CoursesContext courseContext) : base(roleManager, courseContext)
        {
            
        }

        public class RoleModel : IdentityRole
        {
            public string[] Claims { get; set; }
        }

        public List<RoleModel> roles { get; set; }
        public async Task OnGet()
        {
            //_roleManager.GetClaimsAsync() // Lấy tất cả các claim của role đó
            var r = await _roleManager.Roles.OrderBy(o => o.Name).ToListAsync();
            roles = new List<RoleModel>();
            foreach(var _r in r)
            {
                var claims = await _roleManager.GetClaimsAsync(_r);
                var ClaimsString = claims.Select(s => s.Type + " = " + s.Value);
                var rm = new RoleModel()
                {
                    Name = _r.Name,
                    Id = _r.Id,
                    Claims = ClaimsString.ToArray()
                };
                roles.Add(rm);
            }    
        }

        public void OnPost() => RedirectToPage();
    }
}
