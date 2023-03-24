using AutoMapper;
using Courses_MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Mappings
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<AppUser, UserViewModel>()
                .ForMember(dst => dst.Username, opt => opt.MapFrom(x => x.UserName));
            CreateMap<UserViewModel, AppUser>();
        }
    }
}
