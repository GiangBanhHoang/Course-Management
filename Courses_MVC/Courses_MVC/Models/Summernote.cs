using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.Models
{
    public class Summernote
    {
        public Summernote(string IdEditor, bool LoadLibary = true)
        {
            idEditor = IdEditor;
            loadLibary = LoadLibary;
        }
        public string idEditor { get; set; }

        public bool loadLibary { get; set; }

        public int height { get; set; } = 120;

        public string toolBar { get; set; } = @"[
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['height', ['height']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ]";
    }
}
