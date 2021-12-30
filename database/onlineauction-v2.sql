-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3333
-- Generation Time: Dec 27, 2021 at 02:05 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

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
  `otp` smallint
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`name`, `address`, `email`, `dob`, `point`, `level`, `username`, `password`, `isActive`, `sumBid`,`otp`) VALUES
('Nguyễn Đức Huy', '123 Nguyễn Văn Cừ', 'duchuy040421@gmail.com', '2001-04-04', 0, 'admin', 'dhuy', '$2a$10$PvOejPY3hGtfuw3H9mpQa.BkYwIjqtPB8hwlGqWkoMMbu7DSAs7AW', 1, 0, 1111),
('Nguyễn Hoàng Thông', '312 Nguyễn Văn Cừ', 'nhthong30@gmail.com', '2001-03-14', 0, 'admin', 'nhthong', '$2b$10$N8FBL//oxV4m15VT1/.l0.19DFq.09qwXuyRFSSiMGhHlMdDQebWm', 1, 0, 1111),


('Nguyễn Bảo Trâm', '231 Nguyễn Văn Cừ', 'nbtram191@gmail.com', '2001-11-11', 0, 'seller', 'nbtram', '$2a$10$AC6LQRMUbcloWxSn89x9cOB/2ZHHRRJWTy117T1qJSCkiDtEr8vwa', 1, 11, 1913),
('Nguyen Duc Huy', '77 Võ Thị Sáu, Quận 3, TPHCM', 'huyyy13538@gmail.com', '2001-04-04', 7, 'seller', 'dhuy01', '$2b$10$5W5DZ5/Xi0HKnZO9vTq7/.9dgI7eZEC6WCwzPfxeMa5FrWFyqPUe.', 1, 10, 2906),

('Nguyễn Văn An', '234 Nguyễn Văn Linh, Quận Thủ Đức, TPHCM', 'dtphat@gmail.com', '1990-12-13', 0, 'seller', 'daitoanphat', '$2a$10$os5Va7p5VnjBdZvPUCQt/eSpIsEnf.7uPlDm4Pck4RfT0bZZ9lYV.', 1, 0, 6419),
('Trần Văn Đức', '34 Quang Trung, Quận Gò Vấp, TPHCM', 'ptai@gmail.com', '1997-12-22', 0, 'seller', 'phattai', '$2a$10$wrNAB1ut3RBsUFoPa8DroehS./3pUXDwkyPQNzdIBbbd.2oJeEs3.', 1, 0, 8218),
('Hoàng Gia Bảo', '194 Lê Văn Quới, Quận Bình Tân, TPHCM', 'hgbao@gmail.com', '1979-12-23', 0, 'seller', 'thanhvu', '$2a$10$3uMUXOBwg.Kv6wi3e8a5i.VoJ0FvafcvAI3.r8e7MTqAe/fRsJqee', 1, 0, 1026),
('Trần Thanh Như', '528 Trường Chinh, Quận 12, TPHCM', 'ttnhu@gmail.com', '1987-12-27', 0, 'seller', 'dinhvan', '$2a$10$TfrJogwFzqiX2xd8ShMOouYihmTVjMaWZ2ooCNbsttgd1.B9nl2oC', 1, 0, 5853),
('Nguyễn Minh Bảo', '777 Võ Văn Kiệt, Quận 5, TPHCM', 'nmbao@gmail.com', '1989-04-11', 0, 'seller', 'giabao', '$2a$10$Uf2UereUJn05erDm1ZVYl.n6OyNrtPe.Z.bZ9R8jmfH3MJM3ueMXC', 1, 0, 5270),


('Phạm Đăng Phú', '64 Lê Trọng Tấn, Quận Tân Phú, TPHCM', 'pdat@gmail.com', '1999-12-21', 0, 'bidder', 'phatdat', '$2a$10$ZhUQdSRGI7.Cxaq74BRVH.xgjqS6QS0xqhU8OWhXRWQj4YGSm0FKq', 1, 0, 5806),
('Nguyễn Đức Quân', '456/1 Trương Định, Quận 3, TPHCM', 'dtien@gmail.com', '1983-12-22', 0, 'bidder', 'daitien', '$2a$10$JCCQ92ioG.A6kqQs6jDZO.dOELnevSwBMjHpGheA5tDXir4QvkioK', 1, 0, 2056),
('Lê Hoàng Bảo Nam', '304 Ung Văn Khiêm, Quận Bình Thạnh, TPHCM', 'lhbnam@gmail.com', '1992-12-28', 0, 'bidder', 'phucan', '$2a$10$RMSx76sKtMInblCRqfVBZepyeiEPXb/KhgJkvoMVlH9G1IcSiEzT.', 0, 0, 2819),
('Cao Hoàng Ánh Duyên', '715 Lý Thường Kiệt, Quận Tân Bình, TPHCM', 'chaduyen@gmail.com', '1995-12-27', 0, 'bidder', 'ninhhoa', '$2a$10$2fx9HkSgkwZIDCy8.KmiVeQdbhpAgd/DbfMbASWtev6ahJoTVHMxW', 0, 0, 6229);

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
(5, 'dhuy', 11000000, 10000000, 10000000, '2021-12-26 23:04:48', 0, 0, 0, '', '', 0, 0, 0),
(5, 'phatdat', 10800000, 10800000, 10100000, '2021-12-26 23:05:33', 0, 0, 0, '', '', 0, 0, 0);

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
  `Image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProID`, `ProName`, `PriceCurrent`, `PriceWin`, `stepPrice`, `firstPrice`, `Bidder`, `DateStart`, `DateEnd`, `BidderCount`, `Description`, `CatIDNext`, `Seller`, `renewal`, `isVerify`, `Image`) VALUES

(1, 'Realme 8 Pro 8GB - 128GB'        , 8000000 , 10000000, 500000, 7900000 , 'dhuy01', '2021-12-12 23:23:11', '2022-01-31 23:55:00', 1,
                                        '<p>Thương hiệu: Realme</p> <p>Xuất xứ: Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh: 6.4&quot;, FHD+, Super AMOLED, 1080 x 2400 Pixel</p> <p>Camera sau: 108.0 MP + 8.0 MP + 2.0 MP + 2.0 MP</p> <p>Camera trước: 16.0 MP</p> <p>CPU: 2 x Kryo 465 2.3 GHz + 6 x Kryo 465 1.8 GHz</p> <p>RAM: 8GB</p> <p>Bộ nhớ trong: 128GB</p>',
                                        1, 'dhuy01', 0, 0, null),

(2, 'Oppo Reno6 5G'                   , 10000000, 15000000, 500000, 10000000, 'dhuy01', '2021-12-12 09:26:12', '2021-12-31 16:55:20', 0,
                                      '<p>Thương hiệu: Oppo</p> <p>Xuất xứ: Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh: 6.43&quot;, FHD+, AMOLED, 1080 x 2400 Pixel</p> <p>Camera sau: 64.0 MP + 8.0 MP + 2.0 MP</p> <p>Camera trước: 32.0 MP</p> <p>CPU: MediaTek Dimensity 900 5G</p> <p>RAM: 8GB</p> <p>Bộ nhớ trong: 128GB</p>', 
                                      1, 'dhuy01', 0, 0, null),

(3, 'IPhone XR 128GB '                , 10000000, 17000000, 700000, 10000000, 'dhuy01', '2021-12-12 09:26:12', '2021-12-31 16:55:20', 0,
                                      '<p>Thương hiệu: Apple</p> <p>Xuất xứ: Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh: 6.1&quot;, Liquid Retina HD, IPS LCD, 828 x 1792 Pixel</p> <p>Camera sau: 12.0 MP</p> <p>Camera trước: 7.0 MP</p> <p>CPU: A12 Bionic - 4 x 2.5 GHz Vortex + 4 x 1.6 GHz Tempest</p> <p>RAM: 3GB</p> <p>Bộ nhớ trong: 128GB</p>',
                                      1, 'dhuy01', 0, 0, null),
(4, 'iPhone 12 Pro Max 128GB'         , 20000000, 31000000, 800000, 10000000, 'dhuy01', '2021-12-12 09:26:12', '2021-12-31 16:55:20', 0,
                                      '<p>Thương hiệu: Apple</p> <p>Xuất xứ: Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh: 6.7&quot;, Super Retina XDR, OLED, 2778 x 1284 Pixel</p> <p>Camera sau: 12.0 MP + 12.0 MP + 12.0 MP</p> <p>Camera trước: 12.0 MP - CPU: A14 Bionic - 2 x Firestorm 3.1 GHz + 4 x Icestorm 1.8 GHz</p> <p>RAM: 6GB</p> <p>Bộ nhớ trong: 128GB</p>',
                                      1, 'dhuy01', 0, 0, null),

(5, 'Samsung Galaxy Z Fold3 5G 256GB' , 30000000, 41000000, 900000, 10000000, 'dhuy01', '2021-12-12 09:26:12', '2021-12-31 16:55:20', 2,
                                      '<p>Thương hiệu: Samsung</p> <p>Xuất xứ: Việt Nam/Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh ch&iacute;nh: 7.6&rdquo;, M&agrave;n h&igrave;nh phụ: 6.2&rdquo;, HD+, Ch&iacute;nh: Dynamic AMOLED 2X, phụ: Dynamic AMOLED 2X, 1768 x 2208 Pixel</p> <p>Camera sau: 12.0 MP + 12.0 MP + 12.0 MP</p> <p>Camera trước: 12.0 MP</p> <p>CPU: Snapdragon 888</p> <p>RAM: 12GB</p> <p>Bộ nhớ trong: 256GB</p>',
                                      1, 'dhuy01', 0, 0, null),


