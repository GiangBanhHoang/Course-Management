-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2022 at 02:49 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanlykhoahoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `approle`
--

CREATE TABLE `approle` (
  `Id` varchar(100) NOT NULL,
  `Name` text DEFAULT NULL,
  `NormalizedName` text DEFAULT NULL,
  `ConcurrencyStamp` text DEFAULT NULL,
  `Discriminator` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `approle`
--

INSERT INTO `approle` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`, `Discriminator`) VALUES
('166b3f9d-a7f7-4154-8374-30980d66df15', 'Manager', 'MANAGER', '4c95fb39-f180-4542-adfa-8afa8979e275', 'IdentityRole'),
('6eae9fb2-30e2-4b46-996a-69cee71bb287', 'Admin', 'ADMIN', 'df82b5a0-80f5-404a-8de1-3f66bd9efada', 'IdentityRole'),
('797a66f0-0bdd-4043-b9c0-62f01661d189', 'Viewer', 'VIEWER', '0cd5b9b1-c993-4445-9bc3-95a948904f39', 'IdentityRole');

-- --------------------------------------------------------

--
-- Table structure for table `approleclaim`
--

CREATE TABLE `approleclaim` (
  `Id` int(11) NOT NULL,
  `RoleId` text DEFAULT NULL,
  `ClaimType` text DEFAULT NULL,
  `ClaimValue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `appuser`
--

CREATE TABLE `appuser` (
  `Id` varchar(767) NOT NULL,
  `UserName` text DEFAULT NULL,
  `NormalizedUserName` text DEFAULT NULL,
  `Email` text DEFAULT NULL,
  `NormalizedEmail` text DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` text DEFAULT NULL,
  `SecurityStamp` text DEFAULT NULL,
  `ConcurrencyStamp` text DEFAULT NULL,
  `PhoneNumber` text DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` timestamp NULL DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appuser`
--

INSERT INTO `appuser` (`Id`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`, `address`, `birthday`, `avatar`, `gender`) VALUES
('45dbe999-133c-4acf-b110-c98521d7c81d', 'NguyenThanhThanh', 'NGUYENTHANHTHANH', 'nguyenthitonhi201901@gmail.com', 'NGUYENTHITONHI201901@GMAIL.COM', 1, 'AQAAAAEAACcQAAAAEIJb7J48jxTzasBbqTWtjFvZ5vZX5TDqTLpEghB99ES5VhZPEKABvpQwtSDK6tFZSg==', 'SBSUHNMD6JFW2IK346A3FJUNY43V5ACJ', 'f6059c8d-9a3b-4769-8cbd-c76d8c1244ca', NULL, 0, 0, NULL, 1, 0, NULL, '2001-08-04 00:00:00', 'avatar2.png', 'Nữ'),
('536f72a5-2a3b-43d7-af03-4d4139f15ea5', 'LeThiThanhTam', 'LETHITHANHTAM', 'tam616985@gmail.com', 'TAM616985@GMAIL.COM', 1, 'AQAAAAEAACcQAAAAEBcrmzWxEpg3cbFe1kkhf3vFf3xp1JmflPEB4xoQ6OniaPh6lf//FwGtYyeX05XffQ==', 'K2H4IVQ5YEAV7X4T3EZ64BOQAEM57WH2', '7eb6859d-56b7-414e-9b9e-bc9577e160c1', NULL, 0, 0, NULL, 1, 0, NULL, '2001-07-04 00:00:00', 'avatar4.png', 'Nam'),
('53b4d55f-4957-47af-b5a5-867752ff789b', 'NguyenVanA', 'NGUYENVANA', 'abcd@gmail.com', 'ABCD@GMAIL.COM', 1, 'AQAAAAEAACcQAAAAEJtYEgFEQaiCn3Zl8FNyeFG4r6lGqHQJZItHcZBF+Ad2MVCuNggGZQHLeXlfqbbu1g==', '6ITMNR54AKBGH3U4BDCJIITQENPELOIS', 'f3964e92-52d3-445d-97f8-848183553fe7', NULL, 0, 0, NULL, 1, 0, NULL, '2021-12-01 00:00:00', 'avatar3.png', 'Nam'),
('5b18a35a-7886-41d1-9731-4c9e6ebfbdf6', 'NguyenThanhHai', 'NGUYENTHANHHAI', 'giangbanhhoang@gmail.com', 'GIANGBANHHOANG@GMAIL.COM', 1, 'AQAAAAEAACcQAAAAEBBzJTu2tZV7GmTdhAEUMREv3Cry4qWc8gp8Fpw5NrnO4An/LBHD8fRe5eeEDLDa6w==', 'NONJCP6CRTDJF74WWQYEPPMDDWOT277L', 'fe8e5e30-3360-4b5f-83b3-81c7f9247426', NULL, 0, 0, NULL, 1, 0, NULL, '2000-01-01 00:00:00', 'avatar3.png', 'Nam'),
('5b6a622b-2372-49e0-8f3c-c716b4e34c20', 'NguyenThanhTu', 'NGUYENTHANHTU', 'hoanggiang969920@gmail.com', 'HOANGGIANG969920@GMAIL.COM', 1, 'AQAAAAEAACcQAAAAEOtw0MJy5TP+McXf2RrsC6eFtjt6peuru3usL+9gU2KyhWMBkaRvC3pjJ9yO5yD0cQ==', '7R3BTBQLVMDOVW7ZLHYKIZC3UDW7BCTR', 'e09c19d3-be9c-4cb9-bfa8-6cba98231ff5', NULL, 0, 0, NULL, 1, 0, NULL, '2001-01-23 00:00:00', 'avatar1.png', 'Nam'),
('677aa397-36b0-4676-a955-7e6c4297fb3a', 'TranPhanHaiDang', 'TRANPHANHAIDANG', 'haidangtr15012001@gmail.com', 'HAIDANGTR15012001@GMAIL.COM', 1, 'AQAAAAEAACcQAAAAEHU/i3B1VXzyAQ8WhlMJr9NfdOKGReMiEHbPwAW7rLDoP1zY2FDhlXMMzyRXtv6Kgg==', 'T77DV3Y4DASQLVAHKZUGBCUMGMNXIU6M', '79943261-b03c-4add-b144-8b9ea135202b', NULL, 0, 0, NULL, 1, 0, NULL, '2001-01-15 00:00:00', 'avatar1.png', 'Nam'),
('71a4c50d-fc68-474a-895b-8682f0141b93', 'KhanhDuy', 'KHANHDUY', '19521420@gm.uit.edu.vn', '19521420@GM.UIT.EDU.VN', 1, 'AQAAAAEAACcQAAAAENb1Pgwlh5SCkeLef1AH1W4QYJC4iS1syKbOZJu0ai39XXyoGjGZA7zpoCzGOe+Ezw==', 'J3RIIU7AGPH4EMKDZ5CGPE2ZTRQR3RBK', '346b9806-4410-44ab-b6e4-629ace18799d', NULL, 0, 0, NULL, 1, 0, NULL, '2001-03-18 00:00:00', 'avatar2.png', 'Nam'),
('755a5fe7-7907-4f21-8173-9eb5337900d4', 'NguyenThanhLong', 'NGUYENTHANHLONG', '19511080179@sv.ut.edu.vn', '19511080179@SV.UT.EDU.VN', 1, 'AQAAAAEAACcQAAAAEOQle0ypR79QRYBbsSR4yLnWU/tCd+aPUSxBy1PA9XV6//vwDWEvhklsKTA9uXl/MQ==', 'RJA7DGCG5THOCPBDXA3SOVJ6TS4JOMAM', '4c096f43-2351-4363-b96b-87c991b5e5a2', NULL, 0, 0, NULL, 1, 0, NULL, '2000-01-01 00:00:00', 'avatar3.png', 'Nam'),
('783dfa5d-d422-4ddf-ae22-34676d9d56ca', 'NguyenThiPhuongThao', 'NGUYENTHIPHUONGTHAO', 'nguyenthanhlonglop9c@gmail.com', 'NGUYENTHANHLONGLOP9C@GMAIL.COM', 1, 'AQAAAAEAACcQAAAAELr1AVxiikMQKYzzRFghjd9XdOp7B26oeAU2kb5uBrEsvux9Z8PFMoS/IkKhzEFLxA==', 'A6CJ7PW5MHXUBBE32JL4DWDZIMRVEXLG', 'c7c63f7a-5493-4e1d-9e1b-0091df1e6665', NULL, 0, 0, NULL, 1, 0, NULL, '2000-02-01 00:00:00', 'avatar2.png', 'Nữ'),
('9529df33-06e7-4f7e-96b8-015d7f1799d5', 'NguyenThanhThao', 'NGUYENTHANHTHAO', 'tonhii7001@gmail.com', 'TONHII7001@GMAIL.COM', 1, 'AQAAAAEAACcQAAAAEB6nLjzhLK6UKhzYKqM2XurX3w5VXoeB2oqxmuumIWdFBvG8iPAK1UUa6J0szXELPg==', 'IP7G2QLQUPHMN7KESVIKPALUP2JGCZDT', '7817a9b9-fc32-4db3-94cd-9ce187943e30', NULL, 0, 0, NULL, 1, 0, NULL, '2001-09-09 00:00:00', 'avatar4.png', 'Nữ'),
('9c994d92-d7c9-4597-b379-ce8551183d15', 'GiangBanh', 'GIANGBANH', '19521443@gm.uit.edu.vn', '19521443@GM.UIT.EDU.VN', 1, 'AQAAAAEAACcQAAAAEHAIakBwVv6yNKhG0hms38pox8qKru135S9XttNzPdaybXfVhhuGqKm88GE79LcShQ==', 'VUZAPVG66VUGG45GYH77ZTP6ZGEQHVTI', 'd843d277-90f4-4200-86a5-857faabce17c', NULL, 0, 0, NULL, 1, 0, NULL, '2001-01-01 00:00:00', 'avatar3.png', 'Nam'),
('a88ce81e-968c-4be8-83a8-234be543fa90', '19521319@gm.uit.edu.vn', '19521319@GM.UIT.EDU.VN', '19521319@gm.uit.edu.vn', '19521319@GM.UIT.EDU.VN', 1, 'AQAAAAEAACcQAAAAED1vDZ2bRHnM6Lby4s9kCoawvkqUKg7m9FVcZ2mFBZi3O87KBnTfioMLrfqp0w5mkw==', 'HWOOIVCXGEJ3X6H73HPFRB5OIP2KXIVO', 'e4d8b564-6de7-4f03-b276-6ee9ce0188ca', '+84123456', 0, 0, NULL, 1, 2, 'Đồng Tháp', '2001-01-15 20:32:00', 'avatar3.png', NULL),
('b4ee4a32-87ff-4a98-89ee-6539d4fca2be', 'NguyenGiaPhong', 'NGUYENGIAPHONG', 'phongvipkcr@gmail.com', 'PHONGVIPKCR@GMAIL.COM', 1, 'AQAAAAEAACcQAAAAEFvhLPiSSawra18Q+jP36kn6GP6DBe+WA/G9pVPjrQS7dBcgeo1qvKJGyjH9+DUTCw==', 'CSPXHIW5DAI6BV4EV34VPZBNJOGCCA4R', '4c5b636a-e210-4f98-8dc3-43b7f3f9c7a8', NULL, 0, 0, NULL, 1, 0, NULL, '2001-05-03 00:00:00', 'avatar3.png', 'Nam'),
('c8629c84-df72-416d-a472-590327052307', 'DinhThiThuPhuong', 'DINHTHITHUPHUONG', 'thuphuongg81@gmail.com', 'THUPHUONGG81@GMAIL.COM', 1, 'AQAAAAEAACcQAAAAEDVbOcIiCJHa4b3sayqw5il9+3J/s7c6vzh8gDpJ48Yzub1ipYCziBE/Vu/uSQkVuQ==', 'IQMQX6SEFOCO2ZBROPVBHIBVSZ4EXWOO', 'ff128671-7526-4da2-aade-5e765b2c7421', NULL, 0, 0, NULL, 1, 0, NULL, '2000-06-05 00:00:00', 'avatar2.png', 'Nữ'),
('f5ebe639-df16-4e3e-bbc9-8e7dc9400707', 'HaiDang', 'HAIDANG', 'abc@gmail.com', 'ABC@GMAIL.COM', 1, 'AQAAAAEAACcQAAAAEEYoVGDZ69shx2kvMJn/G/UqYP/s6cZJzvsu8pvFoOGUY80kD5NeXxdF/tpmR8dVxw==', '6H33K3OEUUPEWI67YNK5JGPCBJ72G5YO', 'e5b8b53d-4a41-4f11-a107-c20595881073', '123456789', 0, 0, NULL, 1, 0, 'abc', '2021-12-14 23:28:00', 'avatar3.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appuserclaim`
--

CREATE TABLE `appuserclaim` (
  `Id` int(11) NOT NULL,
  `UserId` text DEFAULT NULL,
  `ClaimType` text DEFAULT NULL,
  `ClaimValue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `appuserlogin`
--

CREATE TABLE `appuserlogin` (
  `UserId` varchar(100) NOT NULL,
  `LoginProvider` text DEFAULT NULL,
  `ProviderKey` text DEFAULT NULL,
  `ProviderDisplayName` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `appuserrole`
--

CREATE TABLE `appuserrole` (
  `UserId` varchar(100) NOT NULL,
  `RoleId` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appuserrole`
--

INSERT INTO `appuserrole` (`UserId`, `RoleId`) VALUES
('71a4c50d-fc68-474a-895b-8682f0141b93', '6eae9fb2-30e2-4b46-996a-69cee71bb287'),
('9c994d92-d7c9-4597-b379-ce8551183d15', '166b3f9d-a7f7-4154-8374-30980d66df15'),
('9c994d92-d7c9-4597-b379-ce8551183d15', '6eae9fb2-30e2-4b46-996a-69cee71bb287'),
('a88ce81e-968c-4be8-83a8-234be543fa90', '0444a10f-bbc4-408e-b805-e535cb3d4a98'),
('a88ce81e-968c-4be8-83a8-234be543fa90', '166b3f9d-a7f7-4154-8374-30980d66df15'),
('a88ce81e-968c-4be8-83a8-234be543fa90', '7de294a7-6391-40bc-a16c-7418567216ab'),
('a88ce81e-968c-4be8-83a8-234be543fa90', 'e5d797ac-120f-47b1-9f25-dba92a9e1342'),
('D1DFEBA3-BBA8-48D9-87E6-8EE1AD1C9F14', 'A44641C4-B68C-43D8-8ECD-E001276D9148'),
('f5ebe639-df16-4e3e-bbc9-8e7dc9400707', '6eae9fb2-30e2-4b46-996a-69cee71bb287');

-- --------------------------------------------------------

--
-- Table structure for table `appusertoken`
--

CREATE TABLE `appusertoken` (
  `UserId` varchar(100) NOT NULL,
  `LoginProvider` text DEFAULT NULL,
  `Name` text DEFAULT NULL,
  `Value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `cmtId` int(11) NOT NULL,
  `userId` varchar(767) NOT NULL,
  `courseId` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `evaluate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(11) NOT NULL,
  `AppUserId` varchar(767) DEFAULT NULL,
  `HoTen` varchar(100) DEFAULT NULL,
  `email` text NOT NULL,
  `SDT` varchar(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `content` text NOT NULL,
  `time` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseId` int(11) NOT NULL,
  `courseName` varchar(50) NOT NULL,
  `discription` varchar(1000) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `originalPrice` int(11) NOT NULL,
  `imgCourse` text NOT NULL,
  `totalTime` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL,
  `totalStudent` int(11) NOT NULL,
  `topicId` int(11) NOT NULL,
  `discountId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseId`, `courseName`, `discription`, `price`, `originalPrice`, `imgCourse`, `totalTime`, `rating`, `totalStudent`, `topicId`, `discountId`) VALUES
(1, 'Lập trình hướng đối tượng trong C++', 'Khóa học C++ OOP giúp các lập trình viên học được kỹ thuật lập trình mà tất cả logic, yêu cầu thực tế đều được xây dựng xoay quanh các đối tượng. Hiểu được cách thức hoạt động của C++ OOP sẽ làm đơn giản hóa việc bảo trì và dễ dàng mở rộng trong việc thiết kế phần mềm.', 200000, 400000, 'https://drive.google.com/uc?id=1tg8t9mU6fK2NiIaoOpZGDBqKyDHl3GWK ', '100 giờ', 9, 5000, 3, 3),
(2, 'Truyền thông và Mạng máy tính', 'Khóa học cung cấp cho lập trình viên những kiến thức cơ bản và dễ hiểu về mạng máy tính và truyền thông dữ liệu.', 250000, 500000, 'https://drive.google.com/uc?id=1M13QkBMNWf3mMAtY73_6j6VzfIwyQ8ou', '115 giờ 15 phút', 7, 545, 3, 1),
(3, 'Phần mềm máy tính', 'Phần mềm luôn là công cụ cần thiết trong mọi lĩnh vực, khóa học này sẽ giúp bạn hiểu được các khái niệm về phần mềm và các phần mềm phổ biến hiện nay.\r\n', 400000, 800000, 'https://drive.google.com/uc?id=1OGubr6XYS_IamIC1c4BkmLipc8izjn1O', '80 giờ', 9, 890, 5, 3),
(4, 'Phần cứng máy tính', 'Khóa học này tập trung vào việc cung cấp các kiến thức chung về các bộ phận của máy tính để bạn có thể áp dụng vào việc lựa chọn và sử dụng máy tính.\r\n', 400000, 500000, 'https://drive.google.com/uc?id=1V9EOdu9mY2spgIgOVo30bUyxpaO9H9Rt', '150 giờ', 8, 545, 3, 2),
(5, 'C cho người mới bắt đầu', 'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.\r\n', 375000, 750000, 'https://drive.google.com/uc?id=1yNm40INiL3wWtgHmO6HY9k81MrKldvdt', '200 giờ', 9, 1500, 4, 1),
(6, 'C++ cho người mới bắt đầu', 'Khóa học lập trình C++ cơ bản cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản, dễ hiểu nhất về ngôn ngữ lập trình C++.\r\n', 250000, 500000, 'https://drive.google.com/uc?id=1_o-6-BiHJ_HDATs6LDDcq1ZdNLtLtxr3', '200 giờ', 10, 2000, 4, 4),
(7, 'Làm quen với SQL', 'Khóa học này sẽ giúp các lập trình viên nắm được nguyên tắc, cú pháp và cách thức hoạt động của SQL (Structured Query Language).\r\n', 520000, 650000, 'https://drive.google.com/uc?id=1nz4sj-8dFyHBhY3o_guQq2--rTtMTSvp', '150 giờ', 9, 2000, 4, 2),
(8, 'Javascript căn bản', 'Giúp học viên nắm vững các nguyên tắc và cú pháp cơ bản trong Javascript - ngôn ngữ lập trình phổ biến nhất trên thế giới.\r\n', 600000, 750000, 'https://drive.google.com/uc?id=174z_MRZCD7REQnDI7UjWVI7s1h9-RpRW', '175 giờ ', 7, 1500, 4, 5),
(9, 'Python cơ bản', 'Khóa học lập trình Python cơ bản với các bài tập và lý thuyết dễ hiểu, học xong bạn có thể tự tin để tới với các chủ đề nâng cao hơn của Python.\r\n', 440000, 550000, 'https://drive.google.com/uc?id=1XOnqOxas8vt7wTv_n-hJiUR59mVWcLeP', '130 giờ', 9, 1300, 5, 2),
(10, 'C# cơ bản', 'Khóa học lập trình C# kèm thực hành, khóa học sẽ giúp bạn làm quen với lập trình cũng như tạo nền tảng tư duy và kỹ năng cơ bản khi giải các bài tập.\r\n', 600000, 750000, 'https://drive.google.com/uc?id=1BWVWRTBPXZOK62y3bGAWwwZDRJv6zh7B', '140 giờ', 10, 1500, 5, 2),
(11, 'Java cơ bản', 'Khóa học lập trình Java cơ bản cho người mới bắt đầu, khóa học này sẽ là nền tảng cho khóa Java nâng cao để tiến tới Java Web hay lập trình Android, …\r\n', 400000, 800000, 'https://drive.google.com/uc?id=1indBclBHBP3iSROrvblYg7XeH6iEusEf', '200 giờ', 9, 2500, 4, 4),
(12, 'Thuật toán căn bản', 'Với khóa học thuật toán cơ bản, bạn sẽ học được cách tư duy và giải quyết các bài toán lập trình cơ bản mà một lập trình viên cần có.\r\n', 425000, 850000, 'https://drive.google.com/uc?id=1N0wa9aqjhieH4tLPvgY6j5gwRyTiZEQr', '175 giờ', 8, 500, 6, 1),
(13, 'Thực hành với SQL', 'Khóa học này sẽ giúp bạn biết về một số chức năng chính cần thiết để sắp xếp, lọc và phân loại thông tin trong cơ sở dữ liệu quan hệ, mở rộng bộ công cụ SQL của bạn và giúp bạn có khả năng giải quyết các vấn đề phức tạp hơn thông qua bộ công cụ này. Yêu cầu: Bạn cần hoàn thành khóa Làm quen với SQL để có kiến thức cơ bản trước khi\r\n', 640000, 800000, 'https://drive.google.com/uc?id=1VmBM07dQc1zkpdhG6c6ZlvolXnSlzrLi', '250 giờ 15 phút', 9, 1400, 6, 2),
(14, 'Cấu trúc dữ liệu và giải thuật', 'Khóa học này sẽ giúp các bạn hiểu thuật toán cũng như hiểu rõ bản chất của các cấu trúc dữ liệu - điều kiện để trở thành lập trình viên giỏi.\r\n', 100000, 200000, 'https://drive.google.com/uc?id=14G1yOY1SO6GahAjK6zIE1DbD9m-cR85X', '150 giờ', 8, 2000, 4, 3),
(15, 'Lập trình hướng đối tượng trong Java', 'Lập trình hướng đối tượng (Object-Oriented-Programming) là phương pháp lập trình dựa trên đối tượng để tìm ra bản chất của vấn đề. Khóa học Java OOP giúp các lập trình viên học được kỹ thuật lập trình mà tất cả logic, yêu cầu thực tế đều được xây dựng xoay quanh các đối tượng. Hiểu được cách thức hoạt động của Java OOP sẽ làm đơn giản hóa việc bảo trì và dễ dàng mở rộng trong việc thiết kế phần mềm.\r\n', 400000, 800000, 'https://drive.google.com/uc?id=1KuFnvgVqfelPZ4x7NEMfPB6OmqheImDU', '200 giờ', 8, 1500, 6, 3),
(16, 'C++ nâng cao', 'Khóa học lập trình C++ nâng cao sẽ giúp bạn hiểu sâu hơn về C++ với một số khái niệm như con trỏ, mảng, cấp phát bộ nhớ động, struct,…\r\n', 680000, 850000, 'https://drive.google.com/uc?id=12GS1gi1IlxvHGItqBOtN8ahlrLWd97Ql', '250 giờ', 9, 545, 7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discountId` int(11) NOT NULL,
  `discription` varchar(1000) NOT NULL,
  `time` datetime NOT NULL,
  `sale` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`discountId`, `discription`, `time`, `sale`) VALUES
(1, 'Khuyến mãi ngày tựu trường', '2021-12-16 04:49:04', 0.5),
(2, 'Kỉ niệm một năm thành lập', '2021-11-01 00:00:00', 0.2),
(3, 'Khuyến mãi ngày tết', '2021-11-02 00:00:00', 0.5),
(4, 'Siêu sale back to school', '2021-11-20 00:00:00', 0.5),
(5, 'Mừng trung thu', '2021-11-01 00:00:00', 0.2),
(6, 'Khuyến mãi lần đầu đăng kí', '2021-11-01 00:00:00', 0.5);

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

CREATE TABLE `exercise` (
  `exerciseId` int(11) NOT NULL,
  `exerciseName` varchar(500) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `input` varchar(500) NOT NULL,
  `output` varchar(500) NOT NULL,
  `deadline` date NOT NULL,
  `lessonId` int(11) NOT NULL,
  `userId` varchar(767) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exercise`
--

INSERT INTO `exercise` (`exerciseId`, `exerciseName`, `content`, `input`, `output`, `deadline`, `lessonId`, `userId`) VALUES
(1, 'Bài  1', 'Bạn có thể đã nghe về ít nhất một thuật ngữ \"Lập trình hướng đối tượng\" (OOP) trong nghiên cứu của mình những chính xác thì nó là gì? Làm thế nào nào nó hoạt động? Bài học này sẽ giúp cho bạn tìm ra điều đó.</br>\r\nLập trình hướng chỉ đơn giản là một kỹ thuật để giải quyết vấn đề. Khi chúng ta áp dụng nó trong việc giải quyết vấn đề, mã sẽ trông đẹp hơn và dễ bảo trì hơn, dễ hiểu hơn.&nbsp;\r\n\r\nĐây là một kỹ thuật tiên tiến, có thể áp dụng cho hầu hết các ứng dụng hiện nay.&nbsp;\r\nKỹ thuật này sẽ giải quyết vấn đề bằng cách tách chương trình thành các đối tượng, mỗi đối tượng chứa các thuộc tính và phương thức.\r\n', 'Tạo một lớp Student với 2 thuộc tính (tên và tuổi) và phương thức (hiển thị) sau đó trong phương thức main, ta tạo một đối tượng Student, gán giá trị là name và age và gọi phương thức hiển thị của đối tượng student.', 'Name: Linh,\r\nAge: 17', '2022-01-26', 1, '53b4d55f-4957-47af-b5a5-867752ff789b'),
(2, 'Bài 2', 'Viết chương trình khai báo một Student lớp với các thông tin sau:', 'display() là một phương thức để hiển thị thông tin của đối tượng trên màn hình. Ví dụ, nếu hai thuộc tính này là; \"An\" và 23 đó là những tên tuổi và tương ứng.\r\ngetInformation() là một phương thức để nhập dữ liệu đến name và đi&nbsp; age từ người dùng. Ví dụ: nếu bạn sử dụng phương pháp này để nhập thông tin vào; student đối tượng.', 'Name: An,\r\nAge: 24', '2022-01-20', 1, '53b4d55f-4957-47af-b5a5-867752ff789b'),
(3, 'Bài 3', 'Viết chương trình chấp nhận chiều dài và chiều rộng của hình chữ nhật từ đầu vào của người dùng và hiển thị thông tin sau trên màn hình:\r\nArea = {P1},\r\nPerimeter = {P2}', '4.5,\r\n5.5', 'Area: 24.75,\r\nPerimeter: 20', '2022-01-20', 1, '536f72a5-2a3b-43d7-af03-4d4139f15ea5');

-- --------------------------------------------------------

--
-- Table structure for table `exerciseinuser`
--

CREATE TABLE `exerciseinuser` (
  `exerciseId` int(11) NOT NULL,
  `userId` varchar(767) NOT NULL,
  `content` text NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Chưa chấm điểm',
  `submit` datetime NOT NULL,
  `scores` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `lessonId` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `content` varchar(1000) NOT NULL,
  `link` text NOT NULL,
  `captionLink` varchar(500) NOT NULL,
  `courseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`lessonId`, `title`, `description`, `content`, `link`, `captionLink`, `courseId`) VALUES
(1, 'Lớp và đối tượng', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Sử dụng phương pháp lập trình hướng đối tượng để giải quyết bài tập sau:\r\nBạn hãy viết chương trình nhập từ bàn phím chiều dài và chiều rộng của một hình chữ nhật và hiển thị ra màn hình:\r\nArea = {P1}\r\nPerimeter = {P2}\r\nVới {P1} và {P2} lần lượt là diện tích và chu vi của hình chữ nhật đó.\r\nVí dụ nếu bạn nhập:\r\n4.5\r\n5.5\r\nThì màn hình sẽ hiển thị ra:\r\nArea: 24.75\r\nPerimeter: 20', '', '', 1),
(2, 'Biến tĩnh và phương thức tĩnh', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Sử dụng phương pháp lập trình hướng đối tượng để giải quyết bài tập sau:\r\nBạn hãy viết chương trình nhập từ bàn phím chiều dài và chiều rộng của một hình chữ nhật và hiển thị ra màn hình:\r\nArea = {P1}\r\nPerimeter = {P2}\r\nVới {P1} và {P2} lần lượt là diện tích và chu vi của hình chữ nhật đó.\r\nVí dụ nếu bạn nhập:\r\n4.5\r\n5.5\r\nThì màn hình sẽ hiển thị ra:\r\nArea: 24.75\r\nPerimeter: 20', '', '', 1),
(3, 'Tính đóng gói', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\nLý thuyết\r\nTrước hết bạn hãy nhìn vào đoạn code có sẵn, phương thức display() ở lớp cha sẽ chỉ hiển thị được thông tin về tên và giới tính, do đó để hiển thị thêm được thông tin về tiền lương (salary) bằng phương thức display() thì bạn cần ghi đè lại phương thức display() ở lớp cha.\r\nTrong kế thừa, khi lớp con khai báo phương thức có tên trùng với phương thức ở lớp cha thì phương thức của lớp cha sẽ bị thay thế bởi phương thức ở lớp con. Ví dụ:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SuperClass\"\" << endl;\r\n        }\r\n};\r\n\r\nclass SubClass : public SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SubClass\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        SubClass s;\r\n        s.display();\r\n        return 0;\r\n}\r\nKết quả khi chạy chươ', '', '', 1),
(4, 'Tính kế thừa', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau: \r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\nLý thuyết\r\nTrước hết bạn hãy nhìn vào đoạn code có sẵn, phương thức display() ở lớp cha sẽ chỉ hiển thị được thông tin về tên và giới tính, do đó để hiển thị thêm được thông tin về tiền lương (salary) bằng phương thức display() thì bạn cần ghi đè lại phương thức display() ở lớp cha.\r\nTrong kế thừa, khi lớp con khai báo phương thức có tên trùng với phương thức ở lớp cha thì phương thức của lớp cha sẽ bị thay thế bởi phương thức ở lớp con. Ví dụ:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SuperClass\"\" << endl;\r\n        }\r\n};\r\n\r\nclass SubClass : public SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SubClass\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        SubClass s;\r\n        s.display();\r\n        return 0;\r\n}\r\nKết quả khi chạy chư', '', '', 1),
(5, 'Mối quan hệ giữa các đối tượng', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy vận dụng tính đa hình để điền code vào dấu ... sao cho chương trình hiển thị ra thông tin sau:\r\nsome sound\r\nbow wow\r\nmeow meow\r\nquack quack\r\nHướng dẫn\r\nCode mẫu:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Animal {\r\npublic:\r\n        virtual void sound() {\r\n                cout << \"\"some sound\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Dog : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"bow wow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Cat : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"meow meow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Duck : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"quack quack\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        Animal* animals[4];\r\n        animals[0] = new Animal();\r\n        animals[1] = new Dog();\r\n        animals[2] = new Cat();\r\n        animals[3] = new Duck();\r\n        for (int i = 0; i < 4; i++) {\r\n                animals[i]->sound();\r\n        }\r\n        re', '', '', 1),
(6, 'Tính đa hình kế thừa', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy vận dụng tính đa hình để điền code vào dấu ... sao cho chương trình hiển thị ra thông tin sau:\r\nsome sound\r\nbow wow\r\nmeow meow\r\nquack quack\r\nHướng dẫn\r\nCode mẫu:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Animal {\r\npublic:\r\n        virtual void sound() {\r\n                cout << \"\"some sound\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Dog : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"bow wow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Cat : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"meow meow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Duck : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"quack quack\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        Animal* animals[4];\r\n        animals[0] = new Animal();\r\n        animals[1] = new Dog();\r\n        animals[2] = new Cat();\r\n        animals[3] = new Duck();\r\n        for (int i = 0; i < 4; i++) {\r\n                animals[i]->sound();\r\n        }\r\n        re', '', '', 1),
(7, 'Truyền thông máy tính và dữ liệu', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Sử dụng phương pháp lập trình hướng đối tượng để giải quyết bài tập sau:\r\nBạn hãy viết chương trình nhập từ bàn phím chiều dài và chiều rộng của một hình chữ nhật và hiển thị ra màn hình:\r\nArea = {P1}\r\nPerimeter = {P2}\r\nVới {P1} và {P2} lần lượt là diện tích và chu vi của hình chữ nhật đó.\r\nVí dụ nếu bạn nhập:\r\n4.5\r\n5.5\r\nThì màn hình sẽ hiển thị ra:\r\nArea: 24.75\r\nPerimeter: 20', '', '', 2),
(8, 'Cáp mạng và phân loại', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Sử dụng phương pháp lập trình hướng đối tượng để giải quyết bài tập sau:\r\nBạn hãy viết chương trình nhập từ bàn phím chiều dài và chiều rộng của một hình chữ nhật và hiển thị ra màn hình:\r\nArea = {P1}\r\nPerimeter = {P2}\r\nVới {P1} và {P2} lần lượt là diện tích và chu vi của hình chữ nhật đó.\r\nVí dụ nếu bạn nhập:\r\n4.5\r\n5.5\r\nThì màn hình sẽ hiển thị ra:\r\nArea: 24.75\r\nPerimeter: 20', '', '', 2),
(9, 'Thiết bị chuyển mạch, định tuyến và mô hình đấu nối', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau: \r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\nLý thuyết\r\nTrước hết bạn hãy nhìn vào đoạn code có sẵn, phương thức display() ở lớp cha sẽ chỉ hiển thị được thông tin về tên và giới tính, do đó để hiển thị thêm được thông tin về tiền lương (salary) bằng phương thức display() thì bạn cần ghi đè lại phương thức display() ở lớp cha.\r\nTrong kế thừa, khi lớp con khai báo phương thức có tên trùng với phương thức ở lớp cha thì phương thức của lớp cha sẽ bị thay thế bởi phương thức ở lớp con. Ví dụ:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SuperClass\"\" << endl;\r\n        }\r\n};\r\n\r\nclass SubClass : public SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SubClass\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        SubClass s;\r\n        s.display();\r\n        return 0;\r\n}\r\nKết quả khi chạy chư', '', '', 2),
(10, 'Các loại hình mạng và phân loại', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau: \r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\nLý thuyết\r\nTrước hết bạn hãy nhìn vào đoạn code có sẵn, phương thức display() ở lớp cha sẽ chỉ hiển thị được thông tin về tên và giới tính, do đó để hiển thị thêm được thông tin về tiền lương (salary) bằng phương thức display() thì bạn cần ghi đè lại phương thức display() ở lớp cha.\r\nTrong kế thừa, khi lớp con khai báo phương thức có tên trùng với phương thức ở lớp cha thì phương thức của lớp cha sẽ bị thay thế bởi phương thức ở lớp con. Ví dụ:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SuperClass\"\" << endl;\r\n        }\r\n};\r\n\r\nclass SubClass : public SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SubClass\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        SubClass s;\r\n        s.display();\r\n        return 0;\r\n}\r\nKết quả khi chạy chư', '', '', 2),
(11, 'Các công nghệ phổ biến trong truyền tải mạng', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy vận dụng tính đa hình để điền code vào dấu ... sao cho chương trình hiển thị ra thông tin sau:\r\nsome sound\r\nbow wow\r\nmeow meow\r\nquack quack\r\nHướng dẫn\r\nCode mẫu:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Animal {\r\npublic:\r\n        virtual void sound() {\r\n                cout << \"\"some sound\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Dog : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"bow wow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Cat : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"meow meow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Duck : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"quack quack\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        Animal* animals[4];\r\n        animals[0] = new Animal();\r\n        animals[1] = new Dog();\r\n        animals[2] = new Cat();\r\n        animals[3] = new Duck();\r\n        for (int i = 0; i < 4; i++) {\r\n                animals[i]->sound();\r\n        }\r\n        re', '', '', 2),
(12, 'Các thông số trong truyền tải mạng', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy vận dụng tính đa hình để điền code vào dấu ... sao cho chương trình hiển thị ra thông tin sau:\r\nsome sound\r\nbow wow\r\nmeow meow\r\nquack quack\r\nHướng dẫn\r\nCode mẫu:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Animal {\r\npublic:\r\n        virtual void sound() {\r\n                cout << \"\"some sound\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Dog : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"bow wow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Cat : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"meow meow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Duck : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"quack quack\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        Animal* animals[4];\r\n        animals[0] = new Animal();\r\n        animals[1] = new Dog();\r\n        animals[2] = new Cat();\r\n        animals[3] = new Duck();\r\n        for (int i = 0; i < 4; i++) {\r\n                animals[i]->sound();\r\n        }\r\n        re', '', '', 2),
(13, 'Giới thiệu về phần mềm', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Sử dụng phương pháp lập trình hướng đối tượng để giải quyết bài tập sau:\r\nBạn hãy viết chương trình nhập từ bàn phím chiều dài và chiều rộng của một hình chữ nhật và hiển thị ra màn hình:\r\nArea = {P1}\r\nPerimeter = {P2}\r\nVới {P1} và {P2} lần lượt là diện tích và chu vi của hình chữ nhật đó.\r\nVí dụ nếu bạn nhập:\r\n4.5\r\n5.5\r\nThì màn hình sẽ hiển thị ra:\r\nArea: 24.75\r\nPerimeter: 20', '', '', 3),
(14, 'Phần mềm hệ thống', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Sử dụng phương pháp lập trình hướng đối tượng để giải quyết bài tập sau:\r\nBạn hãy viết chương trình nhập từ bàn phím chiều dài và chiều rộng của một hình chữ nhật và hiển thị ra màn hình:\r\nArea = {P1}\r\nPerimeter = {P2}\r\nVới {P1} và {P2} lần lượt là diện tích và chu vi của hình chữ nhật đó.\r\nVí dụ nếu bạn nhập:\r\n4.5\r\n5.5\r\nThì màn hình sẽ hiển thị ra:\r\nArea: 24.75\r\nPerimeter: 20', '', '', 3),
(15, 'Giới thiệu về hệ điều hành', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau: \r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\nLý thuyết\r\nTrước hết bạn hãy nhìn vào đoạn code có sẵn, phương thức display() ở lớp cha sẽ chỉ hiển thị được thông tin về tên và giới tính, do đó để hiển thị thêm được thông tin về tiền lương (salary) bằng phương thức display() thì bạn cần ghi đè lại phương thức display() ở lớp cha.\r\nTrong kế thừa, khi lớp con khai báo phương thức có tên trùng với phương thức ở lớp cha thì phương thức của lớp cha sẽ bị thay thế bởi phương thức ở lớp con. Ví dụ:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SuperClass\"\" << endl;\r\n        }\r\n};\r\n\r\nclass SubClass : public SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SubClass\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        SubClass s;\r\n        s.display();\r\n        return 0;\r\n}\r\nKết quả khi chạy chư', '', '', 3),
(16, 'Phần mềm ứng dụng: Trình duyệt web', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau: \r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\nLý thuyết\r\nTrước hết bạn hãy nhìn vào đoạn code có sẵn, phương thức display() ở lớp cha sẽ chỉ hiển thị được thông tin về tên và giới tính, do đó để hiển thị thêm được thông tin về tiền lương (salary) bằng phương thức display() thì bạn cần ghi đè lại phương thức display() ở lớp cha.\r\nTrong kế thừa, khi lớp con khai báo phương thức có tên trùng với phương thức ở lớp cha thì phương thức của lớp cha sẽ bị thay thế bởi phương thức ở lớp con. Ví dụ:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SuperClass\"\" << endl;\r\n        }\r\n};\r\n\r\nclass SubClass : public SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SubClass\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        SubClass s;\r\n        s.display();\r\n        return 0;\r\n}\r\nKết quả khi chạy chư', '', '', 3),
(17, 'Phần mềm ứng dụng: Phần mềm văn phòng', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy vận dụng tính đa hình để điền code vào dấu ... sao cho chương trình hiển thị ra thông tin sau:\r\nsome sound\r\nbow wow\r\nmeow meow\r\nquack quack\r\nHướng dẫn\r\nCode mẫu:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Animal {\r\npublic:\r\n        virtual void sound() {\r\n                cout << \"\"some sound\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Dog : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"bow wow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Cat : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"meow meow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Duck : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"quack quack\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        Animal* animals[4];\r\n        animals[0] = new Animal();\r\n        animals[1] = new Dog();\r\n        animals[2] = new Cat();\r\n        animals[3] = new Duck();\r\n        for (int i = 0; i < 4; i++) {\r\n                animals[i]->sound();\r\n        }\r\n        re', '', '', 3),
(18, 'Phần mềm ứng dụng: Trình soạn thảo và lập trình', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy vận dụng tính đa hình để điền code vào dấu ... sao cho chương trình hiển thị ra thông tin sau:\r\nsome sound\r\nbow wow\r\nmeow meow\r\nquack quack\r\nHướng dẫn\r\nCode mẫu:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Animal {\r\npublic:\r\n        virtual void sound() {\r\n                cout << \"\"some sound\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Dog : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"bow wow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Cat : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"meow meow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Duck : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"quack quack\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        Animal* animals[4];\r\n        animals[0] = new Animal();\r\n        animals[1] = new Dog();\r\n        animals[2] = new Cat();\r\n        animals[3] = new Duck();\r\n        for (int i = 0; i < 4; i++) {\r\n                animals[i]->sound();\r\n        }\r\n        re', '', '', 3),
(19, 'Giới thiệu về máy tính', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Sử dụng phương pháp lập trình hướng đối tượng để giải quyết bài tập sau:\r\nBạn hãy viết chương trình nhập từ bàn phím chiều dài và chiều rộng của một hình chữ nhật và hiển thị ra màn hình:\r\nArea = {P1}\r\nPerimeter = {P2}\r\nVới {P1} và {P2} lần lượt là diện tích và chu vi của hình chữ nhật đó.\r\nVí dụ nếu bạn nhập:\r\n4.5\r\n5.5\r\nThì màn hình sẽ hiển thị ra:\r\nArea: 24.75\r\nPerimeter: 20', '', '', 4),
(20, 'Đơn vị xử lý trung tâm', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Sử dụng phương pháp lập trình hướng đối tượng để giải quyết bài tập sau:\r\nBạn hãy viết chương trình nhập từ bàn phím chiều dài và chiều rộng của một hình chữ nhật và hiển thị ra màn hình:\r\nArea = {P1}\r\nPerimeter = {P2}\r\nVới {P1} và {P2} lần lượt là diện tích và chu vi của hình chữ nhật đó.\r\nVí dụ nếu bạn nhập:\r\n4.5\r\n5.5\r\nThì màn hình sẽ hiển thị ra:\r\nArea: 24.75\r\nPerimeter: 20', '', '', 4),
(21, 'Nguồn điện', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau: \r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\nLý thuyết\r\nTrước hết bạn hãy nhìn vào đoạn code có sẵn, phương thức display() ở lớp cha sẽ chỉ hiển thị được thông tin về tên và giới tính, do đó để hiển thị thêm được thông tin về tiền lương (salary) bằng phương thức display() thì bạn cần ghi đè lại phương thức display() ở lớp cha.\r\nTrong kế thừa, khi lớp con khai báo phương thức có tên trùng với phương thức ở lớp cha thì phương thức của lớp cha sẽ bị thay thế bởi phương thức ở lớp con. Ví dụ:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SuperClass\"\" << endl;\r\n        }\r\n};\r\n\r\nclass SubClass : public SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SubClass\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        SubClass s;\r\n        s.display();\r\n        return 0;\r\n}\r\nKết quả khi chạy chư', '', '', 4),
(22, 'Bo mạch chính', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau: \r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\nLý thuyết\r\nTrước hết bạn hãy nhìn vào đoạn code có sẵn, phương thức display() ở lớp cha sẽ chỉ hiển thị được thông tin về tên và giới tính, do đó để hiển thị thêm được thông tin về tiền lương (salary) bằng phương thức display() thì bạn cần ghi đè lại phương thức display() ở lớp cha.\r\nTrong kế thừa, khi lớp con khai báo phương thức có tên trùng với phương thức ở lớp cha thì phương thức của lớp cha sẽ bị thay thế bởi phương thức ở lớp con. Ví dụ:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SuperClass\"\" << endl;\r\n        }\r\n};\r\n\r\nclass SubClass : public SuperClass {\r\npublic:\r\n        void display() {\r\n                cout << \"\"Hello from SubClass\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        SubClass s;\r\n        s.display();\r\n        return 0;\r\n}\r\nKết quả khi chạy chư', '', '', 4),
(23, 'Bộ nhớ RAM/ROM', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy vận dụng tính đa hình để điền code vào dấu ... sao cho chương trình hiển thị ra thông tin sau:\r\nsome sound\r\nbow wow\r\nmeow meow\r\nquack quack\r\nHướng dẫn\r\nCode mẫu:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Animal {\r\npublic:\r\n        virtual void sound() {\r\n                cout << \"\"some sound\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Dog : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"bow wow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Cat : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"meow meow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Duck : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"quack quack\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        Animal* animals[4];\r\n        animals[0] = new Animal();\r\n        animals[1] = new Dog();\r\n        animals[2] = new Cat();\r\n        animals[3] = new Duck();\r\n        for (int i = 0; i < 4; i++) {\r\n                animals[i]->sound();\r\n        }\r\n        re', '', '', 4),
(24, 'Các cổng kết nối', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy vận dụng tính đa hình để điền code vào dấu ... sao cho chương trình hiển thị ra thông tin sau:\r\nsome sound\r\nbow wow\r\nmeow meow\r\nquack quack\r\nHướng dẫn\r\nCode mẫu:\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Animal {\r\npublic:\r\n        virtual void sound() {\r\n                cout << \"\"some sound\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Dog : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"bow wow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Cat : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"meow meow\"\" << endl;\r\n        }\r\n};\r\n\r\nclass Duck : public Animal {\r\npublic:\r\n        void sound() {\r\n                cout << \"\"quack quack\"\" << endl;\r\n        }\r\n};\r\n\r\nint main() {\r\n        Animal* animals[4];\r\n        animals[0] = new Animal();\r\n        animals[1] = new Dog();\r\n        animals[2] = new Cat();\r\n        animals[3] = new Duck();\r\n        for (int i = 0; i < 4; i++) {\r\n                animals[i]->sound();\r\n        }\r\n        re', '', '', 4),
(25, 'Chương trình C đầu tiên', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình hiện ra màn hình dòng chữ:\r\n\r\nWelcome to DCE!\r\n\r\nHướng dẫn\r\nĐể hiển thị lên màn hình một dòng chữ nào đó bạn có thể dùng câu lệnh cout <<. Ví dụ bạn có thể viết chương trình hiển thị ra hình dòng chữ Welcome bằng các câu lệnh:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n        cout << \"\"Welcome\"\";\r\n        return 0;\r\n}\r\n', '', '', 5),
(26, 'Biến', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình khai báo 2 biến a và b kiểu số nguyên, sau đó gán giá trị cho a = 254, b = 343 và hiển thị ra màn hình:\r\n\r\na + b = {P}\r\n\r\nVới {P} là tổng của biến a và biến b.\r\n\r\nLý thuyết\r\nBiến trong lập trình được dùng để đại diện cho một giá trị mà có thể thay đổi trong quá trình chạy. Ví dụ như biến thể hiện số tuổi, số tiền trong tài khoản, ... các giá trị này hoàn toàn có thể thay đổi theo thời gian và cần sử dụng biến để lưu trữ.\r\n\r\nỨng với mỗi kiểu dữ liệu như số nguyên, số thực, xâu ký tự, ... thì lại có một cách khai báo biến khác nhau. Trong đó cú pháp để khai báo biến kiểu số nguyên sẽ giống như sau:\r\n\r\nint tên_biến;\r\n\r\nVí dụ về chương tình khai báo và sử dụng biến kiểu số nguyên:\r\n\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n        // Khai báo biến x kiểu số nguyên\r\n        int x;\r\n        // Gán giá trị cho x = 5\r\n        x = 5;\r\n        // Hiển thị giá trị của biến x ra màn hình\r\n        cout << \"\"x = \"\" << x;\r\n        return 0;\r\n}\r\n', '', '', 5),
(27, 'Đầu vào', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập vào tên của mình từ bàn phím và thực hiện hiển thị ra màn hình dòng chữ:\r\nHello {P}\r\nVới {P} là tên bạn vừa nhập từ bàn phím.\r\n\r\nVí dụ nếu bạn nhập tên là Trung thì màn hình sẽ hiển thị lên dòng chữ:\r\nHello Trung\r\n\r\nLý thuyết\r\nĐể nhập dữ liệu cho 1 biến từ bàn phím bạn có thể dùng câu lệnh cin >> tên_biến;\r\n\r\nBạn hãy chạy thử chương trình sau để hiểu rõ hơn:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n        // Khai báo biến name kiểu string\r\n        string name;\r\n        // Dùng lệnh cin để nhập giá trị cho biến name từ bàn phím\r\n        cin >> name;\r\n        cout << \"\"Hello \"\" << name;\r\n        return 0;\r\n}\r\n\r\nSau khi chạy bạn hãy nhập từ bàn phím:\r\nTrung\r\nVà bấm phím Enter thì màn hình sẽ hiển thị ra:\r\nHello Trung\r\n\r\nCó thể thấy việc nhập dữ liệu từ bàn phím vào 1 biến là rất đơn giản, bạn chỉ cần dùng câu lệnh cin >> tên_biến;\r\n\r\nLưu ý: với cout thì bạn dùng cặp dấu nhỏ hơn (<<) còn với cin thì bạn dùng cặp dấu lớn hơn (>>', '', '', 5),
(28, 'Cấu trúc rẽ nhánh', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập vào từ bàn phím số nguyên n. Sau đó kiểm tra xem nếu n là số chẵn thì hiển thị ra:\r\nn is an even number\r\nNgược lại, nếu n là số lẻ thì hiển thị ra:\r\nn is an odd number\r\n\r\nLý thuyết\r\nKhi lập trình chắc chắn sẽ có những lúc bạn muốn sử dụng tới câu điều kiện, ví dụ như khi bạn muốn viết chương trình kiểm tra tính chẵn lẻ của một số hay kiểm tra xem tên của 2 người có giống nhau hay không, ... để viết được chương trình theo yêu cầu trên thì bạn cần biết cách sử dụng mệnh đề if hoặc mệnh đề if-else.\r\n\r\nMệnh đề if:\r\n\r\nMệnh đề if được dùng để kiểm tra một biểu thức điều kiện có đúng hay không, nếu đúng thì các câu lệnh bên trong mệnh đề if sẽ được thực thi. Ví dụ để kiểm tra xem n có chia hết cho 2 không bạn có thể làm như sau:\r\n\r\nif (n % 2 == 0) {\r\n        // Nếu n chia hết cho 2 thì hiển thị n is an even number\r\n        cout << \"\"n is an even number\"\";\r\n}\r\nif (n % 2 != 0) {\r\n        // Nếu n không chia hết cho 2 thì hiển thị n is an odd number\r\n     ', '', '', 5),
(29, 'Vòng lặp', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập từ bàn phím số nguyên a và b. Sau đó hiển thị ra các số từ a tới b:\r\n\r\nVí dụ nếu nhập a = 5, b = 9 thì chương trình sẽ hiển thị ra màn hình:\r\n5 6 7 8 9 \r\nNếu bạn chưa làm được bài này thì có thể xem hướng dẫn ở bên dưới.\r\n\r\nHướng dẫn\r\nCode mẫu:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n    int a, b;\r\n    cin >> a >> b;\r\n    for (int i = a; i <= b; i++) {\r\n        cout << i << \"\" \"\";\r\n    }\r\n    return 0;\r\n}', '', '', 5),
(30, 'Vòng lặp: while và do-while', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập vào bàn phím số nguyên n và hiển thị ra các số chẵn từ n tới 100.\r\n\r\nVí dụ nếu nhập n = 90 thì chương trình sẽ hiển thị ra màn hình:\r\n90 92 94 96 98 100\r\n\r\nLý thuyết\r\nCấu trúc vòng lặp while:\r\n\r\nwhile (biểu_thức){\r\n    // Nếu biểu thức đúng thì thực hiện đoạn code trong khối lệnh này\r\n}\r\n\r\nCó thể thấy cách sử dụng vòng lặp while rất đơn giản, khi biểu_thức còn đúng thì thực hiện đoạn code bên trong vòng while.\r\n\r\nHãy xem một vài ví dụ về vòng lặp while để hiểu rõ hơn:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n    int n = 5;\r\n    while (n != 0) {\r\n        cout << n << \"\" \"\";\r\n        n--;\r\n    }\r\n    return 0;\r\n}\r\n\r\nChương trình này sẽ hiển thị ra màn hình:\r\n5 4 3 2 1 \r\n\r\nĐoạn code trên có thể hiểu đơn giản là: Khi n còn khác 0 thì hiển thị ra màn hình giá trị của n và giảm n đi 1.\r\n\r\nVí dụ khác về hiển thị các số chẵn từ 1 tới 100 sử dụng vòng lặp while:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n    int n', '', '', 5),
(31, 'Chương trình C++ đầu tiên', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình hiện ra màn hình dòng chữ:\r\n\r\nWelcome to DCE!\r\n\r\nHướng dẫn\r\nĐể hiển thị lên màn hình một dòng chữ nào đó bạn có thể dùng câu lệnh cout <<. Ví dụ bạn có thể viết chương trình hiển thị ra hình dòng chữ Welcome bằng các câu lệnh:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n        cout << \"\"Welcome\"\";\r\n        return 0;\r\n}\r\n', '', '', 6),
(32, 'Biến và các kiểu dữ liệu', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình khai báo 2 biến a và b kiểu số nguyên, sau đó gán giá trị cho a = 254, b = 343 và hiển thị ra màn hình:\r\n\r\na + b = {P}\r\n\r\nVới {P} là tổng của biến a và biến b.\r\n\r\nLý thuyết\r\nBiến trong lập trình được dùng để đại diện cho một giá trị mà có thể thay đổi trong quá trình chạy. Ví dụ như biến thể hiện số tuổi, số tiền trong tài khoản, ... các giá trị này hoàn toàn có thể thay đổi theo thời gian và cần sử dụng biến để lưu trữ.\r\n\r\nỨng với mỗi kiểu dữ liệu như số nguyên, số thực, xâu ký tự, ... thì lại có một cách khai báo biến khác nhau. Trong đó cú pháp để khai báo biến kiểu số nguyên sẽ giống như sau:\r\n\r\nint tên_biến;\r\n\r\nVí dụ về chương tình khai báo và sử dụng biến kiểu số nguyên:\r\n\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n        // Khai báo biến x kiểu số nguyên\r\n        int x;\r\n        // Gán giá trị cho x = 5\r\n        x = 5;\r\n        // Hiển thị giá trị của biến x ra màn hình\r\n        cout << \"\"x = \"\" << x;\r\n        return 0;\r\n}\r\n', '', '', 6),
(33, 'Các toán tử và đầu vào', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập vào tên của mình từ bàn phím và thực hiện hiển thị ra màn hình dòng chữ:\r\nHello {P}\r\nVới {P} là tên bạn vừa nhập từ bàn phím.\r\n\r\nVí dụ nếu bạn nhập tên là Trung thì màn hình sẽ hiển thị lên dòng chữ:\r\nHello Trung\r\n\r\nLý thuyết\r\nĐể nhập dữ liệu cho 1 biến từ bàn phím bạn có thể dùng câu lệnh cin >> tên_biến;\r\n\r\nBạn hãy chạy thử chương trình sau để hiểu rõ hơn:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n        // Khai báo biến name kiểu string\r\n        string name;\r\n        // Dùng lệnh cin để nhập giá trị cho biến name từ bàn phím\r\n        cin >> name;\r\n        cout << \"\"Hello \"\" << name;\r\n        return 0;\r\n}\r\n\r\nSau khi chạy bạn hãy nhập từ bàn phím:\r\nTrung\r\nVà bấm phím Enter thì màn hình sẽ hiển thị ra:\r\nHello Trung\r\n\r\nCó thể thấy việc nhập dữ liệu từ bàn phím vào 1 biến là rất đơn giản, bạn chỉ cần dùng câu lệnh cin >> tên_biến;\r\n\r\nLưu ý: với cout thì bạn dùng cặp dấu nhỏ hơn (<<) còn với cin thì bạn dùng cặp dấu lớn hơn (>>', '', '', 6),
(34, 'Câu lệnh rẽ nhánh', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập vào từ bàn phím số nguyên n. Sau đó kiểm tra xem nếu n là số chẵn thì hiển thị ra:\r\nn is an even number\r\nNgược lại, nếu n là số lẻ thì hiển thị ra:\r\nn is an odd number\r\n\r\nLý thuyết\r\nKhi lập trình chắc chắn sẽ có những lúc bạn muốn sử dụng tới câu điều kiện, ví dụ như khi bạn muốn viết chương trình kiểm tra tính chẵn lẻ của một số hay kiểm tra xem tên của 2 người có giống nhau hay không, ... để viết được chương trình theo yêu cầu trên thì bạn cần biết cách sử dụng mệnh đề if hoặc mệnh đề if-else.\r\n\r\nMệnh đề if:\r\n\r\nMệnh đề if được dùng để kiểm tra một biểu thức điều kiện có đúng hay không, nếu đúng thì các câu lệnh bên trong mệnh đề if sẽ được thực thi. Ví dụ để kiểm tra xem n có chia hết cho 2 không bạn có thể làm như sau:\r\n\r\nif (n % 2 == 0) {\r\n        // Nếu n chia hết cho 2 thì hiển thị n is an even number\r\n        cout << \"\"n is an even number\"\";\r\n}\r\nif (n % 2 != 0) {\r\n        // Nếu n không chia hết cho 2 thì hiển thị n is an odd number\r\n     ', '', '', 6),
(35, 'Vòng lặp: for', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập từ bàn phím số nguyên a và b. Sau đó hiển thị ra các số từ a tới b:\r\n\r\nVí dụ nếu nhập a = 5, b = 9 thì chương trình sẽ hiển thị ra màn hình:\r\n5 6 7 8 9 \r\nNếu bạn chưa làm được bài này thì có thể xem hướng dẫn ở bên dưới.\r\n\r\nHướng dẫn\r\nCode mẫu:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n    int a, b;\r\n    cin >> a >> b;\r\n    for (int i = a; i <= b; i++) {\r\n        cout << i << \"\" \"\";\r\n    }\r\n    return 0;\r\n}', '', '', 6),
(36, 'Vòng lặp: while và do-while', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập vào bàn phím số nguyên n và hiển thị ra các số chẵn từ n tới 100.\r\n\r\nVí dụ nếu nhập n = 90 thì chương trình sẽ hiển thị ra màn hình:\r\n90 92 94 96 98 100\r\n\r\nLý thuyết\r\nCấu trúc vòng lặp while:\r\n\r\nwhile (biểu_thức){\r\n    // Nếu biểu thức đúng thì thực hiện đoạn code trong khối lệnh này\r\n}\r\n\r\nCó thể thấy cách sử dụng vòng lặp while rất đơn giản, khi biểu_thức còn đúng thì thực hiện đoạn code bên trong vòng while.\r\n\r\nHãy xem một vài ví dụ về vòng lặp while để hiểu rõ hơn:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n    int n = 5;\r\n    while (n != 0) {\r\n        cout << n << \"\" \"\";\r\n        n--;\r\n    }\r\n    return 0;\r\n}\r\n\r\nChương trình này sẽ hiển thị ra màn hình:\r\n5 4 3 2 1 \r\n\r\nĐoạn code trên có thể hiểu đơn giản là: Khi n còn khác 0 thì hiển thị ra màn hình giá trị của n và giảm n đi 1.\r\n\r\nVí dụ khác về hiển thị các số chẵn từ 1 tới 100 sử dụng vòng lặp while:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n    int n', '', '', 6),
(37, 'Giới thiệu về cơ sở dữ liệu', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình hiện ra màn hình dòng chữ:\r\n\r\nWelcome to DCE!\r\n\r\nHướng dẫn\r\nĐể hiển thị lên màn hình một dòng chữ nào đó bạn có thể dùng câu lệnh cout <<. Ví dụ bạn có thể viết chương trình hiển thị ra hình dòng chữ Welcome bằng các câu lệnh:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n        cout << \"\"Welcome\"\";\r\n        return 0;\r\n}\r\n', '', '', 7),
(38, 'Khởi tạo bảng', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình khai báo 2 biến a và b kiểu số nguyên, sau đó gán giá trị cho a = 254, b = 343 và hiển thị ra màn hình:\r\n\r\na + b = {P}\r\n\r\nVới {P} là tổng của biến a và biến b.\r\n\r\nLý thuyết\r\nBiến trong lập trình được dùng để đại diện cho một giá trị mà có thể thay đổi trong quá trình chạy. Ví dụ như biến thể hiện số tuổi, số tiền trong tài khoản, ... các giá trị này hoàn toàn có thể thay đổi theo thời gian và cần sử dụng biến để lưu trữ.\r\n\r\nỨng với mỗi kiểu dữ liệu như số nguyên, số thực, xâu ký tự, ... thì lại có một cách khai báo biến khác nhau. Trong đó cú pháp để khai báo biến kiểu số nguyên sẽ giống như sau:\r\n\r\nint tên_biến;\r\n\r\nVí dụ về chương tình khai báo và sử dụng biến kiểu số nguyên:\r\n\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n        // Khai báo biến x kiểu số nguyên\r\n        int x;\r\n        // Gán giá trị cho x = 5\r\n        x = 5;\r\n        // Hiển thị giá trị của biến x ra màn hình\r\n        cout << \"\"x = \"\" << x;\r\n        return 0;\r\n}\r\n', '', '', 7),
(39, 'Hiểu biết về những ràng buộc', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập vào tên của mình từ bàn phím và thực hiện hiển thị ra màn hình dòng chữ:\r\nHello {P}\r\nVới {P} là tên bạn vừa nhập từ bàn phím.\r\n\r\nVí dụ nếu bạn nhập tên là Trung thì màn hình sẽ hiển thị lên dòng chữ:\r\nHello Trung\r\n\r\nLý thuyết\r\nĐể nhập dữ liệu cho 1 biến từ bàn phím bạn có thể dùng câu lệnh cin >> tên_biến;\r\n\r\nBạn hãy chạy thử chương trình sau để hiểu rõ hơn:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n        // Khai báo biến name kiểu string\r\n        string name;\r\n        // Dùng lệnh cin để nhập giá trị cho biến name từ bàn phím\r\n        cin >> name;\r\n        cout << \"\"Hello \"\" << name;\r\n        return 0;\r\n}\r\n\r\nSau khi chạy bạn hãy nhập từ bàn phím:\r\nTrung\r\nVà bấm phím Enter thì màn hình sẽ hiển thị ra:\r\nHello Trung\r\n\r\nCó thể thấy việc nhập dữ liệu từ bàn phím vào 1 biến là rất đơn giản, bạn chỉ cần dùng câu lệnh cin >> tên_biến;\r\n\r\nLưu ý: với cout thì bạn dùng cặp dấu nhỏ hơn (<<) còn với cin thì bạn dùng cặp dấu lớn hơn (>>', '', '', 7),
(40, 'Sửa đổi dữ liệu', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập vào từ bàn phím số nguyên n. Sau đó kiểm tra xem nếu n là số chẵn thì hiển thị ra:\r\nn is an even number\r\nNgược lại, nếu n là số lẻ thì hiển thị ra:\r\nn is an odd number\r\n\r\nLý thuyết\r\nKhi lập trình chắc chắn sẽ có những lúc bạn muốn sử dụng tới câu điều kiện, ví dụ như khi bạn muốn viết chương trình kiểm tra tính chẵn lẻ của một số hay kiểm tra xem tên của 2 người có giống nhau hay không, ... để viết được chương trình theo yêu cầu trên thì bạn cần biết cách sử dụng mệnh đề if hoặc mệnh đề if-else.\r\n\r\nMệnh đề if:\r\n\r\nMệnh đề if được dùng để kiểm tra một biểu thức điều kiện có đúng hay không, nếu đúng thì các câu lệnh bên trong mệnh đề if sẽ được thực thi. Ví dụ để kiểm tra xem n có chia hết cho 2 không bạn có thể làm như sau:\r\n\r\nif (n % 2 == 0) {\r\n        // Nếu n chia hết cho 2 thì hiển thị n is an even number\r\n        cout << \"\"n is an even number\"\";\r\n}\r\nif (n % 2 != 0) {\r\n        // Nếu n không chia hết cho 2 thì hiển thị n is an odd number\r\n     ', '', '', 7),
(41, 'Chuẩn hoá cơ sở dữ liệu', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập từ bàn phím số nguyên a và b. Sau đó hiển thị ra các số từ a tới b:\r\n\r\nVí dụ nếu nhập a = 5, b = 9 thì chương trình sẽ hiển thị ra màn hình:\r\n5 6 7 8 9 \r\nNếu bạn chưa làm được bài này thì có thể xem hướng dẫn ở bên dưới.\r\n\r\nHướng dẫn\r\nCode mẫu:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n    int a, b;\r\n    cin >> a >> b;\r\n    for (int i = a; i <= b; i++) {\r\n        cout << i << \"\" \"\";\r\n    }\r\n    return 0;\r\n}', '', '', 7),
(42, 'Truy vấn cơ sở dữ liệu', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập vào bàn phím số nguyên n và hiển thị ra các số chẵn từ n tới 100.\r\n\r\nVí dụ nếu nhập n = 90 thì chương trình sẽ hiển thị ra màn hình:\r\n90 92 94 96 98 100\r\n\r\nLý thuyết\r\nCấu trúc vòng lặp while:\r\n\r\nwhile (biểu_thức){\r\n    // Nếu biểu thức đúng thì thực hiện đoạn code trong khối lệnh này\r\n}\r\n\r\nCó thể thấy cách sử dụng vòng lặp while rất đơn giản, khi biểu_thức còn đúng thì thực hiện đoạn code bên trong vòng while.\r\n\r\nHãy xem một vài ví dụ về vòng lặp while để hiểu rõ hơn:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n    int n = 5;\r\n    while (n != 0) {\r\n        cout << n << \"\" \"\";\r\n        n--;\r\n    }\r\n    return 0;\r\n}\r\n\r\nChương trình này sẽ hiển thị ra màn hình:\r\n5 4 3 2 1 \r\n\r\nĐoạn code trên có thể hiểu đơn giản là: Khi n còn khác 0 thì hiển thị ra màn hình giá trị của n và giảm n đi 1.\r\n\r\nVí dụ khác về hiển thị các số chẵn từ 1 tới 100 sử dụng vòng lặp while:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n    int n', '', '', 7),
(43, 'Tổng quan, console.log và chú thích', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình hiện ra màn hình dòng chữ:\r\n\r\nWelcome to DCE!\r\n\r\nHướng dẫn\r\nĐể hiển thị lên màn hình một dòng chữ nào đó bạn có thể dùng câu lệnh cout <<. Ví dụ bạn có thể viết chương trình hiển thị ra hình dòng chữ Welcome bằng các câu lệnh:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n        cout << \"\"Welcome\"\";\r\n        return 0;\r\n}\r\n', '', '', 8),
(44, 'Biến', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình khai báo 2 biến a và b kiểu số nguyên, sau đó gán giá trị cho a = 254, b = 343 và hiển thị ra màn hình:\r\n\r\na + b = {P}\r\n\r\nVới {P} là tổng của biến a và biến b.\r\n\r\nLý thuyết\r\nBiến trong lập trình được dùng để đại diện cho một giá trị mà có thể thay đổi trong quá trình chạy. Ví dụ như biến thể hiện số tuổi, số tiền trong tài khoản, ... các giá trị này hoàn toàn có thể thay đổi theo thời gian và cần sử dụng biến để lưu trữ.\r\n\r\nỨng với mỗi kiểu dữ liệu như số nguyên, số thực, xâu ký tự, ... thì lại có một cách khai báo biến khác nhau. Trong đó cú pháp để khai báo biến kiểu số nguyên sẽ giống như sau:\r\n\r\nint tên_biến;\r\n\r\nVí dụ về chương tình khai báo và sử dụng biến kiểu số nguyên:\r\n\r\n#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n        // Khai báo biến x kiểu số nguyên\r\n        int x;\r\n        // Gán giá trị cho x = 5\r\n        x = 5;\r\n        // Hiển thị giá trị của biến x ra màn hình\r\n        cout << \"\"x = \"\" << x;\r\n        return 0;\r\n}\r\n', '', '', 8),
(45, 'Các toán tử', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập vào tên của mình từ bàn phím và thực hiện hiển thị ra màn hình dòng chữ:\r\nHello {P}\r\nVới {P} là tên bạn vừa nhập từ bàn phím.\r\n\r\nVí dụ nếu bạn nhập tên là Trung thì màn hình sẽ hiển thị lên dòng chữ:\r\nHello Trung\r\n\r\nLý thuyết\r\nĐể nhập dữ liệu cho 1 biến từ bàn phím bạn có thể dùng câu lệnh cin >> tên_biến;\r\n\r\nBạn hãy chạy thử chương trình sau để hiểu rõ hơn:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n        // Khai báo biến name kiểu string\r\n        string name;\r\n        // Dùng lệnh cin để nhập giá trị cho biến name từ bàn phím\r\n        cin >> name;\r\n        cout << \"\"Hello \"\" << name;\r\n        return 0;\r\n}\r\n\r\nSau khi chạy bạn hãy nhập từ bàn phím:\r\nTrung\r\nVà bấm phím Enter thì màn hình sẽ hiển thị ra:\r\nHello Trung\r\n\r\nCó thể thấy việc nhập dữ liệu từ bàn phím vào 1 biến là rất đơn giản, bạn chỉ cần dùng câu lệnh cin >> tên_biến;\r\n\r\nLưu ý: với cout thì bạn dùng cặp dấu nhỏ hơn (<<) còn với cin thì bạn dùng cặp dấu lớn hơn (>>', '', '', 8),
(46, 'Các hàm', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập vào từ bàn phím số nguyên n. Sau đó kiểm tra xem nếu n là số chẵn thì hiển thị ra:\r\nn is an even number\r\nNgược lại, nếu n là số lẻ thì hiển thị ra:\r\nn is an odd number\r\n\r\nLý thuyết\r\nKhi lập trình chắc chắn sẽ có những lúc bạn muốn sử dụng tới câu điều kiện, ví dụ như khi bạn muốn viết chương trình kiểm tra tính chẵn lẻ của một số hay kiểm tra xem tên của 2 người có giống nhau hay không, ... để viết được chương trình theo yêu cầu trên thì bạn cần biết cách sử dụng mệnh đề if hoặc mệnh đề if-else.\r\n\r\nMệnh đề if:\r\n\r\nMệnh đề if được dùng để kiểm tra một biểu thức điều kiện có đúng hay không, nếu đúng thì các câu lệnh bên trong mệnh đề if sẽ được thực thi. Ví dụ để kiểm tra xem n có chia hết cho 2 không bạn có thể làm như sau:\r\n\r\nif (n % 2 == 0) {\r\n        // Nếu n chia hết cho 2 thì hiển thị n is an even number\r\n        cout << \"\"n is an even number\"\";\r\n}\r\nif (n % 2 != 0) {\r\n        // Nếu n không chia hết cho 2 thì hiển thị n is an odd number\r\n     ', '', '', 8),
(47, 'Lệnh If - Else và Switch - Case ', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập từ bàn phím số nguyên a và b. Sau đó hiển thị ra các số từ a tới b:\r\n\r\nVí dụ nếu nhập a = 5, b = 9 thì chương trình sẽ hiển thị ra màn hình:\r\n5 6 7 8 9 \r\nNếu bạn chưa làm được bài này thì có thể xem hướng dẫn ở bên dưới.\r\n\r\nHướng dẫn\r\nCode mẫu:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n    int a, b;\r\n    cin >> a >> b;\r\n    for (int i = a; i <= b; i++) {\r\n        cout << i << \"\" \"\";\r\n    }\r\n    return 0;\r\n}', '', '', 8),
(48, 'Vòng lặp', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bài tập\r\nBạn hãy viết chương trình nhập vào bàn phím số nguyên n và hiển thị ra các số chẵn từ n tới 100.\r\n\r\nVí dụ nếu nhập n = 90 thì chương trình sẽ hiển thị ra màn hình:\r\n90 92 94 96 98 100\r\n\r\nLý thuyết\r\nCấu trúc vòng lặp while:\r\n\r\nwhile (biểu_thức){\r\n    // Nếu biểu thức đúng thì thực hiện đoạn code trong khối lệnh này\r\n}\r\n\r\nCó thể thấy cách sử dụng vòng lặp while rất đơn giản, khi biểu_thức còn đúng thì thực hiện đoạn code bên trong vòng while.\r\n\r\nHãy xem một vài ví dụ về vòng lặp while để hiểu rõ hơn:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n    int n = 5;\r\n    while (n != 0) {\r\n        cout << n << \"\" \"\";\r\n        n--;\r\n    }\r\n    return 0;\r\n}\r\n\r\nChương trình này sẽ hiển thị ra màn hình:\r\n5 4 3 2 1 \r\n\r\nĐoạn code trên có thể hiểu đơn giản là: Khi n còn khác 0 thì hiển thị ra màn hình giá trị của n và giảm n đi 1.\r\n\r\nVí dụ khác về hiển thị các số chẵn từ 1 tới 100 sử dụng vòng lặp while:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nint main() {\r\n    int n', '', '', 8),
(49, 'Chương trình đầu tiên và chú thích', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Chúng ta có một số nguyên dương n. Mỗi một lần ta thay thế n bằng tổng các thừa số nguyên tố của nó (ví dụ 12=2*2*3 thì 12 sẽ được thay thế bằng số 2+2+3=7)\r\n\r\nChúng ta áp dụng phép toán này vào số hiện tại cho đến khi kết quả thu được giống vs số hiện tại\r\n\r\nCho một số tự nhiên, hãy tìm kết quả cuối cùng của phép toán trên.\r\n\r\nVí dụ:\r\n\r\nVới n = 24, kết quả factorSum(n) = 5.\r\n24 -> (2 + 2 + 2 + 3) = 9 -> (3 + 3) = 6 -> (2 + 3) = 5 -> 5.\r\nVì vậy kết quả trong trường hợp n = 24 là 5.\r\n\r\nĐầu vào/Đầu ra\r\n[Thời gian chạy] 0.5 giây\r\n[Đầu vào] integer n\r\nĐiều kiện:\r\n2 ≤ n ≤ 200.\r\n[Đầu ra] integer\r\n\r\nLý thuyết\r\nCách kiểm tra một số nguyên dương n có phải một số nguyên tố hay không ? \r\n\r\nNhận thấy rằng một số nguyên n > 1 không phải là một số nguyên tố khi và chỉ khi n có thể biểu diễn dưới dạng : n = x * y, với x,y là hai số nguyên dương lớn hơn 1.\r\nGiả sử răng x ≤ y ⇒ x * x ≤ x * y = n ⇒ x ≤ √n \r\nTừ nhận xét trên ta thấy rằng để kiểm tra xem n có chia hết cho một số nào nhỏ hơn nó hay không t', '', '', 9),
(51, 'Đầu vào', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho xâu kí tự. Hãy đếm số lượng kí tự khác nhau trong xâu đó\r\nVí dụ:\r\nVới s = \"\"cabca\"\", thì kết quả differentSymbolsNaive(s) = 3.\r\nCó 3 kí tự khác nhau là a, b và c.\r\n\r\nĐầu vào/Đầu ra:\r\n[Thời gian chạy] 0.5 seconds\r\n[Đầu vào] string s\r\nXâu kí tự chứa các chữ cái in thường.\r\nGuaranteed constraints:\r\n3 ≤ s.length ≤ 1000.\r\n[Đầu ra] integer.\r\n\r\nHướng dẫn bài tập.\r\nCode mẫu:\r\n\r\nNgôn ngữ C++:\r\n\r\nint differentSymbolsNaive(std::string s)\r\n{\r\n    vector <bool> b(256, false);\r\n    for (int i = 0; i < s.length(); i++)\r\n        b[s[i]] = true;\r\n    int d = 0;\r\n    for (int i = 0; i < s.length(); i++)\r\n    if (b[s[i]]){\r\n        d++;\r\n        b[s[i]] = false;\r\n    }\r\n    return d;\r\n}', '', '', 9);
INSERT INTO `lesson` (`lessonId`, `title`, `description`, `content`, `link`, `captionLink`, `courseId`) VALUES
(52, 'Toán tử cơ bản', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho số nguyên dương n. Hãy tạo ra ma trận vuông kích thước n*n chứa các số từ 1 tới n*n tăng dần theo hình xoắn ốc, xuất phát từ ô trên trái và đi theo theo theo chiều kim đồng hồ\r\n\r\nVí dụ\r\nVới n = 3, kết quả\r\nspiralNumbers(n) = [[1, 2, 3],\r\n                    [8, 9, 4],\r\n                    [7, 6, 5]]\r\n\r\nĐầu vào/đầu ra\r\n[Thời gian chạy] 0.5 giây\r\n[Đầu vào] integer n\r\nĐộ dài của ma trận\r\nĐiều kiện:\r\n3 ≤ n ≤ 100.\r\n[Đầu ra] matrix.integer\r\n\r\nGợi ý:\r\n\r\nTạo ra ma trận kích thước n*n\r\nSử dụng 2 biến để lưu trữ hàng và cột hiện tại, bắt đầu xuất phát từ ô (0,0) (trên trái)\r\nSử dụng 1 biến để lưu trữ giá trị hiện tại của số nằm trong ma trận. Biến này sẽ tăng dần từ 1 cho tới n*n\r\nĐiền số vào ma trận theo nguyên tắc:\r\nVới cạnh đi từ trái qua phải: tăng dần cột, giữ nguyên hàng\r\nVới cạnh đi từ trên xuống dưới: tăng dần hàng, giữ nguyên cột\r\nVới cạnh đi từ phải qua trái: giảm dần cột, giữ nguyên hàng\r\nVới cạnh đi từ dưới lên trên: giảm dần hàng, giữ nguyên cột.\r\n\r\nHướng dẫn bài tập.\r\nCode mẫu:', '', '', 9),
(57, 'Các toán tử', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho xâu kí tự. Hãy đếm số lượng kí tự khác nhau trong xâu đó\r\nVí dụ:\r\nVới s = \"\"cabca\"\", thì kết quả differentSymbolsNaive(s) = 3.\r\nCó 3 kí tự khác nhau là a, b và c.\r\n\r\nĐầu vào/Đầu ra:\r\n[Thời gian chạy] 0.5 seconds\r\n[Đầu vào] string s\r\nXâu kí tự chứa các chữ cái in thường.\r\nGuaranteed constraints:\r\n3 ≤ s.length ≤ 1000.\r\n[Đầu ra] integer.\r\n\r\nHướng dẫn bài tập.\r\nCode mẫu:\r\n\r\nNgôn ngữ C++:\r\n\r\nint differentSymbolsNaive(std::string s)\r\n{\r\n    vector <bool> b(256, false);\r\n    for (int i = 0; i < s.length(); i++)\r\n        b[s[i]] = true;\r\n    int d = 0;\r\n    for (int i = 0; i < s.length(); i++)\r\n    if (b[s[i]]){\r\n        d++;\r\n        b[s[i]] = false;\r\n    }\r\n    return d;\r\n}', '', '', 10),
(58, 'Câu lệnh điều kiện', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho số nguyên dương n. Hãy tạo ra ma trận vuông kích thước n*n chứa các số từ 1 tới n*n tăng dần theo hình xoắn ốc, xuất phát từ ô trên trái và đi theo theo theo chiều kim đồng hồ\r\n\r\nVí dụ\r\nVới n = 3, kết quả\r\nspiralNumbers(n) = [[1, 2, 3],\r\n                    [8, 9, 4],\r\n                    [7, 6, 5]]\r\n\r\nĐầu vào/đầu ra\r\n[Thời gian chạy] 0.5 giây\r\n[Đầu vào] integer n\r\nĐộ dài của ma trận\r\nĐiều kiện:\r\n3 ≤ n ≤ 100.\r\n[Đầu ra] matrix.integer\r\n\r\nGợi ý:\r\n\r\nTạo ra ma trận kích thước n*n\r\nSử dụng 2 biến để lưu trữ hàng và cột hiện tại, bắt đầu xuất phát từ ô (0,0) (trên trái)\r\nSử dụng 1 biến để lưu trữ giá trị hiện tại của số nằm trong ma trận. Biến này sẽ tăng dần từ 1 cho tới n*n\r\nĐiền số vào ma trận theo nguyên tắc:\r\nVới cạnh đi từ trái qua phải: tăng dần cột, giữ nguyên hàng\r\nVới cạnh đi từ trên xuống dưới: tăng dần hàng, giữ nguyên cột\r\nVới cạnh đi từ phải qua trái: giảm dần cột, giữ nguyên hàng\r\nVới cạnh đi từ dưới lên trên: giảm dần hàng, giữ nguyên cột.\r\n\r\nHướng dẫn bài tập.\r\nCode mẫu:', '', '', 10),
(59, 'Vòng lặp', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho tọa độ tâm và bán kính của một đường tròn cùng tọa độ của một điểm trên mặt phẳng 2 chiều\r\n\r\nKiểm tra xem điểm có nằm trong (hoặc nằm trên viền) của đường tròn hay không?\r\n\r\nVí dụ\r\n\r\nVới point = [1, 1], center = [2, 2], và radius = 1, kết quả insideCircle(point, center, radius) = false.\r\nVới point = [1, 1], center = [0, 0], và radius = 3, kết quả insideCircle(point, center, radius) = true.\r\n\r\nĐầu vào/Đầu ra\r\n[Thời gian chạy] 0.5 giây\r\n[Đầu vào] array.integer point\r\nMảng 2 phần tử thể hiện tọa độ của điểm cần kiểm tra.\r\nĐiều kiện:\r\n-100 ≤ point[i] ≤ 100.\r\n\r\n[Đầu vào] array.integer center\r\nMảng 2 phần tử thể hiện tọa độ tâm của đường tròn\r\nĐiều kiện:\r\n-10 ≤ center[i] ≤ 10.\r\n\r\n[Đầu vào] integer radius\r\nBán kính đường tròn.\r\nĐiều kiện:\r\n1 ≤ radius ≤ 5.\r\n\r\n[Đầu ra] boolean\r\ntrue nếu point nằm trong đường tròn, false nếu ngược lại.\r\n\r\nLý thuyết :\r\nCho hệ Oxy, 1 điểm A(x, y) và 1 hình tròn có tâm tại C(xC, yC), bán kính R\r\nKhi đó có 3 quan hệ : \r\ndist(A, C) < R : điểm A nằm trong hình trò', '', '', 10),
(60, 'Vòng lặp: while và do-while', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho một mảng các số nguyên, bạn hãy viết hàm kiểm tra xem các phần tử của mảng có tạo thành một dãy số tăng dần hoặc giảm dần hay không, nếu có return true, ngược lại return false.\r\n\r\nVí du\r\nVới sequence = [1, 4, 5, 7, 9], thì kết quả là isMonotonous(sequence) = true\r\nVới sequence = [0], thì kết quả là isMonotonous(sequence) = true;\r\nVới sequence = [3, 3], thì kết quả là isMonotonous(sequence) = false.\r\nGiải thích: 2 phần tử bằng nhau không tạo thành dãy tăng hay dãy giảm.\r\n\r\nĐầu vào/Đầu ra\r\n[Thời gian chạy] 0.5 giây\r\n[Đầu vào] array.integer sequence\r\nĐiều kiện:\r\n1 ≤ sequence.length ≤ 10,\r\n-250 ≤ sequence[i] ≤ 250.\r\n\r\n[Đầu ra] boolean\r\ntrue nếu sequence là dãy tăng hoặc dãy giảm, false trong trường hợp ngược lại.\r\n\r\nHướng dẫn bài tập.\r\nCode mẫu:\r\n\r\nNgôn ngữ C++:\r\n\r\nbool isMonotonous(std::vector<int> sequence)\r\n{\r\n    if (sequence.size() == 1)\r\n        return true;\r\n    if (sequence.size() == 2)\r\n        return (sequence[0] != sequence[1]);\r\n    for (int i = 2; i < sequence.size(); i++)', '', '', 10),
(61, 'Chương trình đầu tiên và chú thích', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Chúng ta có một số nguyên dương n. Mỗi một lần ta thay thế n bằng tổng các thừa số nguyên tố của nó (ví dụ 12=2*2*3 thì 12 sẽ được thay thế bằng số 2+2+3=7)\r\n\r\nChúng ta áp dụng phép toán này vào số hiện tại cho đến khi kết quả thu được giống vs số hiện tại\r\n\r\nCho một số tự nhiên, hãy tìm kết quả cuối cùng của phép toán trên.\r\n\r\nVí dụ:\r\n\r\nVới n = 24, kết quả factorSum(n) = 5.\r\n24 -> (2 + 2 + 2 + 3) = 9 -> (3 + 3) = 6 -> (2 + 3) = 5 -> 5.\r\nVì vậy kết quả trong trường hợp n = 24 là 5.\r\n\r\nĐầu vào/Đầu ra\r\n[Thời gian chạy] 0.5 giây\r\n[Đầu vào] integer n\r\nĐiều kiện:\r\n2 ≤ n ≤ 200.\r\n[Đầu ra] integer\r\n\r\nLý thuyết\r\nCách kiểm tra một số nguyên dương n có phải một số nguyên tố hay không ? \r\n\r\nNhận thấy rằng một số nguyên n > 1 không phải là một số nguyên tố khi và chỉ khi n có thể biểu diễn dưới dạng : n = x * y, với x,y là hai số nguyên dương lớn hơn 1.\r\nGiả sử răng x ≤ y ⇒ x * x ≤ x * y = n ⇒ x ≤ √n \r\nTừ nhận xét trên ta thấy rằng để kiểm tra xem n có chia hết cho một số nào nhỏ hơn nó hay không t', '', '', 11),
(63, 'Các toán tử', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho xâu kí tự. Hãy đếm số lượng kí tự khác nhau trong xâu đó\r\nVí dụ:\r\nVới s = \"\"cabca\"\", thì kết quả differentSymbolsNaive(s) = 3.\r\nCó 3 kí tự khác nhau là a, b và c.\r\n\r\nĐầu vào/Đầu ra:\r\n[Thời gian chạy] 0.5 seconds\r\n[Đầu vào] string s\r\nXâu kí tự chứa các chữ cái in thường.\r\nGuaranteed constraints:\r\n3 ≤ s.length ≤ 1000.\r\n[Đầu ra] integer.\r\n\r\nHướng dẫn bài tập.\r\nCode mẫu:\r\n\r\nNgôn ngữ C++:\r\n\r\nint differentSymbolsNaive(std::string s)\r\n{\r\n    vector <bool> b(256, false);\r\n    for (int i = 0; i < s.length(); i++)\r\n        b[s[i]] = true;\r\n    int d = 0;\r\n    for (int i = 0; i < s.length(); i++)\r\n    if (b[s[i]]){\r\n        d++;\r\n        b[s[i]] = false;\r\n    }\r\n    return d;\r\n}', '', '', 11),
(64, 'Các câu lệnh điều kiện', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho số nguyên dương n. Hãy tạo ra ma trận vuông kích thước n*n chứa các số từ 1 tới n*n tăng dần theo hình xoắn ốc, xuất phát từ ô trên trái và đi theo theo theo chiều kim đồng hồ\r\n\r\nVí dụ\r\nVới n = 3, kết quả\r\nspiralNumbers(n) = [[1, 2, 3],\r\n                    [8, 9, 4],\r\n                    [7, 6, 5]]\r\n\r\nĐầu vào/đầu ra\r\n[Thời gian chạy] 0.5 giây\r\n[Đầu vào] integer n\r\nĐộ dài của ma trận\r\nĐiều kiện:\r\n3 ≤ n ≤ 100.\r\n[Đầu ra] matrix.integer\r\n\r\nGợi ý:\r\n\r\nTạo ra ma trận kích thước n*n\r\nSử dụng 2 biến để lưu trữ hàng và cột hiện tại, bắt đầu xuất phát từ ô (0,0) (trên trái)\r\nSử dụng 1 biến để lưu trữ giá trị hiện tại của số nằm trong ma trận. Biến này sẽ tăng dần từ 1 cho tới n*n\r\nĐiền số vào ma trận theo nguyên tắc:\r\nVới cạnh đi từ trái qua phải: tăng dần cột, giữ nguyên hàng\r\nVới cạnh đi từ trên xuống dưới: tăng dần hàng, giữ nguyên cột\r\nVới cạnh đi từ phải qua trái: giảm dần cột, giữ nguyên hàng\r\nVới cạnh đi từ dưới lên trên: giảm dần hàng, giữ nguyên cột.\r\n\r\nHướng dẫn bài tập.\r\nCode mẫu:', '', '', 11),
(65, 'Vòng lặp', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho tọa độ tâm và bán kính của một đường tròn cùng tọa độ của một điểm trên mặt phẳng 2 chiều\r\n\r\nKiểm tra xem điểm có nằm trong (hoặc nằm trên viền) của đường tròn hay không?\r\n\r\nVí dụ\r\n\r\nVới point = [1, 1], center = [2, 2], và radius = 1, kết quả insideCircle(point, center, radius) = false.\r\nVới point = [1, 1], center = [0, 0], và radius = 3, kết quả insideCircle(point, center, radius) = true.\r\n\r\nĐầu vào/Đầu ra\r\n[Thời gian chạy] 0.5 giây\r\n[Đầu vào] array.integer point\r\nMảng 2 phần tử thể hiện tọa độ của điểm cần kiểm tra.\r\nĐiều kiện:\r\n-100 ≤ point[i] ≤ 100.\r\n\r\n[Đầu vào] array.integer center\r\nMảng 2 phần tử thể hiện tọa độ tâm của đường tròn\r\nĐiều kiện:\r\n-10 ≤ center[i] ≤ 10.\r\n\r\n[Đầu vào] integer radius\r\nBán kính đường tròn.\r\nĐiều kiện:\r\n1 ≤ radius ≤ 5.\r\n\r\n[Đầu ra] boolean\r\ntrue nếu point nằm trong đường tròn, false nếu ngược lại.\r\n\r\nLý thuyết :\r\nCho hệ Oxy, 1 điểm A(x, y) và 1 hình tròn có tâm tại C(xC, yC), bán kính R\r\nKhi đó có 3 quan hệ : \r\ndist(A, C) < R : điểm A nằm trong hình trò', '', '', 11),
(66, 'Vòng lặp: while và do-while', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho một mảng các số nguyên, bạn hãy viết hàm kiểm tra xem các phần tử của mảng có tạo thành một dãy số tăng dần hoặc giảm dần hay không, nếu có return true, ngược lại return false.\r\n\r\nVí du\r\nVới sequence = [1, 4, 5, 7, 9], thì kết quả là isMonotonous(sequence) = true\r\nVới sequence = [0], thì kết quả là isMonotonous(sequence) = true;\r\nVới sequence = [3, 3], thì kết quả là isMonotonous(sequence) = false.\r\nGiải thích: 2 phần tử bằng nhau không tạo thành dãy tăng hay dãy giảm.\r\n\r\nĐầu vào/Đầu ra\r\n[Thời gian chạy] 0.5 giây\r\n[Đầu vào] array.integer sequence\r\nĐiều kiện:\r\n1 ≤ sequence.length ≤ 10,\r\n-250 ≤ sequence[i] ≤ 250.\r\n\r\n[Đầu ra] boolean\r\ntrue nếu sequence là dãy tăng hoặc dãy giảm, false trong trường hợp ngược lại.\r\n\r\nHướng dẫn bài tập.\r\nCode mẫu:\r\n\r\nNgôn ngữ C++:\r\n\r\nbool isMonotonous(std::vector<int> sequence)\r\n{\r\n    if (sequence.size() == 1)\r\n        return true;\r\n    if (sequence.size() == 2)\r\n        return (sequence[0] != sequence[1]);\r\n    for (int i = 2; i < sequence.size(); i++)', '', '', 11),
(67, 'Số học', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Chúng ta có một số nguyên dương n. Mỗi một lần ta thay thế n bằng tổng các thừa số nguyên tố của nó (ví dụ 12=2*2*3 thì 12 sẽ được thay thế bằng số 2+2+3=7)\r\n\r\nChúng ta áp dụng phép toán này vào số hiện tại cho đến khi kết quả thu được giống vs số hiện tại\r\n\r\nCho một số tự nhiên, hãy tìm kết quả cuối cùng của phép toán trên.\r\n\r\nVí dụ:\r\n\r\nVới n = 24, kết quả factorSum(n) = 5.\r\n24 -> (2 + 2 + 2 + 3) = 9 -> (3 + 3) = 6 -> (2 + 3) = 5 -> 5.\r\nVì vậy kết quả trong trường hợp n = 24 là 5.\r\n\r\nĐầu vào/Đầu ra\r\n[Thời gian chạy] 0.5 giây\r\n[Đầu vào] integer n\r\nĐiều kiện:\r\n2 ≤ n ≤ 200.\r\n[Đầu ra] integer\r\n\r\nLý thuyết\r\nCách kiểm tra một số nguyên dương n có phải một số nguyên tố hay không ? \r\n\r\nNhận thấy rằng một số nguyên n > 1 không phải là một số nguyên tố khi và chỉ khi n có thể biểu diễn dưới dạng : n = x * y, với x,y là hai số nguyên dương lớn hơn 1.\r\nGiả sử răng x ≤ y ⇒ x * x ≤ x * y = n ⇒ x ≤ √n \r\nTừ nhận xét trên ta thấy rằng để kiểm tra xem n có chia hết cho một số nào nhỏ hơn nó hay không t', '', '', 12),
(69, 'Đếm', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho xâu kí tự. Hãy đếm số lượng kí tự khác nhau trong xâu đó\r\nVí dụ:\r\nVới s = \"\"cabca\"\", thì kết quả differentSymbolsNaive(s) = 3.\r\nCó 3 kí tự khác nhau là a, b và c.\r\n\r\nĐầu vào/Đầu ra:\r\n[Thời gian chạy] 0.5 seconds\r\n[Đầu vào] string s\r\nXâu kí tự chứa các chữ cái in thường.\r\nGuaranteed constraints:\r\n3 ≤ s.length ≤ 1000.\r\n[Đầu ra] integer.\r\n\r\nHướng dẫn bài tập.\r\nCode mẫu:\r\n\r\nNgôn ngữ C++:\r\n\r\nint differentSymbolsNaive(std::string s)\r\n{\r\n    vector <bool> b(256, false);\r\n    for (int i = 0; i < s.length(); i++)\r\n        b[s[i]] = true;\r\n    int d = 0;\r\n    for (int i = 0; i < s.length(); i++)\r\n    if (b[s[i]]){\r\n        d++;\r\n        b[s[i]] = false;\r\n    }\r\n    return d;\r\n}', '', '', 12),
(70, 'Ma trận', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho số nguyên dương n. Hãy tạo ra ma trận vuông kích thước n*n chứa các số từ 1 tới n*n tăng dần theo hình xoắn ốc, xuất phát từ ô trên trái và đi theo theo theo chiều kim đồng hồ\r\n\r\nVí dụ\r\nVới n = 3, kết quả\r\nspiralNumbers(n) = [[1, 2, 3],\r\n                    [8, 9, 4],\r\n                    [7, 6, 5]]\r\n\r\nĐầu vào/đầu ra\r\n[Thời gian chạy] 0.5 giây\r\n[Đầu vào] integer n\r\nĐộ dài của ma trận\r\nĐiều kiện:\r\n3 ≤ n ≤ 100.\r\n[Đầu ra] matrix.integer\r\n\r\nGợi ý:\r\n\r\nTạo ra ma trận kích thước n*n\r\nSử dụng 2 biến để lưu trữ hàng và cột hiện tại, bắt đầu xuất phát từ ô (0,0) (trên trái)\r\nSử dụng 1 biến để lưu trữ giá trị hiện tại của số nằm trong ma trận. Biến này sẽ tăng dần từ 1 cho tới n*n\r\nĐiền số vào ma trận theo nguyên tắc:\r\nVới cạnh đi từ trái qua phải: tăng dần cột, giữ nguyên hàng\r\nVới cạnh đi từ trên xuống dưới: tăng dần hàng, giữ nguyên cột\r\nVới cạnh đi từ phải qua trái: giảm dần cột, giữ nguyên hàng\r\nVới cạnh đi từ dưới lên trên: giảm dần hàng, giữ nguyên cột.\r\n\r\nHướng dẫn bài tập.\r\nCode mẫu:', '', '', 12),
(71, 'Hình học', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho tọa độ tâm và bán kính của một đường tròn cùng tọa độ của một điểm trên mặt phẳng 2 chiều\r\n\r\nKiểm tra xem điểm có nằm trong (hoặc nằm trên viền) của đường tròn hay không?\r\n\r\nVí dụ\r\n\r\nVới point = [1, 1], center = [2, 2], và radius = 1, kết quả insideCircle(point, center, radius) = false.\r\nVới point = [1, 1], center = [0, 0], và radius = 3, kết quả insideCircle(point, center, radius) = true.\r\n\r\nĐầu vào/Đầu ra\r\n[Thời gian chạy] 0.5 giây\r\n[Đầu vào] array.integer point\r\nMảng 2 phần tử thể hiện tọa độ của điểm cần kiểm tra.\r\nĐiều kiện:\r\n-100 ≤ point[i] ≤ 100.\r\n\r\n[Đầu vào] array.integer center\r\nMảng 2 phần tử thể hiện tọa độ tâm của đường tròn\r\nĐiều kiện:\r\n-10 ≤ center[i] ≤ 10.\r\n\r\n[Đầu vào] integer radius\r\nBán kính đường tròn.\r\nĐiều kiện:\r\n1 ≤ radius ≤ 5.\r\n\r\n[Đầu ra] boolean\r\ntrue nếu point nằm trong đường tròn, false nếu ngược lại.\r\n\r\nLý thuyết :\r\nCho hệ Oxy, 1 điểm A(x, y) và 1 hình tròn có tâm tại C(xC, yC), bán kính R\r\nKhi đó có 3 quan hệ : \r\ndist(A, C) < R : điểm A nằm trong hình trò', '', '', 12),
(72, 'Dãy số', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Cho một mảng các số nguyên, bạn hãy viết hàm kiểm tra xem các phần tử của mảng có tạo thành một dãy số tăng dần hoặc giảm dần hay không, nếu có return true, ngược lại return false.\r\n\r\nVí du\r\nVới sequence = [1, 4, 5, 7, 9], thì kết quả là isMonotonous(sequence) = true\r\nVới sequence = [0], thì kết quả là isMonotonous(sequence) = true;\r\nVới sequence = [3, 3], thì kết quả là isMonotonous(sequence) = false.\r\nGiải thích: 2 phần tử bằng nhau không tạo thành dãy tăng hay dãy giảm.\r\n\r\nĐầu vào/Đầu ra\r\n[Thời gian chạy] 0.5 giây\r\n[Đầu vào] array.integer sequence\r\nĐiều kiện:\r\n1 ≤ sequence.length ≤ 10,\r\n-250 ≤ sequence[i] ≤ 250.\r\n\r\n[Đầu ra] boolean\r\ntrue nếu sequence là dãy tăng hoặc dãy giảm, false trong trường hợp ngược lại.\r\n\r\nHướng dẫn bài tập.\r\nCode mẫu:\r\n\r\nNgôn ngữ C++:\r\n\r\nbool isMonotonous(std::vector<int> sequence)\r\n{\r\n    if (sequence.size() == 1)\r\n        return true;\r\n    if (sequence.size() == 2)\r\n        return (sequence[0] != sequence[1]);\r\n    for (int i = 2; i < sequence.size(); i++)', '', '', 12),
(73, 'Hàm toán học', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n	string name;\r\n	string gender;\r\n\r\npublic:\r\n	Person(string name, string gender) {\r\n		this->name = name;\r\n		this->gender = gender;\r\n	}\r\n\r\n	string getName() {\r\n		return name;\r\n	}\r\n\r\n	void setName(string name) {\r\n		this->name = name;\r\n	}\r\n\r\n	string getGender() {\r\n		return gender;\r\n	}\r\n\r\n	void setGender(string gender) {\r\n		this->gender = gender;\r\n	}\r\n\r\n	void display() {\r\n		cout << \"\"Name: \"\" << name << endl;\r\n		cout << \"\"Gender: \"\" << gender << endl;\r\n	}\r\n};\r\n\r\nclass Student : Person {\r\n	...\r\n};\r\n\r\nint main() {\r\n	Student s(\"\"Trung\"\", \"\"Male\"\", 1700);\r\n	s.display();\r\n	return 0;\r\n}', '', '', 13),
(74, 'Thao tác với văn bản', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n	string name;\r\n	string gender;\r\n\r\npublic:\r\n	Person(string name, string gender) {\r\n		this->name = name;\r\n		this->gender = gender;\r\n	}\r\n\r\n	string getName() {\r\n		return name;\r\n	}\r\n\r\n	void setName(string name) {\r\n		this->name = name;\r\n	}\r\n\r\n	string getGender() {\r\n		return gender;\r\n	}\r\n\r\n	void setGender(string gender) {\r\n		this->gender = gender;\r\n	}\r\n\r\n	void display() {\r\n		cout << \"\"Name: \"\" << name << endl;\r\n		cout << \"\"Gender: \"\" << gender << endl;\r\n	}\r\n};\r\n\r\nclass Student : Person {\r\n	...\r\n};\r\n\r\nint main() {\r\n	Student s(\"\"Trung\"\", \"\"Male\"\", 1700);\r\n	s.display();\r\n	return 0;\r\n}', '', '', 13),
(75, 'Làm việc với ngày/giờ', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n	string name;\r\n	string gender;\r\n\r\npublic:\r\n	Person(string name, string gender) {\r\n		this->name = name;\r\n		this->gender = gender;\r\n	}\r\n\r\n	string getName() {\r\n		return name;\r\n	}\r\n\r\n	void setName(string name) {\r\n		this->name = name;\r\n	}\r\n\r\n	string getGender() {\r\n		return gender;\r\n	}\r\n\r\n	void setGender(string gender) {\r\n		this->gender = gender;\r\n	}\r\n\r\n	void display() {\r\n		cout << \"\"Name: \"\" << name << endl;\r\n		cout << \"\"Gender: \"\" << gender << endl;\r\n	}\r\n};\r\n\r\nclass Student : Person {\r\n	...\r\n};\r\n\r\nint main() {\r\n	Student s(\"\"Trung\"\", \"\"Male\"\", 1700);\r\n	s.display();\r\n	return 0;\r\n}', '', '', 13),
(76, 'Các mệnh đề SET', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n	string name;\r\n	string gender;\r\n\r\npublic:\r\n	Person(string name, string gender) {\r\n		this->name = name;\r\n		this->gender = gender;\r\n	}\r\n\r\n	string getName() {\r\n		return name;\r\n	}\r\n\r\n	void setName(string name) {\r\n		this->name = name;\r\n	}\r\n\r\n	string getGender() {\r\n		return gender;\r\n	}\r\n\r\n	void setGender(string gender) {\r\n		this->gender = gender;\r\n	}\r\n\r\n	void display() {\r\n		cout << \"\"Name: \"\" << name << endl;\r\n		cout << \"\"Gender: \"\" << gender << endl;\r\n	}\r\n};\r\n\r\nclass Student : Person {\r\n	...\r\n};\r\n\r\nint main() {\r\n	Student s(\"\"Trung\"\", \"\"Male\"\", 1700);\r\n	s.display();\r\n	return 0;\r\n}', '', '', 13),
(77, 'Biểu thức điều kiện', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n	string name;\r\n	string gender;\r\n\r\npublic:\r\n	Person(string name, string gender) {\r\n		this->name = name;\r\n		this->gender = gender;\r\n	}\r\n\r\n	string getName() {\r\n		return name;\r\n	}\r\n\r\n	void setName(string name) {\r\n		this->name = name;\r\n	}\r\n\r\n	string getGender() {\r\n		return gender;\r\n	}\r\n\r\n	void setGender(string gender) {\r\n		this->gender = gender;\r\n	}\r\n\r\n	void display() {\r\n		cout << \"\"Name: \"\" << name << endl;\r\n		cout << \"\"Gender: \"\" << gender << endl;\r\n	}\r\n};\r\n\r\nclass Student : Person {\r\n	...\r\n};\r\n\r\nint main() {\r\n	Student s(\"\"Trung\"\", \"\"Male\"\", 1700);\r\n	s.display();\r\n	return 0;\r\n}', '', '', 13),
(78, 'Truy vấn con', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n	string name;\r\n	string gender;\r\n\r\npublic:\r\n	Person(string name, string gender) {\r\n		this->name = name;\r\n		this->gender = gender;\r\n	}\r\n\r\n	string getName() {\r\n		return name;\r\n	}\r\n\r\n	void setName(string name) {\r\n		this->name = name;\r\n	}\r\n\r\n	string getGender() {\r\n		return gender;\r\n	}\r\n\r\n	void setGender(string gender) {\r\n		this->gender = gender;\r\n	}\r\n\r\n	void display() {\r\n		cout << \"\"Name: \"\" << name << endl;\r\n		cout << \"\"Gender: \"\" << gender << endl;\r\n	}\r\n};\r\n\r\nclass Student : Person {\r\n	...\r\n};\r\n\r\nint main() {\r\n	Student s(\"\"Trung\"\", \"\"Male\"\", 1700);\r\n	s.display();\r\n	return 0;\r\n}', '', '', 13),
(79, 'Cấu trúc dữ liệu mảng', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n	string name;\r\n	string gender;\r\n\r\npublic:\r\n	Person(string name, string gender) {\r\n		this->name = name;\r\n		this->gender = gender;\r\n	}\r\n\r\n	string getName() {\r\n		return name;\r\n	}\r\n\r\n	void setName(string name) {\r\n		this->name = name;\r\n	}\r\n\r\n	string getGender() {\r\n		return gender;\r\n	}\r\n\r\n	void setGender(string gender) {\r\n		this->gender = gender;\r\n	}\r\n\r\n	void display() {\r\n		cout << \"\"Name: \"\" << name << endl;\r\n		cout << \"\"Gender: \"\" << gender << endl;\r\n	}\r\n};\r\n\r\nclass Student : Person {\r\n	...\r\n};\r\n\r\nint main() {\r\n	Student s(\"\"Trung\"\", \"\"Male\"\", 1700);\r\n	s.display();\r\n	return 0;\r\n}', '', '', 14),
(80, 'Ngăn xếp và hàng đợi', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n	string name;\r\n	string gender;\r\n\r\npublic:\r\n	Person(string name, string gender) {\r\n		this->name = name;\r\n		this->gender = gender;\r\n	}\r\n\r\n	string getName() {\r\n		return name;\r\n	}\r\n\r\n	void setName(string name) {\r\n		this->name = name;\r\n	}\r\n\r\n	string getGender() {\r\n		return gender;\r\n	}\r\n\r\n	void setGender(string gender) {\r\n		this->gender = gender;\r\n	}\r\n\r\n	void display() {\r\n		cout << \"\"Name: \"\" << name << endl;\r\n		cout << \"\"Gender: \"\" << gender << endl;\r\n	}\r\n};\r\n\r\nclass Student : Person {\r\n	...\r\n};\r\n\r\nint main() {\r\n	Student s(\"\"Trung\"\", \"\"Male\"\", 1700);\r\n	s.display();\r\n	return 0;\r\n}', '', '', 14),
(81, 'Danh sách liên kết', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 14),
(82, 'Giải thuật tìm kiếm', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n	string name;\r\n	string gender;\r\n\r\npublic:\r\n	Person(string name, string gender) {\r\n		this->name = name;\r\n		this->gender = gender;\r\n	}\r\n\r\n	string getName() {\r\n		return name;\r\n	}\r\n\r\n	void setName(string name) {\r\n		this->name = name;\r\n	}\r\n\r\n	string getGender() {\r\n		return gender;\r\n	}\r\n\r\n	void setGender(string gender) {\r\n		this->gender = gender;\r\n	}\r\n\r\n	void display() {\r\n		cout << \"\"Name: \"\" << name << endl;\r\n		cout << \"\"Gender: \"\" << gender << endl;\r\n	}\r\n};\r\n\r\nclass Student : Person {\r\n	...\r\n};\r\n\r\nint main() {\r\n	Student s(\"\"Trung\"\", \"\"Male\"\", 1700);\r\n	s.display();\r\n	return 0;\r\n}', '', '', 14),
(83, 'Giải thuật sắp xếp', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 14),
(84, 'Giải thuật đệ quy', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 14),
(85, 'Lớp và đối tượng', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 15),
(86, 'Biến tĩnh, phương thức tĩnh', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 15),
(87, 'Tính đóng gói', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 15),
(88, 'Tính kế thừa', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 15),
(89, 'Tính đa hình và trừu tượng', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 15),
(90, 'Mối quan hệ giữa các đối tượng', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 15),
(91, 'Con trỏ', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 16),
(92, 'Mảng', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 16),
(93, 'Các phép toán thao tác bit', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 16),
(94, 'Kiểu cấu trúc', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 16),
(95, 'Stack', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 16),
(96, 'Queue', 'Học bài này để giúp bạn giỏi hơn về lập trình và mọi thứ liên quan đến lập trình', 'Bạn hãy điền code vào dấu ... để chương trình hiển thị ra màn hình thông tin sau:\r\nName: Hieu\r\nGender: Male\r\nSalary: 1700\r\n\r\nCode của chương trình cần điền:\r\n\r\n#include<iostream>\r\n\r\nusing namespace std;\r\n\r\nclass Person {\r\nprivate:\r\n        string name;\r\n        string gender;\r\n\r\npublic:\r\n        Person(string name, string gender) {\r\n                this->name = name;\r\n                this->gender = gender;\r\n        }\r\n\r\n        string getName() {\r\n                return name;\r\n        }\r\n\r\n        void setName(string name) {\r\n                this->name = name;\r\n        }\r\n\r\n        string getGender() {\r\n                return gender;\r\n        }\r\n\r\n        void setGender(string gender) {\r\n                this->gender = gender;\r\n        }\r\n\r\n        void display() {\r\n                cout << \"\"Name: \"\" << name << endl;\r\n                cout << \"\"Gender: \"\" << gender << endl;\r\n        }\r\n};\r\n\r\nclass Student : Person {\r\n        ...\r\n};\r\n\r\nint main() {\r\n        Student s(\"\"Trung\"\", \"\"Male\"\",', '', '', 16);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `Id` int(11) NOT NULL,
  `Content` varchar(500) NOT NULL,
  `Timestamp` datetime NOT NULL,
  `ToRoomId` int(11) NOT NULL,
  `AppUserId` varchar(767) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`Id`, `Content`, `Timestamp`, `ToRoomId`, `AppUserId`) VALUES
(1, 'Hello', '2022-01-11 22:23:48', 1, '677aa397-36b0-4676-a955-7e6c4297fb3a');

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `receiptId` int(11) NOT NULL,
  `totalPrice` float NOT NULL DEFAULT 0,
  `timeReceipt` datetime NOT NULL,
  `registerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `registerId` int(11) NOT NULL,
  `timeReg` datetime NOT NULL,
  `userId` varchar(767) NOT NULL,
  `courseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`registerId`, `timeReg`, `userId`, `courseId`) VALUES
(29, '2021-12-29 23:56:00', '677aa397-36b0-4676-a955-7e6c4297fb3a', 15),
(30, '2021-12-29 02:23:06', 'f5ebe639-df16-4e3e-bbc9-8e7dc9400707', 4),
(31, '2021-12-29 02:23:06', 'f5ebe639-df16-4e3e-bbc9-8e7dc9400707', 5),
(32, '2021-12-31 09:13:33', 'f5ebe639-df16-4e3e-bbc9-8e7dc9400707', 2),
(33, '2021-12-31 09:13:33', 'f5ebe639-df16-4e3e-bbc9-8e7dc9400707', 1),
(34, '2021-12-31 09:13:33', 'f5ebe639-df16-4e3e-bbc9-8e7dc9400707', 7),
(35, '2022-01-12 09:18:03', 'f5ebe639-df16-4e3e-bbc9-8e7dc9400707', 6);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `AppUserId` varchar(767) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`Id`, `Name`, `AppUserId`) VALUES
(1, 'Học tập', '677aa397-36b0-4676-a955-7e6c4297fb3a');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `topicId` int(11) NOT NULL,
  `topicName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`topicId`, `topicName`) VALUES
(3, 'Kiến thức cơ bản'),
(4, 'Lập trình cơ bản'),
(5, 'Lập trình nâng cao'),
(6, 'Giải quyết vấn đề'),
(7, ' Kỹ năng nâng cao');

-- --------------------------------------------------------

--
-- Table structure for table `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20220102024433_new1', '3.1.21'),
('20220111023819_new2', '3.1.21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approle`
--
ALTER TABLE `approle`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `approleclaim`
--
ALTER TABLE `approleclaim`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `appuser`
--
ALTER TABLE `appuser`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `appuserclaim`
--
ALTER TABLE `appuserclaim`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `appuserlogin`
--
ALTER TABLE `appuserlogin`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `appuserrole`
--
ALTER TABLE `appuserrole`
  ADD PRIMARY KEY (`UserId`,`RoleId`);

--
-- Indexes for table `appusertoken`
--
ALTER TABLE `appusertoken`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`cmtId`),
  ADD KEY `IX_comment_courseId` (`courseId`),
  ADD KEY `IX_comment_userId` (`userId`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`),
  ADD KEY `IX_Contact_AppUserId` (`AppUserId`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseId`),
  ADD KEY `IX_course_discountId` (`discountId`),
  ADD KEY `IX_course_topicId` (`topicId`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discountId`);

--
-- Indexes for table `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`exerciseId`),
  ADD KEY `IX_exercise_lessonId` (`lessonId`),
  ADD KEY `IX_exercise_userId` (`userId`);

--
-- Indexes for table `exerciseinuser`
--
ALTER TABLE `exerciseinuser`
  ADD PRIMARY KEY (`userId`,`exerciseId`),
  ADD KEY `IX_exerciseInUser_exerciseId` (`exerciseId`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`lessonId`),
  ADD KEY `IX_lesson_courseId` (`courseId`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Messages_AppUserId` (`AppUserId`),
  ADD KEY `IX_Messages_ToRoomId` (`ToRoomId`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`receiptId`),
  ADD KEY `IX_receipt_registerId` (`registerId`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`registerId`),
  ADD KEY `IX_register_courseId` (`courseId`),
  ADD KEY `IX_register_userId` (`userId`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Rooms_AppUserId` (`AppUserId`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`topicId`);

--
-- Indexes for table `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `approleclaim`
--
ALTER TABLE `approleclaim`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `appuserclaim`
--
ALTER TABLE `appuserclaim`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `cmtId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `courseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `discountId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exercise`
--
ALTER TABLE `exercise`
  MODIFY `exerciseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `lessonId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `receipt`
--
ALTER TABLE `receipt`
  MODIFY `receiptId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `registerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `topicId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_comment_AppUser_userId` FOREIGN KEY (`userId`) REFERENCES `appuser` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_comment_course_courseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK_Contact_AppUser_AppUserId` FOREIGN KEY (`AppUserId`) REFERENCES `appuser` (`Id`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `FK_course_discount_discountId` FOREIGN KEY (`discountId`) REFERENCES `discount` (`discountId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_course_topic_topicId` FOREIGN KEY (`topicId`) REFERENCES `topic` (`topicId`) ON DELETE CASCADE;

--
-- Constraints for table `exercise`
--
ALTER TABLE `exercise`
  ADD CONSTRAINT `FK_exercise_AppUser_userId` FOREIGN KEY (`userId`) REFERENCES `appuser` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_exercise_lesson_lessonId` FOREIGN KEY (`lessonId`) REFERENCES `lesson` (`lessonId`) ON DELETE CASCADE;

--
-- Constraints for table `exerciseinuser`
--
ALTER TABLE `exerciseinuser`
  ADD CONSTRAINT `FK_exerciseInUser_AppUser_userId` FOREIGN KEY (`userId`) REFERENCES `appuser` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_exerciseInUser_exercise_exerciseId` FOREIGN KEY (`exerciseId`) REFERENCES `exercise` (`exerciseId`) ON DELETE CASCADE;

--
-- Constraints for table `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `FK_lesson_course_courseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `FK_Messages_AppUser_AppUserId` FOREIGN KEY (`AppUserId`) REFERENCES `appuser` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Messages_Rooms_ToRoomId` FOREIGN KEY (`ToRoomId`) REFERENCES `rooms` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `FK_receipt_register_registerId` FOREIGN KEY (`registerId`) REFERENCES `register` (`registerId`) ON DELETE CASCADE;

--
-- Constraints for table `register`
--
ALTER TABLE `register`
  ADD CONSTRAINT `FK_register_AppUser_userId` FOREIGN KEY (`userId`) REFERENCES `appuser` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_register_course_courseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `FK_Rooms_AppUser_AppUserId` FOREIGN KEY (`AppUserId`) REFERENCES `appuser` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
