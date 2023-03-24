using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    //Dành cho signalR
    public class RoomViewModel
    {
        public int Id { get; set; }

        [Required]
        [Display(Name = "Tên phòng")]
        [StringLength(100, ErrorMessage = "{0} phải dài từ {2} đến {1} kí tự.", MinimumLength = 5)]
        [RegularExpression(@"^\w+( \w+)*$", ErrorMessage = "Các ký tự được phép: chữ cái, số và một khoảng trắng giữa các từ.")]
        public string Name { get; set; }
    }
}
