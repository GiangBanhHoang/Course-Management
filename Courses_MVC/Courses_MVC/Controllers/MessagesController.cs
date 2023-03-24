using AutoMapper;
using Courses_MVC.Data;
using Courses_MVC.Hubs;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
//Dành cho signalR
namespace Courses_MVC.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MessagesController : ControllerBase
    {
        private readonly CoursesContext _context;
        private readonly IMapper _mapper;
        private readonly IHubContext<ChatHub> _hubContext;
        public MessagesController(CoursesContext context, IMapper mapper, IHubContext<ChatHub> hubContext)
        {
            _context = context;
            _mapper = mapper;
            _hubContext = hubContext;
        }


        [HttpGet("{id}")]
        public async Task<ActionResult<Room>> Get(int id)
        {
            var message = await _context.Messages.FindAsync(id);
            if (message == null)
                return NotFound();

            var messageViewModel = _mapper.Map<Message, MessageViewModel>(message);
            return Ok(messageViewModel);
        }


        //Lấy message từ room
        [HttpGet("Room/{roomName}")]
        public IActionResult GetMessages(string roomName)
        {
            var room = _context.Rooms.FirstOrDefault(r => r.Name == roomName); //Lọc roomName trong csdl
            if (room == null)
                return BadRequest();

            var messages = _context.Messages.Where(m => m.ToRoomId == room.Id) // Lấy message có cùng id của room
                .Include(m => m.AppUser)
                .Include(m => m.Room)
                .OrderByDescending(m => m.Timestamp)
                .Take(20)
                .AsEnumerable()
                .Reverse()
                .ToList();

            var messagesViewModel = _mapper.Map<IEnumerable<Message>, IEnumerable<MessageViewModel>>(messages);//mapper message lên cho messageViewModel

            return Ok(messagesViewModel);
        }

        [HttpPost]
        public async Task<ActionResult<Message>> Create(MessageViewModel messageViewModel)
        {
            var user = _context.Users.FirstOrDefault(u => u.UserName == User.Identity.Name);
            var room = _context.Rooms.FirstOrDefault(r => r.Name == messageViewModel.Room);
            if (room == null)
                return BadRequest();

            var msg = new Message()
            {
                Content = Regex.Replace(messageViewModel.Content, @"<.*?>", string.Empty),
                AppUser = user,
                Room = room,
                Timestamp = DateTime.Now
            };

            _context.Messages.Add(msg);
            await _context.SaveChangesAsync();

            // Broadcast the message
            var createdMessage = _mapper.Map<Message, MessageViewModel>(msg);
            await _hubContext.Clients.Group(room.Name).SendAsync("newMessage", createdMessage);

            return CreatedAtAction(nameof(Get), new { id = msg.Id }, createdMessage);
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var message = await _context.Messages
                .Include(u => u.AppUser)
                .Where(m => m.Id == id && m.AppUser.UserName == User.Identity.Name) //user phải đăng nhập vào mới lấy được name
                .FirstOrDefaultAsync();

            if (message == null)
                return NotFound();

            _context.Messages.Remove(message);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
