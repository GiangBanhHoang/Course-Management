using Courses_MVC.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.configurations
{
    public class AppUserConfigurations : IEntityTypeConfiguration<AppUser>
    {
        public void Configure(EntityTypeBuilder<AppUser> builder)
        {
            builder.ToTable("AppUser");

            builder.HasKey(x => x.Id);

            builder.Property(x => x.address)
                .HasMaxLength(200);

            builder.Property(x => x.avatar)
                .HasMaxLength(500);

            builder.Property(x => x.birthday)
                .HasColumnType("datetime");

            builder.Property(x => x.gender)
                .HasMaxLength(10);
        }


    }
}
