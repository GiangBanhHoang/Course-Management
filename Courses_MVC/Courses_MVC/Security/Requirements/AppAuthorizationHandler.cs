using Courses_MVC.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Security.Requirements
{
    public class AppAuthorizationHandler : IAuthorizationHandler
    {
        private readonly UserManager<AppUser> _userManager;
        public AppAuthorizationHandler(UserManager<AppUser> userManager)
        {
            _userManager = userManager;
        }
        //context.PendingRequirements; // Những requirements chưa kiểm tra
        //context.User
        //context.Resource; //Mặc định là HTTP context, resource dùng để kiểm tra 1 đổi tượng có được làm gì  không
        public Task HandleAsync(AuthorizationHandlerContext context)
        {
            var requirements = context.PendingRequirements.ToList();
            //Xử lý các requirements



            
            return Task.CompletedTask;
        }
    }
}
