using AutoMapper;
using Courses_MVC.Helpers;
using Courses_MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Mappings
{
    public class MessageProfile:Profile
    {
        public MessageProfile()
        { // test
            CreateMap<Message, MessageViewModel>()
                .ForMember(dst => dst.From, opt => opt.MapFrom(x => x.AppUser.UserName))
                .ForMember(dst => dst.Room, opt => opt.MapFrom(x => x.Room.Name))
                .ForMember(dst => dst.Avatar, opt => opt.MapFrom(x => x.AppUser.avatar))
                .ForMember(dst => dst.Content, opt => opt.MapFrom(x => BasicEmojis.ParseEmojis(x.Content)))
                .ForMember(dst => dst.Timestamp, opt => opt.MapFrom(x => x.Timestamp));
            CreateMap<MessageViewModel, Message>();
        }
    }
}
