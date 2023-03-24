using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    public class Exercise
    {
        public int exerciseId { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Tên bài tập")]
        public string exerciseName { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Nội dung")]
        public string content { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Input")]
        public string input { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Output")]
        public string output { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Deadline")]
        public DateTime deadline { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Tên bài học")]
        public int lessonId { get; set; }

        public Lesson Lesson { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Tên người dùng")]
        public string userId { get; set; }

        public AppUser AppUser { get; set; }

        public ICollection<ExerciseInUser> ExerciseInUsers { get; set; }
    }
}
