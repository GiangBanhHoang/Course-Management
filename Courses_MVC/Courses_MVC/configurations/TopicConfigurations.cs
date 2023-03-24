using Courses_MVC.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Courses_MVC.configurations
{
    public class TopicConfigurations : IEntityTypeConfiguration<Topic>
    {
        
        public void Configure(EntityTypeBuilder<Topic> builder)
        {
            builder.ToTable("topic");

            builder.HasKey(x => x.topicId);
            builder.Property(x => x.topicId).ValueGeneratedOnAdd();

            builder.Property(x => x.topicName).IsRequired()
                .HasMaxLength(50);

        }
    }
}
