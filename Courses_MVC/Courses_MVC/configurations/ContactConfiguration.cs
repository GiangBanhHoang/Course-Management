using Courses_MVC.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.configurations
{
    public class ContactConfiguration : IEntityTypeConfiguration<Contact>
    {
        public void Configure(EntityTypeBuilder<Contact> builder)
        {
            builder.ToTable("Contact");

            builder.HasKey(x => x.contactId);
            builder.Property(x => x.contactId)
                .ValueGeneratedOnAdd();

            builder.Property(x => x.HoTen).HasMaxLength(100);

            builder.Property(x => x.SDT).HasMaxLength(11)
                .IsRequired();

            

            builder.Property(x => x.email).HasColumnType("text");

            builder.Property(x => x.title).IsRequired()
                .HasMaxLength(500);

            builder.Property(x => x.content).HasColumnType("text")
                .IsRequired();

            builder.HasOne(x => x.AppUser)
                .WithMany(x => x.Contacts)
                .HasForeignKey(x => x.AppUserId);
        }
    }
}
