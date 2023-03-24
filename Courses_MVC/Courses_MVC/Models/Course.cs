using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    public class Course
    {
        public int courseId { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Tên khóa học")]
        public string courseName { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Mô tả")]
        public string discription { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Giá niêm yết")]
        public int price { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Giá gốc")]
        public int originalPrice { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Hình ảnh")]
        public string imgCourse { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Tổng thời lượng")]
        public string totalTime { get; set; }

        
        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Điểm đánh giá")]
        public int rating { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Tổng số học sinh")]
        public int totalStudent { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Tiêu đề")]
        public int topicId { get; set; }
        public Topic Topic { get; set;}

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Giảm giá")]
        public int discountId { get; set; }
        public Discount Discount { get; set; }

        public ICollection<Lesson> Lessons { get; set; }

        public ICollection<Register> Registers { get; set; }

        public ICollection<Comment> Comments { get; set; }
    }
}
