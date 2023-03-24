using Courses_MVC.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.configurations
{
    public class ExerciseInUserConfiguration : IEntityTypeConfiguration<ExerciseInUser>
    {
        public void Configure(EntityTypeBuilder<ExerciseInUser> builder)
        {
            builder.ToTable("exerciseInUser"); 

            builder.HasKey(x => new { x.userId, x.exerciseId });

            builder.Property(x => x.content).IsRequired()
                .HasColumnType("text");

            builder.Property(x => x.submit).IsRequired()
                .HasColumnType("datetime");

            builder.Property(x => x.scores)
                .HasColumnType("float");

            builder.Property(x => x.status).HasDefaultValue("Chưa chấm điểm")
                .HasMaxLength(100);
            

            builder.HasOne(x => x.Exercise)
                .WithMany(x => x.ExerciseInUsers)
                .HasForeignKey(x => x.exerciseId);

            builder.HasOne(x => x.AppUser)
                .WithMany(x => x.ExerciseInUsers)
                .HasForeignKey(x => x.userId);
                
        }
    }
}
