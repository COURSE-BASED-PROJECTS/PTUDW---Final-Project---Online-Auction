-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2022 at 06:10 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineauction`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `point` int(11) NOT NULL,
  `level` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `sumBid` int(11) NOT NULL DEFAULT 0,
  `otp` smallint(6) DEFAULT NULL,
  `isLock` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`name`, `address`, `email`, `dob`, `point`, `level`, `username`, `password`, `isActive`, `sumBid`, `otp`, `isLock`) VALUES
('Nguyễn Đức Quân', '456/1 Trương Định, Quận 3, TPHCM', 'dtien@gmail.com', '1983-12-22', 0, 'bidder', 'daitien', '$2a$10$JCCQ92ioG.A6kqQs6jDZO.dOELnevSwBMjHpGheA5tDXir4QvkioK', 0, 0, 2056, 0),
('Nguyễn Văn An', '234 Nguyễn Văn Linh, Quận Thủ Đức, TPHCM', 'dtphat@gmail.com', '1990-12-13', 0, 'seller', 'daitoanphat', '$2a$10$os5Va7p5VnjBdZvPUCQt/eSpIsEnf.7uPlDm4Pck4RfT0bZZ9lYV.', 1, 0, 6419, 0),
('Nguyễn Đức Huy', '123 Nguyễn Văn Cừ', 'duchuy040421@gmail.com', '2001-04-04', 0, 'admin', 'dhuy', '$2a$10$PvOejPY3hGtfuw3H9mpQa.BkYwIjqtPB8hwlGqWkoMMbu7DSAs7AW', 1, 0, 1111, 0),
('Nguyen Duc Huy', '77 Võ Thị Sáu, Quận 3, TPHCM', 'huyyy13538@gmail.com', '2001-04-04', 7, 'seller', 'dhuy01', '$2b$10$5W5DZ5/Xi0HKnZO9vTq7/.9dgI7eZEC6WCwzPfxeMa5FrWFyqPUe.', 1, 10, 2906, 0),
('Trần Thanh Như', '528 Trường Chinh, Quận 12, TPHCM', 'ttnhu@gmail.com', '1987-12-27', 2, 'seller', 'dinhvan', '$2b$10$aPLLI8L3HXLJ6YU9R3FMCOLHjtOcRjh6D6ePKya31xBiWnrRZt3Vy', 1, 2, 5853, 0),
('Nguyễn Minh Bảo', '777 Võ Văn Kiệt, Quận 5, TPHCM', 'nmbao@gmail.com', '1989-04-11', 1, 'seller', 'giabao', '$2a$10$Uf2UereUJn05erDm1ZVYl.n6OyNrtPe.Z.bZ9R8jmfH3MJM3ueMXC', 1, 2, 5270, 0),
('Nguyen Bao Tram', '11 Ton That Tung', 'yuanzan1111@gmail.com', '2001-12-11', 0, 'bidder', 'nbt1111', '$2b$10$WtjN3KmSLJ3a.x.yMEWVyurZT2NfTFmVcyM9kQojHVmD7QvBMR3ra', 1, 0, 6354, 0),
('Nguyễn Bảo Trâm', '231 Nguyễn Văn Cừ', 'nbtram191@gmail.com', '2001-11-11', 2, 'admin', 'nbtram', '$2b$10$NZ9.Y7v3vCg0Eze.Nc3oau3dpOk/FHwSEs2SFygbVTVzxWxb1DF4K', 1, 13, 1913, 0),
('Nguyễn Hoàng Thông', '312 Nguyễn Văn Cừ', 'nhthong30@gmail.com', '2001-03-14', 0, 'admin', 'nhthong', '$2b$10$N8FBL//oxV4m15VT1/.l0.19DFq.09qwXuyRFSSiMGhHlMdDQebWm', 1, 0, 1111, 0),
('Cao Hoàng Ánh Duyên', '715 Lý Thường Kiệt, Quận Tân Bình, TPHCM', 'chaduyen@gmail.com', '1995-12-27', 0, 'bidder', 'ninhhoa', '$2a$10$2fx9HkSgkwZIDCy8.KmiVeQdbhpAgd/DbfMbASWtev6ahJoTVHMxW', 0, 0, 6229, 0),
('Phạm Đăng Phú', '64 Lê Trọng Tấn, Quận Tân Phú, TPHCM', 'pdat@gmail.com', '1999-12-21', 1, 'bidder', 'phatdat', '$2a$10$ZhUQdSRGI7.Cxaq74BRVH.xgjqS6QS0xqhU8OWhXRWQj4YGSm0FKq', 1, 10, 5806, 0),
('Trần Văn Đức', '34 Quang Trung, Quận Gò Vấp, TPHCM', 'ptai@gmail.com', '1997-12-22', 3, 'seller', 'phattai', '$2a$10$wrNAB1ut3RBsUFoPa8DroehS./3pUXDwkyPQNzdIBbbd.2oJeEs3.', 1, 10, 8218, 0),
('Lê Hoàng Bảo Nam', '304 Ung Văn Khiêm, Quận Bình Thạnh, TPHCM', 'lhbnam@gmail.com', '1992-12-28', 0, 'bidder', 'phucan', '$2a$10$RMSx76sKtMInblCRqfVBZepyeiEPXb/KhgJkvoMVlH9G1IcSiEzT.', 0, 0, 2819, 0),
('Lê Anh Khiêm', '11 Tôn Thất Tùng, Phường Phạm Ngũ Lão, Quận 1, TP. Hồ Chí Minh', 'gennyharris1901@gmail.com', '2001-04-11', 8, 'bidder', 'renren', '$2b$10$SHZyOjj2Tyg8QpmhLwyKmehnuI0Z6ni/QLYc0lc0wLYztc50tcRqq', 1, 10, 5022, 0),
('Hoàng Gia Bảo', '194 Lê Văn Quới, Quận Bình Tân, TPHCM', 'hgbao@gmail.com', '1979-12-23', 6, 'seller', 'thanhvu', '$2a$10$3uMUXOBwg.Kv6wi3e8a5i.VoJ0FvafcvAI3.r8e7MTqAe/fRsJqee', 1, 10, 1026, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CatID` int(11) UNSIGNED NOT NULL,
  `CatName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CatID`, `CatName`) VALUES
(1, 'Thiết bị số'),
(2, 'Thời trang'),
(3, 'Giày'),
(4, 'Gia dụng');

-- --------------------------------------------------------

--
-- Table structure for table `categoriesnext`
--

CREATE TABLE `categoriesnext` (
  `CatIDNext` int(11) UNSIGNED NOT NULL,
  `CatNextName` varchar(50) NOT NULL,
  `CatID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categoriesnext`
--

INSERT INTO `categoriesnext` (`CatIDNext`, `CatNextName`, `CatID`) VALUES
(1, 'Điện thoại', 1),
(2, 'Máy tính bảng/Laptop', 1),
(3, 'Áo', 2),
(4, 'Quần', 2),
(5, 'Balo/Túi xách', 2),
(6, 'Giày thể thao', 3),
(7, 'Giày tây', 3),
(8, 'Đồ dùng nhà bếp', 4),
(9, 'Thiết bị gia đình', 4);

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `ProID` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`ProID`, `username`) VALUES
(16, 'dinhvan'),
(15, 'renren'),
(31, 'renren'),
(41, 'renren'),
(46, 'renren'),
(50, 'renren'),
(58, 'renren'),
(60, 'renren'),
(84, 'renren'),
(50, 'nbt1111');

-- --------------------------------------------------------

--
-- Table structure for table `historybid`
--