(12, 'Apple iPad Mini 6'              , 9490000 , 19490000, 500000, 9490000 , 'dhuy01', '2021-12-23 17:22:51', '2021-12-29 09:26:12', 0,
                                        '<p>Thương hiệu: Apple</p> <p>Xuất xứ: Trung Quốc</p> <p>M&agrave;n h&igrave;nh: 8.3&quot; - Liquid Retina display - IPS</p> <p>Camera sau: 12MP</p> <p>Camera trước: 12MP</p> <p>CPU: Apple A15 Bionic</p> <p>RAM: 4GB</p> <p>Bộ nhớ trong: 64GB</p> <p>Hệ điều h&agrave;nh: iPadOS</p>',
                                        2, 'dhuy01', 0, 1, null),

(13, 'Dell Gaming G15 5511'           , 17000000, 26990000, 500000, 17000000, 'dhuy01', '2021-12-01 09:26:12', '2021-12-27 09:26:12', 1,
                                        '<p>CPU: Intel Core i5-11400H</p> <p>M&agrave;n h&igrave;nh: 15.6&quot; WVA (1920 x 1080), 120Hz</p> <p>RAM: 2 x 4GB DDR4 3200MHz</p> <p>Đồ họa: NVIDIA GeForce RTX 3050 4GB GDDR6 / Intel UHD Graphics</p> <p>Lưu trữ: 256GB SSD M.2 NVMe /</p> <p>Hệ điều h&agrave;nh: Windows 11 Home</p> <p>Pin: 3 cell - Pin liền</p> <p>Khối lượng: 2.8 kg</p>',
                                        2, 'dhuy01', 0, 1, null),

(14, 'ASUS X415EA-EB640W'             , 9000000 , 16490000, 500000, 9000000 , 'dhuy01', '2021-12-01 09:26:12', '2021-12-29 09:26:12', 2,
                                        '<p>CPU: Intel Core i5-1135G7</p> <p>M&agrave;n h&igrave;nh: 14&quot; IPS (1920 x 1080)</p> <p>RAM: 1 x 4GB Onboard DDR4</p> <p>Đồ họa: Intel Iris Xe Graphics</p> <p>Lưu trữ: 512GB SSD M.2 NVMe /</p> <p>Hệ điều h&agrave;nh: Windows 11 Home</p> <p>Pin: 2 cell 37 Wh Pin liền</p> <p>Khối lượng: 1.6 kg</p>',
                                        2, 'dhuy01', 0, 1, null),

(15, 'Acer Nitro 5 AN515-52-51LW'     , 12990000, 25000000, 500000, 12990000, 'dhuy01', '2021-12-01 09:26:12', '2021-12-27 09:26:12', 1,
                                        '<p>CPU: Intel Core i5-8300H ( 2.3 GHz - 4.0 GHz / 8MB / 4 nh&acirc;n, 8 lu&ocirc;̀ng )</p> <p>M&agrave;n h&igrave;nh: 15.6&quot; IPS ( 1920 x 1080 ) , kh&ocirc;ng cảm ứng</p> <p>RAM: 1 x 8GB DDR4 2666MHz</p> <p>Đồ họa: Intel UHD Graphics 630 / NVIDIA GeForce GTX 1050Ti 4GB GDDR5</p> <p>Lưu trữ: 128GB SSD M.2 SATA / 1TB HDD 5400RPM</p> <p>Hệ điều h&agrave;nh: Linux</p> <p>Pin: 4 cell 48 Wh Pin liền , khối lượng: 2.4 kg</p>',
                                        2, 'dhuy01', 0, 1, null),

(16, 'Lenovo Yoga Slim 7 '            , 14000000, 26690000, 500000, 14000000, 'dhuy01', '2021-12-01 09:26:12', '2021-12-29 09:26:12', 1,
                                        '<p>CPU: Intel Core i7-1165G7</p> <p>M&agrave;n h&igrave;nh: 14&quot; IPS (1920 x 1080)</p> <p>RAM: 8GB Onboard DDR4 3200MHz</p> <p>Đồ họa: Intel Iris Xe Graphics</p> <p>Lưu trữ: 512GB SSD M.2 NVMe /</p> <p>Hệ điều h&agrave;nh: Windows 10 Home SL 64-bit</p> <p>Pin: 60 Wh Pin liền</p> <p>Khối lượng: 1.4 kg</p>',
                                        2, 'dhuy01', 0, 1, null),


(23, 'THOM BROWNE Grosgrain Armband Oxford Shirt'         , 5000000 , 9204520 , 500000 , 5000000 , 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0, 
                                                            '<p>&Aacute;o sơ mi cổ điển vừa vặn bằng vải Oxford cotton m&agrave;u xanh nhạt với băng tay sọc grosgrain. N&uacute;t c&agrave;i ph&iacute;a trước, cổ &aacute;o c&oacute; điểm c&agrave;i c&uacute;c, t&uacute;i ngực c&oacute; miếng v&aacute;, &aacute;o d&agrave;i tay. Thẻ t&ecirc;n thương hiệu đ&iacute;nh tr&ecirc;n viền &aacute;o sơ mi. V&ograve;ng m&oacute;c treo lưng trung t&acirc;m.<br /> Chất liệu: 100% chất liệu cotton. Sản xuất tại Mỹ</p>',
                                                             2, 'nbtram', 0, 0, null),

(24, 'AMI PARIS Ami de Coeur Oversize Funnel Neck Sweater', 4000000 , 8290920 , 500000 , 4000000 , 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                            '<p>&Aacute;o len - len merino nỉ, oversize, dệt kim Ami de Coeur m&agrave;u đỏ, 100% sợi len Virgin.<br /> Chiều d&agrave;i lưng 67 cm (cỡ M)&nbsp;<br /> Giặt nhiệt độ thấp<br /> Kh&ocirc;ng tẩy, kh&ocirc;ng sấy kh&ocirc;<br /> Phơi nơi kh&ocirc; r&aacute;o<br /> B&agrave;n ủi nhiệt độ trung b&igrave;nh<br /> C&oacute; thể giặt kh&ocirc;<br /> &nbsp;</p>',
                                                             2, 'nbtram', 0, 0, null),

(25, 'ALEXANDER MCQUEEN Dove Intarsia Roll Neck Jumpe'    , 7000000 , 15093571, 1000000, 10000000, 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0, 
                                                            '<p>Cổ cuộn bằng len cashmere m&agrave;u kem, cắt vừa vặn, &aacute;o liền quần với phần vai bu&ocirc;ng xuống c&oacute; họa tiết chim bồ c&acirc;u tương phản với c&aacute;c chi tiết th&ecirc;u. Ho&agrave;n thiện với cổ tay &aacute;o c&oacute; g&acirc;n v&agrave; viền &aacute;o.<br /> Chất liệu: 90% len, 10% len cashmere</p>',
                                                            2, 'nbtram', 0, 0, null),

(26, 'Supreme X The North Face S Logo Mountain Jacket'    , 4000000 , 8861920 , 1000000, 4000000 , 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                            '<p>Supreme đ&atilde; bỏ S Logo tập trung v&agrave;o The North Face Collaboration như một phần của bản ph&aacute;t h&agrave;nh FW20 Week 10 của họ. Chiếc &aacute;o kho&aacute;c Mountain Jacket c&oacute; logo chữ S m&agrave;u đen từ sự hợp t&aacute;c đ&atilde; thu h&uacute;t sự so s&aacute;nh với bộ đồ được mặc bởi si&ecirc;u anh h&ugrave;ng The Incredibles, Syndrome.</p> <p>Giống như bộ đồ của Syndrome trong phim, chiếc &aacute;o kho&aacute;c n&agrave;y c&oacute; Logo Supreme S lớn che gần hết phần b&ecirc;n tr&aacute;i của &aacute;o kho&aacute;c. Chiếc &aacute;o kho&aacute;c The North Face đặc biệt n&agrave;y được ph&aacute;t h&agrave;nh với ba m&agrave;u, cũng c&oacute; một m&agrave;u đỏ v&agrave; xanh l&aacute; c&acirc;y. The North Face&#39;s Mountain Jacket thường được khen ngợi v&igrave; thiết kế c&oacute; đường may ho&agrave;n to&agrave;n kh&ocirc;ng thấm nước. Chiếc &aacute;o kho&aacute;c The North Face S Logo Mountain Jacket m&agrave;u đen đ&atilde; được b&aacute;n ra v&agrave;o ng&agrave;y 30 th&aacute;ng 10 năm 2020.</p>',
                                                            2, 'nbtram', 0, 0, null),

(27, 'XLANGER Bowling Shirt'                              , 600000  , 1248853 , 200000 , 600000  , 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                           '<p>Th&agrave;nh phần ch&iacute;nh: 100% Rayon</p> <p>Sợi th&ecirc;u: 100% Polyester.</p>',
                                                            2, 'nbtram', 0, 0, null),

(28, 'LACQUEMUS Le T-shirt Yelò layered top'              , 2000000 , 4042680 , 1000000, 2000000 , 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                            '<p>Được đặt t&ecirc;n l&agrave; La Montagne, bộ sưu tập AW21 của Jacquemus ủng hộ những h&igrave;nh b&oacute;ng đi&ecirc;u khắc v&agrave; giải tr&iacute;. Được k&eacute;o từ sợi b&ocirc;ng tinh khiết, chiếc &aacute;o ph&ocirc;ng Yel&ograve; n&agrave;y l&agrave; một v&iacute; dụ điển h&igrave;nh cho c&aacute;ch tiếp cận thời trang đ&oacute;, v&igrave; n&oacute; c&oacute; lớp phủ tay ngắn m&agrave;u đỏ v&agrave; phần đế m&agrave;u n&acirc;u.<br /> Điểm nổi bật: thiết kế hai t&ocirc;ng m&agrave;u đỏ / n&acirc;u, thiết kế xếp lớp, th&ecirc;u logo trước ngực, cổ tr&ograve;n, tay d&agrave;i, viền thẳng<br /> Th&agrave;nh phần: 100% cotton<br /> Hướng dẫn giặt: Giặt m&aacute;y</p>',
                                                            2, 'nbtram', 0, 0, null),

