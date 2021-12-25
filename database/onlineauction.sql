-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3333
-- Generation Time: Dec 20, 2021 at 02:36 AM
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
  `dob` date NOT NULL,
  `point` int(11) NOT NULL,
  `level` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `active` boolean NOT NULL,
  `otp` smallint
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`name`, `address`, `email`,`dob`, `point`, `level`, `username`, `password`, `active`,`otp`) VALUES
('Nguyễn Đức Huy', '123 Nguyễn Văn Cừ', 'duchuy040421@gmail.com','2001-04-04', 0, 'bidder', 'dhuy', 'huy123', 1, 1234),
('Nguyễn Hoàng Thông', '123 Võ Văn Kiệt', 'nhthong30@gmail.com','2001-03-14', 0, 'admin', 'nhthong', '$2b$10$N8FBL//oxV4m15VT1/.l0.19DFq.09qwXuyRFSSiMGhHlMdDQebWm', 1, 1234),
('Nguyen Duc Huy', '77 district 3', 'huyyy13538@gmail.com','2001-04-04', -5, 'admin', 'dhuy01', '$2b$10$5W5DZ5/Xi0HKnZO9vTq7/.9dgI7eZEC6WCwzPfxeMa5FrWFyqPUe.', 1, 1234);

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
(5, 'Giày thể thao', 3),
(6, 'Giày tây', 3),
(7, 'Đồ dùng nhà bếp', 4),
(8, 'Thiết bị gia đình', 4);

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
  `PriceWinAll` bigint(20) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `isSuccessful` tinyint(1) NOT NULL DEFAULT 0,
  `isAllowed` tinyint(1) NOT NULL DEFAULT 0,
  `isWinner` tinyint(1) NOT NULL DEFAULT 0,
  `commentBidder` text NOT NULL,
  `commentSeller` text NOT NULL,
  `pointFromBidder` int(1) NOT NULL DEFAULT 0,
  `pointFromSeller` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProID` int(11) UNSIGNED NOT NULL,
  `ProName` varchar(50) NOT NULL,
  `PriceCurrent` bigint(20) NOT NULL,
  `PriceWin` bigint(20) NOT NULL,
  `Bidder` varchar(50) DEFAULT NULL,
  `DateStart` datetime NOT NULL DEFAULT current_timestamp(),
  `DateEnd` datetime NOT NULL,
  `BidderCount` int(11) DEFAULT 0,
  `Description` text NOT NULL,
  `CatIDNext` int(11) UNSIGNED DEFAULT NULL,
  `Seller` varchar(50) DEFAULT NULL,
  `renewal` tinyint(1) NOT NULL DEFAULT 0,
  `Image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProID`, `ProName`, `PriceCurrent`, `PriceWin`, `Bidder`, `DateStart`, `DateEnd`, `BidderCount`, `Description`, `CatIDNext`, `Seller`, `renewal`, `Image`) VALUES
(5, 'Samsung Galaxy Z Fold3 5G 256GB', 40990000, 40990000, 'dhuy', '2021-12-01 09:26:12', '2021-12-07 09:26:12', 2, '- Thương hiệu: Samsung\r\n- Xuất xứ: Việt Nam/Trung Quốc\r\n- Thời gian bảo hành: 12 Tháng\r\n- Màn hình chính: 7.6”, Màn hình phụ: 6.2”, HD+, Chính: Dynamic AMOLED 2X, phụ: Dynamic AMOLED 2X, 1768 x 2208 Pixel\r\n- Camera sau: 12.0 MP + 12.0 MP + 12.0 MP\r\n- Camera trước: 12.0 MP\r\n- CPU: Snapdragon 888\r\n- RAM: 12GB\r\n- Bộ nhớ trong: 256GB', 1, 'dhuy', 0, 'https://images.samsung.com/vn/smartphones/galaxy-z-fold3-5g/buy/zfold3_colorselection_phantomgreen_mo.jpg?imwidth=480'),
(6, 'Apple iPad Mini 6', 19490000, 19490000, 'dhuy', '2021-12-01 09:26:12', '2021-12-09 09:26:12', 2, '- Thương hiệu: Apple\r\n- Xuất xứ: Trung Quốc\r\n- Màn hình: 8.3\"\" - Liquid Retina display - IPS\r\n- Camera sau: 12MP\r\n- Camera trước: 12MP\r\n- CPU: Apple A15 Bionic\r\n- RAM: 4GB\r\n- Bộ nhớ trong: 64GB\r\n- Hệ điều hành: iPadOS', 2, 'dhuy', 0, 'https://www.apple.com/newsroom/images/product/ipad/standard/Apple_iPadmini_colors_09142021_big_carousel.jpg.large.jpg'),
(7, 'Dell Gaming G15 5511', 26990000, 26990000, 'dhuy', '2021-12-01 09:26:12', '2021-12-07 09:26:12', 1, '- CPU: Intel Core i5-11400H\r\n- Màn hình: 15.6\"\" WVA (1920 x 1080), 120Hz\r\n- RAM: 2 x 4GB DDR4 3200MHz\r\n- Đồ họa: NVIDIA GeForce RTX 3050 4GB GDDR6 / Intel UHD Graphics\r\n- Lưu trữ: 256GB SSD M.2 NVMe /\r\n- Hệ điều hành: Windows 11 Home\r\n- Pin: 3 cell Pin liền\r\n- Khối lượng: 2.8 kg', 2, 'dhuy', 0, 'https://i.dell.com/is/image/DellContent//content/dam/global-site-design/product_images/dell_client_products/notebooks/g_series/g15_sif_tgl_mlk/media-gallery/na/laptops_g-series_g15_5511_dark_shadow_gr'),
(8, 'ASUS X415EA-EB640W', 16490, 16490, 'dhuy', '2021-12-01 09:26:12', '2021-12-09 09:26:12', 2, '- CPU: Intel Core i5-1135G7\r\n- Màn hình: 14\"\" IPS (1920 x 1080)\r\n- RAM: 1 x 4GB Onboard DDR4\r\n- Đồ họa: Intel Iris Xe Graphics\r\n- Lưu trữ: 512GB SSD M.2 NVMe /\r\n- Hệ điều hành: Windows 11 Home\r\n- Pin: 2 cell 37 Wh Pin liền\r\n- Khối lượng: 1.6 kg', 2, 'dhuy', 0, 'https://dlcdnwebimgs.asus.com/gain/2de00409-9014-45b5-b41f-06a43a198aae/'),
(9, 'Dell Gaming G15 5511', 26990000, 26990000, 'dhuy', '2021-12-01 09:26:12', '2021-12-07 09:26:12', 1, '- CPU: Intel Core i5-11400H\r\n- Màn hình: 15.6\"\" WVA (1920 x 1080), 120Hz\r\n- RAM: 2 x 4GB DDR4 3200MHz\r\n- Đồ họa: NVIDIA GeForce RTX 3050 4GB GDDR6 / Intel UHD Graphics\r\n- Lưu trữ: 256GB SSD M.2 NVMe /\r\n- Hệ điều hành: Windows 11 Home\r\n- Pin: 3 cell Pin liền\r\n- Khối lượng: 2.8 kg', 2, 'dhuy', 0, 'https://i.dell.com/is/image/DellContent//content/dam/global-site-design/product_images/dell_client_products/notebooks/g_series/g15_sif_tgl_mlk/media-gallery/na/laptops_g-series_g15_5511_dark_shadow_gr'),
(10, 'Lenovo Yoga Slim 7 ', 26690000, 26690000, 'dhuy', '2021-12-01 09:26:12', '2021-12-09 09:26:12', 1, '- CPU: Intel Core i7-1165G7\r\n- Màn hình: 14\"\" IPS (1920 x 1080)\r\n- RAM: 8GB Onboard DDR4 3200MHz\r\n- Đồ họa: Intel Iris Xe Graphics\r\n- Lưu trữ: 512GB SSD M.2 NVMe /\r\n- Hệ điều hành: Windows 10 Home SL 64-bit\r\n- 60 Wh Pin liền\r\n- Khối lượng: 1.4 kg', 2, 'dhuy', 0, 'https://hanoicomputercdn.com/media/product/56961_yoga_slim_7__5_.png'),
(11, 'Áo Khoác Hoodie Bò Sữa ', 299000, 299000, 'dhuy', '2021-12-01 09:26:12', '2021-12-07 09:26:12', 1, 'Chất liệu: 80% Cotton, 20% Polyester.\r\nCông nghệ dệt vải da cá thoáng mát.\r\nDây rút bọc nhôm chống xù lông.\r\nHướng dẫn giặt ủi: Giặt tay, không giặt nước nóng, không phơi trực tiếp dưới ánh nắng.', 3, 'dhuy', 0, 'https://hotloko.com/wp-content/uploads/2020/12/Ao-Khoac-Hoodie-Co-Mu-Nam-Nu-doi-han-quoc-Hoa-Tiet-Bo-Sua-Trang-1.jpg'),
(12, 'Áo Sweater Basic Trơn Màu Đen', 350000, 350000, 'dhuy', '2021-12-01 09:26:12', '2021-12-09 09:26:12', 2, 'Chất liệu: 80% Cotton, 20% Polyester.\r\nCông nghệ dệt vải da cá thoáng mát.\r\nSản phẩm cơ bản, phù hợp cho mọi hoạt động hằng ngày.\r\nHướng dẫn giặt ủi: Giặt tay, không giặt nước nóng, không phơi trực tiếp dưới ánh nắng.', 3, 'dhuy', 0, 'https://hotloko.com/wp-content/uploads/2021/04/Ao-sweater-tron-mau-den-6-scaled.jpg'),
(13, 'Áo Khoác Jean Unisex', 390000, 390000, 'dhuy', '2021-12-01 09:26:12', '2021-12-07 09:26:12', 1, 'Áo Khoác Jean Nam Nữ Unisex, Áo Khoác Jean Thời Trang Form Rộng Đen\r\nPhong cách Hàn Quốc trẻ trung.\r\nSize: M, L, XL, 2XL.\r\nChất liệu: Jean\r\nMàu sắc: Xanh dương, Đen\r\nHướng dẫn giặt ủi: Giặt tay, không phơi trực tiếp dưới ánh nắng.', 3, 'dhuy', 0, 'https://hotloko.com/wp-content/uploads/2021/03/ao-khoac-jeans-nam-nu-den-5.jpg'),
(14, 'Áo hoodie local brand Màu Rêu', 450000, 450000, 'dhuy', '2021-12-01 09:26:12', '2021-12-09 09:26:12', 1, 'Chất liệu: 47% Cotton, 53% Polyester.\r\nCông nghệ dệt vải da cá thoáng mát, không lót bông.\r\nDây rút bọc nhôm chống xù lông.\r\nHướng dẫn giặt ủi: Giặt tay, không giặt nước nóng, không phơi trực tiếp dưới ánh nắng.', 3, 'dhuy', 0, 'https://hotloko.com/wp-content/uploads/2021/03/Ao-khoac-hoodie-flexible-toi-gian-xanh-reu-9.jpg'),
(15, 'Áo thun Drew House Cereal Bowl Tee', 290000, 290000, 'dhuy', '2021-12-01 09:26:12', '2021-12-07 09:26:12', 1, 'Mô tả sản phẩm:\r\nÁo thun unisex nam nữ\r\nMàu sắc: Trắng\r\nSize: M, L, XL, 2XL\r\nChất liệu: 100% Cotton\r\nHướng dẫn giặt ủi: Giặt thường', 3, 'dhuy', 0, 'https://hotloko.com/wp-content/uploads/2020/11/ao-thun-drew-8.jpg');

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
('mou1scGYP_I0O-WIhjViNcnh5yEm4-tc', 1640018667, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"authAccount\":{\"name\":\"Nguyen Duc Huy\",\"address\":\"77 district 3\",\"email\":\"huyyy13538@gmail.com\",\"point\":-5,\"level\":\"admin\",\"username\":\"dhuy01\"},\"word\":\"áo khoác\",\"retUrl\":\"http://localhost:3000/product/byCat/2\"}');

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
