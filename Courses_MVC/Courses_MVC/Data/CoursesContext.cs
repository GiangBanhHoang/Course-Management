using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Courses_MVC.configurations;
using Courses_MVC.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using MySql.Data.MySqlClient;

namespace Courses_MVC.Data
{
    public class CoursesContext : IdentityDbContext<AppUser>
    {
        
        public CoursesContext(DbContextOptions<CoursesContext> options) : base(options)
        {

        }

        public DbSet<Comment> Comments { get; set; }

        public DbSet<ExerciseInUser> ExerciseInUsers { get; set; }

        public DbSet<Exercise> Exercises { get; set; }

        public DbSet<Receipt> Receipts { get; set; }

        public DbSet<Register> Registers { get; set; }
        /*kd*/
        //public DbSet<AppUser> Users { get; set; }
        public DbSet<Topic> Topic { get; set; }
        public DbSet<Course> Courses { get; set; }
        public DbSet<Lesson> Lessons { get; set; }
        public DbSet<Discount> Discounts { get; set; }
        public DbSet<Contact> Contact { get; set; }
        public DbSet<Message> Messages { get; set; }
        public DbSet<Room> Rooms { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new RegisterConfiguration());
            modelBuilder.ApplyConfiguration(new ReceiptConfiguration());
            modelBuilder.ApplyConfiguration(new CommentConfiguration());
            modelBuilder.ApplyConfiguration(new ExerciseConfiguration());
            modelBuilder.ApplyConfiguration(new ExerciseInUserConfiguration());
            modelBuilder.ApplyConfiguration(new AppUserConfigurations());
            modelBuilder.ApplyConfiguration(new TopicConfigurations());
            modelBuilder.ApplyConfiguration(new CourseConfiguration());
            modelBuilder.ApplyConfiguration(new LessonConfiguration());
            modelBuilder.ApplyConfiguration(new DiscountConfiguration());
            modelBuilder.ApplyConfiguration(new ContactConfiguration());
            modelBuilder.ApplyConfiguration(new MessageConfiguration());
            modelBuilder.ApplyConfiguration(new RoomConfiguration());


            modelBuilder.Entity<IdentityRole<string>>(entity =>
            {
                entity.ToTable("AppRole");
                entity.HasKey(x => new { x.Id });
                entity.Property(x => x.Id).HasMaxLength(100);
            });
            modelBuilder.Entity<IdentityUserLogin<string>>(entity =>
            {
                entity.ToTable("AppUserLogin");
                entity.HasKey(x => new { x.UserId });
                entity.Property(x => x.UserId).HasMaxLength(100);
                //entity.Property(x => x.ProviderKey).HasMaxLength(100);
            });
            modelBuilder.Entity<IdentityUserRole<string>>(entity =>
            {
                entity.ToTable("AppUserRole");
                entity.HasKey(x => new { x.UserId, x.RoleId });
                entity.Property(x => x.UserId).HasMaxLength(100);
                entity.Property(x => x.RoleId).HasMaxLength(100);
            });
            modelBuilder.Entity<IdentityRoleClaim<string>>(entity =>
            {
                entity.ToTable("AppRoleClaim");
                entity.HasKey(x => x.Id);
                entity.Property(x => x.Id).HasMaxLength(100);
            });
            
            modelBuilder.Entity<IdentityUserClaim<string>>(entity =>
            {
                entity.ToTable("AppUserClaim");
                entity.HasKey(x => x.Id);
                entity.Property(x => x.Id).HasMaxLength(100);
            });
            modelBuilder.Entity<IdentityUserToken<string>>(entity =>
            {
                entity.ToTable("AppUserToken");
                entity.HasKey(x =>  x.UserId);
                entity.Property(x => x.UserId).HasMaxLength(100);
                //entity.Property(x => x.LoginProvider).HasMaxLength(100);
                //entity.Property(x => x.Name).HasMaxLength(100);
            });
        }
        

        
    }
}