(29, 'BERLUTI Double Face Check Scritto Zip-Up Hoodie'    , 20000000, 46538327, 1500000, 20000000, 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                            '<p>C&aacute;c t&iacute;nh năng b&ecirc;n ngo&agrave;i:</p> <ul> <li>&Aacute;o hoodie c&oacute; kh&oacute;a k&eacute;o bằng len hai mặt</li> <li>D&acirc;y da</li> <li>2 t&uacute;i ở mặt trước</li> <li>M&agrave;o da b&ecirc;</li> <li>T&iacute;nh năng b&ecirc;n trong</li> <li>Scritto v&agrave; kiểm tra jacquard</li> <li>M&ugrave;a đ&ocirc;ng 21</li> <li>Sản xuất tại &Yacute;</li> </ul> <p>Chất liệu: 100% len<br /> Hướng dẫn sử dụng: giặt kh&ocirc;</p>',
                                                            2, 'nbtram', 0, 0, null),

(30, 'ALEXANDER MCQUEEN Dove Lace Print Shirt'            , 6000000 , 11853960, 1000000, 6000000 , 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                            '<p>&Aacute;o sơ mi vải b&ocirc;ng trắng in h&igrave;nh Dove Lace. Sản phẩm ho&agrave;n thiện với một chiếc c&uacute;c &aacute;o trước v&agrave; cổ tay &aacute;o.<br /> Chất liệu: 100% cotton</p>',
                                                            2, 'nbtram', 0, 0, null),

(31, 'ALEXANDER MCQUEEN Illustration-style Print Shirt'   , 5000000 , 10022184, 1000000, 5000000 , 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                            '<p>Điểm nổi bật: m&agrave;u trắng, in theo phong c&aacute;ch minh họa, c&agrave;i n&uacute;t ph&iacute;a trước, cổ &aacute;o cổ điển, tay &aacute;o ngắn v&agrave; viền thẳng<br /> Th&agrave;nh phần: 100% cotton</p>',
                                                            2, 'nbtram', 0, 0, null),

(32, 'ALEXANDER MCQUEEN 70s Collar Contrast Piping Shirt' , 4000000 , 8542160 , 1000000, 4000000 , 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                            '<p>&Aacute;o sơ mi poplin bằng cotton trắng với cổ &aacute;o nhọn của thập ni&ecirc;n 70 v&agrave; c&aacute;c chi tiết đường ống m&agrave;u đen tương phản. Đ&atilde; ho&agrave;n th&agrave;nh với một chiếc c&uacute;c &aacute;o trước v&agrave; cổ tay &aacute;o.<br /> Chất liệu: 100% cotton</p>',
                                                            2, 'nbtram', 0, 0, null),

(33, 'ALEXANDER MCQUEEN Selvedge Logo Tape Polo'          , 5000000 , 10049600, 1000000, 5000000 , 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                            '<p>&Aacute;o sơ mi polo b&ocirc;ng đen với chi tiết xếp placket của Alexander McQueen Selvedge.<br /> Chất liệu: 100% cotton</p>',
                                                            2, 'nbtram', 0, 0, null),


(34, 'JACQUEMUS Le Pantalon Asao Brown'                       , 8000000, 15074400, 800000, 8000000, 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                                '<p>Đặc điểm:</p> <ul> <li>Rộng v&agrave; vừa vặn</li> <li>C&aacute;c nếp gấp ph&iacute;a trước</li> <li>D&acirc;y thắt lưng tương phản k&eacute;o d&agrave;i</li> <li>D&acirc;y c&oacute; thể th&aacute;o rời ở dưới ch&acirc;n</li> <li>T&uacute;i thiết kế theo phong c&aacute;ch &Yacute;</li> <li>T&uacute;i c&oacute; đường ống ph&iacute;a sau</li> <li>Bay c&oacute; kh&oacute;a với n&uacute;t</li> </ul> <p>Người mẫu cao 187 cm v&agrave; mặc size 48<br /> Chất liệu: 100% chất liệu cotton<br /> Sản xuất tại Bungari</p>',
                                                                2, 'nbtram', 0, 0, null),

(35, 'ALEXANDER MCQUEEN Cavalry Twill Tailored Peg Trousers'  , 6000000, 11853960, 800000, 6000000, 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0, 
                                                                '<p>Quần t&acirc;y c&oacute; chốt được thiết kế ri&ecirc;ng bằng vải ch&eacute;o m&agrave;u xanh tối m&agrave;u, với hai chi tiết xếp nếp v&agrave; đường viền ngược nhau. Quần c&oacute; hai t&uacute;i b&ecirc;n v&agrave; hai t&uacute;i sau.<br /> Chất liệu: 100% len</p>',
                                                                2, 'nbtram', 0, 0, null),

(36, 'ALEXANDER MCQUEEN Wide Leg Denim Trouser | DARK BLUE'   , 9000000, 18043600, 500000, 9000000, 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                                '<p>Quần jean denim ống rộng m&agrave;u xanh đậm c&oacute; chi tiết với đường kh&acirc;u m&agrave;u tương phản v&agrave; đường viền chồng ngược.<br /> Chất liệu: 100% cotton</p>',
                                                                2, 'nbtram', 0, 0, null),

(37, 'THOM BROWNE Camel Canvas Bear and Salmon Trouser'       , 9900000, 22060772, 900000, 9900000, 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                                '<p>Quần t&acirc;y mỏng vừa vặn c&oacute; th&ecirc;u h&igrave;nh động vật bằng vải b&ocirc;ng lạc đ&agrave; từ THOM BROWNE c&oacute; họa tiết th&ecirc;u, mấu v&ograve;ng grosgrain đặc trưng, ​​nếp gấp, viền chồng ngược, c&agrave;i n&uacute;t ẩn ph&iacute;a trước, hai t&uacute;i c&oacute; r&atilde;nh v&agrave; hai t&uacute;i c&agrave;i c&uacute;c ph&iacute;a sau.<br /> Thấp ống quần cạp thấp trong một nửa gấu thả v&agrave; c&aacute; hồi lấp đầy vải th&ecirc;u lạc đ&agrave; với c&aacute;c tab grosgrain sọc đồng thau c&oacute; n&uacute;t c&agrave;i ở eo. Đ&oacute;ng tab. T&uacute;i b&ecirc;n v&agrave; sau c&oacute; d&acirc;y. V&ograve;ng d&acirc;y grosgrain sọc đặc trưng ở eo sau. Tay &aacute;o cao.<br /> Chất liệu: 60% cotton, 40% Viscose<br /> Sản xuất tại &Yacute;</p>',
                                                                2, 'nbtram', 0, 0, null),

(38, 'MARK FAST Men Oversized Black Casual Pants'             , 3000000, 6281000 , 500000, 3000000, 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0, 
                                                                '<p>MARKFAST Quần &acirc;u đen nam qu&aacute; khổ<br /> Quần jogger của Mark Fast theo phong c&aacute;ch thể thao nh&acirc;n quả. C&oacute; t&uacute;i b&ecirc;n v&agrave; huy hiệu th&ecirc;u đồ họa MF.<br /> Th&agrave;nh phần:<br /> VẢI: 100% POLYESTER<br /> Phương ph&aacute;p giặt:</p> <ul> <li>Giặt tay</li> <li>Nước lạnh hoặc dưới 40 &deg; C</li> <li>Kh&ocirc;ng sử dụng chất tẩy</li> <li>Phơi kh&ocirc;</li> <li>Sấy b&igrave;nh thường&nbsp;</li> </ul> <p>Lưu &yacute;: Kh&ocirc;ng cần giặt ri&ecirc;ng</p>',
                                                                2, 'nbtram', 0, 0, null),

(39, 'MARK FAST Women Printed MF Letter Jogger Denim Pants'   , 1800000, 3882800 , 400000, 1800000, 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0, 
                                                                '<p>Thiết kế quần Jogger với chất liệu vải denim. Cạp chun v&agrave; viền thun co gi&atilde;n thoải m&aacute;i, ph&ugrave; hợp với c&aacute;c d&aacute;ng người kh&aacute;c nhau. Thiết kế miếng d&aacute;n m&agrave;u b&ecirc;n c&oacute; in chữ MF. Hiện đại v&agrave; thời trang, thể hiện phong c&aacute;ch c&aacute; nh&acirc;n ri&ecirc;ng biệt.<br /> Chất liệu: 100% COTTON</p>',
                                                                2, 'nbtram', 0, 0, null),

(40, 'STELLA MCCARTNEY Lacey Wool Pants'                      , 7000000, 14046600, 800000, 7000000, 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                                '<p>M&agrave;u sắc: X&aacute;m tro</p> <p>Đặc điểm:</p> <ul> <li>Quần chắp v&aacute;</li> <li>Kh&oacute;a zip v&agrave; kh&oacute;a d&aacute;n được giấu k&iacute;n</li> <li>Thắt lưng đ&agrave;n hồi với kh&oacute;a d&aacute;n để c&oacute; thể điều chỉnh vừa vặn</li> <li>T&uacute;i zip nghi&ecirc;ng, chi tiết đường may</li> <li>K&eacute;o zip logo Stella McCartney</li> <li>Sản xuất tại: Hungary</li> <li>Chăm s&oacute;c: Sạch kh&ocirc;</li> <li>Th&agrave;nh phần: 100% len</li> <li>Được thiết kế để vừa vặn thoải m&aacute;i, vừa với k&iacute;ch thước</li> <li>Vải c&oacute; trọng lượng trung b&igrave;nh, kh&ocirc;ng co gi&atilde;n</li> </ul>',
                                                                2, 'nbtram', 0, 0, null),

(41, 'ANN DEMEULEMEESTER Cropped Wool-Crepe Tailored Trousers', 8000000, 16067970, 800000, 8000000, 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                                '<p>ANN DEMEULEMEESTER Quần t&acirc;y cắt may bằng len-crepe<br /> Quần t&acirc;y đen của Ann Demeulemeester được thiết kế ri&ecirc;ng ở &Yacute; từ len crepe đến phom d&aacute;ng vừa vặn với ch&acirc;n thẳng v&agrave; cổ tay &aacute;o được cắt x&eacute;n, đảo ngược.</p> <p>M&agrave;u sắc: M&agrave;u đen</p> <p>Chất liệu: 100% len nguy&ecirc;n sinh.</p> <p>Hướng dẫn giặt: Giặt kh&ocirc;</p> <p>Xuất xứ: &Yacute;<br /> &nbsp;</p>',
                                                                2, 'nbtram', 0, 0, null),

