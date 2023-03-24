using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    //Dành cho signalR
    public class Room
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public AppUser AppUser { get; set; }
        public ICollection<Message> Messages { get; set; }
    }
}
