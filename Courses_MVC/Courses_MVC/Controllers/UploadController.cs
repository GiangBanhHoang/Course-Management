using AutoMapper;
using Courses_MVC.Data;
using Courses_MVC.Hubs;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Courses_MVC.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        private readonly int FileSizeLimit; //Giới hạn kích thước của file
        private readonly string[] AllowedExtensions; //Lọc định dạng của file (png, jpg,..)
        private readonly CoursesContext _context;
        private readonly IMapper _mapper;
        private readonly IWebHostEnvironment _environment; // có thể lấy được cái folder trong wwwroot hoặc lưu được file vào trong wwwroot
        private readonly IHubContext<ChatHub> _hubContext;
        public UploadController(CoursesContext context,
            IMapper mapper,
            IWebHostEnvironment environment,
           IHubContext<ChatHub> hubContext,
            IConfiguration configruation)
        {
            _context = context;
            _mapper = mapper;
            _environment = environment;
            _hubContext = hubContext;

            FileSizeLimit = configruation.GetSection("FileUpload").GetValue<int>("FileSizeLimit");
            AllowedExtensions = configruation.GetSection("FileUpload").GetValue<string>("AllowedExtensions").Split(",");
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        public async Task<IActionResult> Upload([FromForm] UploadViewModel uploadViewModel)
        {
            if (ModelState.IsValid)
            {
                if (!Validate(uploadViewModel.File))
                {
                    return BadRequest("Xác thực không thành công!");
                }

                var fileName = DateTime.Now.ToString("yyyymmddMMss") + "_" + Path.GetFileName(uploadViewModel.File.FileName); //Tạo đường dẫn file (thời gian _ tên file)
                var folderPath = Path.Combine(_environment.WebRootPath, "uploads"); //Điều hướng file vừa lấy được vào folder uploads
                var filePath = Path.Combine(folderPath, fileName);
                if (!Directory.Exists(folderPath)) //Kiểm tra folder uploads có tồn tại không
                    Directory.CreateDirectory(folderPath); //Nếu không hệ thống tự tạo folder uploads

                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await uploadViewModel.File.CopyToAsync(fileStream);
                }

                var user = _context.Users.Where(u => u.UserName == User.Identity.Name).FirstOrDefault(); // lấy user đang đăng nhập
                var room = _context.Rooms.Where(r => r.Id == uploadViewModel.RoomId).FirstOrDefault(); //Lấy được phòng hiện tại
                if (user == null || room == null)
                    return NotFound();

                string htmlImage = string.Format(
                    "<a href=\"/uploads/{0}\" target=\"_blank\">" +
                    "<img src=\"/uploads/{0}\" class=\"post-image\">" +
                    "</a>", fileName);

                var message = new Message() 
                {
                    Content = Regex.Replace(htmlImage, @"(?i)<(?!img|a|/a|/img).*?>", string.Empty), //cắt bỏ cách định dạng thừa
                    Timestamp = DateTime.Now,
                    AppUser = user,
                    Room = room
                };

                await _context.Messages.AddAsync(message); //Lưu vào Model Message
                await _context.SaveChangesAsync();

                // Send image-message to group
                var messageViewModel = _mapper.Map<Message, MessageViewModel>(message);
                //await _hubContext.Clients.Group(room.Name).SendAsync("newMessage", messageViewModel);

                return Ok();
            }

            return BadRequest();
        }

        private bool Validate(IFormFile file)
        {
            if (file.Length > FileSizeLimit)
                return false;

            var extension = Path.GetExtension(file.FileName).ToLowerInvariant(); //Lấy ra fileName để nối chuỗi
            if (string.IsNullOrEmpty(extension) || !AllowedExtensions.Any(s => s.Contains(extension)))
                return false;

            return true;
        }
    }
}