(42, 'ANN DEMEULEMEESTER Vincent Fitted Trousers'             , 7000000, 14930796, 800000, 7000000, 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                                '<p>Ann Demeulemeester Vincent Quần t&acirc;y<br /> Quần t&acirc;y nam Vincent vừa vặn m&agrave;u đen, mang lại sự thoải m&aacute;i nhờ Gabardine - 100% Virgin Wool</p> <p>Sản xuất tại &Yacute;<br /> Người mẫu: cỡ ​​48<br /> Chiều cao: 188 cm<br /> V&ograve;ng eo: 69 cm<br /> V&ograve;ng h&ocirc;ng: 90 cm</p>',
                                                                2, 'nbtram', 0, 0, null),

(43, 'ALLSAINTS Frieda High-rise Denim Trousers'              , 1600000, 3949896 , 400000, 1600000, 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                                '<p>Frieda đ&atilde; được l&agrave;m thủ c&ocirc;ng từ một loại vải nhẹ v&agrave; c&oacute; h&igrave;nh d&aacute;ng vừa vặn với phần ch&acirc;n thon, thẳng. Chi tiết t&uacute;i tr&ecirc;n ch&acirc;n ho&agrave;n thiện thẩm mỹ.</p> <p>Đặc điểm:</p> <ul> <li>Cao ốc</li> <li>Đ&oacute;ng zip</li> <li>Hai t&uacute;i trước</li> <li>Hai t&uacute;i sau</li> <li>Hai t&uacute;i b&ecirc;n</li> <li>Rộng co gi&atilde;n</li> <li>Ch&acirc;n thon</li> </ul>',
                                                                2, 'nbtram', 0, 0, null),

(44, 'ALLSAINTS Park Skinny Chinos'                           , 1000000, 2602039 , 300000, 1000000, 'nbtram', '2021-12-11 11:16:11', '2022-01-12 16:11:11', 0,
                                                                '<p>ALLSAINTS Park Skinny Chinos<br /> Park Chinos được t&ocirc;n vinh bởi thời gian. Được cắt từ một loại vải cotton co gi&atilde;n, nhẹ. Với một đ&ocirc;i ch&acirc;n gầy tinh tế. Bạn c&oacute; thể mặc ch&uacute;ng mọi l&uacute;c mọi nơi.</p> <p>Đặc điểm:</p> <ul> <li>Đ&oacute;ng n&uacute;t</li> <li>Đ&oacute;ng zip</li> <li>Chiều d&agrave;i mắt c&aacute; ch&acirc;n</li> <li>Hai t&uacute;i trước</li> <li>T&uacute;i sau</li> </ul> <p>Sản phẩm b&ocirc;ng ALLSAINTS hỗ trợ canh t&aacute;c b&ocirc;ng bền vững hơn. Better Cotton được lấy từ hệ thống C&acirc;n bằng khối lượng.</p> <p>Chất liệu: 97% cotton, 3% elastane.</p> <p>Sản xuất tại: Trung Quốc</p> <p>Người mẫu c&oacute; k&iacute;ch thước 6&#39;2 &quot;/ 188cm v&agrave; đang mặc size 32</p>',
                                                                2, 'nbtram', 0, 0, null),


(45, 'THOM BROWNE Medium Grey 4-bar Stripe Strap Camera Bag'  , 9000000 , 17472600 , 1300000, 9000000 , 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0, 
                                                                '<p>T&uacute;i m&aacute;y ảnh nhỏ bằng len Melton hai mặt m&agrave;u x&aacute;m trung b&igrave;nh với d&acirc;y đeo bằng vải sọc v&agrave; chi tiết 4 vạch ton-sur-ton. Đ&oacute;ng zip k&eacute;o, t&uacute;i zip ph&iacute;a trước, bảng t&ecirc;n ở mặt. C&aacute;c chi tiết da dạng hạt sỏi. Tab v&ograve;ng lặp grosgrain sọc đặc trưng ở mặt.<br /> 93% len, 5% Casmhere, 2% da b&ecirc;.</p> <p>Sản xuất tại &Yacute;</p>',
                                                                2, 'nbtram', 0, 0, null),

(46, 'LOUIS VUITTON Mini Soft Trunk Monogram Eclipse Canvas'  , 40000000, 58233914 , 1500000, 40000000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                                '<p>Được tạo bởi Virgil Abloh cho triển l&atilde;m Xu&acirc;n-H&egrave; 2019, t&uacute;i Mini Soft Trunk được l&agrave;m từ vải canvas Monogram Eclipse v&agrave; c&oacute; d&acirc;y x&iacute;ch đen mờ bằng nhựa. Phụ kiện h&igrave;nh hộp nhưng trang nh&atilde; n&agrave;y gợi l&ecirc;n h&ograve;m kho b&aacute;u của ng&ocirc;i nh&agrave;. N&oacute; c&oacute; thể được đeo tr&ecirc;n vai hoặc mang ch&eacute;o.<br /> C&aacute;c t&iacute;nh năng chi tiết:</p> <ul> <li>18,5 x 13 x 8 cm (D&agrave;i x Cao x Rộng)</li> <li>Vải phủ Monogram Eclipse</li> <li>Dệt may l&oacute;t</li> <li>Da b&ograve; trang tr&iacute;</li> <li>Phần cứng đen mờ</li> <li>T&uacute;i c&oacute; kh&oacute;a k&eacute;o b&ecirc;n ngo&agrave;i</li> <li>B&ecirc;n trong t&uacute;i phẳng</li> <li>D&acirc;y đeo: Kh&ocirc;ng thể th&aacute;o rời, c&oacute; thể điều chỉnh</li> <li>Thả d&acirc;y đeo: 42.0 cm</li> <li>D&acirc;y đeo thả tối đa: 58,0 cm</li> </ul>',
                                                                2, 'nbtram', 0, 0, null),
                                                                
(47, 'BERLUTI Ninorigami Canvas & Leather Clutch'             , 11000000, 23453407 , 1000000, 11000000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                                '<p>Sản xuất tại &Yacute;</p> <p>Line: ODYSSEE</p> <p>Lớp l&oacute;t bằng vải b&ocirc;ng đặc trưng của Venezia Da b&ecirc; (kh&ocirc;ng thể thay đổi lại) Chăm s&oacute;c da Venezia bắt đầu bằng việc loại bỏ bụi bẩn bằng c&aacute;ch sử dụng một tấm vải mềm, sau đ&oacute; l&agrave; một lớp da trong nu&ocirc;i dưỡng and bảo vệ da. Sau đ&oacute;, x&aacute;t mạnh bằng tay đ&aacute;nh b&oacute;ng để phục hồi b&oacute;ng ban đầu của da. Để l&agrave;m sạch Signature Canvas, ch&uacute;ng t&ocirc;i khuy&ecirc;n bạn n&ecirc;n sử dụng một miếng vải mềm, thấm một ch&uacute;t nước x&agrave; ph&ograve;ng, tr&aacute;nh c&aacute;c phần da. Kh&ocirc;ng bao giờ sử dụng m&ocirc;i trường. Ch&uacute;ng t&ocirc;i đề nghị bạn n&ecirc;n bảo vệ sản phẩm của m&igrave;nh từ ẩm độ v&agrave; tr&aacute;nh xa c&aacute;c nguồn nhiệt trực tiếp.</p>',
                                                                2, 'nbtram', 0, 0, null),

(48, 'BERLUTI Un Jour Mini Leather Briefcase'                 , 70000000, 96225605 , 2500000, 70000000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                                '<p>D&ograve;ng: JOUR</p> <p>C&aacute;ch sử dụng:</p> <ul> <li>Cầm tay tay: hai tay cầm tr&ecirc;n c&ugrave;ng</li> <li>Tr&ecirc;n vai: d&acirc;y đeo vai nylon c&oacute; thể điều chỉnh v&agrave; th&aacute;o rời</li> </ul> <p>Đặc điểm:</p> <p>K&iacute;ch thước: Chiều cao: 27 cm, chiều rộng: 38 cm, độ d&agrave;y: 7 cm v&agrave; vừa với một m&aacute;y t&iacute;nh x&aacute;ch tay 15 inch.</p> <p>C&aacute;c t&iacute;nh năng b&ecirc;n ngo&agrave;i:</p> <ul> <li>Một ngăn c&oacute; kh&oacute;a k&eacute;o</li> <li>Một t&uacute;i trước c&oacute; kh&oacute;a k&eacute;o</li> <li>Một t&uacute;i sau phẳng với một t&uacute;i đựng điện thoại</li> <li>Đ&oacute;ng zip kim loại k&eacute;p</li> </ul> <p>C&aacute;c t&iacute;nh năng b&ecirc;n trong:</p> <ul> <li>Một t&uacute;i c&oacute; kh&oacute;a k&eacute;o</li> <li>Hai ống đựng b&uacute;t</li> <li>Một t&uacute;i điện thoại</li> <li>Đằng trước : Một t&uacute;i phẳng viền da, bao gồm d&acirc;y đeo</li> </ul> <p>Sản xuất tại &Yacute;</p>',
                                                                2, 'nbtram', 0, 0, null),

