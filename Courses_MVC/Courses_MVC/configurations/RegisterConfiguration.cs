using Courses_MVC.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.configurations
{
    public class RegisterConfiguration : IEntityTypeConfiguration<Register>
    {
        public void Configure(EntityTypeBuilder<Register> builder)
        {
            builder.ToTable("register");

            builder.HasKey(x => x.registerId);
            builder.Property(x => x.registerId).ValueGeneratedOnAdd();


            builder.Property(x => x.timeReg).IsRequired()
                .HasColumnType("datetime");

            builder.Property(x => x.courseId).IsRequired();
            builder.HasOne(x => x.Course)
                .WithMany(x => x.Registers)
                .HasForeignKey(x => x.courseId);

            builder.Property(x => x.userId).IsRequired();
            builder.HasOne(x => x.AppUser)
                .WithMany(x => x.Registers)
                .HasForeignKey(x => x.userId);
                
        }
    }
}
