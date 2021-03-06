-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 16, 2019 lúc 02:44 AM
-- Phiên bản máy phục vụ: 10.1.37-MariaDB
-- Phiên bản PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `restaurant`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--
create database restaurant;
use restaurant;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `cate_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `cate_name`, `code`) VALUES
(2, 'Món lẩu', 'ML'),
(3, 'Món chiên-xào-hấp', 'MCXH'),
(4, 'Món nướng', 'MN'),
(5, 'Món nhậu', 'MNN'),
(6, 'Món gà', 'MG'),
(10, 'Món khai vị', 'KV');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `foods`
--

CREATE TABLE `foods` (
  `id` int(11) NOT NULL,
  `food_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `prices` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `status` varchar(500) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `foods`
--

INSERT INTO `foods` (`id`, `food_name`, `prices`, `description`, `category_id`, `status`) VALUES
(1, 'Gỏi bò cay', 59000, 'Đây là món khai vị', 10, '1'),
(2, 'Ếch rang tiêu xanh', 59000, 'Đây là món ếch rang tiêu xanh', 10, '1'),
(3, 'Khoai tây chiên', 29000, 'Đây là món khoai tây chiên', 10, '1'),
(4, 'Bắp non xào hành', 29000, 'Đây là món bắp xào hành', 10, '1'),
(5, 'Nghêu hấp', 39000, 'Đây là món nghêu hấp', 10, '1'),
(6, 'Ba chỉ cuộn lá xanh', 39000, 'Đây là món ba chỉ cuốn lá xanh', 3, '2'),
(7, 'Nghêu xào', 39000, 'Đây là món nghêu xào', 3, '2'),
(8, 'Rau muống xào tỏi', 35000, 'Đây là món rau muống xào tỏi', 10, '1'),
(9, 'Gỏi sứa', 39000, 'Đây là món gỏi sứa', 2, '1'),
(10, 'Càng cua trộn hải sản', 49000, 'Đây là món càng cua trộn hải sản', 4, '1'),
(11, 'Bạch tuộc nướng', 49000, 'Đây là món bạch tuộc nướng', 5, '3'),
(12, 'Đậu bắp luộc', 19000, 'Đây là món đậu bắp luộc', 10, '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`id`, `food_id`, `link`) VALUES
(2, 1, 'goibocay.jpg'),
(4, 2, 'echrangtieuxanh.jpg'),
(5, 3, 'khoaitaychien.jpg'),
(6, 4, 'bapnonxao.jpg'),
(7, 6, 'bachicuonlaxanh.jpg'),
(8, 5, 'ngheuhap.jpg'),
(9, 7, 'ngheuxao.jpg'),
(10, 8, 'daubapluoc.jpg'),
(11, 9, 'goisua.jpg'),
(12, 10, 'cangcuatronhaisan.jpg'),
(13, 11, 'bachtuocnuong.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(45) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `order_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `user_name`, `phone`, `email`, `password`, `role_id`) VALUES
(5, 'cung', 989710452, 'cung@gmail.com', 'password', 1),
(6, 'Nguyễn Văn Cưng', 989710345, 'cungnguyen112b3@gmail.com', '$2y$10$CdsQg4bBFNx/rmsDtYheUOtNUSoU.p7IhnA23cPG6Xf/CtSoPuHIC', 1),
(7, 'thuy', 989710345, 'thuy@gmail.com', '$2y$10$C1gLgCgu77aWbAJoXvsxIO41gYNhTmFFOn.62dfkixIl66oCrXG3m', 1),
(11, 'hung', 989710345, 'hung@gmail.com', '$2y$10$rWjxie5q9w.gcTjQzejpTOzdMS93d5ftD22JvzQ3C8.ZcFeVS5Pci', 1),
(13, 'Admin', 123456789, 'admin@gmail.com', '$2y$10$zWKL4C01Z1XyRNFY.PuyROSuQqK7Wf9KH8HCHpwaEVEj48jPZ6y3.', 2),
(15, 'Phạm Thị Thu Hà', 866487699, 'phamthithuha769999@gmail.com', '$2y$10$BOYL5Csnmga/7c46a4ffKOnoIoNQnvzb9mop/GcoqgtjpQwVpjwfG', 1),
(16, 'tuan', 123456711, 'tuan@gmail.com', '$2y$10$JyGwn9IGuXvUkQsstN5ruO.l4yqRehtK1S84/2M3xGXlfYg86tly6', 1),
(17, 'tao', 456872594, 'tao@gmail.com', '$2y$10$QXVxtsS4BEslUiZ80fl97uV5gaamS17bqq9yp3oHy0lB9iW2lvCwW', 1),
(20, 'kiet', 123456711, 'kiet@gmail.com', '$2y$10$qLrF3ZD.V9MhvBLB1kokmeWw47cWgZNA6C.dg5VPet1Eb32bYxAdi', 1),
(22, 'Ngoc Hung', 965243205, 'tranngochung1302@gmail.com', '$2y$10$DYJbIw/3I.r.ZFO0FpKtoOjHns0wKuSBUKupardz0z.0G0Omf.r5W', 1),
(23, 'Tran Ngoc Hung Hung', 965243205, 'anhtran@gmail.com', '$2y$10$ytchy562.gvJwW7UUJgsqOrsTYRiZdjwICpAh7W4HdBajiv0pinWK', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cate_name` (`cate_name`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `food_name` (`food_name`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`id`),
  ADD KEY `role_ibfk_1` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
