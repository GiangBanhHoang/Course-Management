using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    //Dành cho signalR
    public class UserViewModel
    {
        public string Username { get; set; }
        //public string FullName { get; set; }
        public string Avatar { get; set; }
        public string CurrentRoom { get; set; }
        public string Device { get; set; }
    }
}
