using AutoMapper;
using Courses_MVC.Data;
using Courses_MVC.Hubs;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
//Dành cho signalR
namespace Courses_MVC.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomsController : ControllerBase
    {
        private readonly CoursesContext _context;
        private readonly IMapper _mapper;
        private readonly IHubContext<ChatHub> _hubContext; //Kết nói với hub
        public RoomsController(CoursesContext context, IMapper mapper, IHubContext<ChatHub> hubContext)
        {
            _context = context;
            _mapper = mapper;
            _hubContext = hubContext;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<RoomViewModel>>> Get()
        {

            var rooms = await _context.Rooms.ToListAsync();

            var roomsViewModel = _mapper.Map<IEnumerable<Room>, IEnumerable<RoomViewModel>>(rooms);

            return Ok(roomsViewModel);
        }


        [HttpGet("{id}")]
        public async Task<ActionResult<Room>> Get(int id)
        {
            var room = await _context.Rooms.FindAsync(id);
            if (room == null)
                return NotFound();

            var roomViewModel = _mapper.Map<Room, RoomViewModel>(room);
            return Ok(roomViewModel);
        }

        [HttpPost]
        public async Task<ActionResult<Room>> Create(RoomViewModel roomViewModel)
        {
            if (_context.Rooms.Any(r => r.Name == roomViewModel.Name)) //Kiểm tra room có tồn tại chưa
                return BadRequest("Tên phòng không hợp lệ hoặc phòng đã tồn tại");

            var user = _context.Users.FirstOrDefault(u => u.UserName == User.Identity.Name);
            var room = new Room()
            {
                Name = roomViewModel.Name,
                AppUser = user
            };

            _context.Rooms.Add(room);
            await _context.SaveChangesAsync();

            await _hubContext.Clients.All.SendAsync("addChatRoom", new { id = room.Id, name = room.Name });

            return CreatedAtAction(nameof(Get), new { id = room.Id }, new { id = room.Id, name = room.Name });
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Edit(int id, RoomViewModel roomViewModel)
        {
            if (_context.Rooms.Any(r => r.Name == roomViewModel.Name)) //Kiểm tra room có tồn tại chưa
                return BadRequest("Tên phòng không hợp lệ hoặc phòng đã tồn tại");

            var room = await _context.Rooms
                .Include(r => r.AppUser)
                .Where(r => r.Id == id && r.AppUser.UserName == User.Identity.Name)
                .FirstOrDefaultAsync(); //Lấy ra người tạo room

            if (room == null) //Kiểm tra user đấy không phải là người tạo room
                return NotFound();

            room.Name = roomViewModel.Name; //Chỉ có người tạo room mới được phép sửa room đó
            await _context.SaveChangesAsync();

            await _hubContext.Clients.All.SendAsync("updateChatRoom", new { id = room.Id, room.Name });

            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var room = await _context.Rooms
                .Include(r => r.AppUser)
                .Where(r => r.Id == id && r.AppUser.UserName == User.Identity.Name)
                .FirstOrDefaultAsync();

            if (room == null)
                return NotFound();

            _context.Rooms.Remove(room);
            await _context.SaveChangesAsync();

            await _hubContext.Clients.All.SendAsync("removeChatRoom", room.Id);
            await _hubContext.Clients.Group(room.Name).SendAsync("onRoomDeleted", string.Format("Phòng {0} đã xóa.\nBạn phải chuyển sang phòng khác!", room.Name));

            return NoContent();
        }
    }

}
