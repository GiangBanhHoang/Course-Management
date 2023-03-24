using Courses_MVC.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.configurations
{
    public class ReceiptConfiguration : IEntityTypeConfiguration<Receipt>
    {
        public void Configure(EntityTypeBuilder<Receipt> builder)
        {
            builder.ToTable("receipt");

            builder.HasKey(x => x.receiptId);
            builder.Property(x => x.receiptId).ValueGeneratedOnAdd();

            builder.Property(x => x.totalPrice)
                .HasDefaultValue(0);


            builder.Property(x => x.timeReceipt).IsRequired()
                .HasColumnType("datetime");

            builder.HasOne(x => x.Register)
                .WithMany(x => x.Receipts)
                .HasForeignKey(x => x.registerId);
                
        }
    }
}