(49, 'FENDI Brown fabric belt bag'                            , 15000000, 25403846 , 1000000, 15000000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                                '<p>T&uacute;i thắt lưng c&oacute; kh&oacute;a k&eacute;o. Đai điều chỉnh. Được l&agrave;m bằng vải với họa tiết FF. Được t&ocirc; điểm bằng lớp phủ bằng da m&agrave;u tự nhi&ecirc;n. Đồ kim loại bằng paladi.<br /> Sản xuất tại &Yacute;<br /> Chiều d&agrave;i: 46, cm</p> <p>Chiều cao: 18 cm</p> <p>Chiều s&acirc;u: 9, cm</p> <p>Trọng lượng: 0,453 kg</p> <p>Th&agrave;nh phần: 45% Cotton, 40% Polyurethane, 15% Polyester, chất liệu 2: 100% Da b&ograve;, b&ecirc;n trong: 63% Cotton, 34% Polyester, 3% Acrylic, Ribb</p>',
                                                                2, 'nbtram', 0, 0, null),

(50, 'Montblanc x Maison Kitsuné Sling Backpack'              , 13000000, 24210400 , 1000000, 13000000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                                '<p>Montblanc X Maison Kitsun&eacute;&nbsp;Sling Backpack kết hợp thiết kế đặc trưng của Montblanc với th&aacute;i độ t&ograve; m&ograve; v&agrave; vui tươi đ&atilde; định h&igrave;nh n&ecirc;n Kitsun&eacute; Art de Vivre. Được chế t&aacute;c từ da in Saffiano v&agrave; c&oacute; sự t&aacute;i hiện của bản in &lsquo;Camo Fox&rsquo; đặc trưng của Maison Kitsun&eacute;, bộ sưu tập bao gồm một chiếc ba l&ocirc; đeo c&oacute; họa tiết ch&uacute; c&aacute;o đặc biệt với t&ocirc;ng m&agrave;u xanh lam v&agrave; đỏ. N&oacute; ph&ugrave; hợp với lối sống th&agrave;nh thị: nhỏ gọn v&agrave; thể thao, với một phong th&aacute;i điềm tĩnh v&agrave; giản dị.<br /> M&agrave;u sắc, chất liệu: Da b&ecirc; t&aacute;ch đ&ocirc;i, thuộc da chrome, nhuộm qua, c&oacute; in saffiano v&agrave; hoa văn Kitsun&eacute;</p> <p>D&acirc;y đeo: D&acirc;y đeo c&oacute; thể điều chỉnh v&agrave; kh&ocirc;ng c&oacute; nh&atilde;n hiệu</p> <p>M&agrave;u sắc: M&agrave;u xanh lam</p> <p>Vải l&oacute;t: L&oacute;t b&ocirc;ng</p> <p>Kho&aacute;: Zip</p> <p>K&iacute;ch thước: 160x60x250 mm</p>',
                                                                2, 'nbtram', 0, 0, null),

(51, 'SONGMONT Mini Niuye'                                    , 1000000 , 2693350  , 300000 , 1000000 , 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                                '<p>Bộ sưu tập Niuye được thiết kế để kỷ niệm năm OX của Trung Quốc. Sửu, gắn liền với đất, cũng l&agrave; một con vật rất được coi trọng trong văn h&oacute;a Trung Quốc. Sừng b&ecirc; sơ sinh với một chiếc v&ograve;ng b&ograve; dễ thương tượng trưng cho sự kỳ vọng cho năm mới, điềm l&agrave;nh v&agrave; may mắn.</p> <p>Đặc điểm:</p> <ul> <li>Chất liệu: Da b&ecirc; mịn chạm nổi h&igrave;nh voi s&aacute;p dầu</li> <li>B&ecirc;n trong: Nhung, lụa Trung Quốc &amp; da nappa nguy&ecirc;n bản.</li> <li>K&iacute;ch thước: 19,5cm W &times; 11,5cm H &times; 6cm D</li> <li>Trọng lượng: 450g.</li> <li>Phần cứng cổ điển ho&agrave;n thiện bằng v&agrave;ng mờ</li> <li>D&acirc;y đeo chuỗi v&agrave;ng</li> <li>Kho&aacute; từ&nbsp;</li> <li>Hai t&uacute;i b&ecirc;n trong, một t&uacute;i c&oacute; kh&oacute;a k&eacute;o</li> <li>Một t&uacute;i trượt b&ecirc;n ngo&agrave;i c&oacute; đ&oacute;ng từ t&iacute;nh, thuận tiện để đặt điện thoại của bạn</li> </ul>',
                                                                2, 'nbtram', 0, 0, null),

(52, 'SONGMONT Pillow Bag'                                    , 2000000 , 4291100  , 600000 , 2000000 , 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                                '<p><br /> Bộ sưu tập Gối được lấy cảm hứng từ chiếc gối cổ thời Nam Tống. H&igrave;nh d&aacute;ng cổ điển của n&oacute; được thiết kế d&agrave;nh cho phụ nữ hiện đại v&agrave; được biết đến với trọng lượng nhẹ v&agrave; khối lượng đ&aacute;ng kể.</p> <p>Đặc điểm:</p> <ul> <li>Chất liệu: M&agrave;u đen: Da b&ecirc; mịn dập v&acirc;n c&acirc;y; Kh&aacute;c: Da nappa dập nổi h&igrave;nh c&acirc;y</li> <li>Nội thất: Da Nappa &amp; lụa Trung Quốc</li> <li>K&iacute;ch thước: 29cm W &times; 15cm H &times; 6.5cm D</li> <li>Trọng lượng: 300g</li> <li>D&acirc;y da c&oacute; thể điều chỉnh l&agrave;m cho n&oacute; trở th&agrave;nh một chiếc t&uacute;i đeo dưới c&aacute;nh tay hoặc đeo vai</li> <li>Hai kh&oacute;a thắt lưng dưới c&ugrave;ng để cất d&acirc;y đeo khi kh&ocirc;ng sử dụng</li> <li>Đ&atilde; th&ecirc;m kh&oacute;a D ở mỗi b&ecirc;n để cho ph&eacute;p bạn th&ecirc;m phụ kiện mong muốn của m&igrave;nh</li> <li>Kho&aacute; zip</li> <li>Hai t&uacute;i b&ecirc;n trong, một t&uacute;i c&oacute; hai ngăn chứa thẻ</li> <li>Một t&uacute;i ph&iacute;a trước b&ecirc;n ngo&agrave;i c&oacute; đ&oacute;ng từ t&iacute;nh, thuận tiện để đặt điện thoại của bạn</li> <li>Phần cứng cổ điển ho&agrave;n thiện bằng v&agrave;ng mờ</li> </ul>',
                                                                2, 'nbtram', 0, 0, null),

(53, 'DIOR Navy Blue Dior Oblique Jacquard'                   , 40000000, 55236500 , 1500000, 40000000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                                '<p><br /> Dior Oblique Jacquard Mini Saddle Backpack c&oacute; c&aacute;c chi tiết bằng da b&ecirc; m&agrave;u đen đặc trưng. Một chiếc kh&oacute;a &lsquo;Christian Dior&rsquo; đ&oacute;ng nắp trước v&agrave; kết nối với t&uacute;i da c&oacute; v&acirc;n kiểu y&ecirc;n ngựa b&ecirc;n ngo&agrave;i. Tay cầm tr&ecirc;n c&ugrave;ng được đặt ch&iacute;nh giữa hai d&acirc;y đai ph&iacute;a sau c&oacute; đệm nylon c&oacute; thể điều chỉnh được. C&oacute; một t&uacute;i v&aacute; b&ecirc;n trong để giữ c&aacute;c vật dụng cần thiết được ngăn nắp. C&oacute; thể được đeo sau lưng hoặc x&aacute;ch tay, đ&acirc;y l&agrave; phong c&aacute;ch cổ điển của Dior được cập nhật với c&aacute;c chi tiết hiện đại.</p> <p>Đặc điểm:</p> <ul> <li>Chữ k&yacute; &lsquo;Dior&rsquo; dập nổi bằng nhiệt b&ecirc;n trong</li> <li>M&agrave;u xanh hải qu&acirc;n Dior Oblique jacquard</li> <li>D&acirc;y đai lưng nylon c&oacute; đệm c&oacute; thể điều chỉnh</li> <li>Đ&oacute;ng nắp bằng kh&oacute;a &lsquo;Christian Dior&rsquo;</li> <li>T&uacute;i trước b&ecirc;n ngo&agrave;i</li> <li>T&uacute;i v&aacute; b&ecirc;n trong</li> <li>K&iacute;ch thước: 19 cm x 27,5 cm x 11,5 cm</li> <li>Sản xuất tại &Yacute;</li> </ul>',
                                                                2, 'nbtram', 0, 0, null),

(54, 'THOM BROWNE Navy Pebble Grain Leather Mrs Thom Mini Bag', 55000000, 100359825, 2500000, 55000000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                                '<p>Chiếc t&uacute;i mini của Mrs. Thom bằng chất liệu da hạt cuội m&agrave;u xanh nước biển với khung da m&agrave;u trắng tương phản. Kh&oacute;a đ&oacute;ng bằng đồng thau. 2 tay cầm tr&ecirc;n c&ugrave;ng bằng da hạt cuội c&oacute; đệm với v&ograve;ng đồng. Thẻ h&agrave;nh l&yacute; bằng da với c&aacute;c chi tiết sọc. L&oacute;t sọc với t&uacute;i trượt b&ecirc;n trong. Logo in l&aacute; v&agrave;ng v&agrave; tab v&ograve;ng lặp grosgrain sọc ở mục nhập. Phần cứng bằng đồng thau.</p> <p>K&iacute;ch thước 20cm x 18cm x 10cm.</p> <p>Chất liệu: 80% len, 20% da b&ecirc;</p> <p>Sản xuất tại &Yacute;</p>',
                                                                2, 'nbtram', 0, 0, null),

