using Courses_MVC.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.configurations
{
    public class CourseConfiguration : IEntityTypeConfiguration<Course>
    {
        public void Configure(EntityTypeBuilder<Course> builder)
        {
            builder.ToTable("course");

            builder.HasKey(x => x.courseId);
            builder.Property(x => x.courseId).ValueGeneratedOnAdd();

            builder.Property(x => x.courseName).IsRequired()
                .HasMaxLength(50);

            builder.Property(x => x.discription).IsRequired()
                .HasMaxLength(1000);

            builder.Property(x => x.totalTime).IsRequired()
                .HasMaxLength(100);
            
            builder.Property(x => x.totalStudent).IsRequired();

            builder.Property(x => x.courseName).IsRequired()
                .HasMaxLength(50);

            builder.Property(x => x.price).IsRequired()
                .HasDefaultValue(0);

            

            builder.Property(x => x.originalPrice).IsRequired();

            builder.Property(x => x.imgCourse).IsRequired()
                .HasMaxLength(5000);

            /*builder.HasMany(x => x.Lessons)
                .WithOne();*/

            builder.HasOne(x => x.Topic)
                .WithMany(x => x.Course)
                .HasForeignKey(x => x.topicId);


            builder.HasOne(x => x.Discount)
                .WithMany(x => x.Courses)
                .HasForeignKey(x => x.discountId);
                
        }
    }
}
