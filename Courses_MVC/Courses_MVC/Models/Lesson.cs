using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    public class Lesson
    {
        public int lessonId { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Tiêu đề")]
        public string title { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Mô tả")]
        public string description { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Nội dung")]
        public string content { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Link bài học")]
        public string link { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Caption")]
        public string captionLink { get; set; }


        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Khóa học")]
        public int courseId { get; set; }

        public Course Course { get; set; }

        public ICollection<Exercise> Exercises { get; set; }
    }
}