(55, 'DOLCE & GABBANA Small calfskin Sicily bag'              , 23000000, 47382625 , 1500000, 23000000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                                '<p><br /> L&agrave; biểu tượng thương hiệu xuất sắc, chiếc t&uacute;i Sicily nhỏ n&agrave;y c&oacute; một phi&ecirc;n bản mới. H&igrave;nh d&aacute;ng tinh tế v&agrave; nữ t&iacute;nh, chiếc t&uacute;i Sicily n&agrave;y được l&agrave;m bằng da b&ecirc; Dauphine v&agrave; c&oacute; v&iacute; tiền xu ở mặt trước với thẻ thương hiệu với hai lớp mạ kim loại:<br /> &bull; Nắp trước với d&acirc;y buộc từ t&iacute;nh ẩn<br /> &bull; Tấm c&oacute; thương hiệu c&oacute; hai lớp ho&agrave;n thiện mạ kim loại<br /> &bull; Tay cầm tr&ecirc;n c&ugrave;ng v&agrave; d&acirc;y đeo c&oacute; thể điều chỉnh, c&oacute; thể th&aacute;o rời bằng da b&ecirc; Dauphine<br /> &bull; Lớp l&oacute;t vải in<br /> &bull; T&uacute;i b&ecirc;n trong c&oacute; kh&oacute;a k&eacute;o h&agrave;ng hiệu v&agrave; gi&aacute; đỡ điện thoại<br /> &bull; Sản phẩm đi k&egrave;m với một t&uacute;i đựng bụi h&agrave;ng hiệu<br /> &bull; C&aacute;c ph&eacute;p đo: 16 x 20 x 8 cm - 6,3 x 7,9 x 3,1 inch<br /> &bull; Sản xuất tại &Yacute;<br /> Chăm s&oacute;c v&agrave; chi tiết<br /> Th&agrave;nh phần b&ecirc;n ngo&agrave;i: 100% da b&ecirc; Th&agrave;nh phần b&ecirc;n trong: 90% cotton 10% da b&ecirc;</p>',
                                                                2, 'nbtram', 0, 0, null),


(56, 'THOM BROWNE Tech Runner Sneakers'                   , 8000000, 14389200, 500000, 8000000, 'dhuy01', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0, 
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),

(57, 'PALLADIUM Pampa OX Organic Eucalyptus'              , 900000 , 1713000 , 200000, 900000 , 'dhuy01', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0,
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),

(58, 'MLB Chunky High Low New York Yankees'               , 1000000, 2250000 , 300000, 1000000, 'dhuy01', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0, 
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),

(59, 'ALEXANDER MCQUEEN Tread Slick Lace Up'              , 8000000, 15873800, 500000, 8000000, 'dhuy01', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0,
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),

(60, 'XVESSEL Sneaker Violet Paisley'                     , 2300000, 5687160 , 400000, 2300000, 'dhuy01', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0,
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),

(61, 'XVESSEL G.O.P. Highs for Yohji Yamamoto Black'      , 9000000, 16490480, 800000, 9000000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),

(62, 'ASH Sneaker Casual Walking Sporty Shoes'            , 2300000, 5024800 , 400000, 2300000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),

(63, 'RICK OWENS Geth Runner'                             , 9990000, 20135629, 900000, 9990000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),

(64, 'DR.MARTENS 1460 Mono Smooth Leather Lace Up Boot'   , 2400000, 3426000 , 400000, 2400000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),

(65, 'PALLADIUM Pallabrousse Legion Star White'           , 1100000, 2169800 , 300000, 1100000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),

(66, 'PALLADIUM Pampa X Tech WPN Black'                   , 1900000, 4644057 , 500000, 1900000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),

(67, 'PALLADIUM Off-Grid Hi Zip Waterproof + Olive Night' , 1700000, 3651600 , 400000, 1700000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),

(68, 'PALLADIUM Pallabase Twill Butternut'                , 1000000, 2054025 , 200000, 1000000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),

(69, 'PALLADIUM Pallabase Twill Star White'               , 1000000, 2054025 , 200000, 1000000, 'nbtram', '2021-12-27 23:00:00', '2022-01-28 23:55:00', 0,
                                                            '',
                                                            3, 'dhuy01', 0, 0, null),


(78, 'ADAMSTORESAIGON Giày Nhung Thêu Logo'             , 800000 , 2500000, 200000, 800000 ,'dhuy01', '2021-12-01 09:26:12', '2021-12-31 16:55:20', 0, 
                                                         '<p>Gi&agrave;y lười Adam nhung th&ecirc;u logo TXGM27L3 cao cấp thời trang dễ d&agrave;ng kết hợp nhiều loại trang phục đi tiệc được với qu&yacute; &ocirc;ng mọi độ tuổi ưa chuộng. Chất liệu nhung trơn đen c&ugrave;ng điểm nhấn logo TUXEDO th&ecirc;u chỉ v&agrave;ng nổi bật.</p> <p>Gi&agrave;y lười Adam nhung th&ecirc;u logo TXGM27L3 c&oacute; đường may tỉ mỉ chi tiết, đế gi&agrave;y chắc chắn chống trơn trượt. Gi&agrave;y c&oacute; form &ocirc;m ch&acirc;n n&ecirc;n qu&yacute; kh&aacute;ch lưu &yacute; chọn lớn hơn một số đối với qu&yacute; kh&aacute;ch c&oacute; b&agrave;n ch&acirc;n bề ngang lớn.</p>',
                                                         3, 'dhuy01', 0, 0, null),
                                                         
(79, 'ADAMSTORESAIGON Giày Nhung Chuông Đầu Bóng'       , 800000 , 2500000, 200000, 800000 , 'dhuy01', '2021-12-01 09:26:12', '2021-12-31 16:55:20', 0, 
                                                          '<p>Gi&agrave;y Adam nhung chu&ocirc;ng đầu b&oacute;ng M5L23 thời trang dễ d&agrave;ng kết hợp nhiều loại trang phục đi tiệc được với qu&yacute; &ocirc;ng mọi độ tuổi ưa chuộng. Chất liệu mũi gi&agrave;y da trơn b&oacute;ng, phần th&acirc;n ngang c&aacute;ch t&acirc;n vải nhung, mũi form nhọn hiện đại, trẻ trung.</p> <p>Gi&agrave;y Adam nhung chu&ocirc;ng đầu b&oacute;ng M5L23 c&oacute; đường may tỉ mỉ chi tiết, đế gi&agrave;y chắc chắn chống trơn trượt.</p>',
                                                          3, 'dhuy01', 0, 0, null),

(80, 'ADAMSTORESAIGON Giày Da Nam Loafer Nâu'           , 800000 , 2500000, 200000, 800000 , 'dhuy01', '2021-12-01 09:26:12', '2021-12-31 16:55:20', 0,
                                                          '<p>Gi&agrave;y da nam loafer n&acirc;u kiểu d&aacute;ng trẻ trung, lịch l&atilde;m dễ d&agrave;ng kết hợp nhiều loại trang phục đi l&agrave;m, đi tiệc đều được c&aacute;c qu&yacute; &ocirc;ng mọi độ tuổi ưa chuộng.</p> <p>Gi&agrave;y da nam loafer n&acirc;u c&oacute; thiết kế form d&aacute;ng mũi nhọn, chất liệu da n&acirc;u trơn l&igrave; viền mũi đan thừng c&ugrave;ng quai ngang kho&eacute;t mắt, đường may tỉ mỉ chi tiết, đế gi&agrave;y chắc chắn chống trơn trượt.</p>',
                                                          3, 'dhuy01', 0, 0, null),

(81, 'ADAMSTORESAIGON Giày Da Oxford trơn bóng buộc dây', 800000 , 2500000, 200000, 800000 , 'dhuy01', '2021-12-01 09:26:12', '2021-12-31 16:55:20', 0,
                                                          '<p>Gi&agrave;y da oxford nam trơn b&oacute;ng buộc d&acirc;y thời trang dễ d&agrave;ng kết hợp nhiều loại trang phục đi tiệc được qu&yacute; &ocirc;ng mọi độ tuổi ưa chuộng. Gi&agrave;y da oxford nam trơn b&oacute;ng buộc d&acirc;y c&oacute; thiết kế form d&aacute;ng mũi nhọn đẹp mắt, chất liệu trơn b&oacute;ng dễ vệ sinh c&ugrave;ng viền da c&ugrave;ng đường may tỉ mỉ chi tiết, đế gi&agrave;y chắc chắn chống trơn trượt.</p>',
                                                          3, 'dhuy01', 0, 0, null),

(82, 'MASTRO ZAVATTI Double Monk-Strap'                 , 3000000, 5822988, 500000, 3000000, 'nbtram', '2021-12-31 11:11:11', '2021-01-28 23:55:00', 0,
                                                          '<p>Một sự thay thế đẹp mắt cho gi&agrave;y ren, Double Monk được c&aacute;c qu&yacute; &ocirc;ng tr&ecirc;n thế giới ưa chuộng.<br /> Tỷ lệ c&acirc;n đối v&agrave; c&aacute;c chi tiết tối giản được tinh chỉnh để truyền tải một c&aacute;i nh&igrave;n cổ điển. Được chế t&aacute;c từ da đen mịn, d&acirc;y đeo Double Monk được đặt tr&ecirc;n một đế da ho&agrave;n to&agrave;n duy nhất.<br /> T&iacute;nh linh hoạt của n&oacute;&nbsp; l&agrave;m cho phong c&aacute;ch n&agrave;y trở th&agrave;nh một trong những đ&ocirc;i gi&agrave;y tiện dụng nhất cho nam giới, v&igrave; n&oacute; kết hợp tốt cho những dịp trang trọng như đ&aacute;m cưới v&agrave; c&aacute;c sự kiện li&ecirc;n quan đến kinh doanh. V&igrave; vậy, n&oacute; tăng th&ecirc;m sự sắc sảo v&agrave; tinh tế cho những bộ trang phục b&igrave;nh thường hơn.</p>',
                                                          3, 'nbtram', 0, 0, null),

