using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    public class Discount
    {
        public int discountId { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Mô tả")]
        public string? discription { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Thời gian áp dụng")]
        public DateTime time { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Giảm giá")]
        public float sale { get; set; }

        public ICollection<Course> Courses { get; set; }
    }
}
