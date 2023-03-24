using Courses_MVC.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.configurations
{
    public class CommentConfiguration : IEntityTypeConfiguration<Comment>
    {
        public void Configure(EntityTypeBuilder<Comment> builder)
        {
            builder.ToTable("comment");

            builder.HasKey(x => x.cmtId );

            builder.Property(x => x.cmtId).ValueGeneratedOnAdd();

            builder.Property(x => x.content).IsRequired()
                .HasMaxLength(1000);

            builder.Property(x => x.evaluate).IsRequired();

            builder.HasOne(x => x.Course)
                .WithMany(x => x.Comments)
                .HasForeignKey(x => x.courseId);


            builder.HasOne(x => x.AppUser)
                .WithMany(x => x.Comments)
                .HasForeignKey(x => x.userId);
                
        }
    }
}