(83, 'MASTRO ZAVATTI Plain Toe Derby'                   , 3000000, 5822988, 500000, 3000000, 'nbtram', '2021-12-31 11:11:11', '2022-01-28 23:55:00', 0,
                                                          '<p>Plain Toe Derby chắc chắn l&agrave; đ&ocirc;i gi&agrave;y truyền tải tốt nhất sự đơn giản, vượt thời gian v&agrave; tinh tế c&ugrave;ng một l&uacute;c.</p> <p>Phần tr&ecirc;n được l&agrave;m thủ c&ocirc;ng từ da kết d&iacute;nh đ&aacute;nh b&oacute;ng - với những đường n&eacute;t gọn g&agrave;ng v&agrave; sạch sẽ - được đặt tr&ecirc;n một lớp da d&agrave;y v&agrave; đế cao su, l&agrave;m cho những đ&ocirc;i gi&agrave;y derby da n&agrave;y trở th&agrave;nh một phong c&aacute;ch thiết yếu với một giai điệu tinh tế của sự sang trọng. Một sự kết hợp ho&agrave;n hảo giữa chất lượng cao v&agrave; sự thoải m&aacute;i, phong c&aacute;ch n&agrave;y l&agrave; phải c&oacute; để c&oacute; một vẻ ngo&agrave;i trang trọng vượt thời gian nhưng vẫn hiện đại. Với m&agrave;u đen ph&ugrave; hợp với bất kỳ trang phục trang trọng n&agrave;o, đ&acirc;y l&agrave; đ&ocirc;i gi&agrave;y cưới ho&agrave;n hảo cho nam giới, kết hợp ch&uacute;ng với bộ vest c&ocirc;ng sở hoặc mang trong những dịp trang trọng để tạo sự sang trọng.<br /> <u><strong>Đặc điểm</strong></u>:</p> <ul> <li>Độ rộng ph&ugrave; hợp v&agrave; mũi tr&ograve;n</li> <li>Da kết d&iacute;nh đ&aacute;nh b&oacute;ng</li> <li>Đế da đ&ocirc;i bằng cao su</li> <li>Da kh&acirc;u h&igrave;nh chữ L</li> <li>L&oacute;t v&agrave; đế bằng da đầy đủ</li> <li>5 lỗ với d&acirc;y b&ocirc;ng tr&ograve;n, đường kh&acirc;u Blake</li> <li>Được chế t&aacute;c tại &Yacute;</li> </ul>',
                                                          3, 'nbtram', 0, 0, null),

(84, 'MASTRO ZAVATTI Cap Toe Oxford | Black'            , 3000000, 5822988, 500000, 3000000, 'nbtram', '2021-12-31 11:11:11', '2022-01-28 23:55:00', 0,
                                                          '<p>Một m&oacute;n đồ quan trọng trong tủ quần &aacute;o của mọi người đ&agrave;n &ocirc;ng, Cap Toe Oxfords - Black l&agrave; kiểu gi&agrave;y cổ điển vượt thời gian v&agrave; c&oacute; lẽ l&agrave; kiểu gi&agrave;y phổ biến nhất tr&ecirc;n to&agrave;n cầu.<br /> Được chế t&aacute;c từ da nguy&ecirc;n miếng, gi&agrave;y oxford mũi gi&agrave;y c&oacute; c&aacute;c chi tiết kh&acirc;u tinh xảo để mang lại vẻ ngo&agrave;i trang trọng v&agrave; vượt thời gian, cũng được n&acirc;ng cao bởi đế da đơn tốt.<br /> M&agrave;u đen đậm, đ&acirc;y l&agrave; mẫu gi&agrave;y th&iacute;ch hợp để đi c&ocirc;ng sở v&agrave; c&aacute;c sự kiện trang trọng. Kết hợp những đ&ocirc;i gi&agrave;y oxford thủ c&ocirc;ng n&agrave;y với những bộ vest trang trọng nhất của bạn để c&oacute; ấn tượng tốt l&acirc;u d&agrave;i đối với kh&aacute;ch h&agrave;ng v&agrave; bạn b&egrave;.<br /> Được chế t&aacute;c tại &Yacute;</p>',
                                                          3, 'nbtram', 0, 0, null),

(85, 'MASTRO ZAVATTI Cap Toe Oxford | Dark Brown'       , 3000000, 5822988, 500000, 3000000, 'nbtram', '2021-12-31 11:11:11', '2022-01-28 23:55:00', 0,
                                                          '<p>Gi&agrave;y Cap Toe Oxford l&agrave; kiểu gi&agrave;y c&ocirc;ng sở v&agrave; trang trọng được y&ecirc;u th&iacute;ch nhất mọi thời đại của nam giới tr&ecirc;n khắp thế giới.<br /> Phong c&aacute;ch n&agrave;y c&oacute; một bộ cuối c&ugrave;ng kiểu d&aacute;ng đẹp tr&ecirc;n đế ngo&agrave;i bằng da duy nhất. Chất liệu da nguy&ecirc;n miếng mềm mại v&agrave; dẻo dai, c&aacute;c chi tiết kh&acirc;u nhỏ v&agrave; tối giản của mũi gi&agrave;y l&agrave;m cho n&oacute; trở th&agrave;nh một phong c&aacute;ch thiết yếu nhưng vẫn trang trọng v&agrave; vượt thời gian.<br /> Với m&agrave;u n&acirc;u sẫm, n&oacute; l&agrave; đ&ocirc;i gi&agrave;y ph&ugrave; hợp để mang cho c&aacute;c sự kiện li&ecirc;n quan đến c&ocirc;ng việc v&agrave; kinh doanh. Kết hợp đ&ocirc;i gi&agrave;y Oxford cao g&oacute;t với những bộ vest trang trọng nhất của bạn để c&oacute; ấn tượng tốt l&acirc;u d&agrave;i đối với kh&aacute;ch h&agrave;ng cũng như đồng nghiệp.<br /> Được chế t&aacute;c tại &Yacute;</p>',
                                                          3, 'nbtram', 0, 0, null),

(86, 'MASTRO ZAVATTI Split Toe Derby'                   , 3000000, 5822988, 500000, 3000000, 'nbtram', '2021-12-31 11:11:11', '2022-01-28 23:55:00', 0,
                                                          '<p>Split Toe Derby gần đ&acirc;y đ&atilde; trở th&agrave;nh một trong những đ&ocirc;i gi&agrave;y được c&aacute;c qu&yacute; &ocirc;ng săn l&ugrave;ng nhiều nhất.<br /> Phong c&aacute;ch cổ điển vượt thời gian của đ&ocirc;i gi&agrave;y derby kết hợp với những chi tiết tinh tế nhưng nổi bật của đường kh&acirc;u mũi gi&agrave;y v&agrave; tạp dề đ&atilde; l&agrave;m cho n&oacute; trở th&agrave;nh một phong c&aacute;ch mang n&eacute;t đặc trưng ri&ecirc;ng.<br /> Đ&ocirc;i gi&agrave;y Split Toe Derby&nbsp;c&oacute; n&eacute;t cổ điển vượt thời gian được tăng cường lần cuối bởi sắc th&aacute;i n&acirc;u đỏ của da đ&oacute;ng s&aacute;ch đ&aacute;nh b&oacute;ng v&agrave; c&aacute;c chi tiết kh&acirc;u gọn g&agrave;ng ở phần tr&ecirc;n.<br /> Thanh lịch v&agrave; phong c&aacute;ch, Split Toe Derby tuyệt vời với bất kỳ trang phục c&ocirc;ng sở v&agrave; trang phục ch&iacute;nh thức n&agrave;o, mang đến vẻ ngo&agrave;i tinh tế gi&uacute;p bạn nổi bật trong c&aacute;c cuộc họp kinh doanh v&agrave; c&aacute;c sự kiện li&ecirc;n quan đến c&ocirc;ng việc.</p>',
                                                          3, 'nbtram', 0, 0, null),

(87, 'MASTRO ZAVATTI Chunky Cap Toe Oxford | Navy Blue' , 3000000, 5822988, 500000, 3000000, 'nbtram', '2021-12-31 11:11:11', '2022-01-28 23:55:00', 0,
                                                          '<p>Mang phong c&aacute;ch hiện đại mang n&eacute;t cổ điển vượt thời gian, Chunky Cap Toe Oxford sẽ l&agrave; một sự bổ sung hợp lệ cho bất kỳ tủ gi&agrave;y của qu&yacute; &ocirc;ng n&agrave;o.<br /> Chất liệu da trơn mịn, c&aacute;c chi tiết kh&acirc;u tối giản v&agrave; tinh tế ở mũi gi&agrave;y kết hợp với đế ngo&agrave;i bằng da đ&ocirc;i d&agrave;y tạo cho đ&ocirc;i gi&agrave;y n&agrave;y một trang phục hiện đại v&agrave; th&agrave;nh thị.<br /> T&iacute;nh năng ch&iacute;nh l&agrave; mở rộng b&agrave;n ch&acirc;n v&igrave; để n&oacute; giữ cho họ thoải m&aacute;i cả ng&agrave;y d&agrave;i.<br /> Với m&agrave;u xanh nước biển, đ&ocirc;i gi&agrave;y Oxford hiện đại n&agrave;y sẽ mang đến ấn tượng mạnh mẽ v&agrave; t&aacute;o bạo. Gi&agrave;y Chunky Cap Toe Oxford sẽ kết hợp ho&agrave;n hảo với cả trang phục ch&iacute;nh thức v&agrave; b&igrave;nh thường.</p>',
                                                          3, 'nbtram', 0, 0, null),
                                                          
