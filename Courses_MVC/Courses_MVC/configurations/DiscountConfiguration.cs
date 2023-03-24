using Courses_MVC.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.configurations
{
    public class DiscountConfiguration : IEntityTypeConfiguration<Discount>
    {
        public void Configure(EntityTypeBuilder<Discount> builder)
        {
            builder.ToTable("discount");

            builder.HasKey(x => x.discountId);
            builder.Property(x => x.discountId).ValueGeneratedOnAdd();

            builder.Property(x => x.discription).IsRequired()
                .HasMaxLength(1000);

            builder.Property(x => x.time).IsRequired()
                .HasColumnType("datetime");

            builder.Property(x => x.sale).IsRequired()
                .HasColumnType("float");
            
        }
    }
}