CREATE TABLE `historybid` (
  `ProIDHistory` int(11) UNSIGNED NOT NULL,
  `BidderHistory` varchar(50) NOT NULL,
  `PriceBid` bigint(20) NOT NULL,
  `PriceStart` bigint(20) NOT NULL,
  `PriceWinAll` bigint(20) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `isSuccessful` tinyint(1) NOT NULL DEFAULT 0,
  `isAllowed` tinyint(1) NOT NULL DEFAULT 1,
  `isWinner` tinyint(1) NOT NULL DEFAULT 0,
  `commentBidder` text NOT NULL,
  `commentSeller` text NOT NULL,
  `pointFromBidder` int(1) NOT NULL DEFAULT 0,
  `pointFromSeller` int(1) NOT NULL DEFAULT 0,
  `isCancel` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `historybid`
--

INSERT INTO `historybid` (`ProIDHistory`, `BidderHistory`, `PriceBid`, `PriceStart`, `PriceWinAll`, `time`, `isSuccessful`, `isAllowed`, `isWinner`, `commentBidder`, `commentSeller`, `pointFromBidder`, `pointFromSeller`, `isCancel`) VALUES
(5, 'dhuy', 11000000, 10000000, 10000000, '2021-12-26 23:04:48', 0, 0, 0, '', '', 1, 1, 0),
(5, 'phatdat', 10800000, 10800000, 10100000, '2021-12-26 23:05:33', 0, 0, 0, '', '', 1, 1, 0),
(16, 'giabao', 14500000, 14000000, 14000000, '2022-01-13 07:28:02', 0, 1, 0, '', '', 1, 1, 0),
(12, 'giabao', 9990000, 9490000, 9490000, '2022-01-13 07:38:53', 0, 1, 0, '', '', 1, 1, 0),
(89, 'giabao', 600000, 300000, 600000, '2022-01-13 13:06:34', 1, 1, 0, '', '', 1, 1, 0),
(56, 'giabao', 14389200, 8000000, 14389200, '2022-01-13 13:10:21', 1, 1, 0, '', 'Người thắng không thanh toán', 0, -1, 1),
(18, 'giabao', 23290001, 23290000, 23290000, '2022-01-13 13:29:36', 0, 1, 0, '', 'Người thắng không thanh toán', 0, -1, 1),
(24, 'giabao', 7500000, 4000000, 4000000, '2022-01-13 14:40:56', 0, 1, 0, '', '', 0, 1, 1),
(29, 'giabao', 46538327, 20000000, 46538327, '2022-01-13 14:41:30', 1, 1, 0, '', 'Người thắng không thanh toán', 0, -1, 1),
(19, 'giabao', 15390000, 13890000, 14890000, '2022-01-13 14:41:55', 1, 1, 0, '', 'Người thắng không thanh toán', 0, -1, 1),
(63, 'giabao', 12690000, 9990000, 9990000, '2022-01-13 15:05:50', 0, 0, 0, '', 'Người thắng không thanh toán', 0, -1, 1),
(16, 'dinhvan', 26690000, 14111111, 26690000, '2022-01-13 15:18:33', 1, 1, 0, '', '', 1, 1, 0),
(17, 'dinhvan', 34490000, 24000000, 34490000, '2022-01-13 15:18:54', 1, 1, 0, 'Chủ shop đóng gói cẩn thận, giao hàng nhanh, uy tín! Rất tốt.', 'Người thắng không thanh toán', 1, -1, 1),
(24, 'dinhvan', 8290920, 5000000, 8290920, '2022-01-13 15:21:14', 1, 1, 0, 'OK', 'Người thắng không thanh toán', 1, -1, 1),
(75, 'dinhvan', 13500990, 9900990, 9900990, '2022-01-13 19:51:10', 0, 0, 0, '', '', 1, 1, 0),
(46, 'dinhvan', 40000001, 40000000, 40000000, '2022-01-13 20:14:14', 0, 1, 0, '', '', 1, 1, 0),
(52, 'dinhvan', 2000111, 2000000, 2000000, '2022-01-13 20:18:00', 0, 1, 0, '', '', 1, 1, 0),
(50, 'dinhvan', 13500000, 13000000, 13000000, '2022-01-13 20:18:23', 0, 1, 0, '', '', 1, 1, 0),
(57, 'dinhvan', 1111111, 900000, 900000, '2022-01-13 20:20:22', 0, 1, 0, '', '', 1, 1, 0),
(58, 'renren', 1300000, 1000000, 1000000, '2022-01-13 22:13:05', 0, 1, 0, '', '', 1, 1, 0),
(72, 'renren', 5520500, 3020500, 5242850, '2022-01-13 22:13:41', 1, 1, 0, '', '', 1, 1, 0),
(50, 'nbt1111', 14000000, 13000000, 14500000, '2022-01-13 22:30:34', 0, 1, 0, '', '', 1, 1, 0),
(21, 'nbt1111', 21599000, 20999000, 20999000, '2022-01-13 22:31:45', 0, 1, 0, '', '', 1, 1, 0),
(48, 'nbt1111', 96225605, 70000000, 96225605, '2022-01-13 22:32:08', 1, 1, 0, '', '', 1, 1, 0),
(101, 'renren', 1800000, 1600000, 1600000, '2022-01-13 23:39:05', 0, 1, 0, '', '', 1, 1, 0),
(33, 'renren', 6000000, 5000000, 5000000, '2022-01-13 23:42:07', 0, 1, 0, '', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lockauction`
--

CREATE TABLE `lockauction` (
  `id` varchar(50) NOT NULL,
  `product` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lockauction`
--

INSERT INTO `lockauction` (`id`, `product`) VALUES
('giabao', 63),
('dinhvan', 75);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProID` int(11) UNSIGNED NOT NULL,
  `ProName` varchar(50) NOT NULL,
  `PriceCurrent` bigint(20) NOT NULL,
  `PriceWin` bigint(20) NOT NULL,
  `stepPrice` bigint(20) NOT NULL,
  `firstPrice` bigint(20) NOT NULL,
  `Bidder` varchar(50) DEFAULT NULL,
  `DateStart` datetime NOT NULL DEFAULT current_timestamp(),
  `DateEnd` datetime NOT NULL,
  `BidderCount` int(11) DEFAULT 0,
  `Description` text NOT NULL,
  `CatIDNext` int(11) UNSIGNED DEFAULT NULL,
  `Seller` varchar(50) DEFAULT NULL,
  `renewal` tinyint(1) NOT NULL DEFAULT 0,
  `isVerify` tinyint(1) NOT NULL DEFAULT 1,
  `emailed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProID`, `ProName`, `PriceCurrent`, `PriceWin`, `stepPrice`, `firstPrice`, `Bidder`, `DateStart`, `DateEnd`, `BidderCount`, `Description`, `CatIDNext`, `Seller`, `renewal`, `isVerify`, `emailed`) VALUES
(1, 'REALME 8 Pro 8GB - 128GB', 8000000, 10000000, 500000, 7900000, NULL, '2021-12-12 23:23:11', '2022-01-13 07:35:00', 0, '<p>Thương hiệu: Realme</p> <p>Xuất xứ: Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh: 6.4&quot;, FHD+, Super AMOLED, 1080 x 2400 Pixel</p> <p>Camera sau: 108.0 MP + 8.0 MP + 2.0 MP + 2.0 MP</p> <p>Camera trước: 16.0 MP</p> <p>CPU: 2 x Kryo 465 2.3 GHz + 6 x Kryo 465 1.8 GHz</p> <p>RAM: 8GB</p> <p>Bộ nhớ trong: 128GB</p>', 1, 'dhuy01', 0, 1, 1),
(2, 'OPPO Reno6 5G', 10000000, 15000000, 500000, 10000000, NULL, '2021-12-12 09:26:12', '2022-01-29 16:55:20', 0, '<p>Thương hiệu: Oppo</p> <p>Xuất xứ: Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh: 6.43&quot;, FHD+, AMOLED, 1080 x 2400 Pixel</p> <p>Camera sau: 64.0 MP + 8.0 MP + 2.0 MP</p> <p>Camera trước: 32.0 MP</p> <p>CPU: MediaTek Dimensity 900 5G</p> <p>RAM: 8GB</p> <p>Bộ nhớ trong: 128GB</p>', 1, 'dhuy01', 1, 1, 0),
(3, 'APPLE iPhone XR 128GB ', 10000000, 17000000, 700000, 10000000, NULL, '2021-12-12 09:26:12', '2022-01-28 16:55:20', 0, '<p>Thương hiệu: Apple</p> <p>Xuất xứ: Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh: 6.1&quot;, Liquid Retina HD, IPS LCD, 828 x 1792 Pixel</p> <p>Camera sau: 12.0 MP</p> <p>Camera trước: 7.0 MP</p> <p>CPU: A12 Bionic - 4 x 2.5 GHz Vortex + 4 x 1.6 GHz Tempest</p> <p>RAM: 3GB</p> <p>Bộ nhớ trong: 128GB</p>', 1, 'dhuy01', 1, 1, 0),
(5, 'SAMSUNG Galaxy Z Fold3 5G', 30000000, 41000000, 900000, 10000000, NULL, '2021-12-12 09:26:12', '2022-01-26 16:55:20', 0, '<p>Thương hiệu: Samsung</p> <p>Xuất xứ: Việt Nam/Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh ch&iacute;nh: 7.6&rdquo;, M&agrave;n h&igrave;nh phụ: 6.2&rdquo;, HD+, Ch&iacute;nh: Dynamic AMOLED 2X, phụ: Dynamic AMOLED 2X, 1768 x 2208 Pixel</p> <p>Camera sau: 12.0 MP + 12.0 MP + 12.0 MP</p> <p>Camera trước: 12.0 MP</p> <p>CPU: Snapdragon 888</p> <p>RAM: 12GB</p> <p>Bộ nhớ trong: 256GB</p>', 1, 'dhuy01', 1, 1, 0),
(6, 'XIAOMI Mi 11 5G', 11990000, 23990000, 500000, 11990000, NULL, '2021-12-12 09:26:12', '2022-01-25 16:55:20', 0, '<p>Xiaomi Mi 11 một si&ecirc;u phẩm đến từ Xiaomi, m&aacute;y cho trải nghiệm hiệu năng h&agrave;ng đầu với vi xử l&yacute; Qualcomm Snapdragon 888, c&ugrave;ng loạt c&ocirc;ng nghệ đỉnh cao, khiến bất kỳ ai cũng sẽ cho&aacute;ng ngợp về smartphone n&agrave;y.</p> <ul> <li>M&agrave;n h&igrave;nh: AMOLED6.81&quot;Quad HD+ (2K+)</li> <li>Hệ điều h&agrave;nh: Android 11</li> <li>Camera sau: Ch&iacute;nh 108 MP &amp; Phụ 13 MP, 5 MP</li> <li>Camera trước: 20 MP</li> <li>Chip: Snapdragon 888</li> <li>RAM: 8 GB</li> <li>Bộ nhớ trong: 256 GB</li> <li>SIM: 2 Nano SIMHỗ trợ 5G</li> <li>Pin, Sạc: 4600 mAh55 W</li> <li>H&atilde;ng Xiaomi.</li> </ul>', 1, 'nbtram', 1, 1, 0),
(7, 'APPLE iPhone 11 64GB', 13990000, 20990000, 600000, 13990000, NULL, '2021-12-12 09:26:12', '2022-01-24 16:55:20', 0, '<p>Th&ocirc;ng số sản phẩm</p> <ul> <li>M&agrave;n h&igrave;nh: IPS LCD6.1&quot;Liquid Retina</li> <li>Hệ điều h&agrave;nh: iOS 15</li> <li>Camera sau: 2 camera 12 MP</li> <li>Camera trước: 12 MP</li> <li>Chip: Apple A13 Bionic</li> <li>RAM: 4 GB</li> <li>Bộ nhớ trong: 64 GB</li> <li>SIM: 1 Nano SIM &amp; 1 eSIMHỗ trợ 4G</li> <li>Pin, Sạc: 3110 mAh18 W</li> </ul> ', 1, 'nbtram', 1, 1, 0),
(8, 'XIAOMI 11T 5G 128GB', 6000000, 10390000, 400000, 6000000, NULL, '2021-12-12 09:26:12', '2022-01-23 16:55:20', 0, '<p>Th&ocirc;ng tin sản phẩm</p> <ul> <li>M&agrave;n h&igrave;nh: AMOLED6.67&quot;Full HD+</li> <li>Hệ điều h&agrave;nh: Android 11</li> <li>Camera sau: Ch&iacute;nh 108 MP &amp; Phụ 8 MP, 5 MP</li> <li>Camera trước: 16 MP</li> <li>Chip: MediaTek Dimensity 1200</li> <li>RAM: 8 GB</li> <li>Bộ nhớ trong: 128 GB</li> <li>SIM: 2 Nano SIMHỗ trợ 5G</li> <li>Pin, Sạc: 5000 mAh67 W</li> <li>H&atilde;ng: Xiaomi</li> </ul> ', 1, 'nbtram', 1, 1, 0),
(9, 'SAMSUNG Galaxy A32', 3000000, 6100000, 300000, 3000000, NULL, '2021-12-12 09:26:12', '2022-01-22 16:55:20', 0, '<p>Th&ocirc;ng tin sản phẩm</p> <ul> <li>M&agrave;n h&igrave;nh: Super AMOLED6.4&quot;Full HD+</li> <li>Hệ điều h&agrave;nh: Android 11</li> <li>Camera sau: Ch&iacute;nh 64 MP &amp; Phụ 8 MP, 5MP, 5MP</li> <li>Camera trước: 20 MP</li> <li>Chip: MediaTek Helio G80</li> <li>RAM: 6 GB</li> <li>Bộ nhớ trong: 128 GB</li> <li>SIM: 2 Nano SIMHỗ trợ 4G</li> <li>Pin, Sạc: 5000 mAh15 W</li> </ul> ', 1, 'nbtram', 1, 1, 0),
(10, 'SAMSUNG Galaxy S21 Ultra 5G', 11990000, 23990000, 500000, 11990000, NULL, '2021-12-12 09:26:12', '2022-01-31 16:55:20', 0, '<p>Sự đẳng cấp được Samsung gửi gắm th&ocirc;ng qua chiếc smartphone Galaxy S21 Ultra 5G với h&agrave;ng loạt sự n&acirc;ng cấp v&agrave; cải tiến kh&ocirc;ng chỉ ngoại h&igrave;nh b&ecirc;n ngo&agrave;i m&agrave; c&ograve;n sức mạnh b&ecirc;n trong, hứa hẹn đ&aacute;p ứng trọn vẹn nhu cầu ng&agrave;y c&agrave;ng cao của người d&ugrave;ng.</p> <p>Th&ocirc;ng số kĩ thuật:</p> <ul> <li>M&agrave;n h&igrave;nh: Dynamic AMOLED 2X6.8&quot;Quad HD+ (2K+)</li> <li>Hệ điều h&agrave;nh: Android 11</li> <li>Camera sau: Ch&iacute;nh 108 MP &amp; Phụ 12 MP, 10 MP, 10 MP</li> <li>Camera trước: 40 MP</li> <li>Chip: Exynos 2100</li> <li>RAM: 12 GB</li> <li>Bộ nhớ trong: 128 GB</li> <li>SIM: 2 Nano SIM hoặc 1 Nano SIM + 1 eSIMHỗ trợ 5G</li> <li>Pin, Sạc: 5000 mAh25 W</li> </ul>', 1, 'nbtram', 1, 1, 0),
(11, 'VIVO V23e', 7190000, 10190000, 500000, 7190000, NULL, '2021-12-12 09:26:12', '2022-01-20 16:55:20', 0, '<p>Th&ocirc;ng tin sản phẩm</p> <ul> <li>M&agrave;n h&igrave;nh: AMOLED6.44&quot;Full HD+</li> <li>Hệ điều h&agrave;nh: Android 11</li> <li>Camera sau: Ch&iacute;nh 64 MP &amp; Phụ 8 MP, 2 MP</li> <li>Camera trước: 50 MP</li> <li>Chip: MediaTek Helio G96 8 nh&acirc;n</li> <li>RAM: 8 GB</li> <li>Bộ nhớ trong: 128 GB</li> <li>SIM: 2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 4G</li> <li>Pin, Sạc: 4050 mAh44 W</li> <li>H&atilde;ng: Vivo</li> </ul> ', 1, 'nbtram', 1, 0, 0),
(12, 'APPLE iPad Mini 6', 9490000, 19490000, 500000, 9490000, 'giabao', '2021-12-23 17:22:51', '2022-01-26 09:26:12', 1, '<p>Thương hiệu: Apple</p> <p>Xuất xứ: Trung Quốc</p> <p>M&agrave;n h&igrave;nh: 8.3&quot; - Liquid Retina display - IPS</p> <p>Camera sau: 12MP</p> <p>Camera trước: 12MP</p> <p>CPU: Apple A15 Bionic</p> <p>RAM: 4GB</p> <p>Bộ nhớ trong: 64GB</p> <p>Hệ điều h&agrave;nh: iPadOS</p>', 2, 'dhuy01', 0, 1, 0),
(13, 'DELL Gaming G15 5511', 17000000, 26990000, 500000, 17000000, NULL, '2021-12-01 09:26:12', '2022-01-23 09:26:12', 0, '<p>CPU: Intel Core i5-11400H</p> <p>M&agrave;n h&igrave;nh: 15.6&quot; WVA (1920 x 1080,0), 120Hz</p> <p>RAM: 2 x 4GB DDR4 3200MHz</p> <p>Đồ họa: NVIDIA GeForce RTX 3050 4GB GDDR6 / Intel UHD Graphics</p> <p>Lưu trữ: 256GB SSD M.2 NVMe /</p> <p>Hệ điều h&agrave;nh: Windows 11 Home</p> <p>Pin: 3 cell - Pin liền</p> <p>Khối lượng: 2.8 kg</p>', 2, 'dhuy01', 0, 1, 0),
(14, 'ASUS X415EA-EB640W', 9000000, 16490000, 500000, 9000000, NULL, '2021-12-01 09:26:12', '2022-01-26 09:26:12', 0, '<p>CPU: Intel Core i5-1135G7</p> <p>M&agrave;n h&igrave;nh: 14&quot; IPS (1920 x 1080)</p> <p>RAM: 1 x 4GB Onboard DDR4</p> <p>Đồ họa: Intel Iris Xe Graphics</p> <p>Lưu trữ: 512GB SSD M.2 NVMe /</p> <p>Hệ điều h&agrave;nh: Windows 11 Home</p> <p>Pin: 2 cell 37 Wh Pin liền</p> <p>Khối lượng: 1.6 kg</p>', 2, 'dhuy01', 1, 1, 0),
(15, 'ACER Nitro 5 AN515-52-51LW', 12990000, 25000000, 500000, 12990000, NULL, '2021-12-01 09:26:12', '2022-01-23 09:26:12', 0, '<p>CPU: Intel Core i5-8300H ( 2.3 GHz - 4.0 GHz / 8MB / 4 nh&acirc;n, 8 lu&ocirc;̀ng )</p> <p>M&agrave;n h&igrave;nh: 15.6&quot; IPS ( 1920 x 1080 ) , kh&ocirc;ng cảm ứng</p> <p>RAM: 1 x 8GB DDR4 2666MHz</p> <p>Đồ họa: Intel UHD Graphics 630 / NVIDIA GeForce GTX 1050Ti 4GB GDDR5</p> <p>Lưu trữ: 128GB SSD M.2 SATA / 1TB HDD 5400RPM</p> <p>Hệ điều h&agrave;nh: Linux</p> <p>Pin: 4 cell 48 Wh Pin liền , khối lượng: 2.4 kg</p>', 2, 'dhuy01', 0, 1, 0),
(16, 'LENOVO Yoga Slim 7 ', 14111111, 26690000, 500000, 14000000, 'dinhvan', '2021-12-01 09:26:12', '2022-01-06 09:26:12', 2, '<p>CPU: Intel Core i7-1165G7</p> <p>M&agrave;n h&igrave;nh: 14&quot; IPS (1920 x 1080)</p> <p>RAM: 8GB Onboard DDR4 3200MHz</p> <p>Đồ họa: Intel Iris Xe Graphics</p> <p>Lưu trữ: 512GB SSD M.2 NVMe /</p> <p>Hệ điều h&agrave;nh: Windows 10 Home SL 64-bit</p> <p>Pin: 60 Wh Pin liền</p> <p>Khối lượng: 1.4 kg</p>', 2, 'dhuy01', 1, 1, 0),
(17, 'LENOVO Thinkpad X13 ', 24000000, 34490000, 800000, 24000000, 'dinhvan', '2021-12-01 09:26:12', '2022-01-26 09:26:12', 1, '<p>Lenovo Thinkpad X13 20T2S01E00 l&agrave; chiếc laptop cao cấp được thiết kế đẹp mắt, hiện đại, nhỏ gọn với hiệu suất hoạt động v&agrave; t&iacute;nh bảo mật n&acirc;ng cao.&nbsp;N&oacute; c&oacute; khối lượng chỉ 1.2 kg, k&iacute;ch thước 31.19x21.7x1.65cm sử dụng vỏ nh&ocirc;m cao cấp mỏng, nhẹ v&agrave; rất chắc chắn. Với thiết kế n&agrave;y, ch&uacute;ng ta c&oacute; thể dễ d&agrave;ng đem theo mọi l&uacute;c mọi nơi, linh hoạt cho việc sử dụng.</p> <p>Th&ocirc;ng số kĩ thuật:</p> <ul> <li>CPU: Intel Core i5-10210U</li> <li>M&agrave;n h&igrave;nh: 13.3&quot; WVA (1920 x 1080)</li> <li>RAM: 1 x 8GB DDR4 2666MHz</li> <li>Đồ họa: Intel UHD Graphics</li> <li>Lưu trữ: 512GB SSD M.2 NVMe /</li> <li>Hệ điều h&agrave;nh: Windows 10 Pro 64-bit</li> <li>Pin: 6 cell 48 Wh Pin liền</li> <li>Khối lượng: 1.2 kg</li> </ul>', 2, 'nbtram', 0, 1, 1),
(18, 'MICROSOFT Surface Pro', 23290000, 33290000, 800000, 23290000, 'giabao', '2021-12-01 09:26:12', '2022-01-26 09:26:12', 1, '<p>Th&ocirc;ng số kĩ thuật</p> <ul> <li>Part-number: QWT-00001</li> <li>M&agrave;u sắc: Bạc</li> <li>Th&ecirc;́ h&ecirc;̣ CPU: Core i3 , Intel Core thế hệ thứ 10</li> <li>CPU: Intel Core i3-1005G1 ( 1.2 GHz - 3.4 GHz / 4MB / 2 nh&acirc;n, 4 lu&ocirc;̀ng )</li> <li>Chip đ&ocirc;̀ họa: Intel UHD Graphics</li> <li>RAM: 4GB LPDDR4</li> <li>Màn hình: 12.3&quot; ( 2736 x 1824 ) cảm ứng , HD webcam</li> <li>Lưu trữ: 128GB SSD /</li> <li>Cổng kết nối: 1 x USB Type C , 1 x USB 3.0 , 1 x micro SD card slot</li> <li>K&ecirc;́t n&ocirc;́i kh&ocirc;ng d&acirc;y: WiFi 802.11ax (Wifi 6) , Bluetooth 5.0</li> <li>H&ecirc;̣ đi&ecirc;̀u hành: Windows 10</li> <li>Kích thước: 29.21 x 20.14 x 0.85 cm</li> <li>Pin: Pin liền</li> <li>Kh&ocirc;́i lượng: 0.8 kg</li> </ul> ', 2, 'nbtram', 0, 1, 0),
(19, 'HP 340s G7 224L1PA ', 13890000, 14890000, 500000, 13890000, 'giabao', '2021-12-01 09:26:12', '2022-01-26 09:26:12', 1, '<p>Th&ocirc;ng số kỹ thuật</p> <ul> <li>CPU: Intel Core i3-1005G1</li> <li>M&agrave;n h&igrave;nh: 14&quot; IPS (1920 x 1080)</li> <li>RAM: 1 x 4GB DDR4 2666MHz</li> <li>Đồ họa: Intel UHD Graphics</li> <li>Lưu trữ: 512GB SSD M.2 NVMe /</li> <li>Hệ điều h&agrave;nh: Windows 10 Home SL 64-bit</li> <li>Pin: 3 cell 41 Wh Pin liền</li> <li>Khối lượng: 1.35 kg</li> </ul> ', 2, 'nbtram', 1, 1, 0),
(20, 'DELL Vostro 14 3405', 16190000, 17190000, 400000, 16190000, NULL, '2021-12-01 09:26:12', '2022-01-26 09:26:12', 0, '<p>Th&ocirc;ng số kỹ thuật</p> <ul> <li>CPU: AMD Ryzen 5 3500U</li> <li>M&agrave;n h&igrave;nh: 14&quot; WVA (1920 x 1080)</li> <li>RAM: 1 x 4GB DDR4 2400MHz</li> <li>Đồ họa: AMD Radeon Vega 8 Graphics</li> <li>Lưu trữ: 256GB SSD M.2 NVMe /</li> <li>Hệ điều h&agrave;nh: Windows 10 Home SL 64-bit</li> <li>Pin: 3 cell 42 Wh Pin liền</li> <li>Khối lượng: 1.7 kg</li> </ul> ', 2, 'nbtram', 0, 1, 0),
(21, 'ASUS ZenBook UX363EA-HP532T', 20999000, 28999000, 600000, 20999000, 'nbt1111', '2021-12-01 09:26:12', '2022-01-26 09:26:12', 1, '<p>Th&ocirc;ng số sản phẩm</p> <ul> <li>CPU: Intel Core i5 1135G7</li> <li>RAM: 8GB</li> <li>Ổ cứng: 512GB SSD</li> <li>VGA: Onboard</li> <li>M&agrave;n h&igrave;nh: 13.3 FHD Cảm ứng</li> <li>HĐH: Win 10</li> <li>M&agrave;u: X&aacute;m</li> </ul> ', 2, 'nbtram', 0, 1, 0),
(22, 'LENOVO IdeaPad Slim 5 Pro', 20999000, 25999000, 500000, 20999000, NULL, '2021-12-01 09:26:12', '2022-01-26 09:26:12', 0, '<p>Th&ocirc;ng số sản phẩm</p> <ul> <li>CPU: AMD R5 5600U</li> <li>RAM: 16GB</li> <li>Ổ cứng: 512GB SSD</li> <li>VGA: Nvidia MX450 2GB</li> <li>M&agrave;n h&igrave;nh: 14 inch 2k</li> <li>HĐH: Win 10</li> <li>M&agrave;u: X&aacute;m</li> </ul> ', 2, 'nbtram', 0, 1, 0),
(23, 'THOM BROWNE Grosgrain Oxford Shirt', 5000000, 9204520, 500000, 5000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>&Aacute;o sơ mi cổ điển vừa vặn bằng vải Oxford cotton m&agrave;u xanh nhạt với băng tay sọc grosgrain. N&uacute;t c&agrave;i ph&iacute;a trước, cổ &aacute;o c&oacute; điểm c&agrave;i c&uacute;c, t&uacute;i ngực c&oacute; miếng v&aacute;, &aacute;o d&agrave;i tay. Thẻ t&ecirc;n thương hiệu đ&iacute;nh tr&ecirc;n viền &aacute;o sơ mi. V&ograve;ng m&oacute;c treo lưng trung t&acirc;m.<br /> Chất liệu: 100% chất liệu cotton. Sản xuất tại Mỹ</p>', 3, 'nbtram', 0, 1, 0),
(24, 'AMI PARIS Funnel Neck Sweater', 5000000, 8290920, 500000, 4000000, 'dinhvan', '2021-12-11 11:16:11', '2022-01-16 16:11:11', 2, '<p>&Aacute;o len - len merino nỉ, oversize, dệt kim Ami de Coeur m&agrave;u đỏ, 100% sợi len Virgin.<br /> Chiều d&agrave;i lưng 67 cm (cỡ M)&nbsp;<br /> Giặt nhiệt độ thấp<br /> Kh&ocirc;ng tẩy, kh&ocirc;ng sấy kh&ocirc;<br /> Phơi nơi kh&ocirc; r&aacute;o<br /> B&agrave;n ủi nhiệt độ trung b&igrave;nh<br /> C&oacute; thể giặt kh&ocirc;<br /> &nbsp;</p>', 3, 'nbtram', 1, 1, 1),
(25, 'ALEXANDER MCQUEEN Rollneck Dove Sweater', 7000000, 15093571, 1000000, 10000000, NULL, '2021-12-11 11:16:11', '2022-01-22 16:11:11', 0, '<p>Cổ cuộn bằng len cashmere m&agrave;u kem, cắt vừa vặn, &aacute;o liền quần với phần vai bu&ocirc;ng xuống c&oacute; họa tiết chim bồ c&acirc;u tương phản với c&aacute;c chi tiết th&ecirc;u. Ho&agrave;n thiện với cổ tay &aacute;o c&oacute; g&acirc;n v&agrave; viền &aacute;o.<br /> Chất liệu: 90% len, 10% len cashmere</p>', 3, 'nbtram', 1, 1, 0),
(26, 'Supreme X The North Face S Logo Jacket', 4000000, 8861920, 1000000, 4000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>Supreme đ&atilde; bỏ S Logo tập trung v&agrave;o The North Face Collaboration như một phần của bản ph&aacute;t h&agrave;nh FW20 Week 10 của họ. Chiếc &aacute;o kho&aacute;c Mountain Jacket c&oacute; logo chữ S m&agrave;u đen từ sự hợp t&aacute;c đ&atilde; thu h&uacute;t sự so s&aacute;nh với bộ đồ được mặc bởi si&ecirc;u anh h&ugrave;ng The Incredibles, Syndrome.</p> <p>Giống như bộ đồ của Syndrome trong phim, chiếc &aacute;o kho&aacute;c n&agrave;y c&oacute; Logo Supreme S lớn che gần hết phần b&ecirc;n tr&aacute;i của &aacute;o kho&aacute;c. Chiếc &aacute;o kho&aacute;c The North Face đặc biệt n&agrave;y được ph&aacute;t h&agrave;nh với ba m&agrave;u, cũng c&oacute; một m&agrave;u đỏ v&agrave; xanh l&aacute; c&acirc;y. The North Face&#39;s Mountain Jacket thường được khen ngợi v&igrave; thiết kế c&oacute; đường may ho&agrave;n to&agrave;n kh&ocirc;ng thấm nước. Chiếc &aacute;o kho&aacute;c The North Face S Logo Mountain Jacket m&agrave;u đen đ&atilde; được b&aacute;n ra v&agrave;o ng&agrave;y 30 th&aacute;ng 10 năm 2020.</p>', 3, 'nbtram', 1, 1, 0),
(27, 'XLANGER Bowling Shirt', 600000, 1248853, 200000, 600000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>Th&agrave;nh phần ch&iacute;nh: 100% Rayon</p> <p>Sợi th&ecirc;u: 100% Polyester.</p>', 3, 'nbtram', 1, 1, 0),
(28, 'LACQUEMUS Le T-shirt Yelò layered top', 2000000, 4042680, 1000000, 2000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>Được đặt t&ecirc;n l&agrave; La Montagne, bộ sưu tập AW21 của Jacquemus ủng hộ những h&igrave;nh b&oacute;ng đi&ecirc;u khắc v&agrave; giải tr&iacute;. Được k&eacute;o từ sợi b&ocirc;ng tinh khiết, chiếc &aacute;o ph&ocirc;ng Yel&ograve; n&agrave;y l&agrave; một v&iacute; dụ điển h&igrave;nh cho c&aacute;ch tiếp cận thời trang đ&oacute;, v&igrave; n&oacute; c&oacute; lớp phủ tay ngắn m&agrave;u đỏ v&agrave; phần đế m&agrave;u n&acirc;u.<br /> Điểm nổi bật: thiết kế hai t&ocirc;ng m&agrave;u đỏ / n&acirc;u, thiết kế xếp lớp, th&ecirc;u logo trước ngực, cổ tr&ograve;n, tay d&agrave;i, viền thẳng<br /> Th&agrave;nh phần: 100% cotton<br /> Hướng dẫn giặt: Giặt m&aacute;y</p>', 3, 'nbtram', 1, 1, 0),
(29, 'BERLUTI Double Face Check Scritto Hoodie', 20000000, 46538327, 1500000, 20000000, 'giabao', '2021-12-11 11:16:11', '2022-02-12 16:11:11', 1, '<p>C&aacute;c t&iacute;nh năng b&ecirc;n ngo&agrave;i:</p> <ul> <li>&Aacute;o hoodie c&oacute; kh&oacute;a k&eacute;o bằng len hai mặt</li> <li>D&acirc;y da</li> <li>2 t&uacute;i ở mặt trước</li> <li>M&agrave;o da b&ecirc;</li> <li>T&iacute;nh năng b&ecirc;n trong</li> <li>Scritto v&agrave; kiểm tra jacquard</li> <li>M&ugrave;a đ&ocirc;ng 21</li> <li>Sản xuất tại &Yacute;</li> </ul> <p>Chất liệu: 100% len<br /> Hướng dẫn sử dụng: giặt kh&ocirc;</p>', 3, 'nbtram', 0, 0, 1),
(30, 'ALEXANDER MCQUEEN Dove Lace Print Shirt', 6000000, 11853960, 1000000, 6000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>&Aacute;o sơ mi vải b&ocirc;ng trắng in h&igrave;nh Dove Lace. Sản phẩm ho&agrave;n thiện với một chiếc c&uacute;c &aacute;o trước v&agrave; cổ tay &aacute;o.<br /> Chất liệu: 100% cotton</p>', 3, 'nbtram', 1, 1, 0),
(31, 'ALEXANDER MCQUEEN Illustration-style Shirt', 5000000, 10022184, 1000000, 5000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>Điểm nổi bật: m&agrave;u trắng, in theo phong c&aacute;ch minh họa, c&agrave;i n&uacute;t ph&iacute;a trước, cổ &aacute;o cổ điển, tay &aacute;o ngắn v&agrave; viền thẳng<br /> Th&agrave;nh phần: 100% cotton</p>', 3, 'nbtram', 1, 1, 0),
(32, 'ALEXANDER MCQUEEN 70s Collar Shirt', 4000000, 8542160, 1000000, 4000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>&Aacute;o sơ mi poplin bằng cotton trắng với cổ &aacute;o nhọn của thập ni&ecirc;n 70 v&agrave; c&aacute;c chi tiết đường ống m&agrave;u đen tương phản. Đ&atilde; ho&agrave;n th&agrave;nh với một chiếc c&uacute;c &aacute;o trước v&agrave; cổ tay &aacute;o.<br /> Chất liệu: 100% cotton</p>', 3, 'nbtram', 1, 1, 0),
(33, 'ALEXANDER MCQUEEN Selvedge Polo', 5000000, 10049600, 1000000, 5000000, 'renren', '2021-12-11 11:16:11', '2022-01-13 23:56:00', 1, '<p>&Aacute;o sơ mi polo b&ocirc;ng đen với chi tiết xếp placket của Alexander McQueen Selvedge.<br /> Chất liệu: 100% cotton</p>', 3, 'nbtram', 1, 1, 1),
(34, 'JACQUEMUS Le Pantalon Asao Brown', 8000000, 15074400, 800000, 8000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>Đặc điểm:</p> <ul> <li>Rộng v&agrave; vừa vặn</li> <li>C&aacute;c nếp gấp ph&iacute;a trước</li> <li>D&acirc;y thắt lưng tương phản k&eacute;o d&agrave;i</li> <li>D&acirc;y c&oacute; thể th&aacute;o rời ở dưới ch&acirc;n</li> <li>T&uacute;i thiết kế theo phong c&aacute;ch &Yacute;</li> <li>T&uacute;i c&oacute; đường ống ph&iacute;a sau</li> <li>Bay c&oacute; kh&oacute;a với n&uacute;t</li> </ul> <p>Người mẫu cao 187 cm v&agrave; mặc size 48<br /> Chất liệu: 100% chất liệu cotton<br /> Sản xuất tại Bungari</p>', 4, 'nbtram', 1, 1, 0),
(35, 'ALEXANDER MCQUEEN Cavalry Twill Trousers', 6000000, 11853960, 800000, 6000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>Quần t&acirc;y c&oacute; chốt được thiết kế ri&ecirc;ng bằng vải ch&eacute;o m&agrave;u xanh tối m&agrave;u, với hai chi tiết xếp nếp v&agrave; đường viền ngược nhau. Quần c&oacute; hai t&uacute;i b&ecirc;n v&agrave; hai t&uacute;i sau.<br /> Chất liệu: 100% len</p>', 4, 'nbtram', 1, 1, 0),
(36, 'ALEXANDER MCQUEEN Wide Leg Denim Trouser', 9000000, 18043600, 500000, 9000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>Quần jean denim ống rộng m&agrave;u xanh đậm c&oacute; chi tiết với đường kh&acirc;u m&agrave;u tương phản v&agrave; đường viền chồng ngược.<br /> Chất liệu: 100% cotton</p>', 4, 'nbtram', 1, 1, 0),
(37, 'THOM BROWNE Camel Bear&Salmon Trouser', 9900000, 22060772, 900000, 9900000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>Quần t&acirc;y mỏng vừa vặn c&oacute; th&ecirc;u h&igrave;nh động vật bằng vải b&ocirc;ng lạc đ&agrave; từ THOM BROWNE c&oacute; họa tiết th&ecirc;u, mấu v&ograve;ng grosgrain đặc trưng, ​​nếp gấp, viền chồng ngược, c&agrave;i n&uacute;t ẩn ph&iacute;a trước, hai t&uacute;i c&oacute; r&atilde;nh v&agrave; hai t&uacute;i c&agrave;i c&uacute;c ph&iacute;a sau.<br /> Thấp ống quần cạp thấp trong một nửa gấu thả v&agrave; c&aacute; hồi lấp đầy vải th&ecirc;u lạc đ&agrave; với c&aacute;c tab grosgrain sọc đồng thau c&oacute; n&uacute;t c&agrave;i ở eo. Đ&oacute;ng tab. T&uacute;i b&ecirc;n v&agrave; sau c&oacute; d&acirc;y. V&ograve;ng d&acirc;y grosgrain sọc đặc trưng ở eo sau. Tay &aacute;o cao.<br /> Chất liệu: 60% cotton, 40% Viscose<br /> Sản xuất tại &Yacute;</p>', 4, 'nbtram', 1, 1, 0),
(38, 'MARK FAST Men Oversized Black Casual Pants', 3000000, 6281000, 500000, 3000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>MARKFAST Quần &acirc;u đen nam qu&aacute; khổ<br /> Quần jogger của Mark Fast theo phong c&aacute;ch thể thao nh&acirc;n quả. C&oacute; t&uacute;i b&ecirc;n v&agrave; huy hiệu th&ecirc;u đồ họa MF.<br /> Th&agrave;nh phần:<br /> VẢI: 100% POLYESTER<br /> Phương ph&aacute;p giặt:</p> <ul> <li>Giặt tay</li> <li>Nước lạnh hoặc dưới 40 &deg; C</li> <li>Kh&ocirc;ng sử dụng chất tẩy</li> <li>Phơi kh&ocirc;</li> <li>Sấy b&igrave;nh thường&nbsp;</li> </ul> <p>Lưu &yacute;: Kh&ocirc;ng cần giặt ri&ecirc;ng</p>', 4, 'nbtram', 1, 1, 0),
(39, 'MARK FAST Women Jogger Denim Pants', 1800000, 3882800, 400000, 1800000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>Thiết kế quần Jogger với chất liệu vải denim. Cạp chun v&agrave; viền thun co gi&atilde;n thoải m&aacute;i, ph&ugrave; hợp với c&aacute;c d&aacute;ng người kh&aacute;c nhau. Thiết kế miếng d&aacute;n m&agrave;u b&ecirc;n c&oacute; in chữ MF. Hiện đại v&agrave; thời trang, thể hiện phong c&aacute;ch c&aacute; nh&acirc;n ri&ecirc;ng biệt.<br /> Chất liệu: 100% COTTON</p>', 4, 'nbtram', 1, 1, 0),
(40, 'STELLA MCCARTNEY Lacey Wool Pants', 7000000, 14046600, 800000, 7000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>M&agrave;u sắc: X&aacute;m tro</p> <p>Đặc điểm:</p> <ul> <li>Quần chắp v&aacute;</li> <li>Kh&oacute;a zip v&agrave; kh&oacute;a d&aacute;n được giấu k&iacute;n</li> <li>Thắt lưng đ&agrave;n hồi với kh&oacute;a d&aacute;n để c&oacute; thể điều chỉnh vừa vặn</li> <li>T&uacute;i zip nghi&ecirc;ng, chi tiết đường may</li> <li>K&eacute;o zip logo Stella McCartney</li> <li>Sản xuất tại: Hungary</li> <li>Chăm s&oacute;c: Sạch kh&ocirc;</li> <li>Th&agrave;nh phần: 100% len</li> <li>Được thiết kế để vừa vặn thoải m&aacute;i, vừa với k&iacute;ch thước</li> <li>Vải c&oacute; trọng lượng trung b&igrave;nh, kh&ocirc;ng co gi&atilde;n</li> </ul>', 4, 'nbtram', 1, 1, 0),
(41, 'ANN DEMEULEMEESTER Cropped Tailored Trousers', 8000000, 16067970, 800000, 8000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>ANN DEMEULEMEESTER Quần t&acirc;y cắt may bằng len-crepe<br /> Quần t&acirc;y đen của Ann Demeulemeester được thiết kế ri&ecirc;ng ở &Yacute; từ len crepe đến phom d&aacute;ng vừa vặn với ch&acirc;n thẳng v&agrave; cổ tay &aacute;o được cắt x&eacute;n, đảo ngược.</p> <p>M&agrave;u sắc: M&agrave;u đen</p> <p>Chất liệu: 100% len nguy&ecirc;n sinh.</p> <p>Hướng dẫn giặt: Giặt kh&ocirc;</p> <p>Xuất xứ: &Yacute;<br /> &nbsp;</p>', 4, 'nbtram', 1, 1, 0),
(42, 'ANN DEMEULEMEESTER Vincent Fitted Trousers', 7000000, 14930796, 800000, 7000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>Ann Demeulemeester Vincent Quần t&acirc;y<br /> Quần t&acirc;y nam Vincent vừa vặn m&agrave;u đen, mang lại sự thoải m&aacute;i nhờ Gabardine - 100% Virgin Wool</p> <p>Sản xuất tại &Yacute;<br /> Người mẫu: cỡ ​​48<br /> Chiều cao: 188 cm<br /> V&ograve;ng eo: 69 cm<br /> V&ograve;ng h&ocirc;ng: 90 cm</p>', 4, 'nbtram', 1, 1, 0),
(43, 'ALLSAINTS Frieda High-rise Denim Trousers', 1600000, 3949896, 400000, 1600000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>Frieda đ&atilde; được l&agrave;m thủ c&ocirc;ng từ một loại vải nhẹ v&agrave; c&oacute; h&igrave;nh d&aacute;ng vừa vặn với phần ch&acirc;n thon, thẳng. Chi tiết t&uacute;i tr&ecirc;n ch&acirc;n ho&agrave;n thiện thẩm mỹ.</p> <p>Đặc điểm:</p> <ul> <li>Cao ốc</li> <li>Đ&oacute;ng zip</li> <li>Hai t&uacute;i trước</li> <li>Hai t&uacute;i sau</li> <li>Hai t&uacute;i b&ecirc;n</li> <li>Rộng co gi&atilde;n</li> <li>Ch&acirc;n thon</li> </ul>', 4, 'nbtram', 1, 1, 0),
(44, 'ALLSAINTS Park Skinny Chinos', 1000000, 2602039, 300000, 1000000, NULL, '2021-12-11 11:16:11', '2022-02-12 16:11:11', 0, '<p>ALLSAINTS Park Skinny Chinos<br /> Park Chinos được t&ocirc;n vinh bởi thời gian. Được cắt từ một loại vải cotton co gi&atilde;n, nhẹ. Với một đ&ocirc;i ch&acirc;n gầy tinh tế. Bạn c&oacute; thể mặc ch&uacute;ng mọi l&uacute;c mọi nơi.</p> <p>Đặc điểm:</p> <ul> <li>Đ&oacute;ng n&uacute;t</li> <li>Đ&oacute;ng zip</li> <li>Chiều d&agrave;i mắt c&aacute; ch&acirc;n</li> <li>Hai t&uacute;i trước</li> <li>T&uacute;i sau</li> </ul> <p>Sản phẩm b&ocirc;ng ALLSAINTS hỗ trợ canh t&aacute;c b&ocirc;ng bền vững hơn. Better Cotton được lấy từ hệ thống C&acirc;n bằng khối lượng.</p> <p>Chất liệu: 97% cotton, 3% elastane.</p> <p>Sản xuất tại: Trung Quốc</p> <p>Người mẫu c&oacute; k&iacute;ch thước 6&#39;2 &quot;/ 188cm v&agrave; đang mặc size 32</p>', 4, 'nbtram', 1, 1, 0),
(45, 'THOM BROWNE Grey Camera Bag', 9000000, 17472600, 1300000, 9000000, NULL, '2022-01-23 23:00:00', '2022-01-13 07:35:00', 0, '<p>T&uacute;i m&aacute;y ảnh nhỏ bằng len Melton hai mặt m&agrave;u x&aacute;m trung b&igrave;nh với d&acirc;y đeo bằng vải sọc v&agrave; chi tiết 4 vạch ton-sur-ton. Đ&oacute;ng zip k&eacute;o, t&uacute;i zip ph&iacute;a trước, bảng t&ecirc;n ở mặt. C&aacute;c chi tiết da dạng hạt sỏi. Tab v&ograve;ng lặp grosgrain sọc đặc trưng ở mặt.<br /> 93% len, 5% Casmhere, 2% da b&ecirc;.</p> <p>Sản xuất tại &Yacute;</p>', 5, 'nbtram', 0, 0, 1),
(46, 'LOUIS VUITTON Mini Eclipse Canvas', 40000000, 58233914, 1500000, 40000000, 'dinhvan', '2022-01-23 23:00:00', '2022-01-28 23:55:00', 1, '<p>Được tạo bởi Virgil Abloh cho triển l&atilde;m Xu&acirc;n-H&egrave; 2019, t&uacute;i Mini Soft Trunk được l&agrave;m từ vải canvas Monogram Eclipse v&agrave; c&oacute; d&acirc;y x&iacute;ch đen mờ bằng nhựa. Phụ kiện h&igrave;nh hộp nhưng trang nh&atilde; n&agrave;y gợi l&ecirc;n h&ograve;m kho b&aacute;u của ng&ocirc;i nh&agrave;. N&oacute; c&oacute; thể được đeo tr&ecirc;n vai hoặc mang ch&eacute;o.<br /> C&aacute;c t&iacute;nh năng chi tiết:</p> <ul> <li>18,5 x 13 x 8 cm (D&agrave;i x Cao x Rộng)</li> <li>Vải phủ Monogram Eclipse</li> <li>Dệt may l&oacute;t</li> <li>Da b&ograve; trang tr&iacute;</li> <li>Phần cứng đen mờ</li> <li>T&uacute;i c&oacute; kh&oacute;a k&eacute;o b&ecirc;n ngo&agrave;i</li> <li>B&ecirc;n trong t&uacute;i phẳng</li> <li>D&acirc;y đeo: Kh&ocirc;ng thể th&aacute;o rời, c&oacute; thể điều chỉnh</li> <li>Thả d&acirc;y đeo: 42.0 cm</li> <li>D&acirc;y đeo thả tối đa: 58,0 cm</li> </ul>', 5, 'nbtram', 1, 1, 0),
(47, 'BERLUTI Ninorigami Canvas & Leather Clutch', 11000000, 23453407, 1000000, 11000000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Sản xuất tại &Yacute;</p> <p>Line: ODYSSEE</p> <p>Lớp l&oacute;t bằng vải b&ocirc;ng đặc trưng của Venezia Da b&ecirc; (kh&ocirc;ng thể thay đổi lại) Chăm s&oacute;c da Venezia bắt đầu bằng việc loại bỏ bụi bẩn bằng c&aacute;ch sử dụng một tấm vải mềm, sau đ&oacute; l&agrave; một lớp da trong nu&ocirc;i dưỡng and bảo vệ da. Sau đ&oacute;, x&aacute;t mạnh bằng tay đ&aacute;nh b&oacute;ng để phục hồi b&oacute;ng ban đầu của da. Để l&agrave;m sạch Signature Canvas, ch&uacute;ng t&ocirc;i khuy&ecirc;n bạn n&ecirc;n sử dụng một miếng vải mềm, thấm một ch&uacute;t nước x&agrave; ph&ograve;ng, tr&aacute;nh c&aacute;c phần da. Kh&ocirc;ng bao giờ sử dụng m&ocirc;i trường. Ch&uacute;ng t&ocirc;i đề nghị bạn n&ecirc;n bảo vệ sản phẩm của m&igrave;nh từ ẩm độ v&agrave; tr&aacute;nh xa c&aacute;c nguồn nhiệt trực tiếp.</p>', 5, 'nbtram', 1, 1, 0),
(48, 'BERLUTI Un Jour Mini Leather Briefcase', 70000000, 96225605, 2500000, 70000000, 'nbt1111', '2022-01-23 23:00:00', '2022-01-28 23:55:00', 1, '<p>D&ograve;ng: JOUR</p> <p>C&aacute;ch sử dụng:</p> <ul> <li>Cầm tay tay: hai tay cầm tr&ecirc;n c&ugrave;ng</li> <li>Tr&ecirc;n vai: d&acirc;y đeo vai nylon c&oacute; thể điều chỉnh v&agrave; th&aacute;o rời</li> </ul> <p>Đặc điểm:</p> <p>K&iacute;ch thước: Chiều cao: 27 cm, chiều rộng: 38 cm, độ d&agrave;y: 7 cm v&agrave; vừa với một m&aacute;y t&iacute;nh x&aacute;ch tay 15 inch.</p> <p>C&aacute;c t&iacute;nh năng b&ecirc;n ngo&agrave;i:</p> <ul> <li>Một ngăn c&oacute; kh&oacute;a k&eacute;o</li> <li>Một t&uacute;i trước c&oacute; kh&oacute;a k&eacute;o</li> <li>Một t&uacute;i sau phẳng với một t&uacute;i đựng điện thoại</li> <li>Đ&oacute;ng zip kim loại k&eacute;p</li> </ul> <p>C&aacute;c t&iacute;nh năng b&ecirc;n trong:</p> <ul> <li>Một t&uacute;i c&oacute; kh&oacute;a k&eacute;o</li> <li>Hai ống đựng b&uacute;t</li> <li>Một t&uacute;i điện thoại</li> <li>Đằng trước : Một t&uacute;i phẳng viền da, bao gồm d&acirc;y đeo</li> </ul> <p>Sản xuất tại &Yacute;</p>', 5, 'nbtram', 0, 0, 1),
(49, 'FENDI Brown Fabric Belt Bag', 15000000, 25403846, 1000000, 15000000, NULL, '2022-01-23 23:00:00', '2022-01-18 23:55:00', 0, '<p>T&uacute;i thắt lưng c&oacute; kh&oacute;a k&eacute;o. Đai điều chỉnh. Được l&agrave;m bằng vải với họa tiết FF. Được t&ocirc; điểm bằng lớp phủ bằng da m&agrave;u tự nhi&ecirc;n. Đồ kim loại bằng paladi.<br /> Sản xuất tại &Yacute;<br /> Chiều d&agrave;i: 46, cm</p> <p>Chiều cao: 18 cm</p> <p>Chiều s&acirc;u: 9, cm</p> <p>Trọng lượng: 0,453 kg</p> <p>Th&agrave;nh phần: 45% Cotton, 40% Polyurethane, 15% Polyester, chất liệu 2: 100% Da b&ograve;, b&ecirc;n trong: 63% Cotton, 34% Polyester, 3% Acrylic, Ribb</p>', 5, 'nbtram', 1, 1, 0),
(50, 'Montblanc x Maison Kitsuné Sling Backpack', 14500000, 24210400, 1000000, 13000000, 'nbt1111', '2022-01-23 23:00:00', '2022-01-18 23:55:00', 2, '<p>Montblanc X Maison Kitsun&eacute;&nbsp;Sling Backpack kết hợp thiết kế đặc trưng của Montblanc với th&aacute;i độ t&ograve; m&ograve; v&agrave; vui tươi đ&atilde; định h&igrave;nh n&ecirc;n Kitsun&eacute; Art de Vivre. Được chế t&aacute;c từ da in Saffiano v&agrave; c&oacute; sự t&aacute;i hiện của bản in &lsquo;Camo Fox&rsquo; đặc trưng của Maison Kitsun&eacute;, bộ sưu tập bao gồm một chiếc ba l&ocirc; đeo c&oacute; họa tiết ch&uacute; c&aacute;o đặc biệt với t&ocirc;ng m&agrave;u xanh lam v&agrave; đỏ. N&oacute; ph&ugrave; hợp với lối sống th&agrave;nh thị: nhỏ gọn v&agrave; thể thao, với một phong th&aacute;i điềm tĩnh v&agrave; giản dị.<br /> M&agrave;u sắc, chất liệu: Da b&ecirc; t&aacute;ch đ&ocirc;i, thuộc da chrome, nhuộm qua, c&oacute; in saffiano v&agrave; hoa văn Kitsun&eacute;</p> <p>D&acirc;y đeo: D&acirc;y đeo c&oacute; thể điều chỉnh v&agrave; kh&ocirc;ng c&oacute; nh&atilde;n hiệu</p> <p>M&agrave;u sắc: M&agrave;u xanh lam</p> <p>Vải l&oacute;t: L&oacute;t b&ocirc;ng</p> <p>Kho&aacute;: Zip</p> <p>K&iacute;ch thước: 160x60x250 mm</p>', 5, 'nbtram', 1, 1, 0),
(51, 'SONGMONT Mini Niuye', 1000000, 2693350, 300000, 1000000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Bộ sưu tập Niuye được thiết kế để kỷ niệm năm OX của Trung Quốc. Sửu, gắn liền với đất, cũng l&agrave; một con vật rất được coi trọng trong văn h&oacute;a Trung Quốc. Sừng b&ecirc; sơ sinh với một chiếc v&ograve;ng b&ograve; dễ thương tượng trưng cho sự kỳ vọng cho năm mới, điềm l&agrave;nh v&agrave; may mắn.</p> <p>Đặc điểm:</p> <ul> <li>Chất liệu: Da b&ecirc; mịn chạm nổi h&igrave;nh voi s&aacute;p dầu</li> <li>B&ecirc;n trong: Nhung, lụa Trung Quốc &amp; da nappa nguy&ecirc;n bản.</li> <li>K&iacute;ch thước: 19,5cm W &times; 11,5cm H &times; 6cm D</li> <li>Trọng lượng: 450g.</li> <li>Phần cứng cổ điển ho&agrave;n thiện bằng v&agrave;ng mờ</li> <li>D&acirc;y đeo chuỗi v&agrave;ng</li> <li>Kho&aacute; từ&nbsp;</li> <li>Hai t&uacute;i b&ecirc;n trong, một t&uacute;i c&oacute; kh&oacute;a k&eacute;o</li> <li>Một t&uacute;i trượt b&ecirc;n ngo&agrave;i c&oacute; đ&oacute;ng từ t&iacute;nh, thuận tiện để đặt điện thoại của bạn</li> </ul>', 5, 'nbtram', 1, 1, 0),
(52, 'SONGMONT Pillow Bag', 2000000, 4291100, 600000, 2000000, 'dinhvan', '2022-01-23 23:00:00', '2022-01-28 23:55:00', 1, '<p><br /> Bộ sưu tập Gối được lấy cảm hứng từ chiếc gối cổ thời Nam Tống. H&igrave;nh d&aacute;ng cổ điển của n&oacute; được thiết kế d&agrave;nh cho phụ nữ hiện đại v&agrave; được biết đến với trọng lượng nhẹ v&agrave; khối lượng đ&aacute;ng kể.</p> <p>Đặc điểm:</p> <ul> <li>Chất liệu: M&agrave;u đen: Da b&ecirc; mịn dập v&acirc;n c&acirc;y; Kh&aacute;c: Da nappa dập nổi h&igrave;nh c&acirc;y</li> <li>Nội thất: Da Nappa &amp; lụa Trung Quốc</li> <li>K&iacute;ch thước: 29cm W &times; 15cm H &times; 6.5cm D</li> <li>Trọng lượng: 300g</li> <li>D&acirc;y da c&oacute; thể điều chỉnh l&agrave;m cho n&oacute; trở th&agrave;nh một chiếc t&uacute;i đeo dưới c&aacute;nh tay hoặc đeo vai</li> <li>Hai kh&oacute;a thắt lưng dưới c&ugrave;ng để cất d&acirc;y đeo khi kh&ocirc;ng sử dụng</li> <li>Đ&atilde; th&ecirc;m kh&oacute;a D ở mỗi b&ecirc;n để cho ph&eacute;p bạn th&ecirc;m phụ kiện mong muốn của m&igrave;nh</li> <li>Kho&aacute; zip</li> <li>Hai t&uacute;i b&ecirc;n trong, một t&uacute;i c&oacute; hai ngăn chứa thẻ</li> <li>Một t&uacute;i ph&iacute;a trước b&ecirc;n ngo&agrave;i c&oacute; đ&oacute;ng từ t&iacute;nh, thuận tiện để đặt điện thoại của bạn</li> <li>Phần cứng cổ điển ho&agrave;n thiện bằng v&agrave;ng mờ</li> </ul>', 5, 'nbtram', 1, 1, 0),
(53, 'DIOR Navy Blue Dior Oblique Jacquard', 40000000, 55236500, 1500000, 40000000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p><br /> Dior Oblique Jacquard Mini Saddle Backpack c&oacute; c&aacute;c chi tiết bằng da b&ecirc; m&agrave;u đen đặc trưng. Một chiếc kh&oacute;a &lsquo;Christian Dior&rsquo; đ&oacute;ng nắp trước v&agrave; kết nối với t&uacute;i da c&oacute; v&acirc;n kiểu y&ecirc;n ngựa b&ecirc;n ngo&agrave;i. Tay cầm tr&ecirc;n c&ugrave;ng được đặt ch&iacute;nh giữa hai d&acirc;y đai ph&iacute;a sau c&oacute; đệm nylon c&oacute; thể điều chỉnh được. C&oacute; một t&uacute;i v&aacute; b&ecirc;n trong để giữ c&aacute;c vật dụng cần thiết được ngăn nắp. C&oacute; thể được đeo sau lưng hoặc x&aacute;ch tay, đ&acirc;y l&agrave; phong c&aacute;ch cổ điển của Dior được cập nhật với c&aacute;c chi tiết hiện đại.</p> <p>Đặc điểm:</p> <ul> <li>Chữ k&yacute; &lsquo;Dior&rsquo; dập nổi bằng nhiệt b&ecirc;n trong</li> <li>M&agrave;u xanh hải qu&acirc;n Dior Oblique jacquard</li> <li>D&acirc;y đai lưng nylon c&oacute; đệm c&oacute; thể điều chỉnh</li> <li>Đ&oacute;ng nắp bằng kh&oacute;a &lsquo;Christian Dior&rsquo;</li> <li>T&uacute;i trước b&ecirc;n ngo&agrave;i</li> <li>T&uacute;i v&aacute; b&ecirc;n trong</li> <li>K&iacute;ch thước: 19 cm x 27,5 cm x 11,5 cm</li> <li>Sản xuất tại &Yacute;</li> </ul>', 5, 'nbtram', 1, 1, 0),
(54, 'THOM BROWNE Navy Mrs.Thom Mini Bag', 55000000, 100359825, 2500000, 55000000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Chiếc t&uacute;i mini của Mrs. Thom bằng chất liệu da hạt cuội m&agrave;u xanh nước biển với khung da m&agrave;u trắng tương phản. Kh&oacute;a đ&oacute;ng bằng đồng thau. 2 tay cầm tr&ecirc;n c&ugrave;ng bằng da hạt cuội c&oacute; đệm với v&ograve;ng đồng. Thẻ h&agrave;nh l&yacute; bằng da với c&aacute;c chi tiết sọc. L&oacute;t sọc với t&uacute;i trượt b&ecirc;n trong. Logo in l&aacute; v&agrave;ng v&agrave; tab v&ograve;ng lặp grosgrain sọc ở mục nhập. Phần cứng bằng đồng thau.</p> <p>K&iacute;ch thước 20cm x 18cm x 10cm.</p> <p>Chất liệu: 80% len, 20% da b&ecirc;</p> <p>Sản xuất tại &Yacute;</p>', 5, 'nbtram', 1, 1, 0),
(55, 'DOLCE & GABBANA Small Calfskin Sicily Bag', 23000000, 47382625, 1500000, 23000000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p><br /> L&agrave; biểu tượng thương hiệu xuất sắc, chiếc t&uacute;i Sicily nhỏ n&agrave;y c&oacute; một phi&ecirc;n bản mới. H&igrave;nh d&aacute;ng tinh tế v&agrave; nữ t&iacute;nh, chiếc t&uacute;i Sicily n&agrave;y được l&agrave;m bằng da b&ecirc; Dauphine v&agrave; c&oacute; v&iacute; tiền xu ở mặt trước với thẻ thương hiệu với hai lớp mạ kim loại:<br /> &bull; Nắp trước với d&acirc;y buộc từ t&iacute;nh ẩn<br /> &bull; Tấm c&oacute; thương hiệu c&oacute; hai lớp ho&agrave;n thiện mạ kim loại<br /> &bull; Tay cầm tr&ecirc;n c&ugrave;ng v&agrave; d&acirc;y đeo c&oacute; thể điều chỉnh, c&oacute; thể th&aacute;o rời bằng da b&ecirc; Dauphine<br /> &bull; Lớp l&oacute;t vải in<br /> &bull; T&uacute;i b&ecirc;n trong c&oacute; kh&oacute;a k&eacute;o h&agrave;ng hiệu v&agrave; gi&aacute; đỡ điện thoại<br /> &bull; Sản phẩm đi k&egrave;m với một t&uacute;i đựng bụi h&agrave;ng hiệu<br /> &bull; C&aacute;c ph&eacute;p đo: 16 x 20 x 8 cm - 6,3 x 7,9 x 3,1 inch<br /> &bull; Sản xuất tại &Yacute;<br /> Chăm s&oacute;c v&agrave; chi tiết<br /> Th&agrave;nh phần b&ecirc;n ngo&agrave;i: 100% da b&ecirc; Th&agrave;nh phần b&ecirc;n trong: 90% cotton 10% da b&ecirc;</p>', 5, 'nbtram', 1, 1, 0),
(56, 'THOM BROWNE Tech Runner Sneakers', 8000000, 14389200, 500000, 8000000, 'giabao', '2021-12-01 09:26:12', '2022-01-16 16:55:20', 1, '<p>Những người theo đuổi giấc mơ mang gi&agrave;y thể thao. Được trang tr&iacute; bằng một v&ograve;ng grosgrain đặc trưng. <strong>Tech runner sneakers&nbsp;Thom Browne</strong> l&agrave; sự lựa chọn ho&agrave;n hảo để đảm bảo bạn lu&ocirc;n theo đuổi phong c&aacute;ch của m&igrave;nh. Thiết kế mũi gi&agrave;y tr&ograve;n, d&acirc;y buộc ph&iacute;a trước bằng ren, lưỡi trai in nổi thương hiệu, mặt tr&ecirc;n bằng lưới, c&aacute;c tấm da hỗn hợp v&agrave; đế cao su.</p> <p><u><strong>Th&agrave;nh phần:</strong></u></p> <ul> <li>Đế: Cao su 100%</li> <li>Lớp l&oacute;t: Da 100%</li> <li>B&ecirc;n ngo&agrave;i: Da hỗn hợp 100%, Nylon 100%</li> <li>Sản xuất tại &Yacute;</li> </ul>', 6, 'nbtram', 0, 0, 1),
(57, 'PALLADIUM Pampa OX Organic Eucalyptus', 900000, 1713000, 200000, 900000, 'dinhvan', '2021-12-01 09:26:12', '2022-01-16 16:55:20', 1, '<p>Một sản phẩm thiết yếu trong Bộ sưu tập th&acirc;n thiện với m&ocirc;i trường, những đ&ocirc;i ủng Pampa cổ thấp n&agrave;y cung cấp khả năng t&ugrave;y chỉnh v&agrave; t&iacute;nh bền vững. C&aacute;c th&agrave;nh phẩn hữu cơ c&oacute; thể th&aacute;o rời, sẽ giải th&iacute;ch sứ mệnh của n&oacute;, trong khi b&ocirc;ng hữu cơ 100% v&agrave; c&aacute;c đầu ren c&oacute; thể ph&acirc;n hủy sinh học kết hợp phong c&aacute;ch với đạo đức m&ocirc;i trường.</p> <p>Chất liệu:</p> <ul> <li>Vải 100% b&ocirc;ng hữu cơ,&nbsp;cotton 100% hữu cơ</li> <li>Đế: Cao su với 15% cao su t&aacute;i chế + Khu&ocirc;n cắt EVA</li> <li>T&ecirc;n thương hiệu được dệt ở l&ograve;ng v&agrave; g&oacute;t ch&acirc;n</li> <li>C&aacute;c chi tiết: khoen / ren tr&ograve;n bằng polyester t&aacute;i chế</li> </ul>', 6, 'nbtram', 1, 1, 0),
(58, 'MLB Chunky High Low New York Yankees', 1000000, 2250000, 300000, 1000000, 'renren', '2021-12-01 09:26:12', '2022-01-23 16:55:20', 1, '<p>Xuất hiện v&agrave;o cuối năm 2017 nhưng đến nay những đ&ocirc;i gi&agrave;y MLB mang phong c&aacute;ch Chunky Sneakers đ&atilde; trở th&agrave;nh cơn sốt v&agrave; tạo n&ecirc;n trending.</p> <p>Thương Hiệu: MLB-Korea. C&aacute;c thiết kế của thương hiệu n&agrave;y lu&ocirc;n mang đậm tinh thần thể thao đường phố v&agrave; c&oacute; t&iacute;nh ứng dụng cao, được truyền cảm hứng từ bộ m&ocirc;n b&oacute;ng ch&agrave;y. Một l&agrave;n s&oacute;ng tr&agrave;o lưu mới đ&atilde; được tạo ra từ sự kết hợp giữa b&oacute;ng ch&agrave;y v&agrave; thời trang.</p> <p>Chất liệu:&nbsp;</p> <ul> <li>Th&acirc;n: Da tổng hợp</li> <li>Đế: Cao su tổng hợp</li> <li>Đế giầy MLB Big Ball Chunky với 2 lớp d&iacute;nh liền với nhau c&ugrave;ng đường c&aacute;ch điệu mềm mại khiến ch&uacute;ng ta c&oacute; cảm gi&aacute;c như đ&ocirc;i gi&agrave;y c&oacute; 3 lớp đế. Nếu nh&igrave;n kỹ đế giầy, bạn sẽ nhận thấy họa tiết chữ MLB được c&aacute;ch điệu v&ocirc; c&ugrave;ng tinh tế.&nbsp;</li> <li>Điểm nhấn của những đ&ocirc;i MLB Big Ball Chunky l&agrave; họa tiết logo lớn của c&aacute;c đội b&oacute;ng ch&agrave;y Big Ball y&ecirc;u qu&yacute; của MLB.</li> </ul>', 6, 'nbtram', 1, 1, 0),
(59, 'ALEXANDER MCQUEEN Tread Slick Lace Up', 8000000, 15873800, 500000, 8000000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>Gi&agrave;y thể thao đế thấp Tread Slick m&agrave;u trắng / vải cotton nhiều m&agrave;u của Alexander McQueen c&oacute; phần cổ tương phản, mũi gi&agrave;y tr&ograve;n, đ&iacute;nh ren ph&iacute;a trước, kh&oacute;a k&eacute;o ở g&oacute;t v&agrave; đế cao su chunky.<br /> C&oacute; nguồn gốc từ Savile Row, Alexander McQueen kết hợp di sản may đo của Anh với tinh thần nổi loạn r&otilde; rệt. Dưới sự quản l&yacute; của Sarah Burton - người đ&atilde; tạo ra tầm nh&igrave;n l&atilde;ng mạn của ri&ecirc;ng m&igrave;nh trong khi vẫn duy tr&igrave; một g&oacute;c cạnh khi&ecirc;u kh&iacute;ch - ng&ocirc;i nh&agrave; tiếp tục g&acirc;y ấn tượng với bộ trang phục kh&ocirc;ng lỗi, những bản in r&ugrave;ng rợn v&agrave; d&ograve;ng gi&agrave;y thể thao tuy&ecirc;n bố đặc trưng.</p> <p>Đặc điểm:</p> <ul> <li>G&oacute;t: 5,5 cm;</li> <li>Nền: 4 cm;</li> <li>B&ecirc;n ngo&agrave;i: 100% cotton, L&oacute;t: 100% da, Đế: 100% cao su</li> <li>Sản xuất tại &Yacute;</li> </ul>', 6, 'nbtram', 1, 1, 0),
(60, 'XVESSEL Sneaker Violet Paisley', 2300000, 5687160, 400000, 2300000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<ul> <li>Thương hiệu: Xvessel</li> <li>Phong c&aacute;ch: Sneaker</li> <li>M&agrave;u sắc: Violet</li> <li>Sản xuất tại Trung Quốc</li> </ul> <p>Ra mắt v&agrave;o th&aacute;ng 12/2018, Xvessel l&agrave; thương hiệu thời trang của Van Ness Wu, người Đ&agrave;i Loan, Ng&ocirc; Kiến H&agrave;o, th&agrave;nh vi&ecirc;n nh&oacute;m F4 nổi tiếng một thời, l&agrave; tuổi thơ của nhiều thế hệ 8x 9x tại Việt Nam. Với thiết kế gi&agrave;y thể thao độc đ&aacute;o gợi nhớ đến c&aacute;c xu hướng như converse chuck taylor, gi&agrave;y Xvessel rất dễ mặc với mọi trang phục.</p> <p>Hiện tại, tr&agrave;o lưu Xvessel đ&atilde; lan sang c&aacute;c nước Ch&acirc;u &Aacute; như H&agrave;n Quốc, Nhật Bản, Trung Quốc v&agrave; nay l&agrave; Việt Nam.</p>', 6, 'nbtram', 1, 1, 0),
(61, 'XVESSEL G.O.P. Highs for Yohji Yamamoto', 9000000, 16490480, 800000, 9000000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Gi&agrave;y XVESSEL G.O.P. Highs for Yohji Yamamoto Black mẫu gi&agrave;y phong c&aacute;ch đến từ nh&agrave; thiết kế Van Ness Wu - người Đ&agrave;i Loan</p> <ul> <li>Xuất xứ: Ch&acirc;u &Aacute;</li> <li>Kiểu d&aacute;ng: Gi&agrave;y thể thao</li> <li>Chất liệu: Vải/Cao su đế gỗ kết hợp với gỗ v&agrave; cao su</li> </ul> <p>Đ&acirc;y l&agrave; mẫu gi&agrave;y vải kết hợp với gỗ v&agrave; cao su chuy&ecirc;n chất, v&agrave; được l&agrave;m lại từ c&aacute;c xưởng Trung Quốc với chất lượng tương đương, n&ecirc;n bạn cũng cần bảo quản kĩ sau mỗi lần đi chơi hay c&aacute;c hoạt động li&ecirc;n quan đến gi&agrave;y qu&aacute; nhiều, sau đ&acirc;y l&agrave; 1 v&agrave;i mẹo để bạn c&oacute; thể gi&uacute;p đ&ocirc;i gi&agrave;y lu&ocirc;n đươc sạch sẽ hơn,</p> <ul> <li>Lau vết bẩn bằng khăn mềm</li> <li>Hạn chế tiếp x&uacute;c với nước</li> <li>Tr&aacute;nh phơi dưới &aacute;nh nắng gắt</li> <li>Cất giữ nơi tho&aacute;ng m&aacute;t</li> </ul>', 6, 'nbtram', 1, 1, 0),
(62, 'ASH Sneaker Casual Walking Sporty Shoes', 2300000, 5024800, 400000, 2300000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>D&ograve;ng &lsquo;Spider 620&rsquo; mới mẻ v&agrave; hợp thời trang, đẩy giới hạn của gi&agrave;y chạy bộ bằng c&aacute;ch kết hợp c&aacute;c yếu tố s&aacute;ng tạo, chẳng hạn như chất liệu th&acirc;n thiện với m&ocirc;i trường v&agrave; t&ocirc;ng m&agrave;u truyền cảm hứng. Chi tiết hai lưỡi v&agrave; đế chunky cũng thể hiện tốt. Mũ ni l&ocirc;ng c&oacute; trang tr&iacute; bằng da m&agrave;u phấn.<br /> Chi tiết:</p> <ul> <li>Chiều cao g&oacute;t (cm): 6</li> <li>Chiều cao nền tảng (cm): 0 - 1,5cm</li> <li>Chất liệu: Chrome Free Calf Suede; Thảm Nylon Vintage; T&aacute;i chế Pu b&ecirc; mềm; T&aacute;i chế Brasil mềm; Matte Hotmelt</li> <li>Chất liệu nội thất: Da lợn</li> <li>Chất liệu đế ngo&agrave;i: cao su</li> <li>H&igrave;nh dạng mũi: Tr&ograve;n</li> </ul>', 6, 'nbtram', 1, 1, 0),
(63, 'RICK OWENS Geth Runner', 9990000, 20135629, 900000, 9990000, NULL, '2022-01-23 23:00:00', '2022-01-26 23:55:00', 1, '<p>Gi&agrave;y thể thao Geth Runner từ bộ sưu tập FW21 Gethsemane by Rick Owens DRKSHDW c&oacute; phần cuối d&aacute;ng thấp với phần g&oacute;t v&agrave; lưỡi thu&ocirc;n d&agrave;i, phần tr&ecirc;n bằng da b&ecirc; hai t&ocirc;ng m&agrave;u v&agrave; đế xốp EVA d&agrave;y mang lại sự thoải m&aacute;i v&agrave; phong c&aacute;ch cho mỗi bước đi .</p> <p>Th&ocirc;ng tin chi tiết</p> <ul> <li>Bọc da</li> <li>Hệ thống viền</li> <li>L&oacute;t da</li> <li>Đệm g&oacute;t</li> <li>M&agrave;u: SỮA / CARNELIAN</li> </ul>', 6, 'nbtram', 1, 1, 0),
(64, 'DR.MARTENS 1460 Mono Lace-Up Boot', 2400000, 3426000, 400000, 2400000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>1460 Mono l&agrave; đ&ocirc;i bốt Dr.Martens nguy&ecirc;n bản với đế đồng m&agrave;u, d&acirc;y da, đường kh&acirc;u, khoen, d&acirc;y buộc, v&ograve;ng g&oacute;t v&agrave; thậm ch&iacute; cả lớp l&oacute;t&mdash; cho một c&aacute;i nh&igrave;n đơn sắc từ đầu. Giữ lại tất cả cấu tr&uacute;c của phong c&aacute;ch&nbsp; cổ điển, bao gồm c&aacute;c mặt c&oacute; r&atilde;nh, đường kh&acirc;u c&oacute; thể nh&igrave;n thấy v&agrave; v&ograve;ng nối g&oacute;t ch&acirc;n.</p> <ul> <li>Được l&agrave;m bằng da mịn Dr.Martens bền bỉ.</li> <li>Được x&acirc;y dựng tr&ecirc;n đế đệm kh&iacute; mang t&iacute;nh biểu tượng của Dr. Martens, c&oacute; khả năng chống dầu v&agrave; mỡ, chống m&agrave;i m&ograve;n v&agrave; trơn trượt tốt</li> <li>Chất liệu: Bền bỉ v&agrave; nổi tiếng cứng khi bắt đầu, Da mịn, c&oacute; thể được đ&aacute;nh b&oacute;ng sang b&oacute;ng s&aacute;ng hoặc đ&aacute;nh vảy một c&aacute;ch nghệ thuật t&ugrave;y thuộc v&agrave;o sở th&iacute;ch của bạn.</li> </ul>', 6, 'nbtram', 1, 1, 0),
(65, 'PALLADIUM Pallabrousse Legion Star', 1100000, 2169800, 300000, 1100000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Trụ cột của huyền thoại Palladium, Pallabrousse Legion l&agrave; chiếc ủng bằng vải ban đầu được sản xuất v&agrave;o năm 1947. Giờ đ&acirc;y, huyền thoại của n&oacute; đang được khởi chạy lại cho một thế hệ nh&agrave; th&aacute;m hiểm mới.</p> <ul> <li>L&agrave; chiếc ủng đ&atilde; diễu h&agrave;nh khắp thế giới với Binh đo&agrave;n Ngoại giao Ph&aacute;p, t&aacute;c phẩm to lớn nhưng thoải m&aacute;i n&agrave;y đ&atilde; được t&aacute;i sinh bằng vật liệu hiện đại đồng thời t&ocirc;n trọng di sản vượt thời gian của n&oacute;.</li> <li>Sử dụng khu&ocirc;n v&agrave; gi&agrave;y Pallabrousse ban đầu l&agrave;m đ&egrave;n dẫn đường cho dự &aacute;n n&agrave;y, c&aacute;c yếu tố ban đầu của thiết kế đ&atilde; được l&agrave;m cho thoải m&aacute;i v&agrave; tinh vi hơn để ph&ugrave; hợp với nhu cầu ng&agrave;y nay.</li> <li>Phần tr&ecirc;n bằng vải cotton 100% hữu cơ của n&oacute; được x&acirc;y dựng dựa tr&ecirc;n đế ngo&agrave;i vấu mang t&iacute;nh biểu tượng của ch&uacute;ng t&ocirc;i để giảm mỏi ch&acirc;n v&agrave; c&oacute; c&aacute;c chi tiết trang tr&iacute; trang nh&atilde;, t&ocirc;n vinh vị tr&iacute; của n&oacute; trong lịch sử.</li> </ul>', 6, 'nbtram', 1, 1, 0),
(66, 'PALLADIUM Pampa X Tech WPN Black', 1900000, 4644057, 500000, 1900000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Palladium X Michelin ... Hai thương hiệu Ph&aacute;p với c&aacute;c sản phẩm chức năng mang t&iacute;nh biểu tượng đ&atilde; hợp t&aacute;c để mang lại cảm gi&aacute;c cầm nắm tốt nhất. Đế ngo&agrave;i mới n&agrave;y dựa tr&ecirc;n lốp CrossClimate mang lại độ b&aacute;m tuyệt đối nhờ chất liệu cao su đặc biệt v&agrave; bề mặt của n&oacute;. Pampa X Tech l&agrave; một đ&ocirc;i ủng chống thấm nước + bằng vải nubuck / nylon mềm để giữ cho đ&ocirc;i ch&acirc;n của bạn lu&ocirc;n thoải m&aacute;i v&agrave; kh&ocirc; r&aacute;o trong những chuyến kh&aacute;m ph&aacute; th&agrave;nh phố nặng nề của bạn.</p> <ul> <li>UPPER: gi&agrave;y kh&ocirc;ng thấm nước được l&agrave;m chủ yếu bằng da nubuck; qu&yacute; v&agrave; lưỡi bằng vải dệt tổng hợp</li> <li>LINING: chất liệu h&agrave;ng đầu l&agrave; 70% repreve, 30% polyester, chất liệu ph&iacute;a dưới l&agrave; 100% polyester</li> <li>SOCKLINER: EVA đ&uacute;c với tổ ong để tạo sự thoải m&aacute;i v&agrave; đệm - phủ 70% vải bố, 30% polyester</li> <li>BOTTOM + TOE CAP: Đế ngo&agrave;i của Michelin với thiết kế đặc biệt để mang lại độ b&aacute;m tuyệt vời cho mọi điều kiện thời tiết; 100% cao su</li> <li>THƯƠNG HIỆU: Nh&atilde;n dệt tr&ecirc;n lưỡi / nh&atilde;n cao su ở phần tư b&ecirc;n / in ở phần b&ecirc;n / logo GPS tr&ecirc;n phần tư ở giữa</li> <li>C&Aacute;C T&Iacute;NH NĂNG: cấu tạo bootie với m&agrave;ng / gusset / khoen v&agrave; khoen v&ograve;ng ở phần tr&ecirc;n c&ugrave;ng / ren phẳng bằng polyester / gia cố tr&ecirc;n g&oacute;t / Bộ đếm g&oacute;t TPU / đế c&oacute; thể th&aacute;o rời</li> </ul>', 6, 'nbtram', 0, 0, 0);
INSERT INTO `products` (`ProID`, `ProName`, `PriceCurrent`, `PriceWin`, `stepPrice`, `firstPrice`, `Bidder`, `DateStart`, `DateEnd`, `BidderCount`, `Description`, `CatIDNext`, `Seller`, `renewal`, `isVerify`, `emailed`) VALUES
(67, 'PALLADIUM Off-Grid Hi Zip Waterproof', 1700000, 3651600, 400000, 1700000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Sly, phong c&aacute;ch tương lai với những gợi &yacute; về truyền thống đ&atilde; được kết hợp v&agrave;o sản phẩm mới nhất để th&uacute;c đẩy c&aacute;c giới hạn. Được thiết kế để th&aacute;ch thức quy ước v&agrave; x&aacute;c định lại kh&aacute;m ph&aacute; trong cuộc sống sau khi kh&oacute;a m&aacute;y.</p> <p>Đặc điểm:</p> <ul> <li>Off-Grid nổi bật với đế ngo&agrave;i h&igrave;nh tổ ong qu&aacute; khổ mang đến cảm gi&aacute;c cầm nắm vượt trội, ph&ugrave; hợp về mặt giải phẫu v&agrave; kiểu d&aacute;ng sang trọng.</li> <li>Sự lặp lại của gi&agrave;y sneakerboot n&agrave;y đ&atilde; được x&acirc;y dựng về mặt kỹ thuật để bảo vệ bạn khỏi c&aacute;c yếu tố.</li> <li>Bọc ngo&agrave;i chống nước bao gồm phần tr&ecirc;n v&agrave; một lớp zip chống thấm nước cho ph&eacute;p bạn dễ d&agrave;ng đi v&agrave;o.</li> <li>Th&ecirc;m v&agrave;o d&acirc;y buộc nhanh ch&oacute;ng, m&agrave;u sắc b&oacute;ng bẩy v&agrave; thương hiệu tinh tế, bạn c&oacute; một đ&ocirc;i gi&agrave;y thể thao của tương lai.</li> </ul> <p>Ra khỏi lưới v&agrave; kh&aacute;m ph&aacute; lại thế giới của bạn.</p>', 6, 'nbtram', 1, 1, 0),
(68, 'PALLADIUM Pallabase Twill Butternut', 1000000, 2054025, 200000, 1000000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Khởi động Pallabase Twill đưa Pampa mang t&iacute;nh biểu tượng của ch&uacute;ng t&ocirc;i l&ecirc;n một cấp độ cao hơn.</p> <p>Một đ&ocirc;i bốt nữ t&iacute;nh với phần g&oacute;t cao hơn v&agrave; Palladium DNA, bao gồm cả phần mũi gi&agrave;y cao su mang t&iacute;nh biểu tượng.</p> <p>Một chiếc khuy bảo vệ v&agrave; phong c&aacute;ch l&agrave;m cho chiếc ủng n&agrave;y trở th&agrave;nh một bổ sung tuyệt vời cho trang phục dạo phố của bạn.</p>', 6, 'nbtram', 1, 1, 0),
(69, 'PALLADIUM Pallabase Twill Star White', 1000000, 2054025, 200000, 1000000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Khởi động Pallabase Twill đưa Pampa mang t&iacute;nh biểu tượng của ch&uacute;ng t&ocirc;i l&ecirc;n một cấp độ cao hơn.</p> <p>Một đ&ocirc;i bốt nữ t&iacute;nh với phần g&oacute;t cao hơn v&agrave; Palladium DNA, bao gồm cả phần mũi gi&agrave;y cao su mang t&iacute;nh biểu tượng.</p> <p>Một chiếc khuy bảo vệ v&agrave; phong c&aacute;ch l&agrave;m cho chiếc ủng n&agrave;y trở th&agrave;nh một bổ sung tuyệt vời cho trang phục dạo phố của bạn.</p>', 6, 'nbtram', 1, 1, 0),
(70, 'ASH Addict Fur', 4030000, 6734850, 700000, 4030000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>L&agrave; một phần mở rộng của loạt Addict nổi tiếng, Addict Fur bổ sung th&ecirc;m l&ocirc;ng giả, l&agrave;m cho cặp kh&ocirc;ng chỉ thời trang m&agrave; c&ograve;n ấm &aacute;p khi bước v&agrave;o đặc biệt l&agrave; trong thời tiết lạnh. Đừng lo, đế chunky cổ điển của Ash vẫn c&ograve;n, c&ugrave;ng với lớp l&oacute;t lưới cho đ&ocirc;i ch&acirc;n của bạn lu&ocirc;n thoải m&aacute;i. M&ocirc; h&igrave;nh n&agrave;y c&oacute; sự kết hợp của c&aacute;c m&agrave;u sắc tương phản.</p> <p>CHI TIẾT:</p> <ul> <li>Chiều cao g&oacute;t (cm): 6,6</li> <li>Chiều cao nền tảng (cm): 0 - 1,5cm</li> <li>Chất liệu: Chrome Free Nubuck; Da b&ecirc; hỗn hợp; L&ocirc;ng th&uacute; giả</li> <li>Chất liệu nội thất: Faux Fur</li> <li>Chất liệu đế ngo&agrave;i: cao su</li> <li>Mũi gi&agrave;y: Tr&ograve;n</li> </ul>', 6, 'nbtram', 1, 1, 0),
(71, 'ALEXANDER MCQUEEN Hybrid Lace-Up Boot', 9800700, 17780100, 800000, 9800700, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Gi&agrave;y cao cổ bằng da b&ecirc; m&agrave;u đen s&aacute;ng b&oacute;ng với chi tiết brogue v&agrave; đế cao su qu&aacute; khổ. Boot d&aacute;ng với h&igrave;nh tr&ograve;n mũi gi&agrave;y. Kết hợp với chữ k&yacute; Alexander McQueen tương phản tr&ecirc;n c&aacute;c tab dải băng.</p> <p>Chất liệu: 100% da b&ecirc;</p>', 6, 'nbtram', 1, 1, 0),
(72, 'ASH Fidji', 3020500, 5242850, 500000, 3020500, 'renren', '2022-01-23 23:00:00', '2022-01-16 23:55:00', 1, '<p>TH&Ocirc;NG TIN CHI TIẾT</p> <ul> <li>Chiều cao g&oacute;t (cm): 4</li> <li>Chiều cao đế (cm): 0 - 1,5cm</li> <li>Chất liệu: Chrome Free Calf Suede; Brasil mềm th&acirc;n thiện với m&ocirc;i trường; Metal Free Nappa Calf; T&aacute;i chế Brasil mềm</li> <li>Chất liệu nội thất: Da lợn</li> <li>Chất liệu đế ngo&agrave;i: cao su</li> <li>H&igrave;nh dạng mũi: Tr&ograve;n</li> </ul>', 6, 'nbtram', 1, 1, 0),
(73, 'ASH Octopus', 4000000, 6587755, 400000, 4000000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Chọn đ&uacute;ng đ&ocirc;i gi&agrave;y thể thao rất quan trọng - v&igrave; ai lại kh&ocirc;ng th&iacute;ch mặc thứ g&igrave; đ&oacute; thoải m&aacute;i trong khi tr&ocirc;ng thật bắt mắt? V&igrave; vậy, ở đ&acirc;y c&oacute; Octopus - một đ&ocirc;i mới, th&uacute; vị ngồi tr&ecirc;n đế đệm chunky được thiết kế đặc biệt, được ho&agrave;n thiện với c&aacute;c trang tr&iacute; nhiều m&agrave;u tr&ecirc;n mũ. Mỗi m&agrave;u sắc mang đến một rung cảm kh&aacute;c nhau, nhưng tất cả đều vui nhộn v&agrave; phong c&aacute;ch.</p> <p>TH&Ocirc;NG TIN CHI TIẾT</p> <ul> <li>Chiều cao g&oacute;t (cm): 5</li> <li>Chiều cao đế (cm): 0 - 1,5cm</li> <li>Chất liệu: Nubuck; Pu B&ecirc; mềm; Brasil mềm; Nylon cổ điển; Chorme Free Nubuck</li> <li>Chất liệu nội thất: Da lợn</li> <li>Chất liệu đế ngo&agrave;i: cao su</li> <li>H&igrave;nh dạng mũi: Tr&ograve;n</li> </ul>', 6, 'nbtram', 1, 1, 0),
(74, 'MASTRO ZAVATTI Suede Leather Sneakers', 2300000, 4942240, 300000, 2300000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Gi&agrave;y sneaker da hỗn hợp l&agrave; phong c&aacute;ch gi&agrave;y thể thao tiện dụng, tối giản nhưng sang trọng.</p> <p>Được chế t&aacute;c từ da hỗn hợp mềm mại, n&oacute; c&oacute; kiểu d&aacute;ng đẹp v&agrave; c&aacute;c chi tiết gọn g&agrave;ng.</p> <p>Được thiết kế để tr&ocirc;ng tuyệt vời v&agrave; thoải m&aacute;i khi mặc h&agrave;ng ng&agrave;y. Ho&agrave;n hảo để tạo ra một c&aacute;i nh&igrave;n th&agrave;nh thị sắc n&eacute;t với denim hoặc quần chinos y&ecirc;u th&iacute;ch của bạn.</p>', 6, 'nbtram', 1, 1, 0),
(75, 'DOLCE & GABBANA Daymaster sneakers', 9900990, 20907750, 900000, 9900990, NULL, '2022-01-23 23:00:00', '2022-01-16 23:55:00', 1, '<p>Sự mi&ecirc;u tả</p> <ul> <li>Tinh tế v&agrave; nhẹ nh&agrave;ng, đ&ocirc;i gi&agrave;y thể thao Daymaster nylon n&agrave;y c&oacute; c&aacute;c chi tiết bằng da b&ecirc; được tr&aacute;ng cao su. Ho&agrave;n hảo cho việc sử dụng h&agrave;ng ng&agrave;y, ch&uacute;ng được t&ocirc; điểm bởi logo DG ch&eacute;o mới v&agrave; thể hiện một đế cao su si&ecirc;u dẻo:</li> <li>Nylon tr&ecirc;n</li> <li>C&uacute;p g&oacute;t h&agrave;ng hiệu</li> <li>Ren h&igrave;nh ống với d&acirc;y r&uacute;t</li> <li>Da ch&acirc;n với nh&atilde;n h&agrave;ng hiệu</li> <li>Cụm đ&aacute;y cao su si&ecirc;u nhẹ</li> <li>Mặt h&agrave;ng đi k&egrave;m với bao b&igrave; theo chủ đề</li> <li>Sản xuất tại &Yacute;</li> </ul> <p>Chăm s&oacute;c v&agrave; chi tiết</p> <ul> <li>Th&agrave;nh phần b&ecirc;n ngo&agrave;i: 38% Polyamide 23% Da b&ecirc; 20% Viscose 17% Polyurethane 2% Spandex</li> <li>Th&agrave;nh phần b&ecirc;n trong: 80% Da cừu 20% Da d&ecirc;</li> </ul>', 6, 'nbtram', 1, 1, 0),
(76, 'BERLUTI Fly Leather Sneaker', 32090000, 47264311, 900000, 32090000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Gi&agrave;y thể thao cổ thấp&nbsp;</p> <ul> <li>Da b&ecirc; Venezia</li> <li>Da đen v&agrave; l&oacute;t nylon v&agrave; đế bằng vải nỉ</li> <li>Đế gi&agrave;y cao su</li> <li>Sản xuất tại &Yacute;</li> </ul> <p>Chăm s&oacute;c:</p> <p>Qu&aacute; tr&igrave;nh chăm s&oacute;c đồ da của Venezia bắt đầu bằng việc loại bỏ bụi bẩn bằng c&aacute;ch sử dụng vải mềm, sau đ&oacute; l&agrave; b&ocirc;i s&aacute;p c&oacute; m&agrave;u ph&ugrave; hợp để nu&ocirc;i dưỡng v&agrave; bảo vệ đồ da. Sau đ&oacute; d&ugrave;ng găng tay đ&aacute;nh b&oacute;ng ch&agrave; x&aacute;t mạnh để l&agrave;m s&aacute;ng b&oacute;ng.</p>', 6, 'nbtram', 1, 1, 0),
(77, 'BERLUTI Playtime Scritto Leather Sneaker', 14000000, 29745901, 900000, 14000000, NULL, '2022-01-23 23:00:00', '2022-01-28 23:55:00', 0, '<p>Đặc điểm:</p> <ul> <li>Sneaker Low-cut</li> <li>X&acirc;y dựng Incollato</li> <li>Venezia Scritto</li> <li>L&oacute;t v&agrave; đế m&agrave;u trắng</li> <li>Đệm lưỡi v&agrave; đế</li> <li>Đế gi&agrave;y cao su</li> <li>Bộ đếm g&oacute;t đệm b&ecirc;n trong</li> <li>Thiết kế scritto kh&ocirc;ng đối xứng ở hai b&ecirc;n gi&agrave;y</li> <li>Khoen c&oacute; thể nh&igrave;n thấy bằng Palladium</li> <li>Sản xuất tại &Yacute;</li> </ul> <p>Chăm s&oacute;c:</p> <p>Qu&aacute; tr&igrave;nh chăm s&oacute;c đồ da của Venezia bắt đầu bằng việc loại bỏ bụi bẩn bằng c&aacute;ch sử dụng vải mềm, sau đ&oacute; l&agrave; b&ocirc;i s&aacute;p c&oacute; m&agrave;u ph&ugrave; hợp để nu&ocirc;i dưỡng v&agrave; bảo vệ đồ da. Sau đ&oacute; d&ugrave;ng găng tay đ&aacute;nh b&oacute;ng ch&agrave; x&aacute;t mạnh để l&agrave;m s&aacute;ng b&oacute;ng.</p> <p>Để chăm s&oacute;c đế ngo&agrave;i bằng cao su, h&atilde;y sử dụng khăn ẩm ướt c&oacute; x&agrave; ph&ograve;ng để l&agrave;m sạch.</p>', 6, 'nbtram', 1, 1, 0),
(78, 'BERLUTI Alessandro Norwegian Oxford', 42328441, 58793973, 1200000, 42328441, NULL, '2021-12-01 09:26:12', '2022-01-31 16:55:20', 0, '<p>Đặc điểm:</p> <ul> <li>Oxford</li> <li>Type: Na Uy</li> <li>Da Venezia</li> <li>Một miếng da duy nhất</li> <li>Lớp l&oacute;t v&agrave; đế m&agrave;u tự nhi&ecirc;n</li> <li>Đế ngo&agrave;i d&agrave;y hơn Demesure th&ocirc;ng thường</li> <li>Thiết kế kh&acirc;u trang tr&iacute; ở phần g&oacute;t</li> </ul> <p>Chất lượng v&agrave; thiết lập:</p> <ul> <li>Da b&ecirc; Venezia -&nbsp;non-Patinable</li> <li>Qu&aacute; tr&igrave;nh chăm s&oacute;c đồ da của Venezia bắt đầu bằng việc loại bỏ bụi bẩn bằng c&aacute;ch sử dụng vải mềm, sau đ&oacute; l&agrave; b&ocirc;i s&aacute;p c&oacute; m&agrave;u ph&ugrave; hợp để nu&ocirc;i dưỡng v&agrave; bảo vệ đồ da. Sau đ&oacute; d&ugrave;ng găng tay đ&aacute;nh b&oacute;ng ch&agrave; x&aacute;t mạnh để l&agrave;m s&aacute;ng b&oacute;ng.</li> </ul>', 7, 'dhuy01', 1, 1, 0),
(79, 'BERLUTI Patchwork Scritto Oxford', 23000000, 47855644, 1110000, 23000000, NULL, '2021-12-01 09:26:12', '2022-01-31 16:55:20', 0, '<p>Đặc điểm:</p> <ul> <li>Kiểu Blake</li> <li>Gi&agrave;y ren ba lỗ</li> <li>Patchwork pha Scritto v&agrave; Venezia trơn b&oacute;ng</li> <li>Lớp l&oacute;t v&agrave; đế ngo&agrave;i m&agrave;u đen</li> <li>Đế ngo&agrave;i bằng da d&agrave;y</li> <li>Sản xuất tại &Yacute;</li> </ul> <p>Chất liệu &amp; Chăm s&oacute;c:</p> <ul> <li>Da b&ecirc; Venezia Scritto - Patinable</li> <li>Qu&aacute; tr&igrave;nh chăm s&oacute;c đồ da của Venezia bắt đầu bằng việc loại bỏ bụi bẩn bằng c&aacute;ch sử dụng vải mềm, sau đ&oacute; l&agrave; b&ocirc;i s&aacute;p c&oacute; m&agrave;u ph&ugrave; hợp để nu&ocirc;i dưỡng v&agrave; bảo vệ đồ da. Sau đ&oacute; d&ugrave;ng găng tay đ&aacute;nh b&oacute;ng ch&agrave; x&aacute;t mạnh để l&agrave;m s&aacute;ng b&oacute;ng.</li> </ul>', 7, 'dhuy01', 0, 0, 0),
(80, 'BERLUTI Alessandro MOGANO Oxford', 37000000, 45284187, 1200000, 37000000, NULL, '2021-12-01 09:26:12', '2022-01-31 16:55:20', 0, '<p>Đặc điểm:</p> <ul> <li>Da b&ecirc; Venezia</li> <li>Gi&agrave;y ren ba lỗ</li> <li>Gi&agrave;y da một mảnh</li> <li>L&oacute;t, đế v&agrave; gi&agrave;y c&oacute; độ tương phản</li> <li>Ho&agrave;n thiện của thợ đ&oacute;ng gi&agrave;y: cạnh đế tr&ograve;n sử dụng b&aacute;nh xe xoắn</li> <li>Chữ k&yacute; &#39;Berluti&#39; được l&agrave;m thủ c&ocirc;ng th&ecirc;m phần ho&agrave;n thiện trang nh&atilde; cho đế</li> <li>Kiến tr&uacute;c: Blake</li> <li>Sản xuất tại &Yacute;</li> </ul> <p>Chăm s&oacute;c:</p> <p>Qu&aacute; tr&igrave;nh chăm s&oacute;c đồ da của Venezia bắt đầu bằng việc loại bỏ bụi bẩn bằng c&aacute;ch sử dụng một miếng vải mềm, sau đ&oacute; l&agrave; d&ugrave;ng s&aacute;p da trong để nu&ocirc;i dưỡng v&agrave; bảo vệ đồ da. Sau đ&oacute;, ch&agrave; x&aacute;t mạnh bằng găng tay đ&aacute;nh b&oacute;ng để kh&ocirc;i phục độ b&oacute;ng ban đầu của da.</p>', 7, 'dhuy01', 0, 0, 0),
(81, 'BERLUTI Alessandro NERO LUCIDO Oxford', 37000000, 45284187, 1200000, 37000000, NULL, '2021-12-01 09:26:12', '2022-01-31 16:55:20', 0, '<p>Đặc điểm:</p> <ul> <li>Gi&agrave;y ren ba lỗ</li> <li>Gi&agrave;y da một mảnh</li> <li>Kiến tr&uacute;c: Blake</li> <li>Sản xuất tại &Yacute;</li> <li>Da b&ecirc; Venezia</li> </ul> <p>Chăm s&oacute;c:</p> <p>Qu&aacute; tr&igrave;nh chăm s&oacute;c đồ da của Venezia bắt đầu bằng việc loại bỏ bụi bẩn bằng c&aacute;ch sử dụng một miếng vải mềm, sau đ&oacute; l&agrave; d&ugrave;ng s&aacute;p da trong để nu&ocirc;i dưỡng v&agrave; bảo vệ đồ da. Sau đ&oacute;, ch&agrave; x&aacute;t mạnh bằng găng tay đ&aacute;nh b&oacute;ng để kh&ocirc;i phục độ b&oacute;ng ban đầu của da.</p>', 7, 'dhuy01', 0, 0, 0),
(82, 'MASTRO ZAVATTI Double Monk-Strap', 3000000, 5822988, 500000, 3000000, NULL, '2021-12-31 11:11:11', '2022-01-28 23:55:00', 0, '<p>Một sự thay thế đẹp mắt cho gi&agrave;y ren, Double Monk được c&aacute;c qu&yacute; &ocirc;ng tr&ecirc;n thế giới ưa chuộng.<br /> Tỷ lệ c&acirc;n đối v&agrave; c&aacute;c chi tiết tối giản được tinh chỉnh để truyền tải một c&aacute;i nh&igrave;n cổ điển. Được chế t&aacute;c từ da đen mịn, d&acirc;y đeo Double Monk được đặt tr&ecirc;n một đế da ho&agrave;n to&agrave;n duy nhất.<br /> T&iacute;nh linh hoạt của n&oacute;&nbsp; l&agrave;m cho phong c&aacute;ch n&agrave;y trở th&agrave;nh một trong những đ&ocirc;i gi&agrave;y tiện dụng nhất cho nam giới, v&igrave; n&oacute; kết hợp tốt cho những dịp trang trọng như đ&aacute;m cưới v&agrave; c&aacute;c sự kiện li&ecirc;n quan đến kinh doanh. V&igrave; vậy, n&oacute; tăng th&ecirc;m sự sắc sảo v&agrave; tinh tế cho những bộ trang phục b&igrave;nh thường hơn.</p>', 7, 'nbtram', 0, 0, 0),
(83, 'MASTRO ZAVATTI Plain Toe Derby', 3000000, 5822988, 500000, 3000000, NULL, '2021-12-31 11:11:11', '2022-01-28 23:55:00', 0, '<p>Plain Toe Derby chắc chắn l&agrave; đ&ocirc;i gi&agrave;y truyền tải tốt nhất sự đơn giản, vượt thời gian v&agrave; tinh tế c&ugrave;ng một l&uacute;c.</p> <p>Phần tr&ecirc;n được l&agrave;m thủ c&ocirc;ng từ da kết d&iacute;nh đ&aacute;nh b&oacute;ng - với những đường n&eacute;t gọn g&agrave;ng v&agrave; sạch sẽ - được đặt tr&ecirc;n một lớp da d&agrave;y v&agrave; đế cao su, l&agrave;m cho những đ&ocirc;i gi&agrave;y derby da n&agrave;y trở th&agrave;nh một phong c&aacute;ch thiết yếu với một giai điệu tinh tế của sự sang trọng. Một sự kết hợp ho&agrave;n hảo giữa chất lượng cao v&agrave; sự thoải m&aacute;i, phong c&aacute;ch n&agrave;y l&agrave; phải c&oacute; để c&oacute; một vẻ ngo&agrave;i trang trọng vượt thời gian nhưng vẫn hiện đại. Với m&agrave;u đen ph&ugrave; hợp với bất kỳ trang phục trang trọng n&agrave;o, đ&acirc;y l&agrave; đ&ocirc;i gi&agrave;y cưới ho&agrave;n hảo cho nam giới, kết hợp ch&uacute;ng với bộ vest c&ocirc;ng sở hoặc mang trong những dịp trang trọng để tạo sự sang trọng.<br /> <u><strong>Đặc điểm</strong></u>:</p> <ul> <li>Độ rộng ph&ugrave; hợp v&agrave; mũi tr&ograve;n</li> <li>Da kết d&iacute;nh đ&aacute;nh b&oacute;ng</li> <li>Đế da đ&ocirc;i bằng cao su</li> <li>Da kh&acirc;u h&igrave;nh chữ L</li> <li>L&oacute;t v&agrave; đế bằng da đầy đủ</li> <li>5 lỗ với d&acirc;y b&ocirc;ng tr&ograve;n, đường kh&acirc;u Blake</li> <li>Được chế t&aacute;c tại &Yacute;</li> </ul>', 7, 'nbtram', 0, 0, 0),
(84, 'MASTRO ZAVATTI Black Cap Toe Oxford', 3000000, 5822988, 500000, 3000000, NULL, '2021-12-31 11:11:11', '2022-01-28 23:55:00', 0, '<p>Một m&oacute;n đồ quan trọng trong tủ quần &aacute;o của mọi người đ&agrave;n &ocirc;ng, Cap Toe Oxfords - Black l&agrave; kiểu gi&agrave;y cổ điển vượt thời gian v&agrave; c&oacute; lẽ l&agrave; kiểu gi&agrave;y phổ biến nhất tr&ecirc;n to&agrave;n cầu.<br /> Được chế t&aacute;c từ da nguy&ecirc;n miếng, gi&agrave;y oxford mũi gi&agrave;y c&oacute; c&aacute;c chi tiết kh&acirc;u tinh xảo để mang lại vẻ ngo&agrave;i trang trọng v&agrave; vượt thời gian, cũng được n&acirc;ng cao bởi đế da đơn tốt.<br /> M&agrave;u đen đậm, đ&acirc;y l&agrave; mẫu gi&agrave;y th&iacute;ch hợp để đi c&ocirc;ng sở v&agrave; c&aacute;c sự kiện trang trọng. Kết hợp những đ&ocirc;i gi&agrave;y oxford thủ c&ocirc;ng n&agrave;y với những bộ vest trang trọng nhất của bạn để c&oacute; ấn tượng tốt l&acirc;u d&agrave;i đối với kh&aacute;ch h&agrave;ng v&agrave; bạn b&egrave;.<br /> Được chế t&aacute;c tại &Yacute;</p>', 7, 'nbtram', 0, 0, 0),
(85, 'MASTRO ZAVATTI Dark Brown Cap Toe Oxford', 3000000, 5822988, 500000, 3000000, NULL, '2021-12-31 11:11:11', '2022-01-28 23:55:00', 0, '<p>Gi&agrave;y Cap Toe Oxford l&agrave; kiểu gi&agrave;y c&ocirc;ng sở v&agrave; trang trọng được y&ecirc;u th&iacute;ch nhất mọi thời đại của nam giới tr&ecirc;n khắp thế giới.<br /> Phong c&aacute;ch n&agrave;y c&oacute; một bộ cuối c&ugrave;ng kiểu d&aacute;ng đẹp tr&ecirc;n đế ngo&agrave;i bằng da duy nhất. Chất liệu da nguy&ecirc;n miếng mềm mại v&agrave; dẻo dai, c&aacute;c chi tiết kh&acirc;u nhỏ v&agrave; tối giản của mũi gi&agrave;y l&agrave;m cho n&oacute; trở th&agrave;nh một phong c&aacute;ch thiết yếu nhưng vẫn trang trọng v&agrave; vượt thời gian.<br /> Với m&agrave;u n&acirc;u sẫm, n&oacute; l&agrave; đ&ocirc;i gi&agrave;y ph&ugrave; hợp để mang cho c&aacute;c sự kiện li&ecirc;n quan đến c&ocirc;ng việc v&agrave; kinh doanh. Kết hợp đ&ocirc;i gi&agrave;y Oxford cao g&oacute;t với những bộ vest trang trọng nhất của bạn để c&oacute; ấn tượng tốt l&acirc;u d&agrave;i đối với kh&aacute;ch h&agrave;ng cũng như đồng nghiệp.<br /> Được chế t&aacute;c tại &Yacute;</p>', 7, 'nbtram', 0, 0, 0),
(86, 'MASTRO ZAVATTI Split Toe Derby', 3000000, 5822988, 500000, 3000000, NULL, '2021-12-31 11:11:11', '2022-01-28 23:55:00', 0, '<p>Split Toe Derby gần đ&acirc;y đ&atilde; trở th&agrave;nh một trong những đ&ocirc;i gi&agrave;y được c&aacute;c qu&yacute; &ocirc;ng săn l&ugrave;ng nhiều nhất.<br /> Phong c&aacute;ch cổ điển vượt thời gian của đ&ocirc;i gi&agrave;y derby kết hợp với những chi tiết tinh tế nhưng nổi bật của đường kh&acirc;u mũi gi&agrave;y v&agrave; tạp dề đ&atilde; l&agrave;m cho n&oacute; trở th&agrave;nh một phong c&aacute;ch mang n&eacute;t đặc trưng ri&ecirc;ng.<br /> Đ&ocirc;i gi&agrave;y Split Toe Derby&nbsp;c&oacute; n&eacute;t cổ điển vượt thời gian được tăng cường lần cuối bởi sắc th&aacute;i n&acirc;u đỏ của da đ&oacute;ng s&aacute;ch đ&aacute;nh b&oacute;ng v&agrave; c&aacute;c chi tiết kh&acirc;u gọn g&agrave;ng ở phần tr&ecirc;n.<br /> Thanh lịch v&agrave; phong c&aacute;ch, Split Toe Derby tuyệt vời với bất kỳ trang phục c&ocirc;ng sở v&agrave; trang phục ch&iacute;nh thức n&agrave;o, mang đến vẻ ngo&agrave;i tinh tế gi&uacute;p bạn nổi bật trong c&aacute;c cuộc họp kinh doanh v&agrave; c&aacute;c sự kiện li&ecirc;n quan đến c&ocirc;ng việc.</p>', 7, 'nbtram', 0, 0, 0),
(87, 'MASTRO ZAVATTI Navy Blue Chunky Cap Toe', 3000000, 5822988, 500000, 3000000, NULL, '2021-12-31 11:11:11', '2022-01-28 23:55:00', 0, '<p>Mang phong c&aacute;ch hiện đại mang n&eacute;t cổ điển vượt thời gian, Chunky Cap Toe Oxford sẽ l&agrave; một sự bổ sung hợp lệ cho bất kỳ tủ gi&agrave;y của qu&yacute; &ocirc;ng n&agrave;o.<br /> Chất liệu da trơn mịn, c&aacute;c chi tiết kh&acirc;u tối giản v&agrave; tinh tế ở mũi gi&agrave;y kết hợp với đế ngo&agrave;i bằng da đ&ocirc;i d&agrave;y tạo cho đ&ocirc;i gi&agrave;y n&agrave;y một trang phục hiện đại v&agrave; th&agrave;nh thị.<br /> T&iacute;nh năng ch&iacute;nh l&agrave; mở rộng b&agrave;n ch&acirc;n v&igrave; để n&oacute; giữ cho họ thoải m&aacute;i cả ng&agrave;y d&agrave;i.<br /> Với m&agrave;u xanh nước biển, đ&ocirc;i gi&agrave;y Oxford hiện đại n&agrave;y sẽ mang đến ấn tượng mạnh mẽ v&agrave; t&aacute;o bạo. Gi&agrave;y Chunky Cap Toe Oxford sẽ kết hợp ho&agrave;n hảo với cả trang phục ch&iacute;nh thức v&agrave; b&igrave;nh thường.</p>', 7, 'nbtram', 0, 0, 0),
(88, 'MASTRO ZAVATTI Dark Brown Chunky Cap Toe', 3000000, 5822988, 500000, 3000000, NULL, '2021-12-31 11:11:11', '2022-01-28 23:55:00', 0, '<p>Sự t&aacute;i hiện của ch&uacute;ng t&ocirc;i về kiểu d&aacute;ng cổ điển vượt thời gian, Chunky Cap Toe Oxford sẽ l&agrave; một sự bổ sung ho&agrave;n hảo cho kho vũ kh&iacute; gi&agrave;y của bất kỳ người đ&agrave;n &ocirc;ng hiện đại n&agrave;o.<br /> Được chế t&aacute;c từ da nguy&ecirc;n tấm, n&oacute; c&oacute; c&aacute;c chi tiết gọn g&agrave;ng v&agrave; sạch sẽ, đế da đ&ocirc;i mang lại vẻ ngo&agrave;i cổ điển nhưng hiện đại.<br /> T&iacute;nh năng ch&iacute;nh l&agrave; v&ograve;ng được ph&aacute;t triển cuối c&ugrave;ng cho b&agrave;n ch&acirc;n rộng hơn v&igrave; n&oacute; giữ cho họ thoải m&aacute;i cả ng&agrave;y d&agrave;i.<br /> Với m&agrave;u n&acirc;u sẫm trơn, kiểu &aacute;o n&agrave;y ph&ugrave; hợp cho cả trang phục ch&iacute;nh thức v&agrave; th&ocirc;ng thường. Gi&agrave;y Chunky Cap Toe Oxford c&oacute; thể dễ d&agrave;ng kết hợp với trang phục c&ocirc;ng sở s&agrave;nh điệu hoặc tạo vẻ thoải m&aacute;i hơn cho c&aacute;c sự kiện v&agrave; buổi họp mặt gia đ&igrave;nh.</p>', 7, 'nbtram', 0, 0, 0),
(89, 'Nồi cơm điện 1.8L Sunhouse', 300000, 600000, 100000, 300000, 'giabao', '2021-12-01 09:26:12', '2022-01-23 16:55:20', 1, '<p>Thương hiệu: Sunhouse</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 1.8 l&iacute;t</p> <p>C&ocirc;ng suất: 700 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim nh&ocirc;m phủ chống d&iacute;nh</p> <p>K&iacute;ch thước DxRxC (mm): 302 mm x 295 mm x 335 mm</p> <p>Trọng lượng: 2600 g</p>', 8, 'dhuy01', 0, 0, 0),
(90, 'Nồi cơm nắp gài Kangaroo 1.2L', 300000, 700000, 100000, 300000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>Thương hiệu: Kangaroo</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 1.2 l&iacute;t</p> <p>C&ocirc;ng suất: 400 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim phủ chống d&iacute;nh</p> <p>K&iacute;ch thước DxRxC (mm): 267 mm x 267 mm x 280 mm</p> <p>Trọng lượng: 2200g</p>', 8, 'dhuy01', 0, 0, 0),
(91, 'Nồi cơm điện tử Kangaroo 1.8L', 300000, 800000, 100000, 300000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>Thương hiệu: Kangaroo</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 1.8 l&iacute;t</p> <p>C&ocirc;ng suất: 700 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim nh&ocirc;m phủ chống d&iacute;nh</p> <p>K&iacute;ch thước DxRxC (mm): 310 mm x 310 mm x 330 mm</p> <p>Trọng lượng: 3200g</p>', 8, 'dhuy01', 0, 0, 0),
(92, 'Nồi cơm điện Toshiba RC-18JFM(H)VN', 300000, 800000, 100000, 300000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>Thương hiệu: Toshiba</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 1.8 l&iacute;t</p> <p>C&ocirc;ng suất: 700 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim phủ chống d&iacute;nh</p> <p>K&iacute;ch thước DxRxC (mm): 286 mm x 282 mm x 263 mm</p> <p>Trọng lượng: 2.7 kg</p>', 8, 'dhuy01', 0, 0, 0),
(93, 'Nồi chiên không dầu Sunhouse 3L', 300000, 1000000, 100000, 300000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>Thương hiệu: Sunhouse</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 3 l&iacute;t</p> <p>C&ocirc;ng suất: 1500 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim nh&ocirc;m phủ chống d&iacute;nh</p> <p>K&iacute;ch thước (DxRxC): 343 mm x 343 mm x 360 mm</p> <p>Trọng lượng: 4670 g</p>', 8, 'dhuy01', 0, 0, 0),
(94, 'Máy Rửa Bát Bosch SMS46GI01P', 9000000, 15000000, 800000, 9000000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>T&iacute;nh năng nổi bật:</p> <ul> <li>Hệ thống giỏ VarioFlex với tia s&aacute;ng đỏ b&aacute;o hiệu hệ thống đang vận h&agrave;nh tốt.</li> <li>M&agrave;n h&igrave;nh 7 đoạn: hiển thị thời gian c&ograve;n lại cho đến khi kết th&uacute;c chương tr&igrave;nh</li> <li>M&aacute;y rửa ch&eacute;n Silence Plus với chương tr&igrave;nh Im lặng: hoạt động y&ecirc;n tĩnh chỉ ở 46dB</li> <li>Chất liệu vỏ bằng inox chống v&acirc;n tay</li> </ul>', 8, 'dhuy01', 0, 0, 0),
(95, 'Nồi đất nắp kính 1.85L DongHwa Tucbeghi', 150000, 200000, 50000, 150000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>Đặc điểm nổi bật</p> <ul> <li>Nồi bằng sứ d&agrave;y chắc, nấu ăn ngon v&agrave; nhanh.</li> <li>Dung t&iacute;ch 1.85 l&iacute;t d&ugrave;ng kho thịt, c&aacute;, nấu lẩu cho 4 - 6 người d&ugrave;ng.</li> <li>Tay cầm liền khối chắc chắn, nắp k&iacute;nh chịu nhiệt tiện quan s&aacute;t.</li> <li>Nồi d&ugrave;ng được tr&ecirc;n bếp gas, bếp hồng ngoại, kh&ocirc;ng d&ugrave;ng tr&ecirc;n bếp từ.</li> <li>Thương hiệu Donghwa - H&agrave;n Quốc, sản xuất tại Việt Nam.</li> </ul>', 8, 'dhuy01', 0, 0, 0),
(96, 'Bộ dao KORKMAZ Vetra Knife', 1290000, 3290000, 200000, 1290000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>&nbsp;&nbsp;</p> <p>T&iacute;nh năng nổi bật:</p> <ul> <li>Chu&ocirc;i dao được nhựa tổng hợp bao phủ dễ d&agrave;ng trong việc cầm nắm, sử dụng</li> <li>C&ocirc;ng nghệ cắt laser mang lại tuổi thọ v&agrave; độ bền cao hơn</li> <li>Thiết kế tinh tế, gọn nhẹ với nhiều k&iacute;ch cỡ thuận tiện sử dụng để đ&aacute;p ứng mọi nhu cầu của nh&agrave; bếp của bạn &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</li> <li>Lưỡi dao kh&ocirc;ng bị gỉ s&eacute;t c&oacute; độ bền cao, thiết kế sang trọng, t&ocirc; điểm kh&ocirc;ng gian nh&agrave; bếp</li> </ul>', 8, 'dhuy01', 0, 0, 0),
(97, 'Bếp ga âm Sakura SG-2665GB', 2190000, 3990000, 300000, 2190000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p><strong>Th&ocirc;ng Số Kỹ Thuật</strong></p> <ul> <li>K&iacute;ch thước (RxSxC) (mm): 700 x 380 x 100mm</li> <li>Trọng lượng (Kg): 6.5Kg</li> <li>Điện &Aacute;p: 220V- 50hz</li> <li>Lượng Gas Ti&ecirc;u Thụ: 0.21 kg/h/l&ograve;</li> <li style=\"\"display: block; width: 0px; height: 0px; padding: 0px; border: 0px; margin: 0px; position: absolute; top: 0px; left: -9999px; opacity: 0; overflow: hidden;\"\">&nbsp;</li> </ul> ', 8, 'dhuy01', 1, 1, 0),
(98, 'Lò Vi Sóng P70T20P-V6', 1149000, 2649000, 200000, 1149000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>Th&ocirc;ng số kỹ thuật Bếp ga &acirc;m Sakura SG-2665GB</p> <ul> <li> <p>Loại bếp: Bếp lắp &acirc;mBếp lắp dương</p> </li> <li> <p>Đ&aacute;nh lửa: Đ&aacute;nh lửa IC bằng pin nhanh, nhẹ</p> </li> <li> <p>Gas ti&ecirc;u thụ: 0.29 kg/h/l&ograve;</p> </li> <li> <p>Mặt bếp: K&iacute;nh cường lực</p> </li> <li> <p>Đầu đốt: Đầu đốt th&ocirc;ng thường, Chất liệu Đồng</p> </li> <li> <p>Số lượng đầu h&acirc;m: C&oacute; cả 2 bếp</p> </li> <li> <p>Tiện &iacute;ch: Dễ vệ sinhNgắt ga tự động</p> </li> <li> <p>K&iacute;ch thước lỗ đ&aacute;: Ngang 63 cm - Dọc 34.5 cm</p> </li> <li> <p>Sản xuất tại: Trung Quốc</p> </li> <li> <p>H&atilde;ng: Sakura.</p> </li> </ul>', 8, 'dhuy01', 0, 0, 0),
(99, 'Bếp hồng ngoại đơn Hommy 809', 300000, 1000000, 100000, 300000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>Đặc điểm nổi bật</p> <ul> <li><strong>Bảng điều khiển cảm ứng bằng tiếng Việt</strong>&nbsp;dễ quan s&aacute;t v&agrave; t&ugrave;y chỉnh.</li> <li><strong>8 mức c&ocirc;ng suất, 8 mức nhiệt</strong>&nbsp;tiện thiết lập ph&ugrave; hợp với&nbsp;<strong>6 chế độ nấu c&agrave;i đặt sẵn.</strong></li> <li><strong>Hẹn giờ l&ecirc;n đến 3 tiếng</strong>, kiểm so&aacute;t thời gian nấu hiệu quả.</li> <li><strong>Kh&oacute;a bảng điều khiển</strong>&nbsp;bảo vệ an to&agrave;n cho gia đ&igrave;nh c&oacute; trẻ nhỏ.</li> <li>Thiết kế bếp đơn 1 v&ugrave;ng nấu nhỏ gọn.</li> <li><strong>Mặt k&iacute;nh Ceramic Kanger</strong>&nbsp;(Trung Quốc) chịu nhiệt cao.</li> <li>C&oacute; hệ thống bảo vệ khi qu&aacute; nhiệt, sử dụng an to&agrave;n.&nbsp;</li> <li><strong>Sử dụng với mọi chất liệu nồi chảo</strong>.</li> <li>Thương hiệu Hommy - Việt Nam, sản xuất tại Trung Quốc.</li> </ul> ', 8, 'dhuy01', 0, 0, 0),
(100, 'Quạt điều hòa Honeywell', 1600000, 3000000, 200000, 1600000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>Thương hiệu của: Mỹ</p> <p>H&atilde;ng: Honeywell</p> <p>Phạm vi l&agrave;m m&aacute;t: Ph&ograve;ng 25 - 30 m&sup2;</p> <p>C&ocirc;ng suất: 230 W</p> <p>Tốc độ gi&oacute;: 4 mức gi&oacute;</p> <p>Chế độ gi&oacute;: Gi&oacute; thường</p> <p>Điều khiển: C&oacute; remote đi k&egrave;m N&uacute;t nhấn</p> <p>Độ ồn cao nhất: 60 dB</p> <p>B&igrave;nh nước: 20 l&iacute;t</p> <p>K&iacute;ch thước, khối lượng: Ngang 49 cm - Cao 84 cm - S&acirc;u 34 cm - 10.3 kg</p>', 9, 'nbtram', 0, 0, 0),
(101, 'Quạt điều hòa Sunhouse', 1600000, 3000000, 200000, 1600000, 'renren', '2021-12-01 09:26:12', '2022-01-23 16:55:20', 1, '<p>Thương hiệu của: Việt Nam</p> <p>H&atilde;ng: Sunhouse</p> <p>Phạm vi l&agrave;m m&aacute;t: Ph&ograve;ng 20 - 25 m&sup2;</p> <p>C&ocirc;ng suất: 120 W Tốc độ gi&oacute;: 8 mức gi&oacute;</p> <p>Chế độ gi&oacute;: Gi&oacute; tự nhi&ecirc;n, Gi&oacute; thường</p> <p>Điều khiển: Cảm ứng c&oacute; m&agrave;n h&igrave;nh hiển thị, C&oacute; remote đi k&egrave;m</p> <p>Độ ồn cao nhất: 60 dB</p> <p>B&igrave;nh nước: 13 l&iacute;t</p> <p>K&iacute;ch thước, khối lượng: Ngang 33 cm - Cao 98 cm - S&acirc;u 36 cm - 9.8 kg</p>', 9, 'nbtram', 0, 0, 0),
(103, 'Quạt điều hoà Daikiosan', 1600000, 3000000, 200000, 1600000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>Thương hiệu của: Việt Nam</p> <p>H&atilde;ng: Daikiosan</p> <p>Phạm vi l&agrave;m m&aacute;t: Ph&ograve;ng 25 - 30 m&sup2;</p> <p>C&ocirc;ng suất: 160 W</p> <p>Tốc độ gi&oacute;: 3 mức gi&oacute;</p> <p>Chế độ gi&oacute;: Gi&oacute; thường</p> <p>Điều khiển: N&uacute;t nhấn c&oacute; m&agrave;n h&igrave;nh hiển thị, C&oacute; remote đi k&egrave;m</p> <p>Độ ồn cao nhất: 56 dB</p> <p>B&igrave;nh nước: 40 l&iacute;t</p> <p>Mức ti&ecirc;u thụ nước: Khoảng 3 - 4 l&iacute;t/giờ</p>', 9, 'nbtram', 0, 0, 0),
(104, 'Máy lọc nước R.O Hydrogen Kangaroo', 5000000, 7000000, 500000, 5000000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>Thương hiệu: Kangaroo</p> <p>Nơi sản xuất: Việt Nam</p> <p>Năm ra mắt: 2019</p> <p>K&iacute;ch thước, khối lượng: Ngang 42 cm - Cao 120.7 cm - S&acirc;u 42 cm - Nặng 27 kg</p> <p>Dung t&iacute;ch b&igrave;nh chứa: 8 l&iacute;t</p> <p>C&ocirc;ng nghệ lọc: Thẩm thấu ngược RO</p> <p>C&ocirc;ng suất lọc nước: 18 - 20 l&iacute;t/giờ</p> <p>C&ocirc;ng suất ti&ecirc;u thụ điện trung b&igrave;nh khoảng: 0.035 - 0.038 kW/h</p>', 9, 'nbtram', 0, 0, 0),
(105, 'Máy Nước Nóng Lạnh KG41W', 3890000, 5890000, 200000, 3890000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>Th&ocirc;ng số kĩ thuật</p> <ul> <li>Điện &aacute;p: 220~240V/50Hz</li> <li>C&ocirc;ng nghệ l&agrave;m lạnh: BLOCK</li> <li>C&ocirc;ng suất l&agrave;m n&oacute;ng: 500 W</li> <li>C&ocirc;ng suất l&agrave;m lạnh: 100 W</li> <li>Nhiệt độ nước n&oacute;ng: 85-95 độ C</li> <li>Nhiệt độ nước lạnh: 4-20 độ C</li> <li>Loại Gas: R-134a</li> <li>K&iacute;ch thước: 375 x 415 x 1080 mm</li> </ul>', 9, 'nbtram', 0, 0, 0),
(106, 'Máy hút bụi Samsung VC18M21M0VN/SV-N', 1170000, 2170000, 200000, 1170000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>Th&ocirc;ng số sản phẩm</p> <ul> <li>C&ocirc;ng suất hoạt động:&nbsp;1800W</li> <li>C&ocirc;ng suất h&uacute;t bụi: 380W</li> <li>Khoang chứa bụi: Hộp chứa - 1.5 l&iacute;t</li> <li>Bộ lọc: Bộ lọc th&ocirc;</li> <li>Độ ồn: 87 dB</li> <li>Thời gian sử dụng: Sạc Kh&ocirc;ng c&oacute;, d&ugrave;ng H&atilde;ng kh&ocirc;ng c&ocirc;ng bố</li> <li>Tiện &iacute;ch: D&acirc;y điện tự thu gọn</li> <li>Đầu h&uacute;t bụi: Đầu h&uacute;t kheĐầu h&uacute;t s&agrave;n</li> <li>Chiều d&agrave;i d&acirc;y điện: 6m</li> <li>Sản xuất tại: Việt Nam</li> <li>H&atilde;ng: Samsung</li> </ul> ', 9, 'nbtram', 0, 0, 0),
(107, 'Máy Lọc Không Khí FP-J30E-A', 1400000, 2400000, 200000, 1400000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>T&iacute;nh năng nổi bật:</p> <ul> <li>Phạm vi hoạt động: &lt;23 m2</li> <li>Lưu lượng gi&oacute; (High/Medium/Low):&nbsp;180/120/60&nbsp;m3/ph&uacute;t</li> <li>C&ocirc;ng suất&nbsp;(High/Medium/Low):&nbsp;50/30/13&nbsp;W</li> <li>Độ ồn (High/Medium/Low):&nbsp;44/36/23&nbsp;dB</li> <li>Plasmacluster ion mật độ cao diệt khuẩn v&agrave; khử sạch m&ugrave;i</li> </ul> ', 9, 'nbtram', 0, 0, 0),
(108, 'Máy hút bụi cầm tay Midea 600W', 560000, 1000000, 50000, 560000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p><strong>Th&ocirc;ng số kĩ thuật</strong></p> <ul> <li>C&ocirc;ng suất hoạt động: 600W</li> <li>Khoang chứa bụi: Hộp chứa - 0.8 l&iacute;t</li> <li>Bộ lọc: Bộ lọc Hepa</li> <li>Thời gian sử dụng: Sạc Kh&ocirc;ng c&oacute;, d&ugrave;ng H&atilde;ng kh&ocirc;ng c&ocirc;ng bố</li> <li>Đầu h&uacute;t bụi: Đầu h&uacute;t khe Đầu h&uacute;t s&agrave;n</li> <li>Chiều d&agrave;i d&acirc;y điện: 5m</li> <li>Sản xuất tại: Trung Quốc</li> <li>H&atilde;ng: Midea</li> </ul> ', 9, 'nbtram', 0, 0, 0),
(109, 'Máy Làm Nóng Lạnh Nước Uống RWF-W1664TV', 2290000, 4290000, 100000, 2290000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>T&iacute;nh năng nổi bật:</p> <ul> <li>C&ocirc;ng suất l&agrave;m n&oacute;ng: 550W</li> <li>C&ocirc;ng suất l&agrave;m lạnh: 120W</li> <li>Nhiệt độ l&agrave;m lạnh: &le;10 độ C/2L/h</li> <li>Nhiệt độ l&agrave;m n&oacute;ng:&nbsp;&ge;85 độ C/4L/h</li> <li>Sử dụng nước b&igrave;nh 11L&iacute;t hoặc 19L&iacute;t</li> </ul> ', 9, 'nbtram', 0, 0, 0),
(110, 'Máy Nước Nóng Ariston SB35E-VN', 500000, 1000000, 50000, 500000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p>T&iacute;nh năng nổi bật:</p> <ul> <li>Loại m&aacute;y nước n&oacute;ng: Trực tiếp</li> <li>Bơm trợ lực: Kh&ocirc;ng</li> <li>Hiển thị nhiệt độ: N&uacute;m vặn</li> <li>Nhiệt độ ổn định: Kh&ocirc;ng</li> <li>V&ograve;i sen: 1 chế độ</li> <li>Hệ thống chống bỏng th&ocirc;ng minh: Kh&ocirc;ng</li> </ul> ', 9, 'nbtram', 0, 0, 0),
(111, 'Máy Lọc Nước RO Nóng Lạnh Slimbio', 7490000, 10000000, 300000, 7490000, NULL, '2021-12-01 09:26:12', '2022-01-23 16:55:20', 0, '<p><strong>Th&ocirc;ng Tin Sản Phẩm</strong></p> <ul> <li>Loại Sản Phẩm: Tủ Đứng</li> <li>Model: SHA76213CK</li> </ul> <p><strong>Th&ocirc;ng Số Kỹ Thuật</strong></p> <ul> <li>Số L&otilde;i Lọc: 10 l&otilde;i</li> <li>K&iacute;ch Thước: S&acirc;u x Rộng x Cao: 440 x 360 x 1050mm</li> <li>C&ocirc;ng Suất Lọc: 15 l&iacute;t/h</li> <li>C&ocirc;ng Suất: 650W</li> </ul> ', 9, 'nbtram', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('2cnYKyBQKzdt1zR8lhy2_yfltihVKC1N', 1642179667, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"http://localhost:3000/product/detail/33\",\"authAccount\":{\"name\":\"Nguyễn Minh Bảo\",\"address\":\"777 Võ Văn Kiệt, Quận 5, TPHCM\",\"email\":\"nmbao@gmail.com\",\"dob\":\"1989-04-10T17:00:00.000Z\",\"point\":1,\"level\":\"seller\",\"username\":\"giabao\",\"isActive\":1,\"sumBid\":2,\"otp\":5270,\"isLock\":0}}'),
('4SkE5kcr9DT6hcCqeCNrHCBAy7OAunqy', 1642141777, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"http://localhost:3000/seller/liveProduct\",\"authAccount\":{\"name\":\"Nguyễn Minh Bảo\",\"address\":\"777 Võ Văn Kiệt, Quận 5, TPHCM\",\"email\":\"nmbao@gmail.com\",\"dob\":\"1989-04-10T17:00:00.000Z\",\"point\":0,\"level\":\"seller\",\"username\":\"giabao\",\"isActive\":1,\"sumBid\":0,\"otp\":5270,\"isLock\":0}}'),
('7uobGiSUMAtb78evFVJEcKAqfWDAXUBk', 1642179868, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"http://localhost:3000/info/reviewProfile\",\"authAccount\":{\"name\":\"Nguyễn Minh Bảo\",\"address\":\"777 Võ Văn Kiệt, Quận 5, TPHCM\",\"email\":\"nmbao@gmail.com\",\"dob\":\"1989-04-10T17:00:00.000Z\",\"point\":1,\"level\":\"seller\",\"username\":\"giabao\",\"isActive\":1,\"sumBid\":2,\"otp\":5270,\"isLock\":0}}'),
('9M_EuIG5KihU1nDTwIWmB1k-MqnJSgd9', 1642120486, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false,\"retUrl\":\"http://localhost:3000/\"}'),
('DNbQf10xtrium-_88zBOwOI7a_LTngD4', 1642149031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"http://localhost:3000/product/detail/18\",\"authAccount\":{\"name\":\"Nguyễn Bảo Trâm\",\"address\":\"231 Nguyễn Văn Cừ\",\"email\":\"nbtram191@gmail.com\",\"dob\":\"2001-11-10T17:00:00.000Z\",\"point\":2,\"level\":\"admin\",\"username\":\"nbtram\",\"isActive\":1,\"sumBid\":13,\"otp\":1913,\"isLock\":0}}'),
('DxC1ckCGwn7PI0lxDJkwS0cBu3_KYVTO', 1642180108, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"/\",\"authAccount\":{\"name\":\"Lê Anh Khiêm\",\"address\":\"11 Tôn Thất Tùng, Phường Phạm Ngũ Lão, Quận 1, TP. Hồ Chí Minh\",\"email\":\"gennyharris1901@gmail.com\",\"dob\":\"2001-04-10T17:00:00.000Z\",\"point\":0,\"level\":\"bidder\",\"username\":\"renren\",\"isActive\":0,\"sumBid\":0,\"otp\":5022,\"isLock\":0}}'),
('IqhSnoAifc0b-nwlol8t6HmxQXH_qh6i', 1642149908, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"http://localhost:3000/\",\"authAccount\":{\"name\":\"Trần Thanh Như\",\"address\":\"528 Trường Chinh, Quận 12, TPHCM\",\"email\":\"ttnhu@gmail.com\",\"dob\":\"1987-12-26T17:00:00.000Z\",\"point\":2,\"level\":\"seller\",\"username\":\"dinhvan\",\"isActive\":1,\"sumBid\":2,\"otp\":5853,\"isLock\":0}}'),
('L6eoM_uRXntVSpTJ6Fxp1XlS1RF0TsAN', 1642166712, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"http://localhost:3000/product/detail/63\",\"authAccount\":{\"name\":\"Nguyễn Bảo Trâm\",\"address\":\"231 Nguyễn Văn Cừ\",\"email\":\"nbtram191@gmail.com\",\"dob\":\"2001-11-10T17:00:00.000Z\",\"point\":2,\"level\":\"admin\",\"username\":\"nbtram\",\"isActive\":1,\"sumBid\":13,\"otp\":1913,\"isLock\":0}}'),
('LAQKVXiT7OVYRPZ1ydYewC8Y3eL-17WL', 1642148613, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"http://localhost:3000/info/wonProduct\",\"authAccount\":{\"name\":\"Nguyễn Bảo Trâm\",\"address\":\"231 Nguyễn Văn Cừ\",\"email\":\"nbtram191@gmail.com\",\"dob\":\"2001-11-10T17:00:00.000Z\",\"point\":0,\"level\":\"admin\",\"username\":\"nbtram\",\"isActive\":1,\"sumBid\":11,\"otp\":1913,\"isLock\":0}}'),
('Lg5jY7ADmhBm0iI8iLmt6jpgY0pU3x3n', 1642140205, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"http://localhost:3000/\",\"authAccount\":{\"name\":\"Trần Thanh Như\",\"address\":\"528 Trường Chinh, Quận 12, TPHCM\",\"email\":\"ttnhu@gmail.com\",\"dob\":\"1987-12-26T17:00:00.000Z\",\"point\":0,\"level\":\"seller\",\"username\":\"dinhvan\",\"isActive\":1,\"sumBid\":0,\"otp\":5853,\"isLock\":0}}'),
('RgfkQy1gk8D17FMWnrqjTGxziQjim_dH', 1642139514, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"http://localhost:3000/info/reviewProfile\",\"authAccount\":{\"name\":\"Nguyễn Minh Bảo\",\"address\":\"777 Võ Văn Kiệt, Quận 5, TPHCM\",\"email\":\"nmbao@gmail.com\",\"dob\":\"1989-04-10T17:00:00.000Z\",\"point\":0,\"level\":\"seller\",\"username\":\"giabao\",\"isActive\":1,\"sumBid\":0,\"otp\":5270,\"isLock\":0}}'),
('hWNetX9gQA1QnUBbeIaxuf_qNa0P7HfB', 1642174435, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"http://localhost:3000/info/wonProduct\",\"authAccount\":{\"name\":\"Nguyen Bao Tram\",\"address\":\"11 Ton That Tung\",\"email\":\"yuanzan1111@gmail.com\",\"dob\":\"2001-12-10T17:00:00.000Z\",\"point\":0,\"level\":\"bidder\",\"username\":\"nbt1111\",\"isActive\":1,\"sumBid\":0,\"otp\":6354,\"isLock\":0}}'),
('mXF07zyJj5QjIM7wPI6jR2_vuLZSki8S', 1642166423, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"http://localhost:3000/\",\"authAccount\":{\"name\":\"Trần Thanh Như\",\"address\":\"528 Trường Chinh, Quận 12, TPHCM\",\"email\":\"ttnhu@gmail.com\",\"dob\":\"1987-12-26T17:00:00.000Z\",\"point\":2,\"level\":\"seller\",\"username\":\"dinhvan\",\"isActive\":1,\"sumBid\":2,\"otp\":5853,\"isLock\":0}}'),
('swJ8awr0TgRyeYuDl1aNKwN8WOLktaEG', 1642149568, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"http://localhost:3000/\",\"authAccount\":{\"name\":\"Trần Thanh Như\",\"address\":\"528 Trường Chinh, Quận 12, TPHCM\",\"email\":\"ttnhu@gmail.com\",\"dob\":\"1987-12-26T17:00:00.000Z\",\"point\":2,\"level\":\"seller\",\"username\":\"dinhvan\",\"isActive\":1,\"sumBid\":2,\"otp\":5853,\"isLock\":0}}');

-- --------------------------------------------------------

--
-- Table structure for table `upgrade`
--

CREATE TABLE `upgrade` (
  `id` varchar(50) NOT NULL,
  `isCheck` tinyint(1) NOT NULL DEFAULT 0,
  `isCancel` tinyint(1) NOT NULL DEFAULT 0,
  `dateStart` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upgrade`
--

INSERT INTO `upgrade` (`id`, `isCheck`, `isCancel`, `dateStart`) VALUES
('nbt1111', 0, 0, '2022-01-13 15:30:12'),
('renren', 0, 0, '2022-01-13 15:12:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CatID`);
ALTER TABLE `categories` ADD FULLTEXT KEY `category` (`CatName`);

--
-- Indexes for table `categoriesnext`
--
ALTER TABLE `categoriesnext`
  ADD PRIMARY KEY (`CatIDNext`),
  ADD KEY `CatID` (`CatID`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD KEY `username` (`username`),
  ADD KEY `favorite_ibfk_1` (`ProID`);

--
-- Indexes for table `historybid`
--
ALTER TABLE `historybid`
  ADD PRIMARY KEY (`time`),
  ADD KEY `Bidder` (`BidderHistory`),
  ADD KEY `historybid_ibfk_3` (`ProIDHistory`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProID`),
  ADD KEY `CatIDNext` (`CatIDNext`),
  ADD KEY `Bidder` (`Bidder`),
  ADD KEY `Seller` (`Seller`);
ALTER TABLE `products` ADD FULLTEXT KEY `fulltextSearch` (`ProName`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `upgrade`
--
ALTER TABLE `upgrade`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CatID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categoriesnext`
--
ALTER TABLE `categoriesnext`
  ADD CONSTRAINT `categoriesnext_ibfk_1` FOREIGN KEY (`CatID`) REFERENCES `categories` (`CatID`);

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`ProID`) REFERENCES `products` (`ProID`) ON DELETE NO ACTION,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`username`) REFERENCES `account` (`username`);

--
-- Constraints for table `historybid`
--
ALTER TABLE `historybid`
  ADD CONSTRAINT `historybid_ibfk_2` FOREIGN KEY (`BidderHistory`) REFERENCES `account` (`username`),
  ADD CONSTRAINT `historybid_ibfk_3` FOREIGN KEY (`ProIDHistory`) REFERENCES `products` (`ProID`) ON DELETE NO ACTION;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CatIDNext`) REFERENCES `categoriesnext` (`CatIDNext`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`Bidder`) REFERENCES `account` (`username`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`Seller`) REFERENCES `account` (`username`);

--
-- Constraints for table `upgrade`
--
ALTER TABLE `upgrade`
  ADD CONSTRAINT `upgrade_ibfk_1` FOREIGN KEY (`id`) REFERENCES `account` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
