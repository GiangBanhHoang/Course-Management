using System;
using Microsoft.EntityFrameworkCore.Migrations;
using MySql.Data.EntityFrameworkCore.Metadata;

namespace Courses_MVC.Migrations
{
    public partial class new1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AppRole",
                columns: table => new
                {
                    Id = table.Column<string>(maxLength: 100, nullable: false),
                    Name = table.Column<string>(nullable: true),
                    NormalizedName = table.Column<string>(nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true),
                    Discriminator = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AppRole", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AppRoleClaim",
                columns: table => new
                {
                    Id = table.Column<int>(maxLength: 100, nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    RoleId = table.Column<string>(nullable: true),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AppRoleClaim", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AppUser",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    UserName = table.Column<string>(nullable: true),
                    NormalizedUserName = table.Column<string>(nullable: true),
                    Email = table.Column<string>(nullable: true),
                    NormalizedEmail = table.Column<string>(nullable: true),
                    EmailConfirmed = table.Column<bool>(nullable: false),
                    PasswordHash = table.Column<string>(nullable: true),
                    SecurityStamp = table.Column<string>(nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true),
                    PhoneNumber = table.Column<string>(nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(nullable: false),
                    TwoFactorEnabled = table.Column<bool>(nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(nullable: true),
                    LockoutEnabled = table.Column<bool>(nullable: false),
                    AccessFailedCount = table.Column<int>(nullable: false),
                    address = table.Column<string>(maxLength: 200, nullable: true),
                    birthday = table.Column<DateTime>(type: "datetime", nullable: true),
                    avatar = table.Column<string>(maxLength: 500, nullable: true),
                    gender = table.Column<string>(maxLength: 10, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AppUser", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AppUserClaim",
                columns: table => new
                {
                    Id = table.Column<int>(maxLength: 100, nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    UserId = table.Column<string>(nullable: true),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AppUserClaim", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AppUserLogin",
                columns: table => new
                {
                    UserId = table.Column<string>(maxLength: 100, nullable: false),
                    LoginProvider = table.Column<string>(nullable: true),
                    ProviderKey = table.Column<string>(nullable: true),
                    ProviderDisplayName = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AppUserLogin", x => x.UserId);
                });

            migrationBuilder.CreateTable(
                name: "AppUserRole",
                columns: table => new
                {
                    UserId = table.Column<string>(maxLength: 100, nullable: false),
                    RoleId = table.Column<string>(maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AppUserRole", x => new { x.UserId, x.RoleId });
                });

            migrationBuilder.CreateTable(
                name: "AppUserToken",
                columns: table => new
                {
                    UserId = table.Column<string>(maxLength: 100, nullable: false),
                    LoginProvider = table.Column<string>(nullable: true),
                    Name = table.Column<string>(nullable: true),
                    Value = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AppUserToken", x => x.UserId);
                });

            migrationBuilder.CreateTable(
                name: "discount",
                columns: table => new
                {
                    discountId = table.Column<int>(nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    discription = table.Column<string>(maxLength: 1000, nullable: false),
                    time = table.Column<DateTime>(type: "datetime", nullable: false),
                    sale = table.Column<float>(type: "float", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_discount", x => x.discountId);
                });

            migrationBuilder.CreateTable(
                name: "topic",
                columns: table => new
                {
                    topicId = table.Column<int>(nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    topicName = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_topic", x => x.topicId);
                });

            migrationBuilder.CreateTable(
                name: "Contact",
                columns: table => new
                {
                    contactId = table.Column<int>(nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    AppUserId = table.Column<string>(nullable: true),
                    HoTen = table.Column<string>(maxLength: 100, nullable: true),
                    email = table.Column<string>(type: "text", nullable: false),
                    SDT = table.Column<string>(maxLength: 11, nullable: false),
                    title = table.Column<string>(maxLength: 500, nullable: false),
                    content = table.Column<string>(type: "text", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Contact", x => x.contactId);
                    table.ForeignKey(
                        name: "FK_Contact_AppUser_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUser",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Rooms",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    AppUserId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Rooms", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Rooms_AppUser_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUser",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "course",
                columns: table => new
                {
                    courseId = table.Column<int>(nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    courseName = table.Column<string>(maxLength: 50, nullable: false),
                    discription = table.Column<string>(maxLength: 1000, nullable: false),
                    price = table.Column<int>(nullable: false, defaultValue: 0),
                    originalPrice = table.Column<int>(nullable: false),
                    imgCourse = table.Column<string>(maxLength: 5000, nullable: false),
                    totalTime = table.Column<string>(maxLength: 100, nullable: false),
                    rating = table.Column<int>(nullable: false),
                    totalStudent = table.Column<int>(nullable: false),
                    topicId = table.Column<int>(nullable: false),
                    discountId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_course", x => x.courseId);
                    table.ForeignKey(
                        name: "FK_course_discount_discountId",
                        column: x => x.discountId,
                        principalTable: "discount",
                        principalColumn: "discountId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_course_topic_topicId",
                        column: x => x.topicId,
                        principalTable: "topic",
                        principalColumn: "topicId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Messages",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    Content = table.Column<string>(maxLength: 500, nullable: false),
                    Timestamp = table.Column<DateTime>(nullable: false),
                    ToRoomId = table.Column<int>(nullable: false),
                    AppUserId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Messages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Messages_AppUser_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUser",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Messages_Rooms_ToRoomId",
                        column: x => x.ToRoomId,
                        principalTable: "Rooms",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "comment",
                columns: table => new
                {
                    cmtId = table.Column<int>(nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    userId = table.Column<string>(nullable: false),
                    courseId = table.Column<int>(nullable: false),
                    content = table.Column<string>(maxLength: 1000, nullable: false),
                    evaluate = table.Column<float>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_comment", x => x.cmtId);
                    table.ForeignKey(
                        name: "FK_comment_course_courseId",
                        column: x => x.courseId,
                        principalTable: "course",
                        principalColumn: "courseId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_comment_AppUser_userId",
                        column: x => x.userId,
                        principalTable: "AppUser",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "lesson",
                columns: table => new
                {
                    lessonId = table.Column<int>(nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    title = table.Column<string>(maxLength: 200, nullable: false),
                    description = table.Column<string>(nullable: false),
                    content = table.Column<string>(maxLength: 1000, nullable: false),
                    link = table.Column<string>(maxLength: 5000, nullable: false),
                    captionLink = table.Column<string>(maxLength: 500, nullable: false),
                    courseId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_lesson", x => x.lessonId);
                    table.ForeignKey(
                        name: "FK_lesson_course_courseId",
                        column: x => x.courseId,
                        principalTable: "course",
                        principalColumn: "courseId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "register",
                columns: table => new
                {
                    registerId = table.Column<int>(nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    timeReg = table.Column<DateTime>(type: "datetime", nullable: false),
                    userId = table.Column<string>(nullable: false),
                    courseId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_register", x => x.registerId);
                    table.ForeignKey(
                        name: "FK_register_course_courseId",
                        column: x => x.courseId,
                        principalTable: "course",
                        principalColumn: "courseId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_register_AppUser_userId",
                        column: x => x.userId,
                        principalTable: "AppUser",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "exercise",
                columns: table => new
                {
                    exerciseId = table.Column<int>(nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    exerciseName = table.Column<string>(maxLength: 500, nullable: false),
                    content = table.Column<string>(maxLength: 1000, nullable: false),
                    input = table.Column<string>(maxLength: 500, nullable: false),
                    output = table.Column<string>(maxLength: 500, nullable: false),
                    deadline = table.Column<DateTime>(type: "date", nullable: false),
                    lessonId = table.Column<int>(nullable: false),
                    userId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_exercise", x => x.exerciseId);
                    table.ForeignKey(
                        name: "FK_exercise_lesson_lessonId",
                        column: x => x.lessonId,
                        principalTable: "lesson",
                        principalColumn: "lessonId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_exercise_AppUser_userId",
                        column: x => x.userId,
                        principalTable: "AppUser",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "receipt",
                columns: table => new
                {
                    receiptId = table.Column<int>(nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    totalPrice = table.Column<float>(nullable: false, defaultValue: 0f),
                    timeReceipt = table.Column<DateTime>(type: "datetime", nullable: false),
                    registerId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_receipt", x => x.receiptId);
                    table.ForeignKey(
                        name: "FK_receipt_register_registerId",
                        column: x => x.registerId,
                        principalTable: "register",
                        principalColumn: "registerId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "exerciseInUser",
                columns: table => new
                {
                    exerciseId = table.Column<int>(nullable: false),
                    userId = table.Column<string>(nullable: false),
                    content = table.Column<string>(type: "text", nullable: false),
                    status = table.Column<string>(maxLength: 100, nullable: false, defaultValue: "Chưa chấm điểm"),
                    submit = table.Column<DateTime>(type: "datetime", nullable: false),
                    scores = table.Column<float>(type: "float", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_exerciseInUser", x => new { x.userId, x.exerciseId });
                    table.ForeignKey(
                        name: "FK_exerciseInUser_exercise_exerciseId",
                        column: x => x.exerciseId,
                        principalTable: "exercise",
                        principalColumn: "exerciseId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_exerciseInUser_AppUser_userId",
                        column: x => x.userId,
                        principalTable: "AppUser",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_comment_courseId",
                table: "comment",
                column: "courseId");

            migrationBuilder.CreateIndex(
                name: "IX_comment_userId",
                table: "comment",
                column: "userId");

            migrationBuilder.CreateIndex(
                name: "IX_Contact_AppUserId",
                table: "Contact",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_course_discountId",
                table: "course",
                column: "discountId");

            migrationBuilder.CreateIndex(
                name: "IX_course_topicId",
                table: "course",
                column: "topicId");

            migrationBuilder.CreateIndex(
                name: "IX_exercise_lessonId",
                table: "exercise",
                column: "lessonId");

            migrationBuilder.CreateIndex(
                name: "IX_exercise_userId",
                table: "exercise",
                column: "userId");

            migrationBuilder.CreateIndex(
                name: "IX_exerciseInUser_exerciseId",
                table: "exerciseInUser",
                column: "exerciseId");

            migrationBuilder.CreateIndex(
                name: "IX_lesson_courseId",
                table: "lesson",
                column: "courseId");

            migrationBuilder.CreateIndex(
                name: "IX_Messages_AppUserId",
                table: "Messages",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Messages_ToRoomId",
                table: "Messages",
                column: "ToRoomId");

            migrationBuilder.CreateIndex(
                name: "IX_receipt_registerId",
                table: "receipt",
                column: "registerId");

            migrationBuilder.CreateIndex(
                name: "IX_register_courseId",
                table: "register",
                column: "courseId");

            migrationBuilder.CreateIndex(
                name: "IX_register_userId",
                table: "register",
                column: "userId");

            migrationBuilder.CreateIndex(
                name: "IX_Rooms_AppUserId",
                table: "Rooms",
                column: "AppUserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AppRole");

            migrationBuilder.DropTable(
                name: "AppRoleClaim");

            migrationBuilder.DropTable(
                name: "AppUserClaim");

            migrationBuilder.DropTable(
                name: "AppUserLogin");

            migrationBuilder.DropTable(
                name: "AppUserRole");

            migrationBuilder.DropTable(
                name: "AppUserToken");

            migrationBuilder.DropTable(
                name: "comment");

            migrationBuilder.DropTable(
                name: "Contact");

            migrationBuilder.DropTable(
                name: "exerciseInUser");

            migrationBuilder.DropTable(
                name: "Messages");

            migrationBuilder.DropTable(
                name: "receipt");

            migrationBuilder.DropTable(
                name: "exercise");

            migrationBuilder.DropTable(
                name: "Rooms");

            migrationBuilder.DropTable(
                name: "register");

            migrationBuilder.DropTable(
                name: "lesson");

            migrationBuilder.DropTable(
                name: "AppUser");

            migrationBuilder.DropTable(
                name: "course");

            migrationBuilder.DropTable(
                name: "discount");

            migrationBuilder.DropTable(
                name: "topic");
        }
    }
}
