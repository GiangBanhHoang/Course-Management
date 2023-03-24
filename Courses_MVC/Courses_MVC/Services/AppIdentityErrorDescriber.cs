
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Services
{
    public class AppIdentityErrorDescriber : IdentityErrorDescriber
    {
        public override IdentityError DuplicateEmail(string email)
        {
            var er = base.DuplicateEmail(email);
            return new IdentityError()
            {
                Code = er.Code,
                Description = $"Email có tên {email} bị trùng"
            };
        }
        public override IdentityError DuplicateRoleName(string role)
        {
            var er = base.DuplicateRoleName(role);
            return new IdentityError()
            {
                Code = er.Code,
                Description = $"Role có tên {role} bị trùng"
            };
        }
        public override IdentityError DuplicateUserName(string userName)
        {
            var er = base.DuplicateUserName(userName);
            return new IdentityError()
            {
                Code = er.Code,
                Description = $"UserName có tên {userName} bị trùng"

            };
        }    
    }
}
