using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    public class UploadViewModel
    {
        [Required]
        public int RoomId { get; set; }
        [Required]
        public IFormFile File { get; set; } //sử dụng IFormFile để lấy file về
    }
}
