using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    [Serializable]
    public class CarItem
    { 
        public Course Course { get; set; }
        public int Quantity { get; set; }
    }
}