(88, 'MASTRO ZAVATTI Chunky Cap Toe Oxford | Dark Brown', 3000000, 5822988, 500000, 3000000, 'nbtram', '2021-12-31 11:11:11', '2022-01-28 23:55:00', 0,
                                                          '<p>Sự t&aacute;i hiện của ch&uacute;ng t&ocirc;i về kiểu d&aacute;ng cổ điển vượt thời gian, Chunky Cap Toe Oxford sẽ l&agrave; một sự bổ sung ho&agrave;n hảo cho kho vũ kh&iacute; gi&agrave;y của bất kỳ người đ&agrave;n &ocirc;ng hiện đại n&agrave;o.<br /> Được chế t&aacute;c từ da nguy&ecirc;n tấm, n&oacute; c&oacute; c&aacute;c chi tiết gọn g&agrave;ng v&agrave; sạch sẽ, đế da đ&ocirc;i mang lại vẻ ngo&agrave;i cổ điển nhưng hiện đại.<br /> T&iacute;nh năng ch&iacute;nh l&agrave; v&ograve;ng được ph&aacute;t triển cuối c&ugrave;ng cho b&agrave;n ch&acirc;n rộng hơn v&igrave; n&oacute; giữ cho họ thoải m&aacute;i cả ng&agrave;y d&agrave;i.<br /> Với m&agrave;u n&acirc;u sẫm trơn, kiểu &aacute;o n&agrave;y ph&ugrave; hợp cho cả trang phục ch&iacute;nh thức v&agrave; th&ocirc;ng thường. Gi&agrave;y Chunky Cap Toe Oxford c&oacute; thể dễ d&agrave;ng kết hợp với trang phục c&ocirc;ng sở s&agrave;nh điệu hoặc tạo vẻ thoải m&aacute;i hơn cho c&aacute;c sự kiện v&agrave; buổi họp mặt gia đ&igrave;nh.</p>',
                                                          3, 'nbtram', 0, 0, null),


(89, 'Nồi cơm điện 1.8L Sunhouse'         , 300000, 600000 , 100000, 300000, 'dhuy01', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0,
                                            '<p>Thương hiệu: Sunhouse</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 1.8 l&iacute;t</p> <p>C&ocirc;ng suất: 700 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim nh&ocirc;m phủ chống d&iacute;nh</p> <p>K&iacute;ch thước DxRxC (mm): 302 mm x 295 mm x 335 mm</p> <p>Trọng lượng: 2600 g</p>',
                                            4, 'dhuy01', 0, 0, null),

(90, 'Nồi cơm nắp gài Kangaroo 1.2L'      , 300000, 700000 , 100000, 300000, 'dhuy01', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0,
                                            '<p>Thương hiệu: Kangaroo</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 1.2 l&iacute;t</p> <p>C&ocirc;ng suất: 400 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim phủ chống d&iacute;nh</p> <p>K&iacute;ch thước DxRxC (mm): 267 mm x 267 mm x 280 mm</p> <p>Trọng lượng: 2200g</p>',
                                            4, 'dhuy01', 0, 0, null),
                                            
(91, 'Nồi cơm điện tử Kangaroo 1.8L'      , 300000, 800000 , 100000, 300000, 'dhuy01', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0,
                                            '<p>Thương hiệu: Kangaroo</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 1.8 l&iacute;t</p> <p>C&ocirc;ng suất: 700 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim nh&ocirc;m phủ chống d&iacute;nh</p> <p>K&iacute;ch thước DxRxC (mm): 310 mm x 310 mm x 330 mm</p> <p>Trọng lượng: 3200g</p>',
                                            4, 'dhuy01', 0, 0, null),
                                            
(92, 'Nồi cơm điện Toshiba RC-18JFM(H)VN' , 300000, 800000 , 100000, 300000, 'dhuy01', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0,
                                            '<p>Thương hiệu: Toshiba</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 1.8 l&iacute;t</p> <p>C&ocirc;ng suất: 700 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim phủ chống d&iacute;nh</p> <p>K&iacute;ch thước DxRxC (mm): 286 mm x 282 mm x 263 mm</p> <p>Trọng lượng: 2.7 kg</p>',
                                            4, 'dhuy01', 0, 0, null),
                                            
(93, 'Nồi chiên không dầu Sunhouse 3L'    , 300000, 1000000, 100000, 300000, 'dhuy01', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0,
                                            '<p>Thương hiệu: Sunhouse</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 3 l&iacute;t</p> <p>C&ocirc;ng suất: 1500 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim nh&ocirc;m phủ chống d&iacute;nh</p> <p>K&iacute;ch thước (DxRxC): 343 mm x 343 mm x 360 mm</p> <p>Trọng lượng: 4670 g</p>',
                                            4, 'dhuy01', 0, 0, null),
                                            

(100, 'Quạt điều hòa Honeywell'           , 1600000, 3000000, 200000, 1600000, 'nbtram', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0, 
                                            '<p>Thương hiệu của: Mỹ</p> <p>H&atilde;ng: Honeywell</p> <p>Phạm vi l&agrave;m m&aacute;t: Ph&ograve;ng 25 - 30 m&sup2;</p> <p>C&ocirc;ng suất: 230 W</p> <p>Tốc độ gi&oacute;: 4 mức gi&oacute;</p> <p>Chế độ gi&oacute;: Gi&oacute; thường</p> <p>Điều khiển: C&oacute; remote đi k&egrave;m N&uacute;t nhấn</p> <p>Độ ồn cao nhất: 60 dB</p> <p>B&igrave;nh nước: 20 l&iacute;t</p> <p>K&iacute;ch thước, khối lượng: Ngang 49 cm - Cao 84 cm - S&acirc;u 34 cm - 10.3 kg</p>',
                                            4, 'nbtram', 0, 0, null),
                                            
(101, 'Quạt điều hòa Sunhouse'            , 1600000, 3000000, 200000, 1600000, 'nbtram', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0, 
                                            '<p>Thương hiệu của: Việt Nam</p> <p>H&atilde;ng: Sunhouse</p> <p>Phạm vi l&agrave;m m&aacute;t: Ph&ograve;ng 20 - 25 m&sup2;</p> <p>C&ocirc;ng suất: 120 W Tốc độ gi&oacute;: 8 mức gi&oacute;</p> <p>Chế độ gi&oacute;: Gi&oacute; tự nhi&ecirc;n, Gi&oacute; thường</p> <p>Điều khiển: Cảm ứng c&oacute; m&agrave;n h&igrave;nh hiển thị, C&oacute; remote đi k&egrave;m</p> <p>Độ ồn cao nhất: 60 dB</p> <p>B&igrave;nh nước: 13 l&iacute;t</p> <p>K&iacute;ch thước, khối lượng: Ngang 33 cm - Cao 98 cm - S&acirc;u 36 cm - 9.8 kg</p>',
                                            4, 'nbtram', 0, 0, null),
                                            
(102, 'Quạt điều hòa Kangaroo'            , 1600000, 3000000, 200000, 1600000, 'nbtram', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0, 
                                            '<p>Thương hiệu của: Việt Nam</p> <p>H&atilde;ng: Kangaroo.</p> <p>Phạm vi l&agrave;m m&aacute;t: Ph&ograve;ng 30 - 40 m&sup2;</p> <p>C&ocirc;ng suất: 180 W</p> <p>Tốc độ gi&oacute;: 3 mức gi&oacute;</p> <p>Điều khiển: N&uacute;m xoay, N&uacute;t nhấn</p> <p>Độ ồn cao nhất: 63 dB</p> <p>B&igrave;nh nước: 55 l&iacute;t</p> <p>Mức ti&ecirc;u thụ nước: Khoảng 3 - 4 l&iacute;t/giờ</p> <p>K&iacute;ch thước, khối lượng: Ngang 60 cm - Cao 117 cm - S&acirc;u 40 cm - 20.7 kg</p>',
                                            4, 'nbtram', 0, 0, null),
                                            
(103, 'Quạt điều hoà Daikiosan'           , 1600000, 3000000, 200000, 1600000, 'nbtram', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0, 
                                            '<p>Thương hiệu của: Việt Nam</p> <p>H&atilde;ng: Daikiosan</p> <p>Phạm vi l&agrave;m m&aacute;t: Ph&ograve;ng 25 - 30 m&sup2;</p> <p>C&ocirc;ng suất: 160 W</p> <p>Tốc độ gi&oacute;: 3 mức gi&oacute;</p> <p>Chế độ gi&oacute;: Gi&oacute; thường</p> <p>Điều khiển: N&uacute;t nhấn c&oacute; m&agrave;n h&igrave;nh hiển thị, C&oacute; remote đi k&egrave;m</p> <p>Độ ồn cao nhất: 56 dB</p> <p>B&igrave;nh nước: 40 l&iacute;t</p> <p>Mức ti&ecirc;u thụ nước: Khoảng 3 - 4 l&iacute;t/giờ</p>',
                                            4, 'nbtram', 0, 0, null),
                                            
(104, 'Máy lọc nước R.O Hydrogen Kangaroo', 5000000, 7000000, 500000, 5000000, 'nbtram', '2021-12-01 09:26:12', '2021-12-28 16:55:20', 0, 
                                            '<p>Thương hiệu: Kangaroo</p> <p>Nơi sản xuất: Việt Nam</p> <p>Năm ra mắt: 2019</p> <p>K&iacute;ch thước, khối lượng: Ngang 42 cm - Cao 120.7 cm - S&acirc;u 42 cm - Nặng 27 kg</p> <p>Dung t&iacute;ch b&igrave;nh chứa: 8 l&iacute;t</p> <p>C&ocirc;ng nghệ lọc: Thẩm thấu ngược RO</p> <p>C&ocirc;ng suất lọc nước: 18 - 20 l&iacute;t/giờ</p> <p>C&ocirc;ng suất ti&ecirc;u thụ điện trung b&igrave;nh khoảng: 0.035 - 0.038 kW/h</p>',
                                            4, 'nbtram', 0, 0, null);
                                            

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
('RmcXOLNgI53xX7vmDmxgxNqVYZrR8QZ-', 1640623690, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"retUrl\":\"http://localhost:3000/product/detail/5\",\"authAccount\":{\"name\":\"Nguyen Duc Huy\",\"address\":\"77 district 3\",\"email\":\"huyyy13538@gmail.com\",\"dob\":\"2001-04-03T17:00:00.000Z\",\"point\":7,\"level\":\"seller\",\"username\":\"dhuy01\",\"isActive\":1,\"sumBid\":10}}');

-- --------------------------------------------------------

--
-- Table structure for table `upgrade`
--

CREATE TABLE `upgrade` (
  `id` varchar(50) NOT NULL,
  `isCheck` tinyint(1) NOT NULL DEFAULT 0,
  `dateStart` int(11) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD KEY `id` (`id`);

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
  MODIFY `ProID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
