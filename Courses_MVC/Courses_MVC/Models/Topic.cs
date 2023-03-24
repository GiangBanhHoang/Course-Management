using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    public class Topic
    {
        public int topicId { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Tên chủ đề")]
        public string topicName { get; set; }
        public ICollection<Course> Course { get; set; }

    }
}
