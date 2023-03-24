using Courses_MVC.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.configurations
{
    public class ExerciseConfiguration : IEntityTypeConfiguration<Exercise>
    {
        public void Configure(EntityTypeBuilder<Exercise> builder)
        {
            builder.ToTable("exercise");

            //userID

            builder.HasOne(x => x.AppUser)
                .WithMany(x => x.Exercises)
                .HasForeignKey(x => x.userId);
                
            //lessonID
            builder.Property(x => x.lessonId).IsRequired();

            builder.Property(x => x.exerciseName).IsRequired()
                .HasMaxLength(500);

            builder.HasOne(x => x.Lesson)
                .WithMany(x => x.Exercises)
                .HasForeignKey(x => x.lessonId);

            builder.Property(x => x.input).IsRequired()
                .HasMaxLength(500);

            builder.Property(x => x.output).IsRequired()
                .HasMaxLength(500);

            builder.HasKey(x => x.exerciseId);
            builder.Property(x => x.exerciseId).ValueGeneratedOnAdd();

            builder.Property(x => x.content).IsRequired()
                .HasMaxLength(1000);

            builder.Property(x => x.deadline).IsRequired()
                .HasColumnType("date");      
        }
    }
}
