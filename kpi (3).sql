-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 30, 2025 lúc 05:31 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `kpi`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia_kpi`
--

CREATE TABLE `danhgia_kpi` (
  `ID_danhgia` int(11) NOT NULL,
  `ID_phancong` int(11) NOT NULL,
  `Ty_le_hoanthanh` decimal(5,2) DEFAULT NULL,
  `Ketqua_thuchien` decimal(10,0) DEFAULT NULL,
  `Trang_thai` enum('cho_duyet','dat','khong_dat') DEFAULT 'cho_duyet',
  `ID_nguoithamdinh` int(11) DEFAULT NULL,
  `Ngay_thamdinh` timestamp NULL DEFAULT NULL,
  `Nhan_xet` text DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhgia_kpi`
--

INSERT INTO `danhgia_kpi` (`ID_danhgia`, `ID_phancong`, `Ty_le_hoanthanh`, `Ketqua_thuchien`, `Trang_thai`, `ID_nguoithamdinh`, `Ngay_thamdinh`, `Nhan_xet`, `updated_at`) VALUES
(10, 204, 100.00, 5, 'dat', 6, '2025-10-28 21:29:05', 'ok roi nhe', NULL),
(11, 203, 100.00, 10, 'dat', 6, '2025-10-28 21:25:17', 'lam lai', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dulieu_kpi`
--

CREATE TABLE `dulieu_kpi` (
  `ID_dulieu` int(11) NOT NULL,
  `ID_phancong` int(11) NOT NULL,
  `ID_nguoigui` int(11) NOT NULL,
  `Ngay_gui` timestamp NOT NULL DEFAULT current_timestamp(),
  `Minh_chung` text NOT NULL,
  `File_path` varchar(255) DEFAULT NULL,
  `File_name` varchar(255) DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dulieu_kpi`
--

INSERT INTO `dulieu_kpi` (`ID_dulieu`, `ID_phancong`, `ID_nguoigui`, `Ngay_gui`, `Minh_chung`, `File_path`, `File_name`, `updated_at`) VALUES
(6, 204, 1, '2025-10-19 05:57:43', 'kkk', 'kpi-submissions/1/MnQhJrEsXz5XbmOD4gVf3TOAGWS9y4qJWWgh2v72.pdf', 'baibao.pdf', NULL),
(7, 204, 1, '2025-10-19 06:15:32', 'nop lan 2', 'kpi-submissions/1/19t2OyZaHVDB3HKrbNf1tqEL4uWYyEWIBYWHbSOy.pdf', 'certificate.pdf', NULL),
(8, 203, 1, '2025-10-19 07:06:34', 'sấ', 'kpi-submissions/1/JWxH8wZiEYpuzjY8s0p76PaqeNYf2voDh0lmlZq5.pdf', 'certificate (2).pdf', NULL),
(10, 201, 1, '2025-10-30 01:17:15', 'xádsad', 'kpi-submissions/1/Zsf02Jdhpd2awuUD8nzUjqaiXyNexHz7t9Q7kRsu.pdf', 'CAC BUOC TAO RMI TREN NETBEANS.pdf', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dulieu_task`
--

CREATE TABLE `dulieu_task` (
  `ID_dulieu` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `Minh_chung` text NOT NULL,
  `File_name` varchar(255) DEFAULT NULL,
  `File_path` varchar(255) DEFAULT NULL,
  `Ngay_gui` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dulieu_task`
--

INSERT INTO `dulieu_task` (`ID_dulieu`, `task_id`, `user_id`, `Minh_chung`, `File_name`, `File_path`, `Ngay_gui`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 'nop lan 1', '1761577143_banner-pet.jpg', 'tasks/1761577143_banner-pet.jpg', '2025-10-27 07:59:03', '2025-10-27 07:59:03', '2025-10-27 07:59:03'),
(2, 10, 1, 'nop lan 2', '1761577273_HoaDon_HD02_20251025062306.pdf', 'tasks/1761577273_HoaDon_HD02_20251025062306.pdf', '2025-10-27 08:01:13', '2025-10-27 08:01:13', '2025-10-27 08:01:13'),
(3, 14, 11, 'dsadsa', '1761578408_1761577143_banner-pet.jpg', 'tasks/1761578408_1761577143_banner-pet.jpg', '2025-10-27 08:20:08', '2025-10-27 08:20:08', '2025-10-27 08:20:08'),
(4, 15, 1, 'abc', '1761579438_SESSION B - READING 1 (1).pdf', 'tasks/1761579438_SESSION B - READING 1 (1).pdf', '2025-10-27 08:37:18', '2025-10-27 08:37:18', '2025-10-27 08:37:18'),
(5, 14, 1, 'đã hoàn thành', '1761667571_CAC BUOC TAO RMI TREN NETBEANS.pdf', 'tasks/1761667571_CAC BUOC TAO RMI TREN NETBEANS.pdf', '2025-10-28 09:06:11', '2025-10-28 09:06:11', '2025-10-28 09:06:11'),
(6, 14, 1, 'đã hoàn thành', '1761667578_CAC BUOC TAO RMI TREN NETBEANS.pdf', 'tasks/1761667578_CAC BUOC TAO RMI TREN NETBEANS.pdf', '2025-10-28 09:06:18', '2025-10-28 09:06:18', '2025-10-28 09:06:18'),
(7, 14, 1, 'đã hoàn thành', '1761667583_CAC BUOC TAO RMI TREN NETBEANS.pdf', 'tasks/1761667583_CAC BUOC TAO RMI TREN NETBEANS.pdf', '2025-10-28 09:06:23', '2025-10-28 09:06:23', '2025-10-28 09:06:23'),
(8, 16, 1, 'nộp bài', '1761667877_SESSION B - READING 1 (2).pdf', 'tasks/1761667877_SESSION B - READING 1 (2).pdf', '2025-10-28 09:11:17', '2025-10-28 09:11:17', '2025-10-28 09:11:17'),
(9, 20, 1, 'scada', '1761744386_PHẦN 3. LẬP TRÌNH SOCK... _ VLUTE Wiki (1).pdf', 'tasks/1761744386_PHẦN 3. LẬP TRÌNH SOCK... _ VLUTE Wiki (1).pdf', '2025-10-29 06:26:26', '2025-10-29 06:26:27', '2025-10-29 06:26:27'),
(10, 20, 1, 'dfafsa', '1761744415_CAC BUOC TAO RMI TREN NETBEANS.pdf', 'tasks/1761744415_CAC BUOC TAO RMI TREN NETBEANS.pdf', '2025-10-29 06:26:55', '2025-10-29 06:26:55', '2025-10-29 06:26:55'),
(11, 20, 1, 'dqwdwqd', '1761744487_CAC BUOC TAO RMI TREN NETBEANS.pdf', 'tasks/1761744487_CAC BUOC TAO RMI TREN NETBEANS.pdf', '2025-10-29 06:28:07', '2025-10-29 06:28:07', '2025-10-29 06:28:07'),
(12, 22, 1, 'asdas', '1761754264_SESSION B - READING 1 (1).pdf', 'tasks/1761754264_SESSION B - READING 1 (1).pdf', '2025-10-29 16:11:04', '2025-10-29 16:11:04', '2025-10-29 16:11:04'),
(13, 20, 1, 'asdasd', '1761754288_PHẦN 3. LẬP TRÌNH SOCK... _ VLUTE Wiki (1).pdf', 'tasks/1761754288_PHẦN 3. LẬP TRÌNH SOCK... _ VLUTE Wiki (1).pdf', '2025-10-29 16:11:28', '2025-10-29 16:11:28', '2025-10-29 16:11:28'),
(14, 23, 13, 'Nộp bài', '1761756250_ONTAP (1).docx', 'tasks/1761756250_ONTAP (1).docx', '2025-10-29 16:44:10', '2025-10-29 16:44:10', '2025-10-29 16:44:10'),
(15, 23, 1, 'fdsfds', '1761786747_CAC BUOC TAO RMI TREN NETBEANS.pdf', 'tasks/1761786747_CAC BUOC TAO RMI TREN NETBEANS.pdf', '2025-10-30 01:12:27', '2025-10-30 01:12:27', '2025-10-30 01:12:27'),
(16, 23, 1, 'fdsfds', '1761786769_CAC BUOC TAO RMI TREN NETBEANS.pdf', 'tasks/1761786769_CAC BUOC TAO RMI TREN NETBEANS.pdf', '2025-10-30 01:12:49', '2025-10-30 01:12:49', '2025-10-30 01:12:49'),
(31, 25, 1, 'sadasdas', '1761792167_SESSION B - READING 1 (2).pdf', 'tasks/1761792167_SESSION B - READING 1 (2).pdf', '2025-10-30 02:42:47', '2025-10-30 02:42:47', '2025-10-30 02:42:47'),
(32, 26, 1, 'sdadsa', '1761794607_PHẦN 2. LỚP InetAddres... _ VLUTE Wiki.pdf', 'tasks/1761794607_PHẦN 2. LỚP InetAddres... _ VLUTE Wiki.pdf', '2025-10-30 03:23:27', '2025-10-30 03:23:27', '2025-10-30 03:23:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kpi`
--

CREATE TABLE `kpi` (
  `ID_kpi` int(11) NOT NULL,
  `ID_loai_kpi` int(11) DEFAULT NULL,
  `Ten_kpi` varchar(100) NOT NULL,
  `Chi_tieu` decimal(10,0) NOT NULL,
  `Donvi_tinh` varchar(50) DEFAULT NULL,
  `Do_uu_tien` enum('Rất gấp','Gấp','Trung Bình','Không','') DEFAULT NULL,
  `Ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  `Mo_ta` text DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `kpi`
--

INSERT INTO `kpi` (`ID_kpi`, `ID_loai_kpi`, `Ten_kpi`, `Chi_tieu`, `Donvi_tinh`, `Do_uu_tien`, `Ngay_tao`, `Mo_ta`, `updated_at`) VALUES
(1, 1, 'Tăng lượt tương tác mạng xã hội', 120, 'lượt', 'Gấp', '2025-10-15 05:30:26', NULL, NULL),
(2, 2, 'Hoàn thành báo cáo tháng 10/2025', 50, 'trang', 'Trung Bình', '2025-10-15 05:30:26', NULL, NULL),
(3, 3, 'Tạo 15 bài viết marketing mới', 15, 'bài viết', 'Gấp', '2025-10-15 05:30:26', NULL, NULL),
(4, 4, 'Giảm tỷ lệ khách hàng rời bỏ', 5, '%', 'Rất gấp', '2025-10-15 05:30:26', NULL, NULL),
(5, 1, 'Đạt doanh số tuần 2 tháng 10', 10000000, 'VND', 'Trung Bình', '2025-10-15 05:30:26', NULL, NULL),
(14, 2, 'Báo cáo TMDT lần 2', 2, 'Lần', 'Gấp', '2025-10-29 16:46:52', 'asadsa', NULL),
(15, 1, 'Báo cáo TMDT lần 5', 3, 'Lần', 'Trung Bình', '2025-10-30 04:12:42', 'ádsadsad', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_kpi`
--

CREATE TABLE `loai_kpi` (
  `ID_loai_kpi` int(11) NOT NULL,
  `Ten_loai_kpi` varchar(255) NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loai_kpi`
--

INSERT INTO `loai_kpi` (`ID_loai_kpi`, `Ten_loai_kpi`, `updated_at`) VALUES
(1, 'Marketing', NULL),
(2, 'IT', NULL),
(3, 'HR', NULL),
(4, 'Finance', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_01_03_000000_add_submission_columns_to_task_user_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhatky`
--

CREATE TABLE `nhatky` (
  `ID_nhatky` int(11) NOT NULL,
  `ID_nguoithuchien` int(11) NOT NULL,
  `Doi_tuong` varchar(50) NOT NULL,
  `ID_doi_tuong` int(11) NOT NULL,
  `Hanh_dong` enum('them','sua','xoa','duyet','phan cong kpi','phan cong task') NOT NULL,
  `Ngay_thuchien` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhatky`
--

INSERT INTO `nhatky` (`ID_nhatky`, `ID_nguoithuchien`, `Doi_tuong`, `ID_doi_tuong`, `Hanh_dong`, `Ngay_thuchien`, `updated_at`) VALUES
(1, 3, 'user', 9, 'xoa', '2025-10-18 13:58:16', NULL),
(9, 6, 'user', 1, 'phan cong kpi', '2025-10-19 04:26:54', NULL),
(10, 6, 'danhgia_kpi', 10, 'duyet', '2025-10-19 06:11:20', NULL),
(11, 6, 'user', 1, 'phan cong kpi', '2025-10-19 07:03:42', NULL),
(12, 6, 'user', 11, 'phan cong kpi', '2025-10-29 04:32:34', NULL),
(13, 6, 'user', 1, 'phan cong task', '2025-10-29 13:47:36', NULL),
(14, 6, 'user', 1, 'phan cong task', '2025-10-29 16:09:24', NULL),
(15, 3, 'user', 12, 'them', '2025-10-29 16:27:40', NULL),
(16, 3, 'user', 13, 'them', '2025-10-29 16:28:14', NULL),
(17, 3, 'user', 14, 'them', '2025-10-29 16:28:51', NULL),
(18, 3, 'user', 15, 'them', '2025-10-29 16:29:29', NULL),
(19, 3, 'user', 1, 'sua', '2025-10-29 16:29:50', NULL),
(20, 3, 'user', 1, 'sua', '2025-10-29 16:30:02', NULL),
(21, 3, 'user', 11, 'sua', '2025-10-29 16:30:11', NULL),
(22, 3, 'user', 11, 'sua', '2025-10-29 16:30:26', NULL),
(23, 3, 'user', 12, 'sua', '2025-10-29 16:32:15', NULL),
(24, 3, 'user', 12, 'sua', '2025-10-29 16:32:22', NULL),
(25, 3, 'user', 13, 'sua', '2025-10-29 16:32:29', NULL),
(26, 3, 'user', 14, 'sua', '2025-10-29 16:32:34', NULL),
(27, 3, 'user', 15, 'sua', '2025-10-29 16:32:39', NULL),
(28, 3, 'user', 11, 'sua', '2025-10-29 16:32:50', NULL),
(29, 3, 'user', 6, 'sua', '2025-10-29 16:32:59', NULL),
(30, 3, 'user', 3, 'sua', '2025-10-29 16:33:09', NULL),
(31, 3, 'user', 3, 'sua', '2025-10-29 16:33:24', NULL),
(32, 3, 'user', 1, 'sua', '2025-10-29 16:33:37', NULL),
(33, 6, 'user', 13, 'phan cong task', '2025-10-29 16:38:26', NULL),
(34, 6, 'user', 15, 'phan cong task', '2025-10-29 16:38:30', NULL),
(35, 6, 'user', 13, 'phan cong kpi', '2025-10-29 16:46:52', NULL),
(36, 6, 'phancong_kpi', 212, 'xoa', '2025-10-29 16:47:31', NULL),
(37, 6, 'phancong_kpi', 211, 'xoa', '2025-10-29 16:47:34', NULL),
(38, 6, 'phancong_kpi', 210, 'xoa', '2025-10-29 16:47:38', NULL),
(39, 6, 'user', 1, 'phan cong task', '2025-10-30 01:28:11', NULL),
(40, 6, 'user', 13, 'phan cong task', '2025-10-30 01:28:17', NULL),
(41, 6, 'user', 15, 'phan cong task', '2025-10-30 01:28:18', NULL),
(42, 6, 'user', 1, 'phan cong task', '2025-10-30 01:43:13', NULL),
(43, 6, 'user', 13, 'phan cong task', '2025-10-30 01:43:17', NULL),
(44, 6, 'user', 15, 'phan cong task', '2025-10-30 01:43:19', NULL),
(45, 3, 'user', 13, 'sua', '2025-10-30 03:20:46', NULL),
(46, 3, 'user', 13, 'sua', '2025-10-30 03:21:26', NULL),
(47, 13, 'user', 1, 'phan cong task', '2025-10-30 03:22:39', NULL),
(48, 13, 'user', 15, 'phan cong kpi', '2025-10-30 04:12:42', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phancong_kpi`
--

CREATE TABLE `phancong_kpi` (
  `ID_Phancong` int(11) NOT NULL,
  `ID_kpi` int(11) NOT NULL,
  `ID_nguoi_phan_cong` int(11) DEFAULT NULL,
  `ID_loai_kpi` int(11) DEFAULT NULL,
  `ID_user` int(11) DEFAULT NULL,
  `ID_phongban` int(11) DEFAULT NULL,
  `Ngay_batdau` date DEFAULT NULL,
  `Ngay_ketthuc` date DEFAULT NULL,
  `Trang_thai` enum('chua_thuc_hien','dang_thuc_hien','hoan_thanh','qua_han') DEFAULT 'chua_thuc_hien',
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phancong_kpi`
--

INSERT INTO `phancong_kpi` (`ID_Phancong`, `ID_kpi`, `ID_nguoi_phan_cong`, `ID_loai_kpi`, `ID_user`, `ID_phongban`, `Ngay_batdau`, `Ngay_ketthuc`, `Trang_thai`, `updated_at`) VALUES
(201, 1, 6, 1, 1, 1, '2025-10-15', '2025-10-25', 'dang_thuc_hien', NULL),
(202, 2, 6, 2, 1, NULL, '2025-09-30', '2025-10-20', 'qua_han', NULL),
(203, 3, 6, 3, 1, NULL, '2025-10-15', '2025-11-04', 'dang_thuc_hien', NULL),
(204, 4, 6, 4, 1, NULL, '2025-09-15', '2025-10-13', 'hoan_thanh', NULL),
(205, 5, 6, 1, 1, NULL, '2025-10-09', '2025-10-14', 'qua_han', NULL),
(213, 14, 6, 2, 13, 6, '2025-10-29', '2025-11-08', 'chua_thuc_hien', NULL),
(214, 15, 13, 1, 15, 6, '2025-10-30', '2025-11-15', 'chua_thuc_hien', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phongban`
--

CREATE TABLE `phongban` (
  `ID_phongban` int(11) NOT NULL,
  `Ten_phongban` varchar(100) NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phongban`
--

INSERT INTO `phongban` (`ID_phongban`, `Ten_phongban`, `updated_at`) VALUES
(1, 'Phòng IT', NULL),
(6, 'Phòng Khoa CNTT', NULL),
(7, 'Phòng CTSV', NULL),
(8, 'Phòng QLĐT', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quyen`
--

CREATE TABLE `quyen` (
  `ID_quyen` int(11) NOT NULL,
  `Ten_quyen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `quyen`
--

INSERT INTO `quyen` (`ID_quyen`, `Ten_quyen`) VALUES
(1, 'Admin'),
(3, 'Nhân viên'),
(2, 'Quản lý');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tasks`
--

CREATE TABLE `tasks` (
  `ID_task` int(11) NOT NULL,
  `Ten_task` varchar(255) NOT NULL,
  `ID_nguoi_phan_cong` int(11) DEFAULT NULL,
  `Mo_ta` text DEFAULT NULL,
  `Ngay_giao` datetime NOT NULL DEFAULT current_timestamp(),
  `Ngay_het_han` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tasks`
--

INSERT INTO `tasks` (`ID_task`, `Ten_task`, `ID_nguoi_phan_cong`, `Mo_ta`, `Ngay_giao`, `Ngay_het_han`, `updated_at`) VALUES
(23, 'Báo cáo cuối kỳ môn TMĐT', 6, 'Báo cáo vào 3,4 ngày thứ 5 (30/10) tại lớp thực hành', '2025-10-29 23:38:26', '2025-10-14', NULL),
(25, 'Nộp báo cáo', 6, 'Nộp code đồ án TMDT', '2025-10-30 08:43:13', '2025-11-08', NULL),
(26, 'nv test', 13, 'adsada', '2025-10-30 10:22:39', '2025-11-07', NULL);

--
-- Bẫy `tasks`
--
DELIMITER $$
CREATE TRIGGER `trg_tasks_check_due_date` AFTER UPDATE ON `tasks` FOR EACH ROW BEGIN
    -- Bước 1: Kiểm tra điều kiện: Ngày hết hạn (Ngay_het_han) nhỏ hơn Ngày giao (Ngay_giao)
    IF NEW.Ngay_het_han < NEW.Ngay_giao THEN
        
        -- Bước 2: Cập nhật cột trang_thai trong bảng task_user
        -- Cập nhật tất cả các bản ghi task_user liên quan đến task (dùng ID_task) vừa được cập nhật
        UPDATE `task_user`
        SET `trang_thai` = 'qua_han'
        WHERE `task_id` = NEW.ID_task;
        
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `task_user`
--

CREATE TABLE `task_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `trang_thai` enum('chua_bat_dau','dang_thuc_hien','hoan_thanh','qua_han') NOT NULL DEFAULT 'chua_bat_dau',
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `task_user`
--

INSERT INTO `task_user` (`id`, `task_id`, `user_id`, `trang_thai`, `comment`, `created_at`, `updated_at`) VALUES
(20, 23, 13, 'chua_bat_dau', NULL, '2025-10-29 16:38:26', '2025-10-30 00:46:37'),
(21, 23, 15, 'chua_bat_dau', NULL, '2025-10-29 16:38:26', '2025-10-30 00:46:37'),
(22, 23, 1, 'hoan_thanh', 'tốt', '2025-10-29 16:53:07', '2025-10-30 01:21:14'),
(26, 25, 1, 'chua_bat_dau', 'ko tốt', '2025-10-30 01:43:13', '2025-10-30 02:44:11'),
(27, 25, 13, 'chua_bat_dau', NULL, '2025-10-30 01:43:13', '2025-10-30 01:43:13'),
(28, 25, 15, 'chua_bat_dau', NULL, '2025-10-30 01:43:13', '2025-10-30 01:43:13'),
(29, 26, 1, 'dang_thuc_hien', NULL, '2025-10-30 03:22:39', '2025-10-30 03:23:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongbao`
--

CREATE TABLE `thongbao` (
  `ID_thongbao` int(11) NOT NULL,
  `ID_nguoigui` int(11) DEFAULT NULL,
  `ID_nguoinhan` int(11) NOT NULL,
  `Tieu_de` varchar(200) NOT NULL,
  `Noi_dung` text DEFAULT NULL,
  `Loai_thongbao` enum('phancong_kpi','phancong_task','review_kpi','submit_kpi','submit_task') DEFAULT 'phancong_kpi',
  `Da_xem` tinyint(1) DEFAULT 0,
  `Ngay_gui` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thongbao`
--

INSERT INTO `thongbao` (`ID_thongbao`, `ID_nguoigui`, `ID_nguoinhan`, `Tieu_de`, `Noi_dung`, `Loai_thongbao`, `Da_xem`, `Ngay_gui`) VALUES
(1, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nhiem vu 19/10\'. Hạn hoàn thành: 2025-10-23', 'phancong_task', 1, '2025-10-19 07:02:58'),
(2, 6, 1, 'Phân công KPI mới', 'Bạn đã được phân công KPI: kpi 19/10 lan 2. Deadline: 2025-11-01', 'phancong_kpi', 1, '2025-10-19 07:03:42'),
(4, 1, 6, 'Nộp bài KPI', 'Nhân viên đã nộp bài cho KPI: \'Tạo 15 bài viết marketing mới\'. Vui lòng kiểm tra và đánh giá.', 'submit_kpi', 1, '2025-10-19 07:06:34'),
(5, 6, 1, 'Đánh giá KPI', 'KPI \'Tạo 15 bài viết marketing mới\' đã được đánh giá. Tỷ lệ hoàn thành: 66.67%. Trạng thái: Khong dat', 'review_kpi', 1, '2025-10-19 07:07:17'),
(6, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv 1\'. Hạn hoàn thành: 2025-10-31', 'phancong_task', 1, '2025-10-27 14:06:19'),
(7, 6, 11, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv 1\'. Hạn hoàn thành: 2025-10-31', 'phancong_task', 0, '2025-10-27 14:06:19'),
(8, 6, 1, 'Yêu cầu làm lại nhiệm vụ', 'Nhiệm vụ \'nv 1\' cần làm lại.\nLý do: lam lai di', 'phancong_task', 1, '2025-10-27 14:52:41'),
(9, 6, 1, 'Yêu cầu làm lại nhiệm vụ', 'Nhiệm vụ \'nv 1\' cần làm lại.\nLý do: lam lai di', 'phancong_task', 1, '2025-10-27 14:59:43'),
(10, 6, 1, 'Nhiệm vụ được duyệt', 'Bài nộp của bạn cho nhiệm vụ \'nv 1\' đã được duyệt và hoàn thành!\nNhận xét: ok', 'phancong_task', 1, '2025-10-27 15:00:03'),
(11, 6, 1, 'Nhiệm vụ được duyệt', 'Bài nộp của bạn cho nhiệm vụ \'nv 1\' đã được duyệt và hoàn thành!\nNhận xét: ok rôi', 'phancong_task', 1, '2025-10-27 15:04:58'),
(12, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv 2\'. Hạn hoàn thành: 2025-10-29', 'phancong_task', 1, '2025-10-27 15:11:06'),
(13, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv 2\'. Hạn hoàn thành: 2025-10-29', 'phancong_task', 1, '2025-10-27 15:11:09'),
(14, 6, 11, 'Được phân công nhiệm vụ', 'Bạn đã được phân công nhiệm vụ: \'nv 2\'', 'phancong_task', 0, '2025-10-27 15:13:18'),
(15, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv 2\'. Hạn hoàn thành: 2025-10-29', 'phancong_task', 1, '2025-10-27 15:14:08'),
(16, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv 2\'. Hạn hoàn thành: 2025-10-29', 'phancong_task', 1, '2025-10-27 15:16:04'),
(17, 6, 11, 'Được phân công nhiệm vụ', 'Bạn đã được phân công nhiệm vụ: \'nv 2\'', 'phancong_task', 0, '2025-10-27 15:16:54'),
(18, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv 3\'. Hạn hoàn thành: 2025-11-08', 'phancong_task', 1, '2025-10-27 15:18:01'),
(19, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv 4\'. Hạn hoàn thành: 2025-11-07', 'phancong_task', 1, '2025-10-27 15:38:24'),
(20, 6, 1, 'Nhiệm vụ được duyệt', 'Bài nộp của bạn cho nhiệm vụ \'nv 2\' đã được duyệt và hoàn thành!\nNhận xét: rất tốt', 'phancong_task', 1, '2025-10-28 16:08:52'),
(21, 6, 1, 'Nhiệm vụ được duyệt', 'Bài nộp của bạn cho nhiệm vụ \'nv 3\' đã được duyệt và hoàn thành!\nNhận xét: tốt', 'phancong_task', 1, '2025-10-28 16:09:44'),
(22, 6, 1, 'Nhiệm vụ được duyệt', 'Bài nộp của bạn cho nhiệm vụ \'nv 4\' đã được duyệt và hoàn thành!\nNhận xét: tốt', 'phancong_task', 1, '2025-10-28 16:20:17'),
(23, 6, 1, 'Thay đổi phân công nhiệm vụ', 'Nhiệm vụ \'nv 4\' đã được chuyển cho người khác.', 'phancong_task', 1, '2025-10-28 16:34:17'),
(24, 6, 11, 'Được phân công nhiệm vụ', 'Bạn đã được phân công nhiệm vụ: \'nv 4\'', 'phancong_task', 0, '2025-10-28 16:34:17'),
(25, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv5\'. Hạn hoàn thành: 2025-10-31', 'phancong_task', 1, '2025-10-28 16:36:09'),
(26, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv6\'. Hạn hoàn thành: 2025-12-31', 'phancong_task', 1, '2025-10-28 16:37:06'),
(27, 6, 1, 'Đánh giá KPI', 'KPI \'Tạo 15 bài viết marketing mới\' đã được đánh giá. Tỷ lệ hoàn thành: 66.67%. Trạng thái: Khong dat', 'review_kpi', 1, '2025-10-29 04:08:56'),
(28, 6, 1, 'Đánh giá KPI', 'KPI \'Tạo 15 bài viết marketing mới\' đã được đánh giá. Tỷ lệ hoàn thành: 66.67%. Trạng thái: Dat', 'review_kpi', 1, '2025-10-29 04:09:28'),
(29, 6, 1, 'Đánh giá KPI', 'KPI \'Giảm tỷ lệ khách hàng rời bỏ\' đã được đánh giá. Tỷ lệ hoàn thành: 100.00%. Trạng thái: Dat', 'review_kpi', 1, '2025-10-29 04:25:03'),
(30, 6, 1, 'Đánh giá KPI', 'KPI \'Tạo 15 bài viết marketing mới\' đã được đánh giá. Tỷ lệ hoàn thành: 66.67%. Trạng thái: Dat', 'review_kpi', 1, '2025-10-29 04:25:17'),
(31, 6, 1, 'Đánh giá KPI', 'KPI \'Giảm tỷ lệ khách hàng rời bỏ\' đã được đánh giá. Tỷ lệ hoàn thành: 100.00%. Trạng thái: Dat', 'review_kpi', 1, '2025-10-29 04:29:05'),
(32, 6, 11, 'Phân công KPI mới', 'Bạn đã được phân công KPI: Báo cáo TMDT lần 4. Deadline: 2025-11-08', 'phancong_kpi', 0, '2025-10-29 04:32:34'),
(33, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nvvcbc\'. Hạn hoàn thành: 2025-10-31', 'phancong_task', 1, '2025-10-29 12:04:01'),
(34, 6, 1, 'Thay đổi phân công nhiệm vụ', 'Nhiệm vụ \'nvvcbc\' đã được chuyển cho người khác.', 'phancong_task', 1, '2025-10-29 12:35:43'),
(35, 6, 11, 'Được phân công nhiệm vụ', 'Bạn đã được phân công nhiệm vụ: \'nvvcbc\'. Hạn hoàn thành: 2025-10-30', 'phancong_task', 0, '2025-10-29 12:35:43'),
(36, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv tesst\'. Hạn hoàn thành: 2025-11-13', 'phancong_task', 1, '2025-10-29 12:36:32'),
(37, 6, 11, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv tesst\'. Hạn hoàn thành: 2025-11-13', 'phancong_task', 0, '2025-10-29 12:36:36'),
(38, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'dsadsadas\'. Hạn hoàn thành: 2025-09-30', 'phancong_task', 1, '2025-10-29 13:47:36'),
(39, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'asdsa\'. Hạn hoàn thành: 2025-11-08', 'phancong_task', 1, '2025-10-29 16:09:24'),
(40, 1, 6, 'Nộp bài KPI', 'Nhân viên đã nộp bài cho KPI: \'kpi 19/10 lan 2\'. Vui lòng kiểm tra và đánh giá.', 'submit_kpi', 1, '2025-10-29 16:10:52'),
(41, 6, 13, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'Báo cáo cuối kỳ môn TMĐT\'. Hạn hoàn thành: 2025-10-30', 'phancong_task', 1, '2025-10-29 16:38:26'),
(42, 6, 15, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'Báo cáo cuối kỳ môn TMĐT\'. Hạn hoàn thành: 2025-10-30', 'phancong_task', 0, '2025-10-29 16:38:30'),
(43, 6, 13, 'Phân công KPI mới', 'Bạn đã được phân công KPI: Báo cáo TMDT lần 2. Deadline: 2025-11-08', 'phancong_kpi', 1, '2025-10-29 16:46:52'),
(44, 6, 1, 'Được phân công nhiệm vụ', 'Bạn đã được phân công nhiệm vụ: \'Báo cáo cuối kỳ môn TMĐT\'', 'phancong_task', 1, '2025-10-29 16:53:07'),
(45, 1, 6, 'Nộp bài KPI', 'Nhân viên đã nộp bài cho KPI: \'Tăng lượt tương tác mạng xã hội\'. Vui lòng kiểm tra và đánh giá.', 'submit_kpi', 1, '2025-10-30 01:17:15'),
(46, 6, 1, 'Nhiệm vụ được duyệt', 'Bài nộp của bạn cho nhiệm vụ \'Báo cáo cuối kỳ môn TMĐT\' đã được duyệt và hoàn thành!\nNhận xét: tốt', 'phancong_task', 1, '2025-10-30 01:21:14'),
(47, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv test\'. Hạn hoàn thành: 2025-10-15', 'phancong_task', 1, '2025-10-30 01:28:11'),
(48, 6, 13, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv test\'. Hạn hoàn thành: 2025-10-15', 'phancong_task', 1, '2025-10-30 01:28:17'),
(49, 6, 15, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv test\'. Hạn hoàn thành: 2025-10-15', 'phancong_task', 0, '2025-10-30 01:28:18'),
(50, 6, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'Nộp báo cáo\'. Hạn hoàn thành: 2025-11-08', 'phancong_task', 1, '2025-10-30 01:43:13'),
(51, 6, 13, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'Nộp báo cáo\'. Hạn hoàn thành: 2025-11-08', 'phancong_task', 1, '2025-10-30 01:43:17'),
(52, 6, 15, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'Nộp báo cáo\'. Hạn hoàn thành: 2025-11-08', 'phancong_task', 0, '2025-10-30 01:43:19'),
(53, 1, 6, 'Nộp bài nhiệm vụ', 'Nhân viên đã nộp bài cho nhiệm vụ: \'Nộp báo cáo\'. Vui lòng kiểm tra và đánh giá.', 'submit_task', 1, '2025-10-30 02:42:47'),
(54, 6, 1, 'Yêu cầu làm lại nhiệm vụ', 'Nhiệm vụ \'Nộp báo cáo\' cần làm lại.\nLý do: ko tốt', 'phancong_task', 1, '2025-10-30 02:44:11'),
(55, 13, 1, 'Phân công nhiệm vụ mới', 'Bạn đã được phân công nhiệm vụ: \'nv test\'. Hạn hoàn thành: 2025-11-07', 'phancong_task', 0, '2025-10-30 03:22:39'),
(56, 1, 13, 'Nộp bài nhiệm vụ', 'Nhân viên đã nộp bài cho nhiệm vụ: \'nv test\'. Vui lòng kiểm tra và đánh giá.', 'submit_task', 1, '2025-10-30 03:23:27'),
(57, 13, 15, 'Phân công KPI mới', 'Bạn đã được phân công KPI: Báo cáo TMDT lần 5. Deadline: 2025-11-15', 'phancong_kpi', 0, '2025-10-30 04:12:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `ID_user` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `MK` varchar(255) NOT NULL,
  `MK_hash` text NOT NULL,
  `Ho_ten` varchar(100) DEFAULT NULL,
  `ID_quyen` int(11) NOT NULL,
  `ID_phongban` int(11) DEFAULT NULL,
  `Trang_thai` enum('hoat_dong','khong_hoat_dong','bi_chan','') DEFAULT 'hoat_dong',
  `Ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`ID_user`, `Email`, `MK`, `MK_hash`, `Ho_ten`, `ID_quyen`, `ID_phongban`, `Trang_thai`, `Ngay_tao`, `updated_at`) VALUES
(1, 'user@gmail.com', '321', '$2y$12$X17Dqqw/3qax1J/19nwWuOsjO4rEV7XPP2htBbahV.ymhIDsqiOVC', 'USER', 3, 6, 'hoat_dong', '2025-10-08 23:25:09', NULL),
(3, 'admin@gmail.com', '321', '$2y$10$0Mo0tPH0ZZPr29fILEbHLOnS1O9pRoDu9rP.tRLaV6tfsBljRizGy', 'Admin', 1, 8, 'hoat_dong', '2025-10-08 23:25:09', NULL),
(6, 'manager@gmail.com', '123456', '$2y$12$BHYgeTAWUFFfR7jbo1Q.au2/33EUueau5AeLzyUmiCR5xNvCB/EgG', 'MANAGER', 2, 7, 'hoat_dong', '2025-10-16 00:57:39', NULL),
(11, 'user2@gmail.com', '321', '$2y$12$X17Dqqw/3qax1J/19nwWuOsjO4rEV7XPP2htBbahV.ymhIDsqiOVC', 'USER 2', 3, 6, 'bi_chan', '2025-10-08 23:25:09', NULL),
(12, 'datth@vlute.edu.vn', '123456', '$2y$12$gcwkJIiVBB./VJt09x8YNOqqOyJB8US36c6jFjYXlbHRtVLQxWZ9C', 'Trần Hồ Đạt', 1, 8, 'hoat_dong', '2025-10-29 16:27:40', NULL),
(13, '21004074@st.vlute.edu.vn', '123456', '$2y$12$us8sSXi7JaWveUQbGrp1.eYk2tDz7/B9gRZxvEx32K/yUT8kpoVq.', 'Nguyễn Thái Vinh', 2, 6, 'hoat_dong', '2025-10-29 16:28:14', NULL),
(14, '21004046@st.vlute.edu.vn', '123456', '$2y$12$1Q9L/Dd8iUmC1DE9tlsDJut.obVBoLhOBswDlvKgMczI2i894lple', 'Bạch Lê Trọng Ân', 2, 6, 'hoat_dong', '2025-10-29 16:28:51', NULL),
(15, '21004212@st.vlute.edu.vn', '123456', '$2y$12$w5Qzdwg9uAORrOfwMeMVhe3/YB0P1RYZfVQn9HmiN8xu8drzTEp/C', 'Võ Tấn An', 3, 6, 'hoat_dong', '2025-10-29 16:29:29', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `danhgia_kpi`
--
ALTER TABLE `danhgia_kpi`
  ADD PRIMARY KEY (`ID_danhgia`),
  ADD KEY `ID_phancong` (`ID_phancong`),
  ADD KEY `ID_nguoithamdinh` (`ID_nguoithamdinh`);

--
-- Chỉ mục cho bảng `dulieu_kpi`
--
ALTER TABLE `dulieu_kpi`
  ADD PRIMARY KEY (`ID_dulieu`),
  ADD KEY `ID_phancong` (`ID_phancong`),
  ADD KEY `ID_nguoigui` (`ID_nguoigui`);

--
-- Chỉ mục cho bảng `dulieu_task`
--
ALTER TABLE `dulieu_task`
  ADD PRIMARY KEY (`ID_dulieu`);

--
-- Chỉ mục cho bảng `kpi`
--
ALTER TABLE `kpi`
  ADD PRIMARY KEY (`ID_kpi`);

--
-- Chỉ mục cho bảng `loai_kpi`
--
ALTER TABLE `loai_kpi`
  ADD PRIMARY KEY (`ID_loai_kpi`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nhatky`
--
ALTER TABLE `nhatky`
  ADD PRIMARY KEY (`ID_nhatky`),
  ADD KEY `ID_nguoithuchien` (`ID_nguoithuchien`);

--
-- Chỉ mục cho bảng `phancong_kpi`
--
ALTER TABLE `phancong_kpi`
  ADD PRIMARY KEY (`ID_Phancong`),
  ADD KEY `ID_kpi` (`ID_kpi`),
  ADD KEY `ID_user` (`ID_user`),
  ADD KEY `ID_phongban` (`ID_phongban`);

--
-- Chỉ mục cho bảng `phongban`
--
ALTER TABLE `phongban`
  ADD PRIMARY KEY (`ID_phongban`);

--
-- Chỉ mục cho bảng `quyen`
--
ALTER TABLE `quyen`
  ADD PRIMARY KEY (`ID_quyen`),
  ADD UNIQUE KEY `Ten_quyen` (`Ten_quyen`);

--
-- Chỉ mục cho bảng `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`ID_task`);

--
-- Chỉ mục cho bảng `task_user`
--
ALTER TABLE `task_user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `thongbao`
--
ALTER TABLE `thongbao`
  ADD PRIMARY KEY (`ID_thongbao`),
  ADD KEY `ID_nguoinhan` (`ID_nguoinhan`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID_user`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Email_2` (`Email`),
  ADD KEY `ID_quyen` (`ID_quyen`),
  ADD KEY `ID_phongban` (`ID_phongban`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `danhgia_kpi`
--
ALTER TABLE `danhgia_kpi`
  MODIFY `ID_danhgia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `dulieu_kpi`
--
ALTER TABLE `dulieu_kpi`
  MODIFY `ID_dulieu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `dulieu_task`
--
ALTER TABLE `dulieu_task`
  MODIFY `ID_dulieu` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `kpi`
--
ALTER TABLE `kpi`
  MODIFY `ID_kpi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `loai_kpi`
--
ALTER TABLE `loai_kpi`
  MODIFY `ID_loai_kpi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `nhatky`
--
ALTER TABLE `nhatky`
  MODIFY `ID_nhatky` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `phancong_kpi`
--
ALTER TABLE `phancong_kpi`
  MODIFY `ID_Phancong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT cho bảng `phongban`
--
ALTER TABLE `phongban`
  MODIFY `ID_phongban` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `quyen`
--
ALTER TABLE `quyen`
  MODIFY `ID_quyen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tasks`
--
ALTER TABLE `tasks`
  MODIFY `ID_task` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `task_user`
--
ALTER TABLE `task_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `thongbao`
--
ALTER TABLE `thongbao`
  MODIFY `ID_thongbao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `ID_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `danhgia_kpi`
--
ALTER TABLE `danhgia_kpi`
  ADD CONSTRAINT `danhgia_kpi_ibfk_1` FOREIGN KEY (`ID_phancong`) REFERENCES `phancong_kpi` (`ID_Phancong`) ON DELETE CASCADE,
  ADD CONSTRAINT `danhgia_kpi_ibfk_2` FOREIGN KEY (`ID_nguoithamdinh`) REFERENCES `users` (`ID_user`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `dulieu_kpi`
--
ALTER TABLE `dulieu_kpi`
  ADD CONSTRAINT `dulieu_kpi_ibfk_1` FOREIGN KEY (`ID_phancong`) REFERENCES `phancong_kpi` (`ID_Phancong`) ON DELETE CASCADE,
  ADD CONSTRAINT `dulieu_kpi_ibfk_2` FOREIGN KEY (`ID_nguoigui`) REFERENCES `users` (`ID_user`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `nhatky`
--
ALTER TABLE `nhatky`
  ADD CONSTRAINT `nhatky_ibfk_1` FOREIGN KEY (`ID_nguoithuchien`) REFERENCES `users` (`ID_user`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `phancong_kpi`
--
ALTER TABLE `phancong_kpi`
  ADD CONSTRAINT `phancong_kpi_ibfk_1` FOREIGN KEY (`ID_kpi`) REFERENCES `kpi` (`ID_kpi`) ON DELETE CASCADE,
  ADD CONSTRAINT `phancong_kpi_ibfk_2` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`) ON DELETE SET NULL,
  ADD CONSTRAINT `phancong_kpi_ibfk_3` FOREIGN KEY (`ID_phongban`) REFERENCES `phongban` (`ID_phongban`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `thongbao`
--
ALTER TABLE `thongbao`
  ADD CONSTRAINT `thongbao_ibfk_1` FOREIGN KEY (`ID_nguoinhan`) REFERENCES `users` (`ID_user`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`ID_quyen`) REFERENCES `quyen` (`ID_quyen`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`ID_phongban`) REFERENCES `phongban` (`ID_phongban`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
