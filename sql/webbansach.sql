-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 22, 2023 lúc 04:53 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webbansach`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `userId`, `productId`, `qty`, `productName`, `productPrice`, `productImage`) VALUES
(85, 51, 9, 1, 'CHUYỆN CHA CON - ƯỚM GIÀY', '23000', 'uomgiay.jpg'),
(102, 49, 10, 1, 'CHUYỆN CHA CON - CHÚNG TA HÒA BA NHÉ!', '26000', 'hoa.jpg'),
(105, 48, 9, 1, 'CHUYỆN CHA CON - ƯỚM GIÀY', '23000', 'uomgiay.jpg'),
(140, 58, 2, 1, 'Sách tiếng anh lớp 1', '90000', 'TA1.jpg '),
(145, 59, 25, 1, 'DORAEMON TRUYỆN NGẮN - TẬP 3', '20000', 'cd748e6627.jpg'),
(157, 1, 5, 2, 'HELLO CHÀO LỚP 1 – TÔ CHỮ CÁI TIẾNG VIỆT', '24001', 'hello1.png'),
(158, 1, 32, 1, 'Hướng dẫn nấu ăn 200 món truyền thống', '120000', 'c5b934e84d.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(2, 'Sách lớp 1', 1),
(4, 'Sách Nuôi Dạy Con', 0),
(5, 'Sách Kinh Doanh', 0),
(7, 'Tiểu thuyết', 1),
(8, 'Truyện tranh', 1),
(9, 'Lịch sử', 1),
(12, 'Sách tiếng anh', 0),
(13, 'Sách tham khảo lớp 6', 1),
(14, 'Sách tham khảo lớp 7', 1),
(15, 'Sách tham khảo lớp 8', 0),
(16, 'Sách tham khảo lớp 9', 0),
(17, 'Tâm lý - Kỹ Năng Sống ', 1),
(18, 'Khoa học kỹ thuật', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `congty`
--

CREATE TABLE `congty` (
  `id` int(10) UNSIGNED NOT NULL,
  `tencty` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `diachi` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phongban` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `congty`
--

INSERT INTO `congty` (`id`, `tencty`, `diachi`, `phongban`) VALUES
(1, '2000', '18 đường số 53', 'IT'),
(3, '2001\r\n', 'Quang trung', 'sales');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `frequent_asks`
--

