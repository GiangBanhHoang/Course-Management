using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{

    public class Receipt
    {
        public int receiptId { get; set; }

        [Display(Name = "Tổng tiền")]
        public float totalPrice { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Thời gian đăng kí")]
        public DateTime timeReceipt { get; set; }

        [Required(ErrorMessage = "Phải nhập {0}")]
        [Display(Name = "Đăng kí")]
        public int registerId { get; set; }

        public Register Register { get; set; }
    }
}
