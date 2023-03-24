using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{   //Dành cho SignalR
    public class Message
    {
        public int Id { get; set; }
        public string Content { get; set; }
        public DateTime Timestamp { get; set; }
        public int ToRoomId { get; set; }
        public Room Room { get; set; }
        public AppUser AppUser { get; set; }
    }
}