CREATE TABLE `frequent_asks` (
  `id` int(30) NOT NULL,
  `question_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `frequent_asks`
--

INSERT INTO `frequent_asks` (`id`, `question_id`) VALUES
(1, 10),
(2, 13),
(3, 16),
(4, 21),
(5, 10),
(6, 13),
(7, 16),
(8, 20),
(9, 55),
(10, 10),
(11, 13),
(12, 16),
(13, 21),
(14, 51),
(15, 61),
(16, 62),
(17, 65),
(18, 10),
(19, 13);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(51, 48, '2022-10-11', '2022-10-11', 'Hoàn thành'),
(52, 1, '2022-10-12', '2022-10-12', 'Hoàn thành'),
(53, 51, '2022-10-12', '2022-10-15', 'Delivering'),
(54, 1, '2022-11-02', '2022-12-12', 'Hoàn thành'),
(55, 1, '2022-12-05', '2022-12-12', 'Hoàn thành'),
(56, 1, '2022-12-10', '2023-04-23', 'Hoàn thành'),
(57, 1, '2022-12-10', NULL, 'a'),
(58, 1, '2022-12-10', '2023-05-06', 'Hoàn thành'),
(59, 1, '2022-12-10', '2023-05-09', 'Đang giao hàng'),
(60, 48, '2022-12-11', NULL, 'Processing'),
(61, 52, '2022-12-12', NULL, 'Processing'),
(62, 52, '2022-12-12', '2022-12-15', 'Processed'),
(63, 1, '2022-12-13', '2023-05-09', 'Đang giao hàng'),
(64, 1, '2022-12-13', '2023-05-09', 'Đã xử lý'),
(65, 1, '2023-03-20', '2023-04-26', 'Đang giao hàng'),
(66, 59, '2023-05-13', '2023-05-16', 'Đang giao hàng'),
(67, 59, '2023-05-13', NULL, 'Đang xử lý'),
(68, 1, '2023-05-21', '2023-05-29', 'Đã xử lý'),
(70, 60, '2023-05-26', '2023-05-29', 'Đang giao hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(53, 51, 2, 1, '15000', 'Vở luyện viết Tiếng Anh lớp 1', 'TA1.jpg'),
(54, 52, 9, 1, '23000', 'CHUYỆN CHA CON - ƯỚM GIÀY', 'uomgiay.jpg'),
(55, 53, 5, 1, '23000', 'HELLO CHÀO LỚP 1 – TÔ CHỮ CÁI TIẾNG VIỆT', 'hello1.png'),
(56, 53, 9, 0, '23000', 'CHUYỆN CHA CON - ƯỚM GIÀY', 'uomgiay.jpg'),
(57, 54, 9, 1, '23000', 'CHUYỆN CHA CON - ƯỚM GIÀY', 'uomgiay.jpg'),
(58, 55, 5, 1, '23000', 'HELLO CHÀO LỚP 1 – TÔ CHỮ CÁI TIẾNG VIỆT', 'hello1.png'),
(59, 56, 9, 1, '23000', 'CHUYỆN CHA CON - ƯỚM GIÀY', 'uomgiay.jpg'),
(60, 58, 5, 0, '23000', 'HELLO CHÀO LỚP 1 – TÔ CHỮ CÁI TIẾNG VIỆT', 'hello1.png'),
(61, 59, 7, 3, '36000', 'BÀI TẬP TUẦN TOÁN 1 - TẬP 2', 'BTtoan1.jpg'),
(62, 60, 5, 1, '23000', 'HELLO CHÀO LỚP 1 – TÔ CHỮ CÁI TIẾNG VIỆT', 'hello1.png'),
(63, 61, 5, 1, '23000', 'HELLO CHÀO LỚP 1 – TÔ CHỮ CÁI TIẾNG VIỆT', 'hello1.png'),
(64, 62, 4, 1, '99000', 'EHON KỸ NĂNG SỐNG - EM LÀM VIỆC NHÀ', 'sachlamviec1.jpg'),
(65, 63, 9, 1, '23000', 'CHUYỆN CHA CON - ƯỚM GIÀY', 'uomgiay.jpg'),
(66, 63, 2, 1, '900', 'Sách tiếng anh lớp 1', 'TA1.jpg '),
(67, 64, 10, 14, '26000', 'CHUYỆN CHA CON - CHÚNG TA HÒA BA NHÉ!', 'hoa.jpg'),
(68, 65, 2, 1, '900', 'Sách tiếng anh lớp 1', 'TA1.jpg '),
(69, 66, 25, 1, '20000', 'DORAEMON TRUYỆN NGẮN - TẬP 3', 'cd748e6627.jpg'),
(70, 67, 24, 1, '20000', 'DORAEMON TRUYỆN NGẮN - TẬP 2', 'd7242df8f4.jpg'),
(71, 68, 28, 1, '30000', 'Truyện Ngắn Nam Cao (Sách Bỏ Túi)', '20f5c03c99.jpg'),
(72, 70, 37, 2, '85000', 'Rèn Kỹ Năng Giải Các Dạng Bài Toán (Cơ Bản Và Nâng Cao) Lớp 6 - Tập 2', '02f3e2fd71.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `des` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(2, 'Sách tiếng anh lớp 1', '120000', '90000', 'TA1.jpg ', 1, '0000-00-00', 2, 4, 'Vở Luyện Viết 5 Ô Li Tiếng Anh Lớp 1 - Cuốn sách giúp các em giải quyết những khó khăn của học sinh lớp 1 trong học tiếng Anh khi có những âm vần ở tiếng Việt chưa học.', 1, 8),
(3, 'PHIẾU BÀI TẬP CUỐI TUẦN TIẾNG ANH 1 ', '68000', '54000', 'phieubaitap1.jpg', 1, '0000-00-00', 2, 9, 'Global Success - Phiếu Bài Tập Cuối Tuần Tiếng Anh 1 (35 Tuần Học) - Phiếu bài tập cuối tuần Tiếng Anh 1 gồm các bài luyện tập chia theo tuần, ôn tập tổng quát kiến thức của 35 tuần học. Ngoài ra cuốn sách cũng cung cấp các bài kiểm tra giữa kỳ và cuối kỳ để các con trau dồi thêm, tự tin chinh phục điểm cao trong các bài kiểm tra trên lớp.', 1, 6),
(4, 'EHON KỸ NĂNG SỐNG - EM LÀM VIỆC NHÀ', '90000', '95000', 'sachlamviec1.jpg', 1, '0000-00-00', 2, 18, '', 1, 11),
(5, 'HELLO CHÀO LỚP 1 – TÔ CHỮ CÁI TIẾNG VIỆT', '30000', '24001', 'hello1.png', 1, '2022-10-07', 2, 15, 'Hello Chào Lớp 1 – Tô Chữ Cái Tiếng Việt - dành cho trẻ từ 3 – 6 tuổi, giúp trẻ làm quen đầy đủ và trang bị kiến thức toàn diện nhất trước khi vào lớp 1', 1, 7),
(6, 'BIG HERO CHINH PHỤC TIẾNG ANH THEO CHỦ ĐỀ LỚP 1', '68000', '55000', 'big1.jpg', 1, '2022-10-07', 2, 5, 'Big Hero Chinh Phục Tiếng Anh Theo Chủ Đề Lớp 1 - Bộ sách là tài liệu tham khảo đầy đủ, toàn diện, với phần lý thuyết và bài tập của đủ các mảng kiến thức: từ vựng, ngữ âm, ngữ pháp.\r\n', 1, 5),
(7, 'BÀI TẬP TUẦN TOÁN 1 - TẬP 2', '40000', '36000', 'BTtoan1.jpg', 1, '2022-10-07', 2, 43, 'Bài Tập Tuần Toán 1 - Tập 2 (Bám Sát SGK Cánh Diều Và Kết Nối Cùng Học Để Phát Triển Năng Lực - ND) - Các dạng bài tập bám sát cấu trúc để thi giúp học sinh ôn tập và rèn luyện để tự tin khi bước vào kì thi. Dòng kẻ ô ly giúp học sinh viết và làm bài thuận tiện.', 1, 6),
(8, '7 BƯỚC CHUYỂN TUỔI DẬY THÌ', '140000', '120000', 'sachchame.jpeg', 1, '2021-12-07', 4, 7, '7 Bước Chuyển Tuổi Dậy Thì - Cha Mẹ Thấu Hiểu - Con Gái Hạnh Phúc - Cuốn sách đưa đến cho các cha mẹ một khung nền tổng quát để thấu hiểu con gái mình, cùng lúc đối diện với những câu hỏi phổ biến nhất.', 1, 3),
(9, 'CHUYỆN CHA CON - ƯỚM GIÀY', '300000', '230000', 'uomgiay.jpg', 1, '2021-12-07', 4, 4, 'Chuyện Cha Con - Cùng Bé Phát Triển Chỉ Số EQ - Ướm Giày - Chuyện cha con ngắn gọn, súc tích nhưng trẻ sẽ học được cách thể hiện cảm xúc rất dễ dàng khi có đối tượng mình tin tưởng và biết lắng nghe. Qua đó, các bậc phụ huynh cũng hiểu tâm lý con trẻ và tìm được cách nối gần hơn mối quan hệ của cha mẹ và con cái.\r\n', 1, 10),
(10, 'CHUYỆN CHA CON - CHÚNG TA HÒA BA NHÉ!', '30000', '26000', 'hoa.jpg', 1, '2021-12-07', 2, 18, 'Chuyện Cha Con - Cùng Bé Phát Triển Chỉ Số EQ - Chúng Ta Hòa Ba Nhé! - Chuyện cha con ngắn gọn, súc tích nhưng trẻ sẽ học được cách thể hiện cảm xúc rất dễ dàng khi có đối tượng mình tin tưởng và biết lắng nghe. Qua đó, các bậc phụ huynh cũng hiểu tâm lý con trẻ và tìm được cách nối gần hơn mối quan hệ của cha mẹ và con cái', 1, 14),
(11, 'CON LẠNH LẮM, MẸ CÓ THỂ ÔM CON KHÔNG?\r\n', '128000', '111000', 'lanhlam.jpg', 1, '2022-12-27', 4, 10, 'Con Lạnh Lắm, Mẹ Có Thể Ôm Con Không? - Đọc hết cuốn sách này, bạn sẽ nhận ra phương pháp nuôi dạy con tốt nhất trên đời chính là cha mẹ tự tu dưỡng thân – tâm - trí.', 1, 0),
(12, 'TRÒ CHUYỆN CÙNG CON - CHUYỆN LỚN HÓA CHUYỆN CỎN CON\r\n', '180000', '150000', 'trochuyen.jpg', 1, '2021-12-07', 4, 10, 'Trò Chuyện Cùng Con - Chuyện Lớn Hóa Chuyện Cỏn Con - Cuốn sách giúp trẻ xây dựng kỹ năng tự điều chỉnh, đem đến cho trẻ sự tự tin, tử tế, tự quản và đạt được thành tích nhất định.', 1, 0),
(13, '\r\nCOMBO HARVARD BUSINESS REVIEW ON POINT (TRỌN BỘ 12 CUỐN)', '2100000', '2000000', 'combo.jpg', 1, '2021-12-07', 5, 13, 'Combo Harvard Business Review On Point (Trọn Bộ 12 Cuốn) - Cẩm nang kinh doanh cho nhà quản trị trong thời đại 4.0 từ Trường đào tạo Kinh tế hàng đầu thế giới – Đại học Harvard.', 1, 7),
(14, 'COMBO LÃNH ĐẠO PHONG CÁCH JOHN C. MAXWELL (BỘ 5 CUỐN)', '29000000', '28000000', 'lanhdao.jpg', 1, '2021-12-07', 5, 15, 'Combo Lãnh Đạo Phong Cách John C. Maxwell (Bộ 5 Cuốn) - Phẩm chất lãnh đạo nằm sâu tiềm ẩn trong mỗi con người chúng ta, nhưng không phải ai cũng có thể phát huy hay vận dụng nó một cách đúng đắn. Thật vậy, chính điều đó mới tạo nên cái mà ta gọi là \"Xã Hội\"', 1, 0),
(15, 'COMBO DẠY CON LÀM GIÀU - ROBERT T. KIYOSAKI - TRỌN BỘ 13 TẬP\r\n', '29500000', '10500000', '12.jpg', 1, '2021-12-07', 5, 10, 'Combo Dạy Con Làm Giàu - Robert T. Kiyosaki - Trọn Bộ 13 Tập - Giúp các bậc cha mẹ nhận ra những thay đổi hàng ngày và có cách nhìn mới để dạy con những kiến thức về kỹ năng sống, về cuộc sống để chúng thành công và giàu có khi chúng bước vào đời.', 1, 0),
(16, 'COMBO ĐỊNH GIÁ - TĂNG LỢI NHUẬN NHỜ GIÁ BÁN (BỘ 7 CUỐN)', '1130000', '1030000', 'dinhgia.jpg', 1, '2021-12-07', 5, 10, 'Combo Định Giá - Tăng Lợi Nhuận Nhờ Giá Bán (Bộ 7 Cuốn) - Các nhà quản trị sẽ nhìn nhận được sản phẩm doanh nghiệp mình đang nằm ở vị trí nào trên thị trường, đưa ra các quyết định, sách lược về giá đúng đắn và có những điều chỉnh phù hợp với thế thời.', 1, 0),
(17, 'COMBO HBR ON POINT (9 CUỐN)', '1510000', '1510000', 'combo2.png', 1, '2021-12-07', 5, 20, 'Combo HBR On Point (9 Cuốn) Một bộ tài liệu trọn vẹn, bắt kịp tư duy kinh doanh của thời đại nhằm đưa ra những giải pháp triệt để và kiến thức quản trị nâng cao giúp nhà lãnh đạo - quản lý đối phó với biến động của nền kinh tế toàn cầu\r\n', 1, 0),
(18, 'COMBO BỘ 4 CUỐN BINH PHÁP CHO DOANH NGHIỆP', '1430000', '1430000', 'combo4.jpg', 1, '2021-12-07', 5, 5, 'Combo Bộ 4 Cuốn Binh Pháp Cho Doanh Nghiệp -Bộ gồm tuyển tập 4 cuốn sách sẽ cung cấp những công cụ mạnh mẽ cùng các tư duy chiến lược xây dựng lên mô hình kinh doanh hiệu quả cho doanh nghiệp', 1, 0),
(21, 'Những ngã tư và những cột đèn', '150000', '120000', '68f3ee7432.jpg', 1, '2023-05-06', 7, 100, '\"Tôi qua ngã tư Cửa Nam. Ngã tư Cửa Nam đầy khói. Để không thể đếm bao nhiêu nốt chân trên ngã tư. Ai đếm bao nhiêu nốt chân khôn dại. Bao nhiêu nốt chân vui buồn? Ai đếm những ngã tư đời láo nháo nốt chân. Láo nháo cột đèn láo nháo đèn? Đời tôi đã rẽ rồi. Như đã hạ nước cờ không sao đi lại được. Nhưng tại sao tôi cứ ám ảnh: cái ngã tư tại sao ấy. Tôi quên không được. Đi đi không được. Tôi ngồi bệt lề đường. Tôi là đàn ông: tôi không đau khổ. Nhưng tôi muốn khóc. Tôi là đàn ông: Tôi không khóc. Nhưng tôi đau khổ lắm. Tôi ngồi bệt mà nhìn láo nháo cột đèn. Láo nháo khói. Láo nháo hàng cây bên đường lá rụng. Tôi nghe gà gáy te te nội thành. Chỗ tôi ngồi không xa có vườn hoa Canh Nông. Tôi lảo đảo dậy: tôi đi tìm vườn hoa Canh Nông. Tôi vào vườn hoa. Tôi ngồi ghế đá. Ghế đá lạnh. Gà gáy te te. Phố bắt đầu mất khói. Vườn hoa cũng bắt đầu hết khói. Là rạng đông rồi. Tôi không mệt. Buồn ngủ cũng không. Tôi đã nói rồi: tôi đi thấu sáng. Bây giờ tôi ngồi. Cùng với rạng đông. Trong một vườn hoa', 1, 0),
(22, 'NGƯỜI ĐI VẮNG', '350000', '325000', '1349d5b219.jpg', 1, '2023-05-06', 7, 50, 'Giới thiệu tóm tắt tác phẩm:\r\nNgười đi vắng, tự cái tựa đó đã nói rất nhiều. Cô đơn. Vô hình. Bí ẩn. Khoảng trống. Người đi vắng (1999) là một trong những khởi điểm của dòng chảy Nguyễn Bình Phương vào thế giới vô thức, mộng mị, hồng hoang, sẽ được tiếp nối bằng Trí nhớ suy tàn (2000) và Thoạt kỳ thuỷ (2004).\r\n\r\nCư dân của Người đi vắng là những hồn ma, những kẻ sống dở chết dở, những dòng sông, giọt sương, tiếng chuông... Nhưng có lẽ nhân vật nữ, Hoàn, chính là người đi vắng ly kỳ nhất. Tiểu thuyết dành phần mở đầu mô tả mối tình tay ba của Hoàn với Thắng và Cương, người chồng và người tình. Hoàn lao xe xuống vực, cơ thể huỷ hoại còn hồn phiêu diêu. Từ đó, xen kẽ những giấc mơ của Hoàn là kỷ niệm, âm hưởng, dư vị, dấu ấn mà tấm thân nhục dục trước đây của cô để lai trong hai người đàn ông. Trong Người đi vắng, tình yêu/tình dục/tâm linh gắn với nhau như hình với bóng. Chúng hiện lên lung linh, lẫn lộn vật chất tinh thần, chồng chéo giằng co nhau qua những sợi dây thần bí. Người đi vắn', 1, 0),
(23, 'ONE PIECE COLOR WALK 9 - TIGER (TẶNG KÈM POSTCARD, BẢNG STICKER VÀ POSTER GẬP)', '210000', '120000', '7ef5cd6e95.jpg', 1, '0000-00-00', 8, 32, '\r\nARTBOOK ONE PIECE COLOR WALK 9: TIGER!! - TIẾP TỤC CẤT BƯỚC TRONG THẾ GIỚI SẮC MÀU!!\r\n\r\nBằng việc ra mắt tập Artbook thứ 9, tác giả Eiichiro Oda đã đưa Series Artbook OP trở thành loạt Artbook Manga dài nhất từng được NXB Kim Đồng phát hành! Tất cả các tập đều được Fans ủng hộ nhiệt liệt!! Càng ý nghĩa hơn, khi tập Artbook Tiger của chúng ta ra mắt đúng dịp kỉ niệm 100 tập OP!\r\n\r\nTrong tập này, ngoài những tranh màu mới siêu rực rỡ, với công nghệ in 6 màu cao cấp từ tác giả Oda, ở cuối sách sẽ có phần giao lưu đặc biệt, gặp gỡ họa sĩ Eisaku Kubonouchi - Người tham gia thực hiện đoạn phim quảng cáo HUNGRY DAYS cho hãng thực phẩm NISSIN! Công bố những phác thảo thiết kế của tác giả dành cho dự án FILM GOLD, WORLD SEEKER, KYOTO - Nhật kí hành trình băng Mũ Rơm ~ Một Wano quốc khác ~ , TOKYO OP TOWER LIVE ATTRACTION, TGC KUMAMOTO & rất nhiều những nội dung hấp dẫn!!\r\n\r\nSách cũng được đính kèm sẵn quà tặng kèm là Poster dài, Postcard và bảng Sticker đặc biệt!! Các Fan của OP chắc chắn sẽ ', 1, 0),
(24, 'DORAEMON TRUYỆN NGẮN - TẬP 2', '30000', '20000', 'd7242df8f4.jpg', 1, '0000-00-00', 8, 19, 'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.\r\n\r\n\r\nTÁC GIẢ - HỌA SĨ FUJIKO F FUJIO\r\n \r\nTên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).\r\nSau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.\r\nNăm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.\r\nNhững tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân M', 1, 1),
(25, 'DORAEMON TRUYỆN NGẮN - TẬP 3', '35000', '20000', 'cd748e6627.jpg', 1, '0000-00-00', 8, 19, 'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.\r\n\r\nTÁC GIẢ - HỌA SĨ FUJIKO F FUJIO \r\nTên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).\r\nSau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.\r\nNăm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.\r\nNhững tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”', 1, 1),
(26, 'Tuyển Tập Nguyên Hồng', '130000', '110000', '86e908e563.jpg', 1, '0000-00-00', 9, 20, 'Tuyển Tập Nguyên Hồng\r\nTên thật của ông là Nguyễn Nguyên Hồng, sinh ngày 5 tháng 11 năm 1918 ở Nam Định. Những tác phẩm của ông mang một tình cảm nhân đạo thống thiết . Sinh trưởng trong một gia đình nghèo, mồ côi cha, từ nhỏ theo mẹ ra Hải Phòng kiếm sống trong các xóm chợ nghèo. Nguyên Hồng ham đọc sách từ nhỏ. ông thường dành tiền thuê sách để đọc và dường như đọc hết những quyển sách mình thích ở cửa hàng cho thuê sách tại Nam Định. Loại sách Nguyên Hồng thích thuở nhỏ là truyện lịch sử Trung Hoa, trong đó những nhân vật có khí phách ngang tàng, trung dũng, những hảo hán chiếm cảm tình của ông nhiều nhất. Nguyên Hồng Tuyển Tập - Quyển sách tập hợp các tác phẩm hay nhất của nhà văn Nguyên Hồng', 1, 0),
(27, 'Tuyển Tập Kim Lân', '80000', '70000', '9cb12c8d76.jpg', 1, '0000-00-00', 9, 20, 'Tuyển Tập Kim Lân\r\n\r\nNhà văn Kim Lân tên thật là Nguyễn Văn Tài, sinh ngày 1 tháng 8 năm 1921 (28 tháng 6 Tân Dậu), tại xã Phù Lưu, huyện Từ Sơn (nay là Tiên Sơn), tỉnh Bắc Ninh. Nhà nghèo, hồi nhỏ cậu bé Tài chỉ học đến lớp Nhất, rồi phải đi phụ việc cho các thợ đàn anh (sơn guốc, khắc tranh bình phong) để giúp gia đình kiếm sống.\r\n\r\n \r\n\r\n     Nhờ chịu khó quan sát và suy ngẫm, lại có dịp đi đến nhiều làng xã trong vùng, nên từ hồi còn ít tuổi, ông đã có vốn hiểu biết khá dày dặn về những phong tục tập quán và tinh hoa văn hóa dân gian trong cuộc sống ở vùng Kinh Bắc quê hương ông, chuẩn bị tốt để ông trở thành nhà văn sau này với những trang đặc sắc về phong tục nông thôn Việt Nam và cả trong những bước cách mạng chuyển mình.\r\nĐầu những năm 40, trên các báo Tiểu thuyết thứ Bảy và Trung Bắc Chủ nhật, ông đã có một số truyện được đăng với tên mới là Kim Lân trong lúc còn là anh thợ sơn guốc. Ở loạt truyện này, chủ yếu Kim Lân kể lại những cảnh đời cơ khổ và một số sinh hoạt văn hóa pho', 1, 0),
(28, 'Truyện Ngắn Nam Cao (Sách Bỏ Túi)', '40000', '30000', '20f5c03c99.jpg', 1, '0000-00-00', 9, 19, 'Truyện Ngắn Nam Cao Cái chết của con mực Chí Phèo Dì Hảo Đón khách Đôi mắt Đời thừa Giăng sáng Lang Rận Lão Hạc Mò sâm banh Một bữa no Trẻ con không được ăn thịt chó Tư cách mõ Từ ngày mẹ chết', 1, 1),
(29, 'Việt Nam Sử Lược - Trần Trọng Kim (Bìa Cứng)', '500000', '400000', 'a9ad256c15.jpg', 1, '2023-05-13', 9, 10, 'Công ty phát hành:  Công Ty Cổ Phần Văn Hóa Đông A\r\nKích thước:   18.5 x 26.5 cm\r\nLoại bìa:   Bìa cứng\r\nSố trang:   656\r\nNhà xuất bản:  Nhà Xuất Bản Văn Học', 1, 0),
(30, 'Everyday Conversations English - Tự Học Tiếng Anh Cho Người Bận Rộn', '150000', '95000', '474e8c69f3.jpg', 1, '2023-05-13', 17, 10, 'Everyday English For Grown-ups - Tự Học Tiếng Anh Cho Người Bận Rộn\r\n\r\nBạn đăng bức hình ngôi nhà đẹp lộng lẫy để chia sẻ về cuộc sống sung túc của mình trên mạng xã hội nhưng dòng trạng thái lại là: “It’s is my life.”\r\n\r\nMọi nỗ lực diễn đạt đều trở nên vô nghĩa một khi đã SAI NGỮ PHÁP. Vậy chẳng lẽ mỗi khi cần dùng đến tiếng Anh, bạn phải kè kè vài cuốn sách dày cộp bên cạnh hay sao?\r\n\r\nCâu trả lời là: Không, vì bạn đã có Everyday English for grown-ups. Một cuốnsáchđủ NHỎ để mang đi muôn nơi; hệ thống những kiến thức CƠ BẢN giúp bạn sử dụng ĐÚNG trong nhiều ngữ cảnh và quan trọng nhất là: Một cách học HIỆU QUẢ với thời gian EO HẸP. \r\n\r\nBắt đầu từ bảng chữ cái, cuốn sách sẽ từng bước khám phá từ những yếu tố cơ bản của tiếng Anh viết và nói – chính tả, trật tự từ, dấu câu, từ loại – cho đến ngữ điệu, những sai lầm cần tránh và bí quyết để đảm bảo tính mạch lạc và thậm chí là tính thanh lịch.\r\n\r\nHãy luyện tập mỗi ngày và bạn sẽ tránh được những lỗi sai “dở khóc dở cười” khi sử dụng thứ ', 1, 0),
(31, 'American English', '300000', '250000', '46cf66c7e7.jpg', 1, '2023-05-13', 17, 10, '12', 1, 0),
(32, 'Hướng dẫn nấu ăn 200 món truyền thống', '150000', '120000', 'c5b934e84d.jpg', 1, '2023-05-15', 17, 10, 'Đây là cuốn sách dành cho những người yêu thích và muốn trải nghiệm những món ăn ngon của nền ẩm thực truyền thống Việt Nam. Với sự tham gia của nhiều tác giả, các chuyên gia đầu bếp hàng đầu về ẩm thực 3 miền, cuốn sách này được ví như bí kíp nấu ăn bởi nó hội tụ đủ những hương vị chọn lọc từ 3 miền Bắc, Trung, Nam của đất nước Việt Nam. Các món ăn được thể hiện qua hình ảnh bắt mắt, giới thiệu về nguyên liệu, cách chế biến cùng với đó là những yêu cầu khắt khe về thành phẩm.', 1, 0),
(33, 'Bài Tập Tiếng Anh 6 - Tập 1 (Không Đáp Án) - Dùng Kèm SGK Tiếng Anh 6 Global Success (2022)', '45000', '38000', '2f4cadd0f9.jpg', 1, '2023-05-20', 13, 20, 'Bài Tập Tiếng Anh 6 - Tập 1 (Không Đáp Án) - Dùng Kèm SGK Tiếng Anh 6 Global Success (2022)\r\n\r\nNhằm giúp các em học sinh có thêm tài liệu để ôn luyện và thực hành môn tiếng Anh 6 theo chương trình mới của Bộ Giáo dục và Đào tạo, chúng tôi biên soạn bộ sách Bài tập tiếng Anh 6.\r\n\r\nBài tập tiếng Anh 6 gồm hai tập tương ứng với hai tập sách giáo khoa Tiếng Anh 6 Global Success của Nhà Xuất Bản Giáo dục Việt Nam.\r\n\r\nBài tập tiếng Anh 6 - tập 1 gồm 6 đơn vị bài tập, được biên soạn theo sát nội dung của 6 đơn vị bài học trong sách Tiếng Anh 6 - tập 1. Mỗi đơn vị bài tập gồm 5 phần:\r\n\r\n- Phần A - Phonetics: các bài tập ngữ âm giúp củng cố khả năng phát âm và khả năng nhận biết các âm được phát âm giống nhau hoặc khác nhau.\r\n\r\n- Phần B - Vocabulary and Grammar: các bài tập về từ vựng và ngữ pháp giúp ôn luyện từ vựng và củng cố kiến thức ngữ pháp trong từng đơn vị bài học.\r\n\r\n- Phần C - Speaking: các bài tập đặt câu hỏi, hoàn tất đoạn hội thoại, sắp xếp đoạn hội thoại, vv. giúp rèn luyện kỹ nă', 1, 0),
(34, 'The Langmaster - Em Học Giỏi Tiếng Anh Lớp 6 - Tập 2 (Có Đáp Án)', '70000', '66000', '04b559dc60.jpg', 1, '2023-05-20', 13, 20, 'The Langmaster - Em Học Giỏi Tiếng Anh Lớp 6 - Tập 2 (Có Đáp Án)\r\n\r\n\"Bộ sách “Em học giỏi tiếng Anh lớp 6 tập 1 và tập 2” được biên soạn theo khung giáo trình tiếng Anh đang được giảng dạy trong các trường Tiểu học trên toàn quốc\r\nBộ sách được biên soạn rất công phu, kỹ lưỡng và tâm huyết của các giáo viên, giảng viên có nhiều kinh nghiệm giảng dạy ở các trường chuyên Anh.\r\n\r\nBộ sách được chia thành 2 tập:\r\n\r\nTập 1: từ Unit 1 đến Unit 6\r\n\r\nTập 2: từ Unit 7 đến Unit 12\r\n\r\nVới mỗi bài học, chúng tôi đều biên soạn theo ba phần kiến thức cơ bản: Lý thuyết, thực hành ngôn ngữ và thực hành kỹ năng.\r\n\r\nPhần Lý thuyết tổng hợp nội dung ngữ pháp quan trọng của từng bài học.\r\n\r\nPhần Thực hành ngôn ngữ được trình bày một cách chi tiết, khoa học theo ba phần: Từ vựng–Ngữ âm–Ngữ pháp giúp các em vận dụng các kiến thức trong phần Lý thuyết.\r\n\r\nPhần Thực hành kỹ năng: Các bài tập được biên soạn theo từng bài học có nội dung tương ứng với bài học trong sách giáo khoa giúp các học sinh thực hành kỹ năn', 1, 0),
(35, 'Chinh Phục Bộ Đề Thi Tiếng Anh Vào Lớp 6 (Tái Bản 2022)', '100000', '95000', 'b91c0d7426.jpg', 1, '2023-05-20', 13, 20, 'Chinh Phục Bộ Đề Thi Tiếng Anh Vào Lớp 6 (Tái Bản 2022)\r\n\r\nCuốn “Chinh phục bộ đề thi Tiếng Anh vào lớp 6” lần này sẽ là cẩm nang giúp các em rút ngắn khoảng cách và những hạn chế trong hiểu biết của mình để đến với những đề thi vào lớp 6, thi vào các trường huyên, lớp Chọn sát với đề thi chính thức.\r\n\r\n- Đề thi phong phú, đa dạng, bám sát chương trình của PGD & ĐT\r\n\r\n- Đề tham khảo cho học sinh vào các trường Chuyên, lớp Chọn\r\n\r\n- Đề thi tham khảo hữu ích cho học sinh và giáo viên\r\n\r\nCác bài tập được phân cấp rõ ràng từ dễ đến khó, từ đơn giản đến phức tạp. Sau mỗi đề thi sẽ có đáp án cụ thể cho từng bài. Các em sẽ đón nhận ở đó trọn vẹn những gì các em còn thiếu sót để chuẩn bị tốt nhất cho kỳ thi vào lớp 6 sắp tới.\r\n\r\nMã hàng	8935236426831\r\nCấp Độ/ Lớp	Lớp 6\r\nCấp Học	Cấp 2\r\nTên Nhà Cung Cấp	Nhà Sách Minh Thắng\r\nTác giả	Bùi Văn Vinh, Ngô Thanh Tâm\r\nNXB	Đại Học Quốc Gia Hà Nội\r\nNăm XB	2022\r\nTrọng lượng (gr)	407\r\nKích Thước Bao Bì	27 x 19 x 1.1 cm\r\nSố trang	211\r\nHình thức	Bìa Mềm\r\nSản ', 1, 0),
(36, 'Rèn Kỹ Năng Giải Các Dạng Bài Toán (Cơ Bản Và Nâng Cao) Lớp 6 - Tập 1', '100000', '85000', 'adc807557d.jpg', 1, '2023-05-20', 13, 20, 'Nhằm đáp ứng nhu cầu luyện tập, củng cố kiến thức và nâng cao kỹ năng giải toán, Megabook đã biên soạn bộ sách Rèn kỹ năng giải các dạng bài Toán (cơ bản và nâng cao) dành riêng cho đối tượng học sinh THCS\r\n\r\nBộ sách được thiết kế bám sát với khung chương trình giáo dục phổ thông mới của Bộ Giáo dục và Đào tạo, nội dung phù hợp với các em học sinh học các bộ sách giáo khoa Cánh Diều, Chân Trời Sáng Tạo, Kết Nối Tri Thức Với Cuộc Sống.\r\n\r\nBộ sách tổng hợp đầy đủ nội dung của khung chương trình toán THCS, nội dung phân dạng với phương pháp giải rõ ràng, giúp các em học sinh dễ dàng nắm bắt kiến thức và nhớ được trình tự giải toán theo logic từ dễ đến khó.\r\n\r\nNHỮNG ƯU ĐIỂM VƯỢT TRỘI CỦA CUỐN SÁCH:\r\n\r\n1. Nội dung kiến thức bám sát khung chương trình của Bộ Giáo dục và Đào tạo\r\n\r\n- Tập 1 gồm 3 chương với 24 chủ đề bám sát chương trình mới của Bộ Giáo dục và Đào tạo như: Số tự nhiên, Số nguyên, phân số.\r\n\r\n2. Phương pháp giải cụ thể cho từng dạng bài\r\n\r\nSách Cung cấp phương pháp giải chung v', 1, 0),
(37, 'Rèn Kỹ Năng Giải Các Dạng Bài Toán (Cơ Bản Và Nâng Cao) Lớp 6 - Tập 2', '100000', '85000', '02f3e2fd71.jpg', 1, '2023-05-20', 13, 18, 'Nhằm đáp ứng nhu cầu luyện tập, củng cố kiến thức và nâng cao kỹ năng giải toán, Megabook đã biên soạn bộ sách Rèn kỹ năng giải các dạng bài Toán (cơ bản và nâng cao) dành riêng cho đối tượng học sinh THCS\r\n\r\nBộ sách được thiết kế bám sát với khung chương trình giáo dục phổ thông mới của Bộ Giáo dục và Đào tạo, nội dung phù hợp với các em học sinh học các bộ sách giáo khoa Cánh Diều, Chân Trời Sáng Tạo, Kết Nối Tri Thức Với Cuộc Sống.\r\n\r\nBộ sách tổng hợp đầy đủ nội dung của khung chương trình toán THCS, nội dung phân dạng với phương pháp giải rõ ràng, giúp các em học sinh dễ dàng nắm bắt kiến thức và nhớ được trình tự giải toán theo logic từ dễ đến khó.\r\n\r\nNHỮNG ƯU ĐIỂM VƯỢT TRỘI CỦA CUỐN SÁCH:\r\n\r\n1. Nội dung kiến thức bám sát khung chương trình của Bộ Giáo dục và Đào tạo\r\n\r\n- Tập 1 gồm 3 chương với 24 chủ đề bám sát chương trình mới của Bộ Giáo dục và Đào tạo như: Số tự nhiên, Số nguyên, phân số.\r\n\r\n2. Phương pháp giải cụ thể cho từng dạng bài\r\n\r\nSách Cung cấp phương pháp giải chung v', 1, 2),
(38, 'Thực Hành Toán 6 - Tập 1', '50000', '40000', '4a5ca022d2.jpg', 1, '2023-05-20', 13, 20, 'Bộ sách Thực hành Toán được biên soạn bám sát Chương trình GIáo dục phổ thông mới. Các bài tập được thiết kế theo tuần, giúp các em củng cố, vận dụng, mở rộng kiến thức đã học. \r\n\r\nNhiều dạng bài tập phong phú, đa dạng giúp các em học tốt và hứng thú hơn với môn học.', 1, 0),
(39, 'Thực Hành Toán 6 - Tập 2', '50000', '40000', '6b236b0510.jpg', 1, '2023-05-20', 13, 20, 'Bộ sách Thực hành Toán được biên soạn bám sát Chương trình GIáo dục phổ thông mới. Các bài tập được thiết kế theo tuần, giúp các em củng cố, vận dụng, mở rộng kiến thức đã học. \r\n\r\nNhiều dạng bài tập phong phú, đa dạng giúp các em học tốt và hứng thú hơn với môn học.', 1, 0),
(40, 'Tăng Cường Tin Học Quốc Tế - Dành Cho Lớp 6 - Ic3 Gs6 Level 1', '100000', '70000', '962fc892bc.jpg', 1, '2023-05-20', 13, 20, 'Tăng Cường Tin Học Quốc Tế - Dành Cho Lớp 6 - Ic3 Gs6 Level 1\r\n\r\nNhằm hỗ trợ quí thầy cô và học sinh trong việc dạy và học, với mục tiêu vừa học chương trình tin học Quốc gia, nhưng đồng thời có thể học và lấy được chứng chỉ của chương trình Tin học Quốc tế IC3 GS6 - Level 1, nhóm biên soạn giáo trình Tin học Quốc tế của tổ chức giáo dục IIG Vietnam biên soạn giáo trình này.\r\n\r\nSo với các bộ giáo trình trước đây, bộ giáo trình “Tin học Quốc tế IC3 GS6 - Level 1” có những đặc điểm như sau:\r\n\r\n• Nội dung sát với các mục tiêu bài thi IC3 GS6 - Level 1;\r\n\r\n• Bổ sung các nội dung trong chương trình Tin học lớp 6 của Bộ Giáo dục & Đào tạo nhằm đảm bảo nội dung trong yêu cầu của mục tiêu bài thi chứng chỉ quốc tế;\r\n\r\n• Cách trình bày gần gũi với sách giáo khoa nhà trường.\r\n\r\nBộ giáo trình là tài liệu bổ trợ, giúp học sinh bổ sung các kiến thức được cập nhật mới nhất, ngang tầm với trình độ cùng cấp của các nước trên toàn thế giới. Chúng tôi rất mong nhận được sự phản hồi, đóng góp ý kiến của ', 1, 0),
(41, 'Hướng Dẫn Học Ngữ Văn 7 - Tập 1 (Dùng Kèm Sách Giáo Khoa Chân Trời Sáng Tạo)', '80000', '60000', 'b2f44e0dc8.jpg', 1, '2023-05-20', 14, 20, 'Hướng Dẫn Học  Ngữ Văn 7 (Bám Sát SGK Chân trời sáng tạo)\r\n\r\nVới mong ước giảm bớt gánh nặng cho quý thầy cô và giúp các em khám phá vẻ kì thú của văn chương, Nhà sách gửi đến bạn đọc bộ sách tham khảo Ngữ văn 7 (dùng cho bộ sách giáo khoa bám sát sách giáo khoa chân trời sáng tạo  ). Mỗi bộ sách tham khảo sẽ bám sát chương trình của từng bộ sgk mới. Phần gợi ý theo hướng mở, có các câu hỏi mở rộng, nâng cao,… phù hợp với phương pháp dạy học phát triển phẩm chất và năng lực. Với kiến thức sâu rộng từ những tác giả có bề dày giảng dạy trong nhiều năm, chắc chắn các quyển sách do Nhà sách chúng tôi phát hành sẽ đảm bảo chặt chẽ về mặt nội dung lẫn cách trình bày, giúp các em học sinh dễ dàng tiếp thu kiến thức từ cơ bản đến nâng cao, góp phần thúc đẩy sự yêu thích và say mê trong học tập và rèn luyện, phát triển trí tuệ và nâng cao năng lực bản thân.\r\n\r\nChúc các em trở thành những người con ngoan trò giỏi của gia đình và xã hội.', 1, 0),
(42, 'Tiếng Anh Lớp 7 - Sách Học Sinh (Global Success) (2022)', '100000', '70000', '3b906c1905.jpg', 1, '2023-05-20', 14, 20, 'Tiếng Anh Lớp 7 - Sách Học Sinh (Global Success) (2022), nội dung sách là sự kết hợp nhuần nhuyễn giữa những giá trị văn hóa, phong tục quen thuộc của người Việt với những nét văn hóa quốc tế, đặc biệt từ các quốc gia nói Tiếng Anh có nền kinh tế văn hóa phát triển. Điều này không chỉ giúp học sinh khi tiếp thu kiến thức sẽ thấy gần gũi với đời sống thường ngày. Có thể tìm được trong bộ sách những hình ảnh của bản thân. Cũng như khám phá thêm được nhiều dạng thức văn hóa đa quốc gia. Các em sẽ ngày càng tự tin khi sử dụng Tiếng Anh như một ngôn ngữ thứ hai để dễ dàng hòa nhập, phát triển bản thân khi có cơ hội được đặt vào môi trường hợp tác toàn cầu hóa trong tương lai.\r\n\r\nBộ sách giáo khoa Tiếng Anh Global Success được biên soạn đồng bộ, thống nhất từ lớp 1 đến lớp 12 do GS.TS. Hoàng Văn Vân là Tổng chủ biên có đội ngũ tác giả 100% là người Việt', 1, 0),
(43, 'Luyện Giải Bộ Đề Bồi Dưỡng Học Sinh Giỏi Tiếng Anh Lớp 7', '100000', '80000', '49d903c524.jpg', 1, '2023-05-20', 14, 20, 'Luyện giải bộ đề Bồi dưỡng học sinh giỏi tiếng Anh lớp 7 là cuốn sách giúp học sinh tổng hợp lại kiến thức từ cơ bản đến nâng cao, cùng bộ đề ôn luyện học sinh giỏi với các bài tập đa dạng và bám sát chương trình học.\r\n\r\nCẤU TRÚC TỔNG QUAN CỦA CUỐN SÁCH\r\n\r\nPhần I – Ôn tập kiến thức\r\n\r\nPhần II – Luyện giải đề học sinh giỏi\r\n\r\nPhần III – Lời giải chi tiết\r\n\r\nNHỮNG ƯU ĐIỂM NỔI BẬT CỦA CUỐN SÁCH\r\n\r\n1. Là cuốn sách tổng ôn đầy đủ, chi tiết nhất – Vừa ôn tập kiến thức vừa luyện giải đề thi học sinh giỏi, đi kèm lời giải chi tiết.\r\n\r\n2. Tổng hợp và mở rộng toàn bộ kiến thức với 13 Chuyên đề của chương trình học tiếng Anh lớp 7 theo Bộ Giáo dục & Đào tạo.\r\n\r\nMỗi chuyên đề sẽ có đầy đủ & chi tiết:\r\n\r\nPronunciation → Grammar Structure → Vocabulary\r\n\r\nDưới mỗi phần lý thuyết là các bài tập vận dụng kèm lời giải, giúp các em dễ dàng ghi nhớ kiến thức vừa học và biết cách vận dụng cụ thể.\r\n\r\n3. Biên soạn, chọn lọc 10 đề ôn luyện học sinh giỏi hay và bám sát đề thi thật\r\n\r\nCác đề thi cung cấp hệ thố', 1, 0),
(44, 'Giải Bài Tập Toán Lớp 7 - Tập 1 (Theo Bộ Sách Chân Trời Sáng Tạo)', '80000', '65000', 'c2d154874e.jpg', 1, '2023-05-20', 14, 20, 'Giải Bài Tập Toán Lớp 7 - Tập 1 (Theo Bộ Sách Chân Trời Sáng Tạo)\r\n\r\nNhằm giúp các em có thêm tài liệu tham khảo, Nhà xuất bản Giáo dục Việt Nam đã tổ chức biên soạn bộ sách Giải bài tập Toán lớp 7 để sử dụng song song với các cuốn sách sau:\r\n\r\nSách giáo khoa Toán lớp 7 (Bộ sách chân trời sáng tạo)\r\nSách bài tập Toán lớp 7 (Bộ sách chân trời sáng tạo)\r\nBộ sách này sẽ giúp các em trả lời câu hỏi và giải bài tập trong sách giáo khoa (SGK), sách bài tập (SBT) Toán lớp 7 – Bộ sách Chân trời sáng tạo một cách chi tiết và cụ thể.\r\n\r\nCấu trúc sách gồm: Chương/Chủ đề; Bài tương ứng với các Chương/Chủ đề; Bài trong SGK và SBT Toán lớp 7 – Bộ sách Chân trời sáng tạo. Mỗi bài có các phần chính sau:\r\n\r\n- Kiến thức trọng tâm\r\n\r\n- Hướng giải bài tập trong SGK Toán lớp 7 – Bộ sách Chân trời sáng tạo\r\n\r\n- Hướng dẫn giải bài tập trong SBT Toán lớp 7 – Bộ sách Chân trời sáng tạo\r\n\r\nSau khi học lý thuyết, các em nên cố gắng tự giải bài tập. Nếu gặp khó khăn, các em có thể tham khảo lời giải của bộ sách n', 1, 0),
(45, 'Bồi Dưỡng Năng Lực Tự Học Môn Khoa Học Tự Nhiên 7', '100000', '85000', '333d16b349.jpg', 1, '2023-05-20', 14, 20, 'Tự học là cơ mở của mọi hoạt động học tập. Tuy nhiên, hiện nay nhiều học sinh chim có thói quen tự học, còn học một cách đối phó, thụ động dẫn đến kết quả học tập chim cao. Môn Khoa học tự nhiên ở lớp 7 là môn học mới, được xây dựng và phát triển trên nền tảng các lĩnh vực Vật lí, Hoá học, Sinh học và Khoa học Trái Đất. Khoa học tự nhiên là cơ sở của nhiều ngành quan trọng trong nền kinh tế, xã hội, có liên quan chặt chẽ với cuộc sống. do đó rất cần được sự quan tâm hướng dẫn, bồi thường năng lực tự học cho học sinh.\r\n\r\nMôn Khoa học tự nhiên 7 bao gồm các lĩnh vực:\r\n\r\nNội dung lĩnh vực Vật lí trong môn Khoa học tự nhiên 7 với các chủ đề: Tốc độ: Âm thanh; Ánh sáng: Tử. Đây là những chủ đề rất gần gũi với cuộc sống, hứa hẹn những kiến thức mới bổ ích, hấp dẫn.\r\n\r\nNội dung lĩnh vực Hoá học trong môn Khoa học tự nhiên 7 với các chủ đề: Nguyên tử; Nguyên tố hoá học; Sơ lược về bảng tuần hoàn các nguyên tố hoá học; Phân tử. Đây là những chủ đề về thế giới vi mô khá trừu tượng', 1, 0),
(46, 'Ngữ Pháp Tiếng Anh Lớp 8 (Theo Chương Trình Khung Của Bộ Giáo Dục Và Đào Tạo)', '80000', '60000', '7f10d467cd.jpg', 1, '2023-05-20', 15, 20, 'Ngữ Pháp Tiếng Anh 8 (Theo Chương Trình Khung Của Bộ Giáo Dục Và Đào Tạo)\r\n\r\nNhằm giúp các em học sinh lớp 8 có tài liệu học tập và thực hành ngữ pháp, chúng tôi biên soạn Ngữ pháp tiếng Anh 8.\r\n\r\nNgữ pháp tiếng Anh 8 tổng hợp các điểm ngữ pháp trọng yếu dựa theo khung chương trình mới ngữ pháp tiếng Anh lớp 8 của Bộ GD&ĐT. Sách gồm 3 phần:\r\n\r\n- Tense (Thì)\r\n\r\n- Parts of Speech (Từ loại)\r\n\r\n- Sentence Structures (Cấu trúc câu)\r\n\r\nCác chủ điểm ngữ pháp trong mỗi phần được trình bày rõ ràng, chi tiết nhằm giúp các em học sinh dễ dàng ghi nhớ và nắm vững phần lý thuyết.\r\n\r\n', 1, 0),
(47, 'Sổ Tay Học Nhanh Toàn Diện Kiến Thức Và Dạng Bài Hóa Học Lớp 8-9', '60000', '50000', '504b2a385b.jpg', 1, '2023-05-20', 15, 20, 'NHỮNG ƯU ĐIỂM CỦA CUỐN SÁCH\r\n\r\nTổng hợp toàn bộ những kiến thức trọng tâm của chương trình Hóa học THCS. Chỉ với cuốn sách này, các teen lớp 8, lớp 9 hoàn toàn có thể nắm chắc kiến thức để làm bài tập và ôn luyện trước các kì kiểm tra\r\n\r\nĐược coi là cuốn sổ tay thần thánh không chỉ tổng hợp lý thuyết, công thức hóa học, cuốn sách còn tổng hợp các dạng bài thường gặp nhất trong các đề kiểm tra. Sau khi học lý thuyết, các bài thực hành giúp người học hiểu sâu sắc và nhớ lâu hơn.\r\n\r\nPhần định hướng giải bài giúp người học tập tư duy, nắm được cách làm bài cho từng dạng bài cụ thể\r\n\r\nĐáp án chi tiết giúp người học đối chiếu, tự kiểm tra năng lực, từ đó đối chiếu để thấy được sự tiến bộ của bản thân.\r\n\r\nCuốn sổ tay nhỏ gọn giúp người học có thể mang theo để học mọi lúc mọi nơi, vô cùng tiện lợi.\r\n\r\nVới những ưu điểm trên, Sổ tay học nhanh toàn diện kiến thức và dạng bài Hóa học lớp 8,9 chắc chắn là người bạn đồng hành không thể thiếu trên hành trình chinh phục môn Hóa học của các em học sin', 1, 0),
(48, 'Học Tốt Toán 8 Hình Học (Trung Học Cơ Sở)', '70000', '60000', 'e628818d4c.jpg', 1, '2023-05-20', 15, 20, 'Học Tốt Toán 8 Hình Học (Trung Học Cơ Sở)', 1, 0),
(49, 'Bồi Dưỡng Học Sinh Giỏi Vật Lí 8', '70000', '50000', '291aff2c7f.jpg', 1, '2023-05-20', 15, 20, 'Cuốn sách này được biên soạn dựa theo kiến thức của chương trình sách giáo khoa Vật lí của Bộ Giáo dục và Đào tạo. Quyển sách này giúp cho người đọc tham khảo lý thuyết cơ bản ở sách giáo khoa và các dạng bài tập từ cơ bản đến nâng cao, có hướng dẫn giải cụ thể để giúp quý phụ huynh, thầy cô và các em học sinh tiện theo dõi tham khảo.\r\nQua cuốn sách này, chúng tôi hy vọng có thể giúp được cho các em có niềm đam mê học môn vật lí có thêm điều kiện trong quá trình học tập của mình.', 1, 0),
(50, '150 Bài Văn Hay Lớp 8 (Tái Bản)', '100000', '80000', 'da04ee40bf.jpg', 1, '2023-05-20', 15, 20, 'Cuốn sách 150 Bài Làm Văn Hay Lớp 8 nhằm giúp các em học sinh, phụ huynh và các thầy cô giáo có thêm một tài liệu tham khảo.\r\n\r\n150 Bài Làm Văn Hay Lớp 8 có cấu trúc gồm 4 phần:\r\n\r\nPhần một: Văn tự sự\r\n\r\nPhần hai: Văn miêu tả kết hợp tự sự\r\n\r\nPhần ba: Văn thuyết minh\r\n\r\nPhần bốn: Văn nghị luận.\r\n\r\nNội dung các bài văn trong sách khá phong phú, sát chương trình và có nâng cao mở rộng. Cuốn sách sẽ là một trong những tài liệu bổ ích dành cho các em học sinh trong việc học môn Tập làm văn theo hướng tích hợp của sách giáo khoa mới.\r\n\r\n', 1, 0),
(51, 'Chinh Phục Luyện Thi Vào 10 Môn Tiếng Anh Theo Chủ Đề', '150000', '120000', 'f627363fa3.jpg', 1, '2023-05-20', 16, 20, 'Chinh phục luyện thi vào 10 môn Tiếng Anh theo chủ đề là cuốn sách trong bộ sách “Chinh phục luyện thi vào 10 theo chủ đề” được biên soạn bởi các tác giả uy tín và nhiều năm kinh nghiệm giảng dạy, luyện thi vào lớp 10. Cuốn sách được tổng hợp bài bản, cập nhật mới nhất các nội dung được đưa vào đề thi môn tiếng Anh những năm gần đây, chắc chắn sẽ giúp các em vững vàng kiến thức, tự tin đạt điểm cao trong kỳ thi sắp tới.\r\n\r\nChinh phục luyện thi vào 10 theo chủ đề: Hơn cả sự mong đợi về một bộ sách tổng hợp chuyên đề trọng tâm cho học sinh lớp 9.\r\n\r\nBộ sách Chinh phục luyện thi vào 10 theo chủ đề:\r\n\r\n- Đầy đủ và chi tiết nhất về các chuyên đề trọng tâm 100% có trong đề thi\r\n\r\n- Bổ sung lý thuyết, kiến thức căn bản một cách bài bản, dễ hiểu, dễ vận dụng\r\n\r\n- Lộ trình kiến thức khoa học từ cơ bản đến nâng cao\r\n\r\n- Đáp án, lời giải chi tiết, rõ ràng\r\n\r\n5 ƯU ĐIỂM NỔI BẬT CHỈ CÓ Ở CHINH PHỤC LUYỆN THI VÀO 10 MÔN TIẾNG ANH THEO CHỦ ĐỀ\r\n\r\n 1. Tổng hợp đầy đủ 16 chuyên đề trọng tâm trong chương ', 1, 0),
(52, 'Chinh Phục Luyện Thi Vào Lớp 10 Môn Ngữ Văn Theo Chủ Đề', '150000', '120000', '10482bbc69.jpg', 1, '2023-05-20', 16, 20, 'Cuốn sách nằm trong bộ 3 cuốn Chinh phục luyện thi vào 10 theo chủ đề - Toán Văn Anh.\r\n\r\nChinh phục luyện thi vào 10 theo chủ đề: Hơn cả sự mong đợi về một bộ sách tổng hợp chuyên đề trọng tâm cho học sinh lớp 9.\r\n\r\nBộ sách Chinh phục luyện thi vào 10 theo chủ đề:\r\n\r\n- Đầy đủ và chi tiết nhất về các chuyên đề trọng tâm 100% có trong đề thi\r\n\r\n- Bổ sung lý thuyết, kiến thức căn bản một cách bài bản, dễ hiểu, dễ vận dụng\r\n\r\n- Lộ trình kiến thức khoa học từ cơ bản đến nâng cao\r\n\r\n- Đáp án, lời giải chi tiết, rõ ràng\r\n\r\n5 ƯU ĐIỂM NỔI BẬT CHỈ CÓ Ở CHINH PHỤC LUYỆN THI VÀO 10 MÔN NGỮ VĂN THEO CHỦ ĐỀ\r\n\r\nTổng hợp đầy đủ 4 chuyên đề trọng tâm của chương trình thi vào 10\r\n\r\n4 chuyên đề lớn 100% xuất hiện trong các đề thi tuyển sinh vào 10: Tiếng Việt, Đọc – Hiểu văn bản, Nghị luận xã hội và Nghị luận văn học\r\n\r\nDiễn giải chi tiết, khoa học các kiến thức cần ghi nhớ của mỗi chuyên đề\r\n\r\nMỗi chuyên đề được biên soạn đầy đủ, chi tiết từ kiến thức cơ bản, phương pháp làm bài đến các bài tập vận dụng', 1, 0),
(53, 'Chinh Phục Luyện Thi Vào Lớp 10 Môn Toán Theo Chủ Đề', '150000', '120000', '3e4d1b33cb.jpg', 1, '2023-05-20', 16, 20, 'Chinh phục luyện thi vào 10 môn Toán theo chủ đề là cuốn sách trong bộ sách “Chinh phục luyện thi vào 10 theo chủ đề” được biên soạn bởi các tác giả uy tín và nhiều năm kinh nghiệm giảng dạy, luyện thi vào lớp 10. Cuốn sách được tổng hợp bài bản, cập nhật mới nhất các nội dung được đưa vào đề thi môn Toán những năm gần đây, chắc chắn sẽ giúp các em vững vàng kiến thức, tự tin đạt điểm cao trong kỳ thi sắp tới.\r\n\r\nCuốn sách nằm trong bộ 3 cuốn Chinh phục luyện thi vào 10 theo chủ đề - Toán Văn Anh.\r\n\r\nChinh phục luyện thi vào 10 theo chủ đề: Hơn cả sự mong đợi về một bộ sách tổng hợp chuyên đề trọng tâm cho học sinh lớp 9.\r\n\r\nBộ sách Chinh phục luyện thi vào 10 theo chủ đề:\r\n\r\n- Đầy đủ và chi tiết nhất về các chuyên đề trọng tâm 100% có trong đề thi\r\n\r\n- Bổ sung lý thuyết, kiến thức căn bản một cách bài bản, dễ hiểu, dễ vận dụng\r\n\r\n- Lộ trình kiến thức khoa học từ cơ bản đến nâng cao\r\n\r\n- Đáp án, lời giải chi tiết, rõ ràng\r\n\r\n5 ƯU ĐIỂM NỔI BẬT CHỈ CÓ Ở CHINH PHỤC LUYỆN THI VÀO 10 MÔN TO', 1, 0),
(54, 'Combo Sách Chinh Phục Toàn Diện Hóa Học Lớp 9 (Bộ 2 Cuốn)', '180000', '150000', 'c62dde3c2d.jpg', 1, '2023-05-20', 16, 20, 'Combo Sách Chinh Phục Toàn Diện Hóa Học Lớp 9 (Bộ 2 Cuốn)\r\n\r\n1. Tự Học Toàn Diện Hóa Học - Từ Cơ Bản Đến Nâng Cao Lớp 9\r\n\r\nTự học toàn diện Hóa học – Từ cơ bản đến nâng cao lớp 9 là cuốn sách được trình bày theo các chuyên đề học tập, kèm bài tập vận dụng và đề kiểm tra giúp các học sinh lớp 9 có thể dễ dàng tự học, ôn luyện môn Hóa học ngay tại nhà một cách bài bản, khoa học và hiệu quả.\r\n\r\nTự học toàn diện Hóa học – Từ cơ bản đến nâng cao lớp 9 biên soạn toàn bộ chương trình Hóa học lớp 9 với 5 ƯU ĐIỂM NỔI BẬT\r\n\r\nTổng hợp 5 chuyên đề trọng tâm nhất – Bám sát 100% chương trình đào tạo của Bộ Giáo dục & Đào tạo\r\n\r\nBao gồm:\r\n\r\n- Chương 1: Các loại hợp chất vô cơ\r\n\r\n- Chương 2: Kim loại\r\n\r\n- Chương 3: Phi kim\r\n\r\n- Chương 4: Hiđrocacbon\r\n\r\n- Chương 5: Dẫn xuất của Hiđrocacbon – Polime.232\r\n\r\nMỗi chuyên đề được xây dựng với kết cấu vô cùng chặt chẽ\r\n\r\nCấu trúc mỗi chuyên đề: Bài kiểm tra đánh giá năng lực số 1 >> Bảng theo dõi quá trình tự ôn tập >> Kiến thức trọng tâm >> Một số phương phá', 1, 0),
(55, 'Bí Quyết Chinh Phục Điểm Cao Địa Lí 9', '150000', '130000', '5ba166eac2.jpg', 1, '2023-05-20', 16, 20, 'Bí quyết chinh phục điểm cao Địa lí 9\r\n\r\nLên lớp 9, các em sẽ được học về địa lý dân cư, địa lý kinh tế và sự phân hóa lãnh thổ. Tuy các chủ đề nội dung khá gần gũi với cuộc sống nhưng với lượng kiến thức phải học thuộc nhiều, cùng yêu cầu phân tích các bảng số liệu thống kê có tần suất khá dày đã khiến không ít học sinh gặp khó khăn trong việc tiếp cận và khai thác kiến thức môn Địa.\r\n\r\nNhằm giúp các em dễ dàng tổng hợp kiến thức và đạt điểm cao đối với môn Địa lí 9, chúng tôi đã nghiên cứu và biên soạn cuốn sách “Bí quyết chinh phục điểm cao Địa lí 9”. Cuốn sách nằm trong bộ “Bí quyết chinh phục điểm cao lớp 9” gồm 8 môn học: Toán (2 tập), Ngữ văn, tiếng Anh (2 tập), Vật lí, Hóa học, Sinh học, Địa lí, Lịch sử do NXB Đại học Quốc gia Hà Nội phát hành.\r\n\r\nCấu trúc nội dung sách “Bí quyết chinh phục điểm cao Địa lí 9”\r\n\r\nSách được chia thành 3 phần: Phần 1 - Bài học, Phần 2 - Đề kiểm tra, Phần 3 - Đáp án. Cụ thể:\r\n\r\nPhần 1: Nội dung kiến thức\r\n\r\nNội dung sách được trình bày theo trình t', 1, 0),
(56, 'Việt Sử Diễn Họa', '150000', '130000', 'ec410616d4.jpg', 1, '2023-05-21', 9, 20, 'Việt Sử Diễn Họa\r\n\r\nLịch sử Việt Nam từ thuở sơ khai cho đến khi lập quốc và trải qua thời kỳ phong kiến vẫn luôn là đề tài bất tận cho những sáng tạo sau này. Việt Sử Diễn Họa ra đời với mong muốn tái hiện lại những thời kỳ vàng son trong quá khứ một cách sinh động và chân thực nhất. Chắt lọc những điểm lịch sử nổi bật của từng giai đoạn, truyền tải thành những tranh vẽ trau chuốt, màu sắc rực rỡ, đội ngũ tác giả hy vọng Việt Sử Diễn Họa sẽ là tác phẩm gần gũi, dễ hiểu và bắt mắt với độc giả mọi lứa tuổi.\r\n\r\nVề in ấn:\r\n- Sách Việt Sử Diễn Họa được in màu trên giấy ốp. Giấy ốp bắt mực in, hấp thụ mực in tốt đồng thời có bề mặt nhám, không chói nên thích hợp để viết hoặc đọc..\r\n\r\n- Bìa cán mờ với lớp phủ mịn ít phản chiếu độ bóng, mang lại cái nhìn tự nhiên hơn. Các vết trầy xước vì thế cũng ít bị phát hiện hơn.\r\n\r\n- Sách dày 208 trang, khổ 19cm x 25cm.\r\n\r\n- Bên trong có 4 trang vẽ màu gấp nối. Bìa áo được bọc ngoài, khoét tròn tên sách ở giữa bìa.\r\n\r\n', 1, 0),
(57, 'Nghệ Thuật Thuyết Phục Tác Động Đến Người Khác', '220000', '190000', '6328c0cbf5.jpg', 1, '2023-05-21', 17, 20, 'Có bao giờ bạn tự hỏi chuyện gì sẽ xảy ra nếu mình thuyết phục được người khác làm bất cứ điều gì vào bất cứ lúc nào mình muốn?\r\n\r\nTất cả chúng ta đều biết đến những người có khả năng thuyết phục cực giỏi. Với sức cuốn hút tự nhiên, họ dần dần chiếm được lòng tin, sự quan tâm và ủng hộ của chúng ta hết lần này đến lần khác. Đó phải chăng là khả năng thiên phú? Hay thực ra họ đang tung hỏa mù nhằm tạo ảo giác?\r\n\r\nKhông, đó chính là nghệ thuật thuyết phục và bạn hoàn toàn có thể rèn luyện được.\r\n\r\nTrên cơ sở dày công phân tích hành vi và cách suy nghĩ của những người thành công nhất trong việc thuyết phục người khác, quyển sách này sẽ chỉ cho bạn bí quyết kỳ diệu để làm chủ khả năng thuyết phục – phương cách hiệu quả nhất giúp bạn gặt hái thành công trong công việc và cuộc sống.', 1, 0),
(58, 'Giao tiếp hiệu quả', '100000', '80000', 'e4ef927986.jpg', 1, '2023-05-21', 17, 20, 'Đây là một cuốn sách rất nổi tiếng và được đánh giá cao bởi độc giả. Cuốn sách cung cấp cho bạn những kiến thức, kỹ năng và chiến lược để cải thiện kỹ năng giao tiếp của mình.', 1, 0),
(59, 'American Accent Training ', '180000', '120000', '19e70d865e.jpg', 1, '2023-05-21', 17, 20, 'American Accent Training ', 1, 0),
(60, 'The Lean Startup', '250000', '230000', '8d93bf28d7.jpg', 1, '2023-05-21', 17, 20, 'Most startups fail. But many of those failures are preventable.  The Lean Startup is a new approach being adopted across the globe, changing the way companies are built and new products are launched.\r\n\r\nEric Ries defines a startup as an organization dedicated to creating something new under conditions of extreme uncertainty. This is just as true for one person in a garage or a group of seasoned professionals in a Fortune 500 boardroom. What they have in common is a mission to penetrate that fog of uncertainty to discover a successful path to a sustainable business.\r\n\r\nThe Lean Startup approach fosters companies that are both more capital efficient and that leverage human creativity more effectively.  Inspired by lessons from lean manufacturing, it relies on “validated learning,” rapid scientific experimentation, as well as a number of counter-intuitive practices that shorten product development cycles, measure actual progress without resorting to vanity metrics, and learn what customer', 1, 0),
(61, 'Start With Why', '250000', '230000', 'e95321e3ca.jpg', 1, '2023-05-21', 17, 20, 'Start with Why ', 1, 0),
(62, 'Mishkin - Kinh Tế Học Về Tiền, Ngân Hàng Và Thị Trường Tài Chính', '800000', '710000', 'dd9c86d6fc.jpg', 1, '2023-05-21', 17, 20, 'Mishkin - Kinh Tế Học Về Tiền, Ngân Hàng Và Thị Trường Tài Chính\r\n\r\nNhững ngày gần đây, giới tài chính – đầu tư trên toàn thế giới đang hưng phấn tột bậc nhưng cũng ưu tư tột cùng khi chứng kiến mức tăng và lập đỉnh kỷ lục của đồng tiền mật mã đang được quan tâm nhất hiện nay: Bitcoin. Không chỉ bitcoin, những đồng tiền tương tự cũng đang được quan tâm và trở thành một phần trong danh mục đầu tư của hàng triệu người, thậm chí ngay cả những định chế lớn toàn cầu. Trong khi đó, tại Việt Nam những ngày này, hàng triệu cá nhân và doanh nghiệp đang theo dõi sát sao những biến động của lãi suất và hành động điều tiết chính sách tiền tệ của Ngân hàng Nước nhằm phục hồi nền kinh tế hậu đại dịch covid-19.\r\n\r\nVậy những đồng tiền mã hóa kia có giá trị gì mà khiến cả thế giới phải chú ý như vậy? Tại sao cứ mỗi khi nền kinh tế bất ổn hoặc có dấu hiệu suy thoái, mọi con mắt sẽ đổ dồn về phía Ngân hàng Trung ương?\r\n\r\nTừ khóa cho những câu hỏi này có lẽ là chữ TIỀN.\r\n\r\nVậy, tiền là gì? Tiền từ đâu mà ', 1, 0),
(63, 'Khoa Học Về Nấu Ăn - The Science Of Cooking', '300000', '270000', '795ee39b80.jpg', 1, '2023-05-21', 17, 20, 'Nắm bắt các kiến thức khoa học và nấu ăn như một đầu bếp thực thụ!\r\n\r\nCùng tìm hiểu xem tại sao ướp thịt qua đêm là không cần thiết, ngâm nước các loại gia vị khô lại giúp gia tăng hương vị, tại sao tốt nhất là nên nướng hạt trong lò vi sóng và muối có thể giúp bạn chần trứng hoàn hảo như thế nào.\r\n\r\nNâng tầm kỹ năng và hoàn thiện cách thức nấu ăn của bạn!\r\n\r\nĐến từ bác sĩ, nhà khoa học thực phẩm, tiến sĩ Stuart Farrimond, người đã đưa khoa học về nấu ăn vào cuộc sống qua các chương trình truyền hình và phát thanh nổi tiếng.\r\n\r\nTÁC GIẢ:\r\nVới chuyên môn về khoa học thực phẩm, tiến sĩ Stuart Farrimond là một cây bút, người dẫn chương trình và nhà truyền thông về khoa học và sức khỏe.\r\n\r\nLà một bác sĩ và giáo viên y khoa được đào tạo bài bản, thường xuyên xuất hiện trên truyền hình, đài phát thanh và các sự kiện đại chúng của Anh, bài viết của ông cũng có mặt trên báo chí Anh và quốc tế, bao gồm Daily Mail, New Scientist, BBC Focus, The Independent và The Washington Post.\r\n\r\nÔng từng n', 1, 0),
(64, 'Giải Toán Và Ôn Luyện Hình Học Lớp 6', '40000', '30000', '36b127c7d1.jpg', 1, '2023-05-21', 13, 20, 'Giải Toán Và Ôn Luyện Hình Học Lớp 6', 1, 0),
(65, '199 Bài Và Đoạn Văn Hay Lớp 6 (Theo Chương Trình Giáo Dục Phổ Thông Mới)', '100000', '80000', '6811e56da2.jpg', 1, '2023-05-21', 13, 20, 'Từ năm học 2020 – 2021, các nhà trường triển khai chương trình Giáo dục phố thông mới. Với môn Ngữ văn, kiến thức không được tách thành 3 mảng Văn bản - Tiếng Việt - Tập làm văn như các SGK trước mà tổ chức theo các hoạt động Đọc, Viết, Nói và Nghe xoay quanh trục các văn bản đọc theo thể loại: truyện, thơ, kí, văn bản nghị luận, văn bản thông tin. Trong các hoạt động này, hoạt động Việt chiếm một vị trí hết sức quan trọng, thể hiện rõ nhất năng lực, kĩ năng và kiến thức của học sinh. Trong các bài kiểm tra Ngữ văn cũng không thể thiếu yêu cầu viết đoạn hoặc viết bài văn.\r\n\r\nNhằm gợi mở một cách viết đúng kiến thức và kĩ năng cho học sinh khi học và thi môn Ngữ văn 6, chúng tôi biên soạn bộ sách 199 bài là đoạn văn hay. Bộ sách được biên soạn theo chương trình Giáo dục phổ thông 2018, môn Tiếng Việt (đối với cấp Tiểu học), chương trình Ngữ văn (đối với cấp Trung học cơ sở và Trung học phổ thông), 199 đề bài trong sách bao gồm các mức độ từ dễ đến khó để phù hợp với yêu cầu của người họ', 1, 0),
(66, 'Bứt Phá 9+ Môn Tiếng Anh Lớp 6 (Kiến Thức Trọng Tâm Chương Trình Mới)', '200000', '170000', '923a8e31c3.jpg', 1, '2023-05-21', 13, 20, 'Bứt Phá 9+ Môn Tiếng Anh Lớp 6\r\n\r\n1. ĐINH NGHĨA:\r\n\r\nNằm trong bộ sách “Bứt phá 9+ lớp 6”, cuốn sách Bứt phá 9+ Môn Tiếng Anh lớp 6 được thiết kế với các chuyên đề khác nhau bám sát khung chương trình SGK mới (bộ Cánh diều, Kết nối tri thức với cuộc sống, Chân trời sáng tạo). Mỗi chuyên đề bao gồm phần lý thuyết và bài tập, hướng dẫn giải, giúp các các em dễ dàng làm quen với chương trình học mới đồng thời giúp tăng cường kĩ năng vận dụng, nắm chắc phương pháp giải các dạng bài.\r\n\r\n2. MỤC TIÊU HỌC TẬP:\r\n\r\n- Giúp học sinh nắm chắc các đơn vị kiến thức có trong chương trình lớp 6.\r\n\r\n- Đạt điểm số cao trên lớp.\r\n\r\n3. CẤU TRÚC:\r\n\r\n- Hệ thống kiến thức trọng tâm theo chủ đề: Cung cấp đầy đủ, trọng tâm theo từng đơn vị kiến thức giúp học sinh nắm chắc cơ bản và nâng cao, vận dụng giải quyết các câu hỏi trong đề thi.\r\n\r\n- Ví dụ từng dạng: Ở mỗi chuyên đề các em được cung cấp ví dụ minh họa, dấu hiệu nhận biết và các phương pháp làm bài phù hợp cho từng dạng có trong chủ đề đó.\r\n\r\n- Bài tập tự', 1, 0),
(67, 'Phương Pháp Tư Duy Tìm Cách Giải Toán Đại Số Lớp 7 (Dùng Chung Cho Các Bộ SGK Hiện Hành)', '80000', '50000', '8f66eac8b0.jpg', 1, '2023-05-21', 14, 15, 'Phương Pháp Tư Duy Tìm Cách Giải Toán Đại Số Lớp 7 (Dùng Chung Cho Các Bộ SGK Hiện Hành)\r\n\r\nBộ sách: Phương pháp tư duy tìm cách giải toán học gồm 12 tập:\r\n\r\n- Đại số lớp 7 gồm có tập 1 và tập 2.\r\n\r\n- Đại số lớp 8 gồm có tập 1 và tập 2.\r\n\r\n- Đại số lớp 9 gồm có tập 1 và tập 2.\r\n\r\n- Hình học lớp 7 gồm có tập 1 và tập 2.\r\n\r\n- Hình học lớp 8 gồm có tập 1 và tập 2.\r\n\r\n- Hình học lớp 9 gồm có tập 1 và tập 2.\r\n\r\nKhi viết bộ sách này tác giả nhằm các mục đích:\r\n\r\n- Góp phần vào phương pháp tư duy của học sinh và củng cố thêm phương pháp giải toán\r\n\r\n- Củng cố các kiến thức cơ bản có trong chương trình đã học ở sách giáo khoa.\r\n\r\n- Củng cố và rèn luyện thêm kĩ năng trình bày bài giải.\r\n\r\n- Với phụ huynh học sinh thì bộ sách này là sổ tay Toán học, là cẩm nang, là giáo án đơn giản góp phần nào củng cố kiến thức cơ bản cho những người có con em đang học các lớp trung học cơ sở.\r\n\r\nBộ sách viết theo chương mục có trong sách giáo khoa hiện hành.\r\n\r\nNgoài các bài tập có trong sách giáo khoa và sách', 1, 0),
(68, 'Phương Pháp Tư Duy Tìm Cách Giải Toán Hình Học Lớp 7 (Dùng Chung Cho Các Bộ SGK Hiện Hành)', '80000', '50000', 'bcd69e69c8.jpg', 1, '2023-05-21', 14, 25, 'Phương Pháp Tư Duy Tìm Cách Giải Toán Hình Học Lớp 7 (Dùng Chung Cho Các Bộ SGK Hiện Hành)\r\n\r\nBộ sách: Phương pháp tư duy tìm cách giải toán học gồm 12 tập:\r\n\r\n- Đại số lớp 7 gồm có tập 1 và tập 2.\r\n\r\n- Đại số lớp 8 gồm có tập 1 và tập 2.\r\n\r\n- Đại số lớp 9 gồm có tập 1 và tập 2.\r\n\r\n- Hình học lớp 7 gồm có tập 1 và tập 2.\r\n\r\n- Hình học lớp 8 gồm có tập 1 và tập 2.\r\n\r\n- Hình học lớp 9 gồm có tập 1 và tập 2.\r\n\r\nKhi viết bộ sách này tác giả nhằm các mục đích:\r\n\r\n- Góp phần vào phương pháp tư duy của học sinh và củng cố thêm phương pháp giải toán\r\n\r\n- Củng cố các kiến thức cơ bản có trong chương trình đã học ở sách giáo khoa.\r\n\r\n- Củng cố và rèn luyện thêm kĩ năng trình bày bài giải.\r\n\r\n- Với phụ huynh học sinh thì bộ sách này là sổ tay Toán học, là cẩm nang, là giáo án đơn giản góp phần nào củng cố kiến thức cơ bản cho những người có con em đang học các lớp trung học cơ sở.\r\n\r\nBộ sách viết theo chương mục có trong sách giáo khoa hiện hành.\r\n\r\nNgoài các bài tập có trong sách giáo khoa và sá', 1, 0);
INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(69, 'Hướng Dẫn Nói Và Viết Văn - Nghị Luận Xã Hội - Nghị Luận Văn Học Lớp 7', '90000', '80000', 'fbabe17424.jpg', 1, '2023-05-21', 14, 30, 'Hướng Dẫn Nói Và Viết Văn - Nghị Luận Xã Hội - Nghị Luận Văn Học Lớp 7 (Dùng Chung Cho Các Bộ SGK Hiện Hành)\r\n\r\nTrong chương trình Giáo dục phổ thông tổng thể 2018, môn Ngữ văn lớp 6, học sinh bước đầu đã biết viết dạng văn nghị luận. Kế thừa và phát triển theo định hướng “vòng tròn đồng tâm”, môn Ngữ văn lớp 7 tiếp tục định hướng cho học sinh rèn luyện kĩ năng viết, nói - nghe thể loại văn nghị luận ở mức độ mở rộng cao hơn. Cuốn sách Hướng dẫn viết, nói và nghe kiểu bài văn nghị luận xã hội, nghị luận văn học lớp 7 của nhóm tác giả Kiều Bắc, Nguyễn Quốc Khánh, Nguyễn Thị Hoa sẽ giúp thầy cô, các em học sinh và phụ huynh thuận lợi trong quá trình dạy và học.\r\n\r\nSách bao gồm:\r\n\r\n- Phần giới thiệu kiến thức, kĩ năng viết, nói - nghe các dạng bài văn nghị luận xã hội, nghị luận văn học.\r\n\r\n- Phần đề minh họa: gồm đề tham khảo (gợi ý dàn bài và bài văn hoàn chỉnh) hướng dẫn học sinh kĩ năng viết, nói – nghe văn nghị luận xã hội, nghị luận văn học.\r\n\r\nĐể sử dụng hiệu quả cuốn sách này, thầ', 1, 0),
(70, 'Sách Thế Chiến Thứ Hai (Antony Beevor)', '600000', '500000', '47edc7f1ef.png', 1, '2023-05-21', 9, 25, 'THẾ CHIẾN THỨ HAI - BIÊN NIÊN SỬ TOÀN DIỆN VÀ HẤP DẪN VỀ CUỘC XUNG ĐỘT TỒI TỆ NHẤT LỊCH SỬ NHÂN LOẠI\r\n\r\nMột bản tường thuật xuất sắc và vĩ đại của nhà sử học quân sự Antony Beevor\r\n\r\nĐược viết một cách ly kỳ và được nghiên cứu một cách xuất sắc, Thế chiến thứ hai như một bản tường thuật vĩ đại và đầy khiêu khích của Antony Beevor về cuộc đại chiến trong lịch sử nhân loại. Tác phẩm này cũng vô tình khẳng định thêm lần nữa rằng tác giả của nó thực sự là một trong những nhà sử học quân sự hạng nhất.', 1, 0),
(71, 'The Social Network', '250000', '200000', '99de593608.jpg', 1, '2023-05-21', 9, 25, 'The Social Network', 1, 0),
(72, 'Clean Code', '1000000', '800000', '444531e030.jpg', 1, '2023-05-26', 18, 20, 'Tác giả: Robert C. Martin\r\nMột cuốn sách có đầy đủ về lập trình ', 1, 0),
(73, 'The Pragmatic Programmer', '800000', '500000', 'e9c6c919bb.jpg', 1, '2023-05-26', 18, 20, 'Tác giả: Andrew Hunt \r\nWard Cunningham Straight from the programming trenches, The Pragmatic Programmer cuts through the increasing specialization and technicalities of modern software development to examine the core process--taking a requirement and producing working, maintainable code that delights its users. It covers topics ranging from personal responsibility and career development to architectural techniques for keeping your code flexible and easy to adapt and reuse. Read this book, and you’ll learn how to Fight software rot; Avoid the trap of duplicating knowledge; Write flexible, dynamic, and adaptable code; Avoid programming by coincidence; Bullet-proof your code with contracts, assertions, and exceptions; Capture real requirements; Test ruthlessly and effectively; Delight your users; Build teams of pragmatic programmers; and Make your developments more precise with automation. Written as a series of self-contained sections and filled with entertaining anecdotes, thoughtful ex', 1, 0),
(74, 'Code Complete', '500000', '400000', 'a4410b89e1.jpg', 1, '2023-05-26', 18, 25, 'Tác giả: Steve McConnell\r\nHere is a thorough expert look at the intricate process of commercial software development. The text is rich in example code, contains powerful insights on managing technical yet creative people, and examines each milestone in software development in considerable detail. Ideal for professional, self-taught, and student programmers.', 1, 0),
(75, 'The Art of Computer Programming', '5000000', '4500000', 'a0f40686a4.jpg', 1, '2023-05-26', 18, 10, 'Tác giả: Donald Knuth', 1, 0),
(76, 'Introduction to Algorithms', '500000', '450000', '2f69f23622.jpg', 1, '2023-05-26', 18, 25, 'Tác giả: Thomas Cormen\r\nCuốn sách chuyên về các thuật toán ', 1, 0),
(77, 'Kinh tế học tài chính', '500000', '450000', '99a55c3b41.jpg', 1, '2023-05-26', 18, 20, 'Tác giả: Robert Barro', 1, 0),
(78, 'HƯỚNG DẪN NÓI VÀ VIẾT VĂN NGHỊ LUẬN - BIỂU CẢM - THUYẾT MINH LỚP 6', '70000', '55000', 'be34df0ae0.jpg', 1, '2023-05-26', 13, 20, 'Hướng Dẫn Nói Và Viết Văn Nghị Luận - Biểu Cảm - Thuyết Minh Lớp 6 (Theo Chương Trình Giáo Dục Phổ Thông Mới)\r\n\r\nDạy học phát triển phẩm chất và năng lực là chủ trương thay đổi lớn trong chương trình giáo dục phổ thông tổng thể 2018. Thông qua quá trình dạy và học, học sinh hình thành và hoàn thiện đầy đủ những phẩm chất cốt yếu của con người như: yêu nước, nhân ái, trung thực, chăm chỉ, trách nhiệm.\r\n\r\nNội dung cuốn sách bao gồm:\r\n- Phần giới thiệu kiến thức, kĩ năng.\r\n- Phần luyện đề\r\n\r\nĐể sử dụng hiệu quả cuốn sách này, Thầy Cô và các em nên kết hợp chặt chẽ với sách giáo khoa.', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE `questions` (
  `id` int(30) NOT NULL,
  `question` text DEFAULT NULL,
  `response_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `questions`
--

INSERT INTO `questions` (`id`, `question`, `response_id`) VALUES
(1, 'hi', 1),
(2, '2', 1),
(3, 'xin chào', 1),
(4, 'hello', 1),
(5, 'chào bạn', 1),
(6, 'tôi cần mua sách', 1),
(7, 'tôi muốn mua sách', 1),
(8, 'à nhon', 1),
(9, 'chào', 1),
(10, 'sách tham khảo', 2),
(11, 'tham khảo', 2),
(12, 'giáo dục', 2),
(13, 'sách tham khảo lớp 6', 3),
(14, 'sách tham khảo 6', 3),
(15, 'sách tham khảo l 6', 3),
(16, 'Toán 6', 4),
(17, 'Toán lớp 6', 4),
(18, 'Toán l 6', 4),
(19, 'Toán lo 6', 4),
(20, 'Đại số lớp 6', 5),
(21, 'đại số 6', 5),
(22, 'đại số l 6', 5),
(23, 'Hình học lớp 6', 6),
(24, 'hình học 6', 6),
(25, 'hình học l 6', 6),
(26, 'Văn lớp 6', 7),
(27, 'Văn 6', 7),
(28, 'văn bản thơ ', 8),
(29, 'văn bản thơ lớp 6', 8),
(30, 'Văn bản văn nghị luận', 9),
(31, 'văn nghị luận', 9),
(32, 'Tiếng anh 6', 10),
(33, 'Tiếng anh lớp 6', 10),
(34, 'ngữ pháp và từ vựng', 11),
(35, 'sách tham khảo lớp 7', 12),
(36, 'sách tham khảo 7', 12),
(37, 'Toán 7', 13),
(38, 'Toán lớp 7', 13),
(39, 'Đại số lớp 7', 14),
(40, 'Đại số 7', 14),
(41, 'Hình học lớp 7', 15),
(42, 'hình học 7', 15),
(43, 'văn lớp 7', 16),
(44, 'văn 7', 16),
(45, 'văn học lớp 7', 16),
(46, 'văn bản văn nghị luận xã hội', 17),
(47, 'văn bản nghị luận xã hội', 17),
(48, 'tiếng anh 7', 18),
(49, 'tiếng anh lớp 7', 18),
(50, 'đọc hiểu và viết văn', 19),
(51, 'Sách tâm lý', 20),
(52, 'kỹ năng sống', 20),
(53, 'phát triển bản thân', 21),
(54, 'bản thân khởi nghiệp', 22),
(55, 'Cảm ơn', 23),
(56, 'Thanks', 23),
(57, 'Rất cảm ơn', 23),
(58, 'cảm ơn bạn', 23),
(59, 'Đặt hàng online', 24),
(60, 'online', 24),
(61, 'nấu ăn', 25),
(62, 'người mới bắt đầu', 26),
(63, 'người mới', 26),
(64, 'người mới nấu ăn', 26),
(65, 'món ăn đơn giản', 27),
(66, 'đồ ăn đơn giản', 27),
(67, 'món ăn phức tạp', 28),
(68, 'đồ ăn phức tạp', 28),
(69, 'khoa học kỹ thuật', 29),
(70, 'khoa học', 29),
(71, 'công nghệ thông tin', 30),
(72, 'it', 30),
(73, 'lập trình', 31),
(74, 'code', 31),
(75, 'phát triển phần mềm', 32),
(76, 'sách lịch sử', 33),
(77, 'lịch sử việt nam', 34),
(78, 'sách lịch sử việt nam', 34),
(79, 'Thời kỳ X đến XVII', 35),
(80, 'lịch sử thế giới', 36);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `responses`
--

CREATE TABLE `responses` (
  `id` int(30) NOT NULL,
  `response_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `responses`
--

INSERT INTO `responses` (`id`, `response_message`) VALUES
(1, 'Chào bạn! Bạn có câu hỏi nào liên quan đến sách hay đang tìm kiếm thông tin về sách nào ?, nhà sách chúng tôi chuyên cung cấp các chủ đề sách như sau: <a href=\"http://localhost:8080/bansach/productList.php?cateId=13\">Sách tham khảo</a>, <a href=\"http://localhost:8080/bansach/productList.php?cateId=17\">Sách tâm lý - kỹ năng sống</a>, <a href=\"http://localhost:8080/bansach/productList.php?cateId=18\">Khoa học kỹ thuật</a>, <a href=\"http://localhost:8080/bansach/productList.php?cateId=9\">Sách lịch sử</a>. '),
(2, 'Chào bạn! Tất nhiên, tôi sẽ giúp bạn. Bạn muốn tìm hiểu về sách tham khảo cho học sinh lớp mấy ? ví dụ: \"sách tham khảo lớp 6\" \"sách tham khảo lớp 7\"'),
(3, 'Bạn quan tâm đến chủ đề nào cụ thể như Toán 6, Văn 6, Tiếng Anh 6 ?'),
(4, 'Bạn đang gặp khó khăn trong toán đại số lớp 6 hay hình học lớp 6 ?'),
(5, 'Tuyệt vời! Cuốn sách <a href=\"http://localhost:8080/bansach/detail.php?id=37\">Rèn Kỹ Năng Giải Các Dạng Bài Toán</a> cung cấp kiến thức đại số theo cách dễ hiểu và trực quan. Nó giúp học sinh lớp 6 hiểu và áp dụng các khái niệm đại số vào giải các bài tập. Cuốn sách này cũng đi kèm với nhiều ví dụ và bài tập thực hành để học sinh rèn kỹ năng. Bạn có thể xem thông tin chi tiết về cuốn sách này và quyết định liệu nó phù hợp với nhu cầu của bạn không.'),
(6, 'Tuyệt vời! Cuốn sách <a href=\"http://localhost:8080/bansach/detail.php?id=64\">Giải Toán Và Ôn Luyện Hình Học Lớp 6</a> cung cấp kiến thức hình học theo cách dễ hiểu và trực quan. Nó giúp học sinh lớp 6 hiểu và áp dụng các khái niệm hình học vào giải các bài tập. Cuốn sách này cũng đi kèm với nhiều ví dụ và bài tập thực hành để học sinh rèn kỹ năng. Bạn có thể xem thông tin chi tiết về cuốn sách này và quyết định liệu nó phù hợp với nhu cầu của bạn không.'),
(7, 'Chào bạn! Bạn đang tìm sách tham khảo về môn Văn cho lớp 6, phải không? Tôi sẽ giúp bạn tìm những cuốn sách phù hợp. Bạn có chủ đề cụ thể trong môn Văn mà bạn quan tâm ví dụ: \"văn bản thơ\" \"văn bản văn nghị luận\".'),
(8, 'Văn bản thơ là chủ đề quan trọng trong môn Văn. Tôi có một số cuốn sách phù hợp với yêu cầu của bạn. Đầu tiên, về văn bản thơ, có cuốn sách <a href=\"http://localhost:8080/bansach/detail.php?id=65\">199 Bài Và Đoạn Văn Hay Lớp 6</a>. Cuốn sách này giúp học sinh lớp 6 hiểu về cấu trúc và ngôn ngữ thơ, cung cấp các bài thơ mẫu và bài tập để rèn kỹ năng sáng tác và hiểu thơ.'),
(9, 'Văn bản văn nghị luận là một chủ đề quan trọng trong môn Văn. Tôi có một số cuốn sách phù hợp với yêu cầu của bạn. Đầu tiên về văn nghị luận có cuốn sách <a href=\"http://localhost:8080/bansach/detail.php?id=78\">\"HƯỚNG DẪN NÓI VÀ VIẾT VĂN NGHỊ LUẬN - BIỂU CẢM - THUYẾT MINH LỚP 6\"</a>. Cuốn sách này giúp học sinh lớp 6 hiểu về cấu trúc và ngôn ngữ văn bản nghị luận, cung cấp các bài văn mẫu và bài tập để rèn kỹ năng sáng tác và hiểu được cấu trúc của một bài văn nghị luận.'),
(10, 'Bạn đang tìm sách tham khảo cho môn Tiếng Anh lớp 6 đúng không? Tôi có thể giúp bạn tìm sách phù hợp. Bạn có chủ đề hoặc phần nào trong môn Tiếng Anh bạn quan tâm đặc biệt không ? Ví dụ: \"ngữ pháp và từ vựng\"'),
(11, 'Ngữ pháp và từ vựng là hai khía cạnh quan trọng trong Tiếng Anh. Tôi có vài đề xuất cho bạn. Trước tiên, có cuốn sách <a href=\"http://localhost:8080/bansach/detail.php?id=66\">\"Bứt Phá 9+ Môn Tiếng Anh Lớp 6\"</a> của tác giả Phan Thị Tâm, Hoàng Thị Quy. Cuốn sách này bao gồm nhiều chủ đề ngữ pháp như thì, cấu trúc câu và các loại từ. Nó cung cấp lý thuyết, ví dụ và bài tập thực hành giúp học sinh nâng cao kỹ năng ngữ pháp của mình. Bạn có muốn tìm hiểu thêm về cuốn sách này không?'),
(12, 'Bạn quan tâm đến chủ đề nào cụ thể như Toán 7, Văn 7, Tiếng Anh 7 ?'),
(13, 'Bạn đang gặp khó khăn trong toán đại số lớp 7 hay hình học lớp 7'),
(14, 'Tuyệt vời! Cuốn sách <a href=\"http://localhost:8080/bansach/detail.php?id=67\">\"Phương Pháp Tư Duy Tìm Cách Giải Toán Đại Số Lớp 7\"</a> cung cấp kiến thức đại số theo cách dễ hiểu và trực quan. Nó giúp học sinh lớp 7 hiểu và áp dụng các khái niệm đại số vào giải các bài tập. Cuốn sách này cũng đi kèm với nhiều ví dụ và bài tập thực hành để học sinh rèn kỹ năng. Bạn có thể xem thông tin chi tiết về cuốn sách này và quyết định liệu nó phù hợp với nhu cầu của bạn không.'),
(15, 'Tuyệt vời! Cuốn sách <a href=\"http://localhost:8080/bansach/detail.php?id=\">\"Phương Pháp Tư Duy Tìm Cách Giải Toán Hình Học Lớp 7\"</a> cung cấp kiến thức hình học theo cách dễ hiểu và trực quan. Nó giúp học sinh lớp 7 hiểu và áp dụng các khái niệm hình học vào giải các bài tập. Cuốn sách này cũng đi kèm với nhiều ví dụ và bài tập thực hành để học sinh rèn kỹ năng. Bạn có thể xem thông tin chi tiết về cuốn sách này và quyết định liệu nó phù hợp với nhu cầu của bạn không.'),
(16, 'Chào bạn! Bạn đang tìm sách tham khảo về môn Văn cho lớp 6, phải không? Tôi sẽ giúp bạn tìm những cuốn sách phù hợp. Bạn có chủ đề cụ thể trong môn Văn mà bạn quan tâm ví dụ: văn bản văn nghị luận xã hội '),
(17, 'Văn bản văn nghị luận xã hội là một chủ đề quan trọng trong môn Văn lớp 7. Tôi có một số cuốn sách phù hợp với yêu cầu của bạn. Đầu tiên về văn nghị luận có cuốn sách <a href=\"http://localhost:8080/bansach/detail.php?id=41\">\"Hướng Dẫn Học Ngữ Văn 7\"</a>. Cuốn sách này giúp học sinh lớp 7 hiểu về cấu trúc và ngôn ngữ văn bản nghị luận xã hội, cung cấp các bài văn mẫu và bài tập để rèn kỹ năng sáng tác và hiểu được cấu trúc của một bài văn nghị luận xã hội.'),
(18, 'Bạn đang tìm sách tham khảo cho môn Tiếng Anh lớp 7 đúng không? Tôi có thể giúp bạn tìm sách phù hợp. Bạn có chủ đề hoặc phần nào trong môn Tiếng Anh bạn quan tâm đặc biệt không ? Ví dụ: đọc hiểu và viết văn '),
(19, 'Đọc hiểu và viết văn là hai khía cạnh quan trọng trong Tiếng Anh lớp 7. Tôi có vài đề xuất cho bạn. Trước tiên, có cuốn sách <a href=\"http://localhost:8080/bansach/detail.php?id=42\">\"Tiếng Anh Lớp 7 - Sách Học Sinh\"</a> được xuất bản năm 2022. Cuốn sách này bao gồm nhiều chủ đề ngữ pháp như thì, cấu trúc câu và các loại từ. Nó cung cấp lý thuyết, ví dụ và bài tập thực hành giúp học sinh nâng cao kỹ năng ngữ pháp của mình. '),
(20, 'Chào bạn! Tất nhiên, tôi sẽ giúp bạn. Bạn đang quan tâm về sách tâm lý - kỹ năng sống với chủ đề nào ? ví dụ: \"phát triển bản thân\" \"nấu ăn\" \"kỹ năng giao tiếp\" '),
(21, 'Tất nhiên. Bạn có hứng thú với loại sách nào? Về quản lý thời gian, giải pháp tâm lý hay bản thân khởi nghiệp ?'),
(22, 'Vậy bạn có thể tham khảo cuốn <a href=\"http://localhost:8080/bansach/detail.php?id=60\">\"The Lean Startup\"</a>  của tác giả Eric Ries, hoặc <a href=\"http://localhost:8080/bansach/detail.php?id=61\">\"Start with Why\"</a>  của tác giả Simon Sinek. Cả hai cuốn sách này đều giới thiệu những phương pháp và kinh nghiệm để xây dựng một kế hoạch kinh doanh hiệu quả và thành công. Bạn muốn mua trực tiếp tại cửa hàng hay đặt hàng online ?'),
(23, 'Rất vui khi được giúp đỡ bạn. Nếu bạn cần thêm thông tin gì thì hãy liên hệ với chúng tôi nhé.'),
(24, 'Có chứ, chúng tôi có hỗ trợ đặt hàng trực tuyến. Bạn có thể đặt hàng trên trang web của chúng tôi bằng cách click vào sản phẩm bạn muốn mua.'),
(25, 'Tất nhiên, tôi sẽ giúp bạn. Bạn là người mới bắt đầu hay đã có một số kiến thức cơ bản ? '),
(26, 'Bạn muốn tìm hiểu về món ăn đơn giản hay món ăn phức tạp ?'),
(27, 'Hiểu rồi. Đối với các món ăn đơn giản như vậy, tôi khuyến nghị cuốn <a href=\"http://localhost:8080/bansach/detail.php?id=32\">\"Hướng dẫn nấu ăn 200 món truyền thống\"</a>  . Cuốn sách này cung cấp hướng dẫn cơ bản, các công thức đơn giản và bước thực hiện dễ hiểu để bạn có thể bắt đầu nấu ăn một cách dễ dàng.'),
(28, 'Hiểu rồi. Đối với các món ăn phức  như vậy, tôi khuyến nghị cuốn <a href=\"http://localhost:8080/bansach/detail.php?id=63\">\"Khoa Học Về Nấu Ăn - The Science Of Cooking\"</a>  . Cuốn sách này cung cấp các hướng dẫn, các công thức rõ ràng và bước thực hiện dễ hiểu để bạn có thể bắt đầu nấu ăn một cách dễ dàng.'),
(29, 'Chào bạn! Tất nhiên, tôi sẽ giúp bạn. Bạn muốn tìm hiểu về sách khoa học kỹ thuật với chủ đề gì ? ví dụ: \"công nghệ thông tin \"kinh tế học\" '),
(30, 'Về lĩnh vực công nghệ thông tin, chúng tôi có rất nhiều cuốn sách hay. Bạn quan tâm đến chủ đề nào trong ngành công nghệ thông tin ? ví dụ: \"lập trình\", \"phát triển phần mềm\"'),
(31, 'Tuyệt vời, chúng tôi có một số đầu sách hay liên quan đến chủ đề này. Bạn có thể tham khảo một số cuốn như <a href=\"http://localhost:8080/bansach/detail.php?id=72\">\"Clean Code\"</a>  của Robert C. Martin hoặc <a href=\"http://localhost:8080/bansach/detail.php?id=73\">\"The Pragmatic Programmer\"</a> của Andrew Hunt và David Thomas. Bạn muốn mua trực tiếp tại cửa hàng hay đặt hàng online.'),
(32, 'Chúng tôi có những cuốn sách chuyên về chủ đề mà bạn muốn <a href=\"http://localhost:8080/bansach/detail.php?id=74\">\"Code Complete\"</a>  của Steve McConnell, <a href=\"http://localhost:8080/bansach/detail.php?id=75\"> \"The Art of Computer Programming\"</a> của Donald Knuth, và <a href=\"http://localhost:8080/bansach/detail.php?id=76\">\"Introduction to Algorithms\"</a> của Thomas Cormen. Tất cả đều là những cuốn sách kinh điển trong lĩnh vực này. Bạn muốn mua hàng trực tiếp tại cửa hàng hay đặt hàng online.'),
(33, 'Chào bạn! Tất nhiên, tôi sẽ giúp bạn. Bạn muốn tìm hiểu về sách lịch sử của việt nam hay thế giới ? '),
(34, 'Chào bạn, bạn muốn tìm một quyển sách về lịch sử Việt Nam, tuyệt vời! Chúng tôi có nhiều sự lựa chọn cho bạn. Bạn muốn tìm hiểu về thời kỳ nào trong lịch sử Việt Nam ?'),
(35, 'Rất tuyệt, chúng tôi có một số quyển sách rất hay về thời kỳ đó. Bạn có thể tham khảo các tác phẩm như <a href=\"http://localhost:8080/bansach/detail.php?id=29\">\"Việt Nam Sử Lược\"</a> của Trần Bình Trọng hoặc <a href=\"http://localhost:8080/bansach/detail.php?id=56\">\"Việt Sử Diễn Họa\"</a> của Thanh Huyên. Bạn có hứng thú với cuốn sách nào nhất ? Bạn muốn mua trực tiếp tại cửa hàng hay đặt hàng online ?'),
(36, 'Rất tuyệt, chúng tôi có một số quyển sách rất hay về lịch sử thế giới. Bạn có thể tham khảo các tác phẩm như <a href=\"http://localhost:8080/bansach/detail.php?id=70\">\"Sách Thế Chiến Thứ Hai\"</a> của Antony Beevor. Bạn muốn mua trực tiếp tại cửa hàng hay đặt hàng online ?');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Staff'),
(2, 'Normal');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Hệ tư vấn'),
(4, 'intro', 'Xin chào ! Để bắt đầu câu chuyện bạn có thể nhập câu hỏi hoặc từ khóa vào ô chat của tôi. Tôi sẽ cố gắng trả lời chúng trong thời gian ngắn nhất có thể! Nhà sách chuyên cung cấp các chủ đề như: <a href=\"http://localhost:8080/bansach/productList.php?cateId=13\">Sách tham khảo</a>, <a href=\"http://localhost:8080/bansach/productList.php?cateId=17\">Sách tâm lý - kỹ năng sống</a>, <a href=\"http://localhost:8080/bansach/productList.php?cateId=18\">Khoa học kỹ thuật</a>, <a href=\"http://localhost:8080/bansach/productList.php?cateId=9\">Sách lịch sử</a>.'),
(6, 'short_name', 'ChatBot'),
(10, 'no_result', '\"Rất tiếc, sản phẩm đã hết hàng hoặc câu hỏi của bạn chúng tôi chưa hiểu. Chúng tôi sẽ thông báo cho bạn ngay khi sản phẩm được cung cấp trở lại. Bạn có thể tham khảo các sản phẩm khác trong danh mục của chúng tôi.\"'),
(11, 'logo', 'uploads/1685123040_1683404580_bot.jpg'),
(12, 'bot_avatar', 'uploads/bot_avatar.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `unanswered`
--

CREATE TABLE `unanswered` (
  `id` int(30) NOT NULL,
  `question` text DEFAULT NULL,
  `no_asks` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `unanswered`
--

INSERT INTO `unanswered` (`id`, `question`, `no_asks`) VALUES
(1, 'sách tham khải', 2),
(2, 'bạn mới bắt đầu', 2),
(3, 'sách lớp 13', 0),
(4, 'sách mẫu giáo', 0),
(5, 'truyẹn tranh lớp lá', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) NOT NULL,
  `isConfirmed` tinyint(4) NOT NULL DEFAULT 0,
  `captcha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`, `isConfirmed`, `captcha`) VALUES
(1, 'staff@gmail.com', 'Mỹ Hiền', '2022-11-01', '202cb962ac59075b964b07152d234b70', 1, 1, 'adasd', 1, ''),
(31, 'myhien@gmail.com', 'myhien', '2021-12-06', 'e10adc3949ba59abbe56e057f20f883e', 2, 1, 'BRVT', 1, '56661'),
(48, 'duchien2382000@gmail.com', 'Trần Đức Hiền', '2022-09-27', 'd41d8cd98f00b204e9800998ecf8427e', 2, 1, '123', 0, '75341'),
(49, 'nguyenhoangmy2701@gmail.com', 'Nguyễn Hoàng Mỹ', '2022-10-25', '202cb962ac59075b964b07152d234b70', 2, 1, '18/56 đường số 53', 0, '72651'),
(51, 'hien2308@gmail.com', 'Nguyễn Hoàng Mỹ', '2022-09-27', '202cb962ac59075b964b07152d234b70', 2, 1, '18/56 đường số 53', 0, '37806'),
(52, 'hin@gmail.com', 'Nguyễn Hoàng Mỹ', '2022-12-30', '202cb962ac59075b964b07152d234b70', 2, 1, '18/56 đường số 53', 0, '58384'),
(58, 'nhom1@gmail.com', 'Nguyễn Hoàng Mỹ', '2002-06-12', 'd41d8cd98f00b204e9800998ecf8427e', 2, 1, '656/74 Quang Trung Gò vấp Tp HCM', 0, '48144'),
(59, 'nguyenhoangmy2701@gmail.comm', 'Nguyễn Hoàng Mỹ', '2008-02-20', '202cb962ac59075b964b07152d234b70', 2, 1, '', 0, '19668'),
(60, 'hmy@gmail.com', 'Hoàng Mỹ', '2002-06-06', '81dc9bdb52d04dc20036dbd8313ed055', 2, 1, '18 đường số 53 TPhcm', 0, '86967');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userss`
--

CREATE TABLE `userss` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `userss`
--

INSERT INTO `userss` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `date_added`, `date_updated`) VALUES
(1, 'Nguyễn', 'Hoàng Mỹ', 'admin', '202cb962ac59075b964b07152d234b70', 'uploads/1684684020_usa.jpg', NULL, '2023-01-03 14:02:37', '2023-05-21 22:48:08');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `congty`
--
ALTER TABLE `congty`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `frequent_asks`
--
ALTER TABLE `frequent_asks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `unanswered`
--
ALTER TABLE `unanswered`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Chỉ mục cho bảng `userss`
--
ALTER TABLE `userss`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `congty`
--
ALTER TABLE `congty`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `frequent_asks`
--
ALTER TABLE `frequent_asks`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `responses`
--
ALTER TABLE `responses`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `unanswered`
--
ALTER TABLE `unanswered`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `userss`
--
ALTER TABLE `userss`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
