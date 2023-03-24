using Courses_MVC.Data;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Areas.Admin.Pages.Role
{
    public class RolePageModel : PageModel
    {
        protected readonly RoleManager<IdentityRole> _roleManager;

        protected readonly CoursesContext _context;

        [TempData] // sử dụng session lưu thông báo
        public string StatusMassage { get; set; }

        public RolePageModel(RoleManager<IdentityRole> roleManager, CoursesContext courseContext)
        {
            _roleManager = roleManager;
            _context = courseContext;
        }

    }
}
