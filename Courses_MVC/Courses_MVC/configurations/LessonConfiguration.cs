using Courses_MVC.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.configurations
{
    public class LessonConfiguration : IEntityTypeConfiguration<Lesson>
    {
        public void Configure(EntityTypeBuilder<Lesson> builder)
        {
            builder.ToTable("lesson");

            builder.HasKey(x => x.lessonId);
            builder.Property(x => x.lessonId).ValueGeneratedOnAdd();

            builder.Property(x => x.title).IsRequired()
                .HasMaxLength(200);

            builder.Property(x => x.link).IsRequired()
                .HasMaxLength(5000);

            builder.Property(x => x.captionLink).IsRequired()
                .HasMaxLength(500);

            builder.Property(x => x.content).IsRequired()
                .HasMaxLength(1000);

            builder.Property(x => x.courseId).IsRequired();

            builder.HasOne(x => x.Course)
                .WithMany(x => x.Lessons)
                .HasForeignKey(x => x.courseId);
                

        }
    }
}
