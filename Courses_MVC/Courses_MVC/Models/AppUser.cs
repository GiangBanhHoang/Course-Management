using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    public class AppUser : IdentityUser
    {

        public string? address { get; set; }

        public DateTime? birthday { get; set; }

        //public string FullName { get; set; }

        public string avatar { get; set; }

        public ICollection<Room> Rooms { get; set; }

        public ICollection<Message> Messages { get; set; }
        

        public string gender { get; set; }

        public ICollection<ExerciseInUser> ExerciseInUsers { get; set; }

        public ICollection<Exercise> Exercises { get; set; }

        public ICollection<Comment> Comments { get; set; }

        public ICollection<Register> Registers { get; set; }

        public ICollection<Contact> Contacts { get; set; }
    }
}
