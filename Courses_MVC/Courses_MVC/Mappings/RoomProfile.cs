using AutoMapper;
using Courses_MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Mappings
{
    public class RoomProfile : Profile
    {
        public RoomProfile()
        {
            CreateMap<Room, RoomViewModel>();
            CreateMap<RoomViewModel, Room>();
        }
    }
}
