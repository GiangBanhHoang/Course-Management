using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    public class Contact
    {
        public int contactId { get; set; }

        [Display(Name = "Tên người dùng")]
        public string AppUserId { get; set; }

        public AppUser AppUser { get; set; }

        public string HoTen { get; set; }

        [Display(Name ="Email")]
        [EmailAddress(ErrorMessage = "Mail phải đúng định dạng")]
        public string  email { get; set; }

        [Display(Name = "Số điện thoại")]
        [Phone]
        [StringLength(100, ErrorMessage = "{0} phải dài từ {1} kí tự.")]
        [Required(ErrorMessage ="Phải nhập số điện thoại")]
        public string  SDT { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Chủ đề")]
        public string title { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Nội dung")]
        public string content { get; set; }

        [Display(Name = "Ngày viết")]
        public DateTime time { get; set; }
    }
}
