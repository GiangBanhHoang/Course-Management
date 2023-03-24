using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    public class Register
    {
        public int registerId { get; set; }

        [Display(Name = "Ngày đăng kí")]
        public DateTime timeReg { get; set; }

        [Display(Name = "Tên khách hàng")]
        [Required(ErrorMessage = "Phải chọn {0}")]
        public string userId { get; set; }

        public AppUser AppUser { get; set; }


        [Display(Name = "Tên khóa học")]
        [Required(ErrorMessage = "Phải chọn {0}")]
        public int courseId { get; set; }  

        public Course Course { get; set; }

        public ICollection<Receipt> Receipts { get; set; }
    }
}
