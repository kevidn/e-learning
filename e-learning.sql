-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 03, 2025 at 03:22 PM
-- Server version: 8.4.3
-- PHP Version: 8.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `assignment_id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` longtext,
  `deadline` datetime(6) DEFAULT NULL,
  `module_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`assignment_id`, `title`, `description`, `deadline`, `module_id`) VALUES
(104, 'Tugas: Praktek Control Flow Logic', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-14 18:47:23.017196', 217),
(105, 'Tugas: Praktek Control Flow Logic', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-07 18:47:23.490339', 220),
(106, 'Tugas: Praktek Basic Syntax & Variables', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-09 18:47:23.549225', 221),
(107, 'Tugas: Praktek Data Structures', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-07 18:47:23.573881', 222),
(108, 'Tugas: Praktek Database Integration', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-08 18:47:23.634877', 225),
(109, 'Tugas: Praktek Deployment Strategies', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-14 18:47:23.688878', 228),
(110, 'Tugas: Praktek Basic Syntax & Variables', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-07 18:47:23.717879', 229),
(111, 'Tugas: Praktek Control Flow Logic', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-14 18:47:23.737878', 230),
(112, 'Tugas: Praktek Database Integration', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-14 18:47:23.782880', 232),
(113, 'Tugas: Praktek Deployment Strategies', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-13 18:47:23.801878', 233),
(114, 'Tugas: Praktek Monitoring & Evaluation', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-07 18:47:23.847875', 235),
(115, 'Tugas: Praktek Growth Hacks', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-13 18:47:23.881874', 237),
(116, 'Tugas: Praktek Planning Strategy', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-07 18:47:23.905878', 238),
(117, 'Tugas: Praktek Control Flow Logic', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-15 18:47:23.964879', 241),
(118, 'Tugas: Praktek Database Integration', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-07 18:47:23.983874', 242),
(119, 'Tugas: Praktek Conclusion', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-07 18:47:24.050026', 245),
(120, 'Tugas: Praktek Advanced Tips', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-12 18:47:24.070035', 246),
(121, 'Tugas: Praktek Mindset & Fundamentals', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-09 18:47:24.088948', 247),
(122, 'Tugas: Praktek Conclusion', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-16 18:47:24.112947', 248),
(123, 'Tugas: Praktek Execution Techniques', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-13 18:47:24.170947', 251),
(124, 'Tugas: Praktek Monitoring & Evaluation', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-11 18:47:24.195949', 252),
(125, 'Tugas: Praktek Case Study Analysis', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-08 18:47:24.234264', 254),
(126, 'Tugas: Praktek Common Mistakes', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-12 18:47:24.259264', 255),
(127, 'Tugas: Praktek Growth Hacks', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-07 18:47:24.297257', 257),
(128, 'Tugas: Praktek Planning Strategy', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-08 18:47:24.341264', 259),
(129, 'Tugas: Praktek Mindset & Fundamentals', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-10 18:47:24.365264', 260),
(130, 'Tugas: Praktek Case Study Analysis', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-08 18:47:24.389262', 261),
(131, 'Tugas: Praktek Common Mistakes', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-14 18:47:24.453263', 264),
(132, 'Tugas: Praktek Tools & Resources', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-14 18:47:24.498491', 266),
(133, 'Tugas: Praktek Common Mistakes', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-05 18:47:24.580902', 270),
(134, 'Tugas: Praktek Execution Techniques', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-15 18:47:24.604900', 271),
(135, 'Tugas: Praktek Advanced Tips', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-13 18:47:24.643581', 273),
(136, 'Tugas: Praktek Growth Hacks', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-15 18:47:24.667602', 274),
(137, 'Tugas: Praktek Planning Strategy', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-13 18:47:24.706581', 276),
(138, 'Tugas: Praktek Mindset & Fundamentals', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-15 18:47:24.730581', 277),
(139, 'Tugas: Praktek Tools & Resources', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-05 18:47:24.759581', 278),
(140, 'Tugas: Praktek Common Mistakes', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-13 18:47:24.779587', 279),
(141, 'Tugas: Praktek Tools & Resources', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-06 18:47:24.823580', 281),
(142, 'Tugas: Praktek Mindset & Fundamentals', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-10 18:47:24.843584', 282),
(143, 'Tugas: Praktek Conclusion', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-12 18:47:24.919580', 286),
(144, 'Tugas: Praktek Common Mistakes', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-14 18:47:24.983581', 289),
(145, 'Tugas: Praktek Tools & Resources', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-15 18:47:25.023579', 291),
(146, 'Tugas: Praktek Tools & Resources', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-07 18:47:25.066327', 293),
(147, 'Tugas: Praktek Mindset & Fundamentals', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-14 18:47:25.115097', 296),
(148, 'Tugas: Praktek Common Mistakes', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-10 18:47:25.135095', 297),
(149, 'Tugas: Praktek Tools & Resources', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-05 18:47:25.174098', 299),
(150, 'Tugas: Praktek Conclusion', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-11 18:47:25.197095', 300),
(151, 'Tugas: Praktek Conclusion', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-07 18:47:25.269445', 304),
(152, 'Tugas: Praktek Tools & Resources', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-14 18:47:25.312447', 306),
(153, 'Tugas: Praktek Common Mistakes', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-06 18:47:25.336445', 307),
(154, 'Tugas: Praktek Advanced Tips', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-08 18:47:25.373444', 309),
(155, 'Tugas: Praktek Conclusion', 'Kerjakan latihan sesuai materi video dan upload hasilnya.', '2025-12-15 18:47:25.392445', 310);

-- --------------------------------------------------------

--
-- Table structure for table `assignment_files`
--

CREATE TABLE `assignment_files` (
  `file_id` int NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `assignment_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add assignment', 7, 'add_assignment'),
(26, 'Can change assignment', 7, 'change_assignment'),
(27, 'Can delete assignment', 7, 'delete_assignment'),
(28, 'Can view assignment', 7, 'view_assignment'),
(29, 'Can add course', 8, 'add_course'),
(30, 'Can change course', 8, 'change_course'),
(31, 'Can delete course', 8, 'delete_course'),
(32, 'Can view course', 8, 'view_course'),
(33, 'Can add role', 9, 'add_role'),
(34, 'Can change role', 9, 'change_role'),
(35, 'Can delete role', 9, 'delete_role'),
(36, 'Can view role', 9, 'view_role'),
(37, 'Can add assignment file', 10, 'add_assignmentfile'),
(38, 'Can change assignment file', 10, 'change_assignmentfile'),
(39, 'Can delete assignment file', 10, 'delete_assignmentfile'),
(40, 'Can view assignment file', 10, 'view_assignmentfile'),
(41, 'Can add module', 11, 'add_module'),
(42, 'Can change module', 11, 'change_module'),
(43, 'Can delete module', 11, 'delete_module'),
(44, 'Can view module', 11, 'view_module'),
(45, 'Can add module content', 12, 'add_modulecontent'),
(46, 'Can change module content', 12, 'change_modulecontent'),
(47, 'Can delete module content', 12, 'delete_modulecontent'),
(48, 'Can view module content', 12, 'view_modulecontent'),
(49, 'Can add quiz', 13, 'add_quiz'),
(50, 'Can change quiz', 13, 'change_quiz'),
(51, 'Can delete quiz', 13, 'delete_quiz'),
(52, 'Can view quiz', 13, 'view_quiz'),
(53, 'Can add question', 14, 'add_question'),
(54, 'Can change question', 14, 'change_question'),
(55, 'Can delete question', 14, 'delete_question'),
(56, 'Can view question', 14, 'view_question'),
(57, 'Can add user', 15, 'add_user'),
(58, 'Can change user', 15, 'change_user'),
(59, 'Can delete user', 15, 'delete_user'),
(60, 'Can view user', 15, 'view_user'),
(61, 'Can add submission', 16, 'add_submission'),
(62, 'Can change submission', 16, 'change_submission'),
(63, 'Can delete submission', 16, 'delete_submission'),
(64, 'Can view submission', 16, 'view_submission'),
(65, 'Can add message', 17, 'add_message'),
(66, 'Can change message', 17, 'change_message'),
(67, 'Can delete message', 17, 'delete_message'),
(68, 'Can view message', 17, 'view_message'),
(69, 'Can add grade', 18, 'add_grade'),
(70, 'Can change grade', 18, 'change_grade'),
(71, 'Can delete grade', 18, 'delete_grade'),
(72, 'Can view grade', 18, 'view_grade'),
(73, 'Can add enrollment', 19, 'add_enrollment'),
(74, 'Can change enrollment', 19, 'change_enrollment'),
(75, 'Can delete enrollment', 19, 'delete_enrollment'),
(76, 'Can view enrollment', 19, 'view_enrollment'),
(77, 'Can add discussion', 20, 'add_discussion'),
(78, 'Can change discussion', 20, 'change_discussion'),
(79, 'Can delete discussion', 20, 'delete_discussion'),
(80, 'Can view discussion', 20, 'view_discussion');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int NOT NULL,
  `course_name` varchar(150) NOT NULL,
  `description` longtext,
  `created_at` datetime(6) NOT NULL,
  `lecturer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `description`, `created_at`, `lecturer_id`) VALUES
(47, 'Fullstack Web Development', 'Panduan lengkap tentang Fullstack Web Development. Membahas Django & React dari dasar hingga mahir.', '2025-12-02 18:47:22.756677', 44),
(48, 'Data Science Bootcamp', 'Panduan lengkap tentang Data Science Bootcamp. Membahas Python & Pandas dari dasar hingga mahir.', '2025-12-02 18:47:23.122779', 44),
(49, 'Flutter Mobile Apps', 'Panduan lengkap tentang Flutter Mobile Apps. Membahas Android & iOS dari dasar hingga mahir.', '2025-12-02 18:47:23.579880', 45),
(50, 'Cyber Security Ethical Hacking', 'Panduan lengkap tentang Cyber Security Ethical Hacking. Membahas Network Security dari dasar hingga mahir.', '2025-12-02 18:47:23.693899', 48),
(51, 'DevOps & Cloud Computing', 'Panduan lengkap tentang DevOps & Cloud Computing. Membahas AWS & Docker dari dasar hingga mahir.', '2025-12-02 18:47:23.822879', 46),
(52, 'Game Development with Unity', 'Panduan lengkap tentang Game Development with Unity. Membahas C# Programming dari dasar hingga mahir.', '2025-12-02 18:47:23.911881', 46),
(53, 'UI/UX Design Masterclass', 'Panduan lengkap tentang UI/UX Design Masterclass. Membahas Figma & Wireframing dari dasar hingga mahir.', '2025-12-02 18:47:24.007878', 44),
(54, 'Machine Learning A-Z', 'Panduan lengkap tentang Machine Learning A-Z. Membahas AI & Neural Networks dari dasar hingga mahir.', '2025-12-02 18:47:24.094948', 48),
(55, 'Blockchain Fundamentals', 'Panduan lengkap tentang Blockchain Fundamentals. Membahas Crypto & Smart Contracts dari dasar hingga mahir.', '2025-12-02 18:47:24.200948', 44),
(56, 'Software QA Testing', 'Panduan lengkap tentang Software QA Testing. Membahas Automated Testing dari dasar hingga mahir.', '2025-12-02 18:47:24.303262', 48),
(57, 'Digital Marketing Strategy', 'Panduan lengkap tentang Digital Marketing Strategy. Membahas SEO & Ads dari dasar hingga mahir.', '2025-12-02 18:47:24.395265', 47),
(58, 'Public Speaking Confidence', 'Panduan lengkap tentang Public Speaking Confidence. Membahas Communication Skills dari dasar hingga mahir.', '2025-12-02 18:47:24.503491', 46),
(59, 'Financial Management 101', 'Panduan lengkap tentang Financial Management 101. Membahas Personal Finance dari dasar hingga mahir.', '2025-12-02 18:47:24.585900', 44),
(60, 'Project Management PMP', 'Panduan lengkap tentang Project Management PMP. Membahas Agile & Scrum dari dasar hingga mahir.', '2025-12-02 18:47:24.673581', 44),
(61, 'Microsoft Excel Mastery', 'Panduan lengkap tentang Microsoft Excel Mastery. Membahas Data Analysis dari dasar hingga mahir.', '2025-12-02 18:47:24.799581', 44),
(62, 'Copywriting for Sales', 'Panduan lengkap tentang Copywriting for Sales. Membahas Persuasive Writing dari dasar hingga mahir.', '2025-12-02 18:47:24.924580', 47),
(63, 'Branding & Identity', 'Panduan lengkap tentang Branding & Identity. Membahas Building Personal Brand dari dasar hingga mahir.', '2025-12-02 18:47:25.047792', 45),
(64, 'Entrepreneurship Startup', 'Panduan lengkap tentang Entrepreneurship Startup. Membahas Business Model Canvas dari dasar hingga mahir.', '2025-12-02 18:47:25.140096', 44),
(65, 'Time Management Hacks', 'Panduan lengkap tentang Time Management Hacks. Membahas Productivity dari dasar hingga mahir.', '2025-12-02 18:47:25.217097', 45),
(66, 'Graphic Design for Beginners', 'Panduan lengkap tentang Graphic Design for Beginners. Membahas Canva & Photoshop dari dasar hingga mahir.', '2025-12-02 18:47:25.317443', 47);

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `discussion_id` int NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `course_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `discussions`
--

INSERT INTO `discussions` (`discussion_id`, `message`, `created_at`, `course_id`, `user_id`) VALUES
(53, 'Izin bertanya untuk materi Data Science Bootcamp?', '2025-12-02 18:47:25.404443', 48, 49),
(54, 'Halo Andi Saputra, silakan cek referensi ya.', '2025-12-02 18:47:25.410450', 48, 44),
(55, 'Izin bertanya untuk materi Branding & Identity?', '2025-12-02 18:47:25.434335', 63, 49),
(56, 'Halo Andi Saputra, silakan cek referensi ya.', '2025-12-02 18:47:25.439345', 63, 45),
(57, 'Izin bertanya untuk materi Blockchain Fundamentals?', '2025-12-02 18:47:25.477335', 55, 49),
(58, 'Halo Andi Saputra, silakan cek referensi ya.', '2025-12-02 18:47:25.482335', 55, 44),
(59, 'Izin bertanya untuk materi Machine Learning A-Z?', '2025-12-02 18:47:25.545339', 54, 49),
(60, 'Halo Andi Saputra, silakan cek referensi ya.', '2025-12-02 18:47:25.549337', 54, 48),
(61, 'Izin bertanya untuk materi Project Management PMP?', '2025-12-02 18:47:25.573833', 60, 50),
(62, 'Halo Siti Aminah, silakan cek referensi ya.', '2025-12-02 18:47:25.578833', 60, 44),
(63, 'Izin bertanya untuk materi Fullstack Web Development?', '2025-12-02 18:47:25.782045', 47, 51),
(64, 'Halo Budi Kecil, silakan cek referensi ya.', '2025-12-02 18:47:25.786678', 47, 44),
(65, 'Izin bertanya untuk materi Digital Marketing Strategy?', '2025-12-02 18:47:25.874604', 57, 52),
(66, 'Halo Citra Kirana, silakan cek referensi ya.', '2025-12-02 18:47:25.879605', 57, 47),
(67, 'Izin bertanya untuk materi Financial Management 101?', '2025-12-02 18:47:25.903604', 59, 52),
(68, 'Halo Citra Kirana, silakan cek referensi ya.', '2025-12-02 18:47:25.908606', 59, 44),
(69, 'Izin bertanya untuk materi Entrepreneurship Startup?', '2025-12-02 18:47:25.932601', 64, 52),
(70, 'Halo Citra Kirana, silakan cek referensi ya.', '2025-12-02 18:47:25.936603', 64, 44),
(71, 'Izin bertanya untuk materi Branding & Identity?', '2025-12-02 18:47:25.957605', 63, 52),
(72, 'Halo Citra Kirana, silakan cek referensi ya.', '2025-12-02 18:47:25.961605', 63, 45),
(73, 'Izin bertanya untuk materi Blockchain Fundamentals?', '2025-12-02 18:47:26.024604', 55, 52),
(74, 'Halo Citra Kirana, silakan cek referensi ya.', '2025-12-02 18:47:26.030604', 55, 44),
(75, 'Izin bertanya untuk materi Digital Marketing Strategy?', '2025-12-02 18:47:26.068604', 57, 53),
(76, 'Halo Deni Sumargo, silakan cek referensi ya.', '2025-12-02 18:47:26.073605', 57, 47),
(77, 'Izin bertanya untuk materi Game Development with Unity?', '2025-12-02 18:47:26.197529', 52, 54),
(78, 'Halo Eko Patrio, silakan cek referensi ya.', '2025-12-02 18:47:26.201509', 52, 46),
(79, 'Izin bertanya untuk materi Public Speaking Confidence?', '2025-12-02 18:47:26.247911', 58, 54),
(80, 'Halo Eko Patrio, silakan cek referensi ya.', '2025-12-02 18:47:26.252910', 58, 46),
(81, 'Izin bertanya untuk materi Entrepreneurship Startup?', '2025-12-02 18:47:26.320911', 64, 55),
(82, 'Halo Fanny Ghassani, silakan cek referensi ya.', '2025-12-02 18:47:26.324909', 64, 44),
(83, 'Izin bertanya untuk materi Microsoft Excel Mastery?', '2025-12-02 18:47:26.437911', 61, 56),
(84, 'Halo Gilang Dirga, silakan cek referensi ya.', '2025-12-02 18:47:26.441912', 61, 44),
(85, 'Izin bertanya untuk materi Graphic Design for Beginners?', '2025-12-02 18:47:26.501911', 66, 56),
(86, 'Halo Gilang Dirga, silakan cek referensi ya.', '2025-12-02 18:47:26.506911', 66, 47),
(87, 'Izin bertanya untuk materi Branding & Identity?', '2025-12-02 18:47:26.550909', 63, 56),
(88, 'Halo Gilang Dirga, silakan cek referensi ya.', '2025-12-02 18:47:26.554910', 63, 45),
(89, 'Izin bertanya untuk materi Machine Learning A-Z?', '2025-12-02 18:47:26.583910', 54, 57),
(90, 'Halo Hesti Purwadinata, silakan cek referensi ya.', '2025-12-02 18:47:26.588912', 54, 48),
(91, 'Izin bertanya untuk materi Financial Management 101?', '2025-12-02 18:47:26.637262', 59, 57),
(92, 'Halo Hesti Purwadinata, silakan cek referensi ya.', '2025-12-02 18:47:26.642263', 59, 44),
(93, 'Izin bertanya untuk materi Microsoft Excel Mastery?', '2025-12-02 18:47:26.692702', 61, 57),
(94, 'Halo Hesti Purwadinata, silakan cek referensi ya.', '2025-12-02 18:47:26.698702', 61, 44),
(95, 'Izin bertanya untuk materi Data Science Bootcamp?', '2025-12-02 18:47:26.721702', 48, 57),
(96, 'Halo Hesti Purwadinata, silakan cek referensi ya.', '2025-12-02 18:47:26.726702', 48, 44),
(97, 'Izin bertanya untuk materi Copywriting for Sales?', '2025-12-02 18:47:26.799992', 62, 58),
(98, 'Halo Irfan Hakim, silakan cek referensi ya.', '2025-12-02 18:47:26.805992', 62, 47),
(99, 'Izin bertanya untuk materi Public Speaking Confidence?', '2025-12-02 18:47:26.870081', 58, 58),
(100, 'Halo Irfan Hakim, silakan cek referensi ya.', '2025-12-02 18:47:26.874102', 58, 46),
(101, 'Izin bertanya untuk materi Microsoft Excel Mastery?', '2025-12-02 18:47:26.894083', 61, 58),
(102, 'Halo Irfan Hakim, silakan cek referensi ya.', '2025-12-02 18:47:26.898081', 61, 44);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'app', 'assignment'),
(10, 'app', 'assignmentfile'),
(8, 'app', 'course'),
(20, 'app', 'discussion'),
(19, 'app', 'enrollment'),
(18, 'app', 'grade'),
(17, 'app', 'message'),
(11, 'app', 'module'),
(12, 'app', 'modulecontent'),
(14, 'app', 'question'),
(13, 'app', 'quiz'),
(9, 'app', 'role'),
(16, 'app', 'submission'),
(15, 'app', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-11-26 21:59:19.385952'),
(2, 'auth', '0001_initial', '2025-11-26 21:59:21.425052'),
(3, 'admin', '0001_initial', '2025-11-26 21:59:21.995673'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-11-26 21:59:22.034678'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-11-26 21:59:22.073680'),
(6, 'app', '0001_initial', '2025-11-26 21:59:27.502664'),
(7, 'app', '0002_enrollment_last_module_grade_enrollment', '2025-11-26 21:59:28.074013'),
(8, 'contenttypes', '0002_remove_content_type_name', '2025-11-26 21:59:28.465424'),
(9, 'auth', '0002_alter_permission_name_max_length', '2025-11-26 21:59:28.733190'),
(10, 'auth', '0003_alter_user_email_max_length', '2025-11-26 21:59:28.878853'),
(11, 'auth', '0004_alter_user_username_opts', '2025-11-26 21:59:28.913532'),
(12, 'auth', '0005_alter_user_last_login_null', '2025-11-26 21:59:29.171514'),
(13, 'auth', '0006_require_contenttypes_0002', '2025-11-26 21:59:29.177491'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2025-11-26 21:59:29.232493'),
(15, 'auth', '0008_alter_user_username_max_length', '2025-11-26 21:59:29.482860'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2025-11-26 21:59:29.757840'),
(17, 'auth', '0010_alter_group_name_max_length', '2025-11-26 21:59:29.865003'),
(18, 'auth', '0011_update_proxy_permissions', '2025-11-26 21:59:29.950526'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2025-11-26 21:59:30.226126'),
(20, 'sessions', '0001_initial', '2025-11-26 21:59:30.348102'),
(21, 'app', '0003_grade_feedback', '2025-11-29 04:17:21.460243');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('i3l2xe7d33ahb4r0b92ri6e80ycfmn6q', 'e30:1vQoAZ:oT-4Bb01RjhCpP-aQPt_IO_FggSn10gOCVVLZEhbCG0', '2025-12-17 14:49:27.354660'),
('pxor1bmqaa8qd11er914pxg6ijjqa794', 'eyJ1c2VyX2lkIjo2LCJuYW1lIjoiQW5kaSBTYXB1dHJhIiwicm9sZV9uYW1lIjoiTWFoYXNpc3dhIn0:1vQ4Ag:UEq6yBw0O8j_KAzEk4Tdr6udJqwaRroWbZL6Qn3bAbg', '2025-12-15 13:42:30.985707'),
('xrzd3guody9p0gksf0occ4qtd9glbx4m', 'eyJ1c2VyX2lkIjo2LCJuYW1lIjoiQW5kaSBTYXB1dHJhIiwicm9sZV9uYW1lIjoiTWFoYXNpc3dhIn0:1vPCrz:o9be0tp2Hs4wamvqZ7RzBjT8T1MAw6yqcRBjKRYSVTA', '2025-12-13 04:47:39.887270');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` int NOT NULL,
  `enrolled_at` datetime(6) NOT NULL,
  `course_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `last_module_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`enrollment_id`, `enrolled_at`, `course_id`, `user_id`, `last_module_id`) VALUES
(77, '2025-12-02 18:47:25.398445', 48, 49, 219),
(78, '2025-12-02 18:47:25.428338', 63, 49, NULL),
(79, '2025-12-02 18:47:25.472342', 55, 49, NULL),
(80, '2025-12-02 18:47:25.497335', 57, 49, NULL),
(81, '2025-12-02 18:47:25.512336', 58, 49, NULL),
(82, '2025-12-02 18:47:25.520359', 53, 49, 244),
(83, '2025-12-02 18:47:25.540336', 54, 49, 248),
(84, '2025-12-02 18:47:25.568830', 60, 50, NULL),
(85, '2025-12-02 18:47:25.587853', 63, 50, NULL),
(86, '2025-12-02 18:47:25.603596', 64, 50, NULL),
(87, '2025-12-02 18:47:25.629596', 62, 50, NULL),
(88, '2025-12-02 18:47:25.679438', 54, 50, NULL),
(89, '2025-12-02 18:47:25.716751', 54, 51, NULL),
(90, '2025-12-02 18:47:25.742294', 64, 51, NULL),
(91, '2025-12-02 18:47:25.756866', 53, 51, NULL),
(92, '2025-12-02 18:47:25.777119', 47, 51, NULL),
(93, '2025-12-02 18:47:25.801525', 57, 51, NULL),
(94, '2025-12-02 18:47:25.810373', 52, 51, NULL),
(95, '2025-12-02 18:47:25.824934', 60, 51, NULL),
(96, '2025-12-02 18:47:25.845605', 63, 51, NULL),
(97, '2025-12-02 18:47:25.869605', 57, 52, NULL),
(98, '2025-12-02 18:47:25.898604', 59, 52, NULL),
(99, '2025-12-02 18:47:25.927603', 64, 52, NULL),
(100, '2025-12-02 18:47:25.952625', 63, 52, NULL),
(101, '2025-12-02 18:47:25.981604', 65, 52, NULL),
(102, '2025-12-02 18:47:26.000604', 56, 52, NULL),
(103, '2025-12-02 18:47:26.020604', 55, 52, NULL),
(104, '2025-12-02 18:47:26.049604', 48, 53, NULL),
(105, '2025-12-02 18:47:26.063604', 57, 53, NULL),
(106, '2025-12-02 18:47:26.087766', 62, 53, NULL),
(107, '2025-12-02 18:47:26.107765', 63, 53, NULL),
(108, '2025-12-02 18:47:26.127512', 60, 53, NULL),
(109, '2025-12-02 18:47:26.152509', 64, 53, NULL),
(110, '2025-12-02 18:47:26.172509', 51, 54, NULL),
(111, '2025-12-02 18:47:26.192504', 52, 54, NULL),
(112, '2025-12-02 18:47:26.216507', 53, 54, NULL),
(113, '2025-12-02 18:47:26.242913', 58, 54, NULL),
(114, '2025-12-02 18:47:26.261934', 59, 54, NULL),
(115, '2025-12-02 18:47:26.286911', 57, 54, NULL),
(116, '2025-12-02 18:47:26.305911', 52, 55, NULL),
(117, '2025-12-02 18:47:26.315933', 64, 55, NULL),
(118, '2025-12-02 18:47:26.344913', 55, 55, NULL),
(119, '2025-12-02 18:47:26.369911', 57, 55, NULL),
(120, '2025-12-02 18:47:26.383911', 63, 55, NULL),
(121, '2025-12-02 18:47:26.408912', 54, 56, NULL),
(122, '2025-12-02 18:47:26.432912', 61, 56, NULL),
(123, '2025-12-02 18:47:26.461913', 47, 56, NULL),
(124, '2025-12-02 18:47:26.475911', 60, 56, NULL),
(125, '2025-12-02 18:47:26.496911', 66, 56, NULL),
(126, '2025-12-02 18:47:26.525911', 49, 56, NULL),
(127, '2025-12-02 18:47:26.545912', 63, 56, NULL),
(128, '2025-12-02 18:47:26.579911', 54, 57, NULL),
(129, '2025-12-02 18:47:26.613910', 53, 57, NULL),
(130, '2025-12-02 18:47:26.632262', 59, 57, NULL),
(131, '2025-12-02 18:47:26.667702', 66, 57, NULL),
(132, '2025-12-02 18:47:26.687702', 61, 57, NULL),
(133, '2025-12-02 18:47:26.717702', 48, 57, NULL),
(134, '2025-12-02 18:47:26.746375', 59, 58, NULL),
(135, '2025-12-02 18:47:26.771376', 53, 58, NULL),
(136, '2025-12-02 18:47:26.794937', 62, 58, NULL),
(137, '2025-12-02 18:47:26.824993', 55, 58, NULL),
(138, '2025-12-02 18:47:26.845082', 66, 58, NULL),
(139, '2025-12-02 18:47:26.865082', 58, 58, NULL),
(140, '2025-12-02 18:47:26.889083', 61, 58, NULL),
(143, '2025-12-02 19:17:58.017734', 66, 49, 309);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int NOT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  `assignment_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `quiz_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `enrollment_id` int DEFAULT NULL,
  `feedback` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `score`, `assignment_id`, `course_id`, `quiz_id`, `user_id`, `enrollment_id`, `feedback`) VALUES
(114, 94.00, 106, NULL, NULL, 49, NULL, 'Bagus, tingkatkan lagi.'),
(115, 75.00, 146, NULL, NULL, 49, NULL, 'Perbaiki format.'),
(116, 73.00, 147, NULL, NULL, 49, NULL, 'Perbaiki format.'),
(117, 63.00, 148, NULL, NULL, 49, NULL, 'Perbaiki format.'),
(118, 76.00, 127, NULL, NULL, 49, NULL, 'Perbaiki format.'),
(119, 62.00, 132, NULL, NULL, 49, NULL, 'Perbaiki format.'),
(120, 80.00, 119, NULL, NULL, 49, NULL, 'Perbaiki format.'),
(121, 86.00, 120, NULL, NULL, 49, NULL, 'Bagus, tingkatkan lagi.'),
(122, 68.00, 122, NULL, NULL, 49, NULL, 'Perbaiki format.'),
(123, 68.00, 124, NULL, NULL, 49, NULL, 'Perbaiki format.'),
(124, 70.00, 147, NULL, NULL, 50, NULL, 'Perbaiki format.'),
(125, 86.00, 149, NULL, NULL, 50, NULL, 'Bagus, tingkatkan lagi.'),
(126, 83.00, 150, NULL, NULL, 50, NULL, 'Bagus, tingkatkan lagi.'),
(127, 65.00, 144, NULL, NULL, 50, NULL, 'Perbaiki format.'),
(128, 80.00, 145, NULL, NULL, 50, NULL, 'Perbaiki format.'),
(129, 81.00, 123, NULL, NULL, 50, NULL, 'Bagus, tingkatkan lagi.'),
(130, 83.00, 124, NULL, NULL, 50, NULL, 'Bagus, tingkatkan lagi.'),
(131, 60.00, 122, NULL, NULL, 51, NULL, 'Perbaiki format.'),
(132, 64.00, 123, NULL, NULL, 51, NULL, 'Perbaiki format.'),
(133, 94.00, 124, NULL, NULL, 51, NULL, 'Bagus, tingkatkan lagi.'),
(134, 97.00, 150, NULL, NULL, 51, NULL, 'Bagus, tingkatkan lagi.'),
(135, 78.00, 119, NULL, NULL, 51, NULL, 'Perbaiki format.'),
(136, 92.00, 120, NULL, NULL, 51, NULL, 'Bagus, tingkatkan lagi.'),
(137, 72.00, 104, NULL, NULL, 51, NULL, 'Perbaiki format.'),
(138, 70.00, 117, NULL, NULL, 51, NULL, 'Perbaiki format.'),
(139, 69.00, 137, NULL, NULL, 51, NULL, 'Perbaiki format.'),
(140, 64.00, 138, NULL, NULL, 51, NULL, 'Perbaiki format.'),
(141, 88.00, 146, NULL, NULL, 51, NULL, 'Bagus, tingkatkan lagi.'),
(142, 69.00, 147, NULL, NULL, 51, NULL, 'Perbaiki format.'),
(143, 83.00, 148, NULL, NULL, 51, NULL, 'Bagus, tingkatkan lagi.'),
(144, 69.00, 131, NULL, NULL, 52, NULL, 'Perbaiki format.'),
(145, 97.00, 132, NULL, NULL, 52, NULL, 'Bagus, tingkatkan lagi.'),
(146, 67.00, 134, NULL, NULL, 52, NULL, 'Perbaiki format.'),
(147, 69.00, 135, NULL, NULL, 52, NULL, 'Perbaiki format.'),
(148, 72.00, 150, NULL, NULL, 52, NULL, 'Perbaiki format.'),
(149, 74.00, 146, NULL, NULL, 52, NULL, 'Perbaiki format.'),
(150, 62.00, 147, NULL, NULL, 52, NULL, 'Perbaiki format.'),
(151, 83.00, 151, NULL, NULL, 52, NULL, 'Bagus, tingkatkan lagi.'),
(152, 99.00, 152, NULL, NULL, 52, NULL, 'Bagus, tingkatkan lagi.'),
(153, 62.00, 129, NULL, NULL, 52, NULL, 'Perbaiki format.'),
(154, 90.00, 130, NULL, NULL, 52, NULL, 'Bagus, tingkatkan lagi.'),
(155, 70.00, 125, NULL, NULL, 52, NULL, 'Perbaiki format.'),
(156, 88.00, 127, NULL, NULL, 52, NULL, 'Bagus, tingkatkan lagi.'),
(157, 92.00, 105, NULL, NULL, 53, NULL, 'Bagus, tingkatkan lagi.'),
(158, 83.00, 132, NULL, NULL, 53, NULL, 'Bagus, tingkatkan lagi.'),
(159, 96.00, 144, NULL, NULL, 53, NULL, 'Bagus, tingkatkan lagi.'),
(160, 95.00, 145, NULL, NULL, 53, NULL, 'Bagus, tingkatkan lagi.'),
(161, 80.00, 146, NULL, NULL, 53, NULL, 'Perbaiki format.'),
(162, 89.00, 148, NULL, NULL, 53, NULL, 'Bagus, tingkatkan lagi.'),
(163, 66.00, 137, NULL, NULL, 53, NULL, 'Perbaiki format.'),
(164, 91.00, 139, NULL, NULL, 53, NULL, 'Bagus, tingkatkan lagi.'),
(165, 88.00, 140, NULL, NULL, 53, NULL, 'Bagus, tingkatkan lagi.'),
(166, 95.00, 149, NULL, NULL, 53, NULL, 'Bagus, tingkatkan lagi.'),
(167, 73.00, 150, NULL, NULL, 53, NULL, 'Perbaiki format.'),
(168, 70.00, 115, NULL, NULL, 54, NULL, 'Perbaiki format.'),
(169, 71.00, 116, NULL, NULL, 54, NULL, 'Perbaiki format.'),
(170, 98.00, 118, NULL, NULL, 54, NULL, 'Bagus, tingkatkan lagi.'),
(171, 76.00, 119, NULL, NULL, 54, NULL, 'Perbaiki format.'),
(172, 71.00, 120, NULL, NULL, 54, NULL, 'Perbaiki format.'),
(173, 72.00, 121, NULL, NULL, 54, NULL, 'Perbaiki format.'),
(174, 67.00, 134, NULL, NULL, 54, NULL, 'Perbaiki format.'),
(175, 72.00, 135, NULL, NULL, 54, NULL, 'Perbaiki format.'),
(176, 89.00, 136, NULL, NULL, 54, NULL, 'Bagus, tingkatkan lagi.'),
(177, 74.00, 131, NULL, NULL, 54, NULL, 'Perbaiki format.'),
(178, 75.00, 132, NULL, NULL, 54, NULL, 'Perbaiki format.'),
(179, 87.00, 149, NULL, NULL, 55, NULL, 'Bagus, tingkatkan lagi.'),
(180, 81.00, 150, NULL, NULL, 55, NULL, 'Bagus, tingkatkan lagi.'),
(181, 87.00, 125, NULL, NULL, 55, NULL, 'Bagus, tingkatkan lagi.'),
(182, 89.00, 126, NULL, NULL, 55, NULL, 'Bagus, tingkatkan lagi.'),
(183, 89.00, 127, NULL, NULL, 55, NULL, 'Bagus, tingkatkan lagi.'),
(184, 77.00, 132, NULL, NULL, 55, NULL, 'Perbaiki format.'),
(185, 63.00, 146, NULL, NULL, 55, NULL, 'Perbaiki format.'),
(186, 86.00, 147, NULL, NULL, 55, NULL, 'Bagus, tingkatkan lagi.'),
(187, 85.00, 148, NULL, NULL, 55, NULL, 'Bagus, tingkatkan lagi.'),
(188, 62.00, 122, NULL, NULL, 56, NULL, 'Perbaiki format.'),
(189, 64.00, 123, NULL, NULL, 56, NULL, 'Perbaiki format.'),
(190, 90.00, 124, NULL, NULL, 56, NULL, 'Bagus, tingkatkan lagi.'),
(191, 88.00, 141, NULL, NULL, 56, NULL, 'Bagus, tingkatkan lagi.'),
(192, 66.00, 143, NULL, NULL, 56, NULL, 'Perbaiki format.'),
(193, 73.00, 104, NULL, NULL, 56, NULL, 'Perbaiki format.'),
(194, 73.00, 139, NULL, NULL, 56, NULL, 'Perbaiki format.'),
(195, 88.00, 140, NULL, NULL, 56, NULL, 'Bagus, tingkatkan lagi.'),
(196, 70.00, 153, NULL, NULL, 56, NULL, 'Perbaiki format.'),
(197, 87.00, 155, NULL, NULL, 56, NULL, 'Bagus, tingkatkan lagi.'),
(198, 98.00, 108, NULL, NULL, 56, NULL, 'Bagus, tingkatkan lagi.'),
(199, 92.00, 109, NULL, NULL, 56, NULL, 'Bagus, tingkatkan lagi.'),
(200, 99.00, 146, NULL, NULL, 56, NULL, 'Bagus, tingkatkan lagi.'),
(201, 91.00, 147, NULL, NULL, 56, NULL, 'Bagus, tingkatkan lagi.'),
(202, 91.00, 148, NULL, NULL, 56, NULL, 'Bagus, tingkatkan lagi.'),
(203, 60.00, 122, NULL, NULL, 57, NULL, 'Perbaiki format.'),
(204, 82.00, 123, NULL, NULL, 57, NULL, 'Bagus, tingkatkan lagi.'),
(205, 84.00, 124, NULL, NULL, 57, NULL, 'Bagus, tingkatkan lagi.'),
(206, 88.00, 119, NULL, NULL, 57, NULL, 'Bagus, tingkatkan lagi.'),
(207, 91.00, 121, NULL, NULL, 57, NULL, 'Bagus, tingkatkan lagi.'),
(208, 70.00, 134, NULL, NULL, 57, NULL, 'Perbaiki format.'),
(209, 99.00, 135, NULL, NULL, 57, NULL, 'Bagus, tingkatkan lagi.'),
(210, 82.00, 136, NULL, NULL, 57, NULL, 'Bagus, tingkatkan lagi.'),
(211, 64.00, 154, NULL, NULL, 57, NULL, 'Perbaiki format.'),
(212, 96.00, 155, NULL, NULL, 57, NULL, 'Bagus, tingkatkan lagi.'),
(213, 98.00, 142, NULL, NULL, 57, NULL, 'Bagus, tingkatkan lagi.'),
(214, 91.00, 143, NULL, NULL, 57, NULL, 'Bagus, tingkatkan lagi.'),
(215, 91.00, 106, NULL, NULL, 57, NULL, 'Bagus, tingkatkan lagi.'),
(216, 91.00, 107, NULL, NULL, 57, NULL, 'Bagus, tingkatkan lagi.'),
(217, 77.00, 134, NULL, NULL, 58, NULL, 'Perbaiki format.'),
(218, 97.00, 135, NULL, NULL, 58, NULL, 'Bagus, tingkatkan lagi.'),
(219, 66.00, 136, NULL, NULL, 58, NULL, 'Perbaiki format.'),
(220, 85.00, 119, NULL, NULL, 58, NULL, 'Bagus, tingkatkan lagi.'),
(221, 82.00, 120, NULL, NULL, 58, NULL, 'Bagus, tingkatkan lagi.'),
(222, 83.00, 121, NULL, NULL, 58, NULL, 'Bagus, tingkatkan lagi.'),
(223, 64.00, 144, NULL, NULL, 58, NULL, 'Perbaiki format.'),
(224, 95.00, 145, NULL, NULL, 58, NULL, 'Bagus, tingkatkan lagi.'),
(225, 92.00, 125, NULL, NULL, 58, NULL, 'Bagus, tingkatkan lagi.'),
(226, 85.00, 127, NULL, NULL, 58, NULL, 'Bagus, tingkatkan lagi.'),
(227, 80.00, 154, NULL, NULL, 58, NULL, 'Perbaiki format.'),
(228, 74.00, 155, NULL, NULL, 58, NULL, 'Perbaiki format.'),
(229, 78.00, 133, NULL, NULL, 58, NULL, 'Perbaiki format.'),
(230, 85.00, 141, NULL, NULL, 58, NULL, 'Bagus, tingkatkan lagi.'),
(231, 68.00, 143, NULL, NULL, 58, NULL, 'Perbaiki format.');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int NOT NULL,
  `message_text` longtext NOT NULL,
  `sent_at` datetime(6) NOT NULL,
  `receiver_id` int DEFAULT NULL,
  `sender_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `module_id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` longtext,
  `created_at` datetime(6) NOT NULL,
  `course_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`module_id`, `title`, `description`, `created_at`, `course_id`) VALUES
(214, 'Modul 1: Data Structures', 'Pembahasan mendalam mengenai Data Structures dalam konteks Fullstack Web Development.', '2025-12-02 18:47:22.779183', 47),
(215, 'Modul 2: Final Project', 'Pembahasan mendalam mengenai Final Project dalam konteks Fullstack Web Development.', '2025-12-02 18:47:22.851143', 47),
(216, 'Modul 3: API & Connectivity', 'Pembahasan mendalam mengenai API & Connectivity dalam konteks Fullstack Web Development.', '2025-12-02 18:47:22.916141', 47),
(217, 'Modul 4: Control Flow Logic', 'Pembahasan mendalam mengenai Control Flow Logic dalam konteks Fullstack Web Development.', '2025-12-02 18:47:22.963893', 47),
(218, 'Modul 5: Basic Syntax & Variables', 'Pembahasan mendalam mengenai Basic Syntax & Variables dalam konteks Fullstack Web Development.', '2025-12-02 18:47:23.039810', 47),
(219, 'Modul 1: Introduction & Setup', 'Pembahasan mendalam mengenai Introduction & Setup dalam konteks Data Science Bootcamp.', '2025-12-02 18:47:23.149917', 48),
(220, 'Modul 2: Control Flow Logic', 'Pembahasan mendalam mengenai Control Flow Logic dalam konteks Data Science Bootcamp.', '2025-12-02 18:47:23.255751', 48),
(221, 'Modul 3: Basic Syntax & Variables', 'Pembahasan mendalam mengenai Basic Syntax & Variables dalam konteks Data Science Bootcamp.', '2025-12-02 18:47:23.534223', 48),
(222, 'Modul 4: Data Structures', 'Pembahasan mendalam mengenai Data Structures dalam konteks Data Science Bootcamp.', '2025-12-02 18:47:23.554844', 48),
(223, 'Modul 1: Control Flow Logic', 'Pembahasan mendalam mengenai Control Flow Logic dalam konteks Flutter Mobile Apps.', '2025-12-02 18:47:23.584883', 49),
(224, 'Modul 2: Basic Syntax & Variables', 'Pembahasan mendalam mengenai Basic Syntax & Variables dalam konteks Flutter Mobile Apps.', '2025-12-02 18:47:23.605879', 49),
(225, 'Modul 3: Database Integration', 'Pembahasan mendalam mengenai Database Integration dalam konteks Flutter Mobile Apps.', '2025-12-02 18:47:23.620877', 49),
(226, 'Modul 4: Object Oriented Programming', 'Pembahasan mendalam mengenai Object Oriented Programming dalam konteks Flutter Mobile Apps.', '2025-12-02 18:47:23.639879', 49),
(227, 'Modul 5: Introduction & Setup', 'Pembahasan mendalam mengenai Introduction & Setup dalam konteks Flutter Mobile Apps.', '2025-12-02 18:47:23.654881', 49),
(228, 'Modul 6: Deployment Strategies', 'Pembahasan mendalam mengenai Deployment Strategies dalam konteks Flutter Mobile Apps.', '2025-12-02 18:47:23.674879', 49),
(229, 'Modul 1: Basic Syntax & Variables', 'Pembahasan mendalam mengenai Basic Syntax & Variables dalam konteks Cyber Security Ethical Hacking.', '2025-12-02 18:47:23.698880', 50),
(230, 'Modul 2: Control Flow Logic', 'Pembahasan mendalam mengenai Control Flow Logic dalam konteks Cyber Security Ethical Hacking.', '2025-12-02 18:47:23.722877', 50),
(231, 'Modul 3: Data Structures', 'Pembahasan mendalam mengenai Data Structures dalam konteks Cyber Security Ethical Hacking.', '2025-12-02 18:47:23.743901', 50),
(232, 'Modul 4: Database Integration', 'Pembahasan mendalam mengenai Database Integration dalam konteks Cyber Security Ethical Hacking.', '2025-12-02 18:47:23.762878', 50),
(233, 'Modul 5: Deployment Strategies', 'Pembahasan mendalam mengenai Deployment Strategies dalam konteks Cyber Security Ethical Hacking.', '2025-12-02 18:47:23.787879', 50),
(234, 'Modul 6: API & Connectivity', 'Pembahasan mendalam mengenai API & Connectivity dalam konteks Cyber Security Ethical Hacking.', '2025-12-02 18:47:23.807881', 50),
(235, 'Modul 1: Monitoring & Evaluation', 'Pembahasan mendalam mengenai Monitoring & Evaluation dalam konteks DevOps & Cloud Computing.', '2025-12-02 18:47:23.827879', 51),
(236, 'Modul 2: Advanced Tips', 'Pembahasan mendalam mengenai Advanced Tips dalam konteks DevOps & Cloud Computing.', '2025-12-02 18:47:23.853880', 51),
(237, 'Modul 3: Growth Hacks', 'Pembahasan mendalam mengenai Growth Hacks dalam konteks DevOps & Cloud Computing.', '2025-12-02 18:47:23.867879', 51),
(238, 'Modul 4: Planning Strategy', 'Pembahasan mendalam mengenai Planning Strategy dalam konteks DevOps & Cloud Computing.', '2025-12-02 18:47:23.887879', 51),
(239, 'Modul 1: Final Project', 'Pembahasan mendalam mengenai Final Project dalam konteks Game Development with Unity.', '2025-12-02 18:47:23.915878', 52),
(240, 'Modul 2: Object Oriented Programming', 'Pembahasan mendalam mengenai Object Oriented Programming dalam konteks Game Development with Unity.', '2025-12-02 18:47:23.930875', 52),
(241, 'Modul 3: Control Flow Logic', 'Pembahasan mendalam mengenai Control Flow Logic dalam konteks Game Development with Unity.', '2025-12-02 18:47:23.950877', 52),
(242, 'Modul 4: Database Integration', 'Pembahasan mendalam mengenai Database Integration dalam konteks Game Development with Unity.', '2025-12-02 18:47:23.969879', 52),
(243, 'Modul 5: Basic Syntax & Variables', 'Pembahasan mendalam mengenai Basic Syntax & Variables dalam konteks Game Development with Unity.', '2025-12-02 18:47:23.988879', 52),
(244, 'Modul 1: Execution Techniques', 'Pembahasan mendalam mengenai Execution Techniques dalam konteks UI/UX Design Masterclass.', '2025-12-02 18:47:24.013879', 53),
(245, 'Modul 2: Conclusion', 'Pembahasan mendalam mengenai Conclusion dalam konteks UI/UX Design Masterclass.', '2025-12-02 18:47:24.030878', 53),
(246, 'Modul 3: Advanced Tips', 'Pembahasan mendalam mengenai Advanced Tips dalam konteks UI/UX Design Masterclass.', '2025-12-02 18:47:24.056028', 53),
(247, 'Modul 4: Mindset & Fundamentals', 'Pembahasan mendalam mengenai Mindset & Fundamentals dalam konteks UI/UX Design Masterclass.', '2025-12-02 18:47:24.074948', 53),
(248, 'Modul 1: Conclusion', 'Pembahasan mendalam mengenai Conclusion dalam konteks Machine Learning A-Z.', '2025-12-02 18:47:24.099950', 54),
(249, 'Modul 2: Advanced Tips', 'Pembahasan mendalam mengenai Advanced Tips dalam konteks Machine Learning A-Z.', '2025-12-02 18:47:24.118954', 54),
(250, 'Modul 3: Common Mistakes', 'Pembahasan mendalam mengenai Common Mistakes dalam konteks Machine Learning A-Z.', '2025-12-02 18:47:24.137949', 54),
(251, 'Modul 4: Execution Techniques', 'Pembahasan mendalam mengenai Execution Techniques dalam konteks Machine Learning A-Z.', '2025-12-02 18:47:24.151948', 54),
(252, 'Modul 5: Monitoring & Evaluation', 'Pembahasan mendalam mengenai Monitoring & Evaluation dalam konteks Machine Learning A-Z.', '2025-12-02 18:47:24.176943', 54),
(253, 'Modul 1: Execution Techniques', 'Pembahasan mendalam mengenai Execution Techniques dalam konteks Blockchain Fundamentals.', '2025-12-02 18:47:24.205970', 55),
(254, 'Modul 2: Case Study Analysis', 'Pembahasan mendalam mengenai Case Study Analysis dalam konteks Blockchain Fundamentals.', '2025-12-02 18:47:24.220949', 55),
(255, 'Modul 3: Common Mistakes', 'Pembahasan mendalam mengenai Common Mistakes dalam konteks Blockchain Fundamentals.', '2025-12-02 18:47:24.240263', 55),
(256, 'Modul 4: Planning Strategy', 'Pembahasan mendalam mengenai Planning Strategy dalam konteks Blockchain Fundamentals.', '2025-12-02 18:47:24.264264', 55),
(257, 'Modul 5: Growth Hacks', 'Pembahasan mendalam mengenai Growth Hacks dalam konteks Blockchain Fundamentals.', '2025-12-02 18:47:24.283263', 55),
(258, 'Modul 1: Common Mistakes', 'Pembahasan mendalam mengenai Common Mistakes dalam konteks Software QA Testing.', '2025-12-02 18:47:24.308286', 56),
(259, 'Modul 2: Planning Strategy', 'Pembahasan mendalam mengenai Planning Strategy dalam konteks Software QA Testing.', '2025-12-02 18:47:24.322262', 56),
(260, 'Modul 3: Mindset & Fundamentals', 'Pembahasan mendalam mengenai Mindset & Fundamentals dalam konteks Software QA Testing.', '2025-12-02 18:47:24.346265', 56),
(261, 'Modul 4: Case Study Analysis', 'Pembahasan mendalam mengenai Case Study Analysis dalam konteks Software QA Testing.', '2025-12-02 18:47:24.370261', 56),
(262, 'Modul 1: Conclusion', 'Pembahasan mendalam mengenai Conclusion dalam konteks Digital Marketing Strategy.', '2025-12-02 18:47:24.400263', 57),
(263, 'Modul 2: Advanced Tips', 'Pembahasan mendalam mengenai Advanced Tips dalam konteks Digital Marketing Strategy.', '2025-12-02 18:47:24.419263', 57),
(264, 'Modul 3: Common Mistakes', 'Pembahasan mendalam mengenai Common Mistakes dalam konteks Digital Marketing Strategy.', '2025-12-02 18:47:24.434264', 57),
(265, 'Modul 4: Execution Techniques', 'Pembahasan mendalam mengenai Execution Techniques dalam konteks Digital Marketing Strategy.', '2025-12-02 18:47:24.459264', 57),
(266, 'Modul 5: Tools & Resources', 'Pembahasan mendalam mengenai Tools & Resources dalam konteks Digital Marketing Strategy.', '2025-12-02 18:47:24.479263', 57),
(267, 'Modul 1: Planning Strategy', 'Pembahasan mendalam mengenai Planning Strategy dalam konteks Public Speaking Confidence.', '2025-12-02 18:47:24.508512', 58),
(268, 'Modul 2: Execution Techniques', 'Pembahasan mendalam mengenai Execution Techniques dalam konteks Public Speaking Confidence.', '2025-12-02 18:47:24.523513', 58),
(269, 'Modul 3: Conclusion', 'Pembahasan mendalam mengenai Conclusion dalam konteks Public Speaking Confidence.', '2025-12-02 18:47:24.539280', 58),
(270, 'Modul 4: Common Mistakes', 'Pembahasan mendalam mengenai Common Mistakes dalam konteks Public Speaking Confidence.', '2025-12-02 18:47:24.560278', 58),
(271, 'Modul 1: Execution Techniques', 'Pembahasan mendalam mengenai Execution Techniques dalam konteks Financial Management 101.', '2025-12-02 18:47:24.590902', 59),
(272, 'Modul 2: Monitoring & Evaluation', 'Pembahasan mendalam mengenai Monitoring & Evaluation dalam konteks Financial Management 101.', '2025-12-02 18:47:24.609900', 59),
(273, 'Modul 3: Advanced Tips', 'Pembahasan mendalam mengenai Advanced Tips dalam konteks Financial Management 101.', '2025-12-02 18:47:24.624579', 59),
(274, 'Modul 4: Growth Hacks', 'Pembahasan mendalam mengenai Growth Hacks dalam konteks Financial Management 101.', '2025-12-02 18:47:24.648600', 59),
(275, 'Modul 1: Case Study Analysis', 'Pembahasan mendalam mengenai Case Study Analysis dalam konteks Project Management PMP.', '2025-12-02 18:47:24.677580', 60),
(276, 'Modul 2: Planning Strategy', 'Pembahasan mendalam mengenai Planning Strategy dalam konteks Project Management PMP.', '2025-12-02 18:47:24.692582', 60),
(277, 'Modul 3: Mindset & Fundamentals', 'Pembahasan mendalam mengenai Mindset & Fundamentals dalam konteks Project Management PMP.', '2025-12-02 18:47:24.711581', 60),
(278, 'Modul 4: Tools & Resources', 'Pembahasan mendalam mengenai Tools & Resources dalam konteks Project Management PMP.', '2025-12-02 18:47:24.736587', 60),
(279, 'Modul 5: Common Mistakes', 'Pembahasan mendalam mengenai Common Mistakes dalam konteks Project Management PMP.', '2025-12-02 18:47:24.765582', 60),
(280, 'Modul 6: Conclusion', 'Pembahasan mendalam mengenai Conclusion dalam konteks Project Management PMP.', '2025-12-02 18:47:24.784584', 60),
(281, 'Modul 1: Tools & Resources', 'Pembahasan mendalam mengenai Tools & Resources dalam konteks Microsoft Excel Mastery.', '2025-12-02 18:47:24.804581', 61),
(282, 'Modul 2: Mindset & Fundamentals', 'Pembahasan mendalam mengenai Mindset & Fundamentals dalam konteks Microsoft Excel Mastery.', '2025-12-02 18:47:24.829588', 61),
(283, 'Modul 3: Planning Strategy', 'Pembahasan mendalam mengenai Planning Strategy dalam konteks Microsoft Excel Mastery.', '2025-12-02 18:47:24.848579', 61),
(284, 'Modul 4: Monitoring & Evaluation', 'Pembahasan mendalam mengenai Monitoring & Evaluation dalam konteks Microsoft Excel Mastery.', '2025-12-02 18:47:24.862581', 61),
(285, 'Modul 5: Execution Techniques', 'Pembahasan mendalam mengenai Execution Techniques dalam konteks Microsoft Excel Mastery.', '2025-12-02 18:47:24.881580', 61),
(286, 'Modul 6: Conclusion', 'Pembahasan mendalam mengenai Conclusion dalam konteks Microsoft Excel Mastery.', '2025-12-02 18:47:24.900581', 61),
(287, 'Modul 1: Case Study Analysis', 'Pembahasan mendalam mengenai Case Study Analysis dalam konteks Copywriting for Sales.', '2025-12-02 18:47:24.929581', 62),
(288, 'Modul 2: Execution Techniques', 'Pembahasan mendalam mengenai Execution Techniques dalam konteks Copywriting for Sales.', '2025-12-02 18:47:24.948580', 62),
(289, 'Modul 3: Common Mistakes', 'Pembahasan mendalam mengenai Common Mistakes dalam konteks Copywriting for Sales.', '2025-12-02 18:47:24.968582', 62),
(290, 'Modul 4: Advanced Tips', 'Pembahasan mendalam mengenai Advanced Tips dalam konteks Copywriting for Sales.', '2025-12-02 18:47:24.988582', 62),
(291, 'Modul 5: Tools & Resources', 'Pembahasan mendalam mengenai Tools & Resources dalam konteks Copywriting for Sales.', '2025-12-02 18:47:25.004580', 62),
(292, 'Modul 6: Growth Hacks', 'Pembahasan mendalam mengenai Growth Hacks dalam konteks Copywriting for Sales.', '2025-12-02 18:47:25.028581', 62),
(293, 'Modul 1: Tools & Resources', 'Pembahasan mendalam mengenai Tools & Resources dalam konteks Branding & Identity.', '2025-12-02 18:47:25.052326', 63),
(294, 'Modul 2: Execution Techniques', 'Pembahasan mendalam mengenai Execution Techniques dalam konteks Branding & Identity.', '2025-12-02 18:47:25.072322', 63),
(295, 'Modul 3: Growth Hacks', 'Pembahasan mendalam mengenai Growth Hacks dalam konteks Branding & Identity.', '2025-12-02 18:47:25.086324', 63),
(296, 'Modul 4: Mindset & Fundamentals', 'Pembahasan mendalam mengenai Mindset & Fundamentals dalam konteks Branding & Identity.', '2025-12-02 18:47:25.101097', 63),
(297, 'Modul 5: Common Mistakes', 'Pembahasan mendalam mengenai Common Mistakes dalam konteks Branding & Identity.', '2025-12-02 18:47:25.121096', 63),
(298, 'Modul 1: Execution Techniques', 'Pembahasan mendalam mengenai Execution Techniques dalam konteks Entrepreneurship Startup.', '2025-12-02 18:47:25.145119', 64),
(299, 'Modul 2: Tools & Resources', 'Pembahasan mendalam mengenai Tools & Resources dalam konteks Entrepreneurship Startup.', '2025-12-02 18:47:25.160098', 64),
(300, 'Modul 3: Conclusion', 'Pembahasan mendalam mengenai Conclusion dalam konteks Entrepreneurship Startup.', '2025-12-02 18:47:25.179098', 64),
(301, 'Modul 4: Monitoring & Evaluation', 'Pembahasan mendalam mengenai Monitoring & Evaluation dalam konteks Entrepreneurship Startup.', '2025-12-02 18:47:25.203099', 64),
(302, 'Modul 1: Advanced Tips', 'Pembahasan mendalam mengenai Advanced Tips dalam konteks Time Management Hacks.', '2025-12-02 18:47:25.222098', 65),
(303, 'Modul 2: Mindset & Fundamentals', 'Pembahasan mendalam mengenai Mindset & Fundamentals dalam konteks Time Management Hacks.', '2025-12-02 18:47:25.236444', 65),
(304, 'Modul 3: Conclusion', 'Pembahasan mendalam mengenai Conclusion dalam konteks Time Management Hacks.', '2025-12-02 18:47:25.255444', 65),
(305, 'Modul 4: Execution Techniques', 'Pembahasan mendalam mengenai Execution Techniques dalam konteks Time Management Hacks.', '2025-12-02 18:47:25.274444', 65),
(306, 'Modul 5: Tools & Resources', 'Pembahasan mendalam mengenai Tools & Resources dalam konteks Time Management Hacks.', '2025-12-02 18:47:25.293443', 65),
(307, 'Modul 1: Common Mistakes', 'Pembahasan mendalam mengenai Common Mistakes dalam konteks Graphic Design for Beginners.', '2025-12-02 18:47:25.322443', 66),
(308, 'Modul 2: Case Study Analysis', 'Pembahasan mendalam mengenai Case Study Analysis dalam konteks Graphic Design for Beginners.', '2025-12-02 18:47:25.341443', 66),
(309, 'Modul 3: Advanced Tips', 'Pembahasan mendalam mengenai Advanced Tips dalam konteks Graphic Design for Beginners.', '2025-12-02 18:47:25.355444', 66),
(310, 'Modul 4: Conclusion', 'Pembahasan mendalam mengenai Conclusion dalam konteks Graphic Design for Beginners.', '2025-12-02 18:47:25.378446', 66);

-- --------------------------------------------------------

--
-- Table structure for table `module_contents`
--

CREATE TABLE `module_contents` (
  `content_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `text_content` longtext,
  `video_url` varchar(255) DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `module_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `module_contents`
--

INSERT INTO `module_contents` (`content_id`, `title`, `text_content`, `video_url`, `order`, `created_at`, `module_id`) VALUES
(524, 'Data Structures - Part 1', 'Lorem ipsum content detail untuk Data Structures. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 1, '2025-12-02 18:47:22.798186', 214),
(525, 'Data Structures - Part 2', 'Lorem ipsum content detail untuk Data Structures. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 2, '2025-12-02 18:47:22.822173', 214),
(526, 'Final Project - Part 1', 'Lorem ipsum content detail untuk Final Project. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:22.870137', 215),
(527, 'Final Project - Part 2', 'Lorem ipsum content detail untuk Final Project. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 2, '2025-12-02 18:47:22.886140', 215),
(528, 'Final Project - Part 3', 'Lorem ipsum content detail untuk Final Project. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 3, '2025-12-02 18:47:22.901140', 215),
(529, 'API & Connectivity - Part 1', 'Lorem ipsum content detail untuk API & Connectivity. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 1, '2025-12-02 18:47:22.932015', 216),
(530, 'API & Connectivity - Part 2', 'Lorem ipsum content detail untuk API & Connectivity. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 2, '2025-12-02 18:47:22.948147', 216),
(531, 'Control Flow Logic - Part 1', 'Lorem ipsum content detail untuk Control Flow Logic. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 1, '2025-12-02 18:47:22.979178', 217),
(532, 'Control Flow Logic - Part 2', 'Lorem ipsum content detail untuk Control Flow Logic. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 2, '2025-12-02 18:47:22.995514', 217),
(533, 'Basic Syntax & Variables - Part 1', 'Lorem ipsum content detail untuk Basic Syntax & Variables. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:23.056407', 218),
(534, 'Basic Syntax & Variables - Part 2', 'Lorem ipsum content detail untuk Basic Syntax & Variables. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 2, '2025-12-02 18:47:23.072069', 218),
(535, 'Basic Syntax & Variables - Part 3', 'Lorem ipsum content detail untuk Basic Syntax & Variables. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 3, '2025-12-02 18:47:23.088313', 218),
(536, 'Introduction & Setup - Part 1', 'Lorem ipsum content detail untuk Introduction & Setup. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 1, '2025-12-02 18:47:23.177693', 219),
(537, 'Introduction & Setup - Part 2', 'Lorem ipsum content detail untuk Introduction & Setup. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:23.217372', 219),
(538, 'Control Flow Logic - Part 1', 'Lorem ipsum content detail untuk Control Flow Logic. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 1, '2025-12-02 18:47:23.290678', 220),
(539, 'Control Flow Logic - Part 2', 'Lorem ipsum content detail untuk Control Flow Logic. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 2, '2025-12-02 18:47:23.425685', 220),
(540, 'Control Flow Logic - Part 3', 'Lorem ipsum content detail untuk Control Flow Logic. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 3, '2025-12-02 18:47:23.452407', 220),
(541, 'Basic Syntax & Variables - Part 1', 'Lorem ipsum content detail untuk Basic Syntax & Variables. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 1, '2025-12-02 18:47:23.539223', 221),
(542, 'Basic Syntax & Variables - Part 2', 'Lorem ipsum content detail untuk Basic Syntax & Variables. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 2, '2025-12-02 18:47:23.544223', 221),
(543, 'Data Structures - Part 1', 'Lorem ipsum content detail untuk Data Structures. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:23.559845', 222),
(544, 'Data Structures - Part 2', 'Lorem ipsum content detail untuk Data Structures. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 2, '2025-12-02 18:47:23.564845', 222),
(545, 'Data Structures - Part 3', 'Lorem ipsum content detail untuk Data Structures. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 3, '2025-12-02 18:47:23.569846', 222),
(546, 'Control Flow Logic - Part 1', 'Lorem ipsum content detail untuk Control Flow Logic. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 1, '2025-12-02 18:47:23.590883', 223),
(547, 'Control Flow Logic - Part 2', 'Lorem ipsum content detail untuk Control Flow Logic. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:23.595878', 223),
(548, 'Control Flow Logic - Part 3', 'Lorem ipsum content detail untuk Control Flow Logic. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 3, '2025-12-02 18:47:23.600878', 223),
(549, 'Basic Syntax & Variables - Part 1', 'Lorem ipsum content detail untuk Basic Syntax & Variables. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 1, '2025-12-02 18:47:23.610878', 224),
(550, 'Basic Syntax & Variables - Part 2', 'Lorem ipsum content detail untuk Basic Syntax & Variables. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 2, '2025-12-02 18:47:23.615878', 224),
(551, 'Database Integration - Part 1', 'Lorem ipsum content detail untuk Database Integration. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 1, '2025-12-02 18:47:23.625878', 225),
(552, 'Database Integration - Part 2', 'Lorem ipsum content detail untuk Database Integration. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:23.630880', 225),
(553, 'Object Oriented Programming - Part 1', 'Lorem ipsum content detail untuk Object Oriented Programming. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:23.644878', 226),
(554, 'Object Oriented Programming - Part 2', 'Lorem ipsum content detail untuk Object Oriented Programming. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 2, '2025-12-02 18:47:23.649882', 226),
(555, 'Introduction & Setup - Part 1', 'Lorem ipsum content detail untuk Introduction & Setup. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 1, '2025-12-02 18:47:23.659879', 227),
(556, 'Introduction & Setup - Part 2', 'Lorem ipsum content detail untuk Introduction & Setup. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 2, '2025-12-02 18:47:23.664879', 227),
(557, 'Introduction & Setup - Part 3', 'Lorem ipsum content detail untuk Introduction & Setup. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 3, '2025-12-02 18:47:23.669878', 227),
(558, 'Deployment Strategies - Part 1', 'Lorem ipsum content detail untuk Deployment Strategies. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:23.679878', 228),
(559, 'Deployment Strategies - Part 2', 'Lorem ipsum content detail untuk Deployment Strategies. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 2, '2025-12-02 18:47:23.684902', 228),
(560, 'Basic Syntax & Variables - Part 1', 'Lorem ipsum content detail untuk Basic Syntax & Variables. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:23.703877', 229),
(561, 'Basic Syntax & Variables - Part 2', 'Lorem ipsum content detail untuk Basic Syntax & Variables. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 2, '2025-12-02 18:47:23.708878', 229),
(562, 'Basic Syntax & Variables - Part 3', 'Lorem ipsum content detail untuk Basic Syntax & Variables. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 3, '2025-12-02 18:47:23.713879', 229),
(563, 'Control Flow Logic - Part 1', 'Lorem ipsum content detail untuk Control Flow Logic. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 1, '2025-12-02 18:47:23.728879', 230),
(564, 'Control Flow Logic - Part 2', 'Lorem ipsum content detail untuk Control Flow Logic. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 2, '2025-12-02 18:47:23.733878', 230),
(565, 'Data Structures - Part 1', 'Lorem ipsum content detail untuk Data Structures. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 1, '2025-12-02 18:47:23.747878', 231),
(566, 'Data Structures - Part 2', 'Lorem ipsum content detail untuk Data Structures. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 2, '2025-12-02 18:47:23.753879', 231),
(567, 'Data Structures - Part 3', 'Lorem ipsum content detail untuk Data Structures. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 3, '2025-12-02 18:47:23.758898', 231),
(568, 'Database Integration - Part 1', 'Lorem ipsum content detail untuk Database Integration. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 1, '2025-12-02 18:47:23.767878', 232),
(569, 'Database Integration - Part 2', 'Lorem ipsum content detail untuk Database Integration. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 2, '2025-12-02 18:47:23.772879', 232),
(570, 'Database Integration - Part 3', 'Lorem ipsum content detail untuk Database Integration. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 3, '2025-12-02 18:47:23.777878', 232),
(571, 'Deployment Strategies - Part 1', 'Lorem ipsum content detail untuk Deployment Strategies. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 1, '2025-12-02 18:47:23.792879', 233),
(572, 'Deployment Strategies - Part 2', 'Lorem ipsum content detail untuk Deployment Strategies. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 2, '2025-12-02 18:47:23.797879', 233),
(573, 'API & Connectivity - Part 1', 'Lorem ipsum content detail untuk API & Connectivity. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 1, '2025-12-02 18:47:23.812879', 234),
(574, 'API & Connectivity - Part 2', 'Lorem ipsum content detail untuk API & Connectivity. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 2, '2025-12-02 18:47:23.817880', 234),
(575, 'Monitoring & Evaluation - Part 1', 'Lorem ipsum content detail untuk Monitoring & Evaluation. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 1, '2025-12-02 18:47:23.832878', 235),
(576, 'Monitoring & Evaluation - Part 2', 'Lorem ipsum content detail untuk Monitoring & Evaluation. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:23.837880', 235),
(577, 'Monitoring & Evaluation - Part 3', 'Lorem ipsum content detail untuk Monitoring & Evaluation. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 3, '2025-12-02 18:47:23.843880', 235),
(578, 'Advanced Tips - Part 1', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:23.857879', 236),
(579, 'Advanced Tips - Part 2', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 2, '2025-12-02 18:47:23.862880', 236),
(580, 'Growth Hacks - Part 1', 'Lorem ipsum content detail untuk Growth Hacks. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 1, '2025-12-02 18:47:23.872880', 237),
(581, 'Growth Hacks - Part 2', 'Lorem ipsum content detail untuk Growth Hacks. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 2, '2025-12-02 18:47:23.877879', 237),
(582, 'Planning Strategy - Part 1', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 1, '2025-12-02 18:47:23.891878', 238),
(583, 'Planning Strategy - Part 2', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 2, '2025-12-02 18:47:23.896879', 238),
(584, 'Planning Strategy - Part 3', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 3, '2025-12-02 18:47:23.901879', 238),
(585, 'Final Project - Part 1', 'Lorem ipsum content detail untuk Final Project. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 1, '2025-12-02 18:47:23.920879', 239),
(586, 'Final Project - Part 2', 'Lorem ipsum content detail untuk Final Project. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 2, '2025-12-02 18:47:23.925878', 239),
(587, 'Object Oriented Programming - Part 1', 'Lorem ipsum content detail untuk Object Oriented Programming. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:23.935875', 240),
(588, 'Object Oriented Programming - Part 2', 'Lorem ipsum content detail untuk Object Oriented Programming. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 2, '2025-12-02 18:47:23.940877', 240),
(589, 'Object Oriented Programming - Part 3', 'Lorem ipsum content detail untuk Object Oriented Programming. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 3, '2025-12-02 18:47:23.945878', 240),
(590, 'Control Flow Logic - Part 1', 'Lorem ipsum content detail untuk Control Flow Logic. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 1, '2025-12-02 18:47:23.955877', 241),
(591, 'Control Flow Logic - Part 2', 'Lorem ipsum content detail untuk Control Flow Logic. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 2, '2025-12-02 18:47:23.959879', 241),
(592, 'Database Integration - Part 1', 'Lorem ipsum content detail untuk Database Integration. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 1, '2025-12-02 18:47:23.974877', 242),
(593, 'Database Integration - Part 2', 'Lorem ipsum content detail untuk Database Integration. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:23.979880', 242),
(594, 'Basic Syntax & Variables - Part 1', 'Lorem ipsum content detail untuk Basic Syntax & Variables. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 1, '2025-12-02 18:47:23.993881', 243),
(595, 'Basic Syntax & Variables - Part 2', 'Lorem ipsum content detail untuk Basic Syntax & Variables. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 2, '2025-12-02 18:47:23.998879', 243),
(596, 'Basic Syntax & Variables - Part 3', 'Lorem ipsum content detail untuk Basic Syntax & Variables. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 3, '2025-12-02 18:47:24.003877', 243),
(597, 'Execution Techniques - Part 1', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 1, '2025-12-02 18:47:24.018879', 244),
(598, 'Execution Techniques - Part 2', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 2, '2025-12-02 18:47:24.024880', 244),
(599, 'Conclusion - Part 1', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:24.035877', 245),
(600, 'Conclusion - Part 2', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 2, '2025-12-02 18:47:24.041028', 245),
(601, 'Conclusion - Part 3', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 3, '2025-12-02 18:47:24.046028', 245),
(602, 'Advanced Tips - Part 1', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 1, '2025-12-02 18:47:24.061014', 246),
(603, 'Advanced Tips - Part 2', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 2, '2025-12-02 18:47:24.065034', 246),
(604, 'Mindset & Fundamentals - Part 1', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:24.079949', 247),
(605, 'Mindset & Fundamentals - Part 2', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 2, '2025-12-02 18:47:24.084948', 247),
(606, 'Conclusion - Part 1', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 1, '2025-12-02 18:47:24.103949', 248),
(607, 'Conclusion - Part 2', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 2, '2025-12-02 18:47:24.108949', 248),
(608, 'Advanced Tips - Part 1', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:24.123949', 249),
(609, 'Advanced Tips - Part 2', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 2, '2025-12-02 18:47:24.128950', 249),
(610, 'Advanced Tips - Part 3', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 3, '2025-12-02 18:47:24.132949', 249),
(611, 'Common Mistakes - Part 1', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 1, '2025-12-02 18:47:24.142946', 250),
(612, 'Common Mistakes - Part 2', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 2, '2025-12-02 18:47:24.147949', 250),
(613, 'Execution Techniques - Part 1', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 1, '2025-12-02 18:47:24.156949', 251),
(614, 'Execution Techniques - Part 2', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 2, '2025-12-02 18:47:24.161947', 251),
(615, 'Execution Techniques - Part 3', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 3, '2025-12-02 18:47:24.166951', 251),
(616, 'Monitoring & Evaluation - Part 1', 'Lorem ipsum content detail untuk Monitoring & Evaluation. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 1, '2025-12-02 18:47:24.181950', 252),
(617, 'Monitoring & Evaluation - Part 2', 'Lorem ipsum content detail untuk Monitoring & Evaluation. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 2, '2025-12-02 18:47:24.186949', 252),
(618, 'Monitoring & Evaluation - Part 3', 'Lorem ipsum content detail untuk Monitoring & Evaluation. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 3, '2025-12-02 18:47:24.190969', 252),
(619, 'Execution Techniques - Part 1', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 1, '2025-12-02 18:47:24.210948', 253),
(620, 'Execution Techniques - Part 2', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 2, '2025-12-02 18:47:24.215949', 253),
(621, 'Case Study Analysis - Part 1', 'Lorem ipsum content detail untuk Case Study Analysis. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:24.224949', 254),
(622, 'Case Study Analysis - Part 2', 'Lorem ipsum content detail untuk Case Study Analysis. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:24.230257', 254),
(623, 'Common Mistakes - Part 1', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 1, '2025-12-02 18:47:24.245263', 255),
(624, 'Common Mistakes - Part 2', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 2, '2025-12-02 18:47:24.250262', 255),
(625, 'Common Mistakes - Part 3', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 3, '2025-12-02 18:47:24.254264', 255),
(626, 'Planning Strategy - Part 1', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 1, '2025-12-02 18:47:24.269263', 256),
(627, 'Planning Strategy - Part 2', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 2, '2025-12-02 18:47:24.274263', 256),
(628, 'Planning Strategy - Part 3', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 3, '2025-12-02 18:47:24.278263', 256),
(629, 'Growth Hacks - Part 1', 'Lorem ipsum content detail untuk Growth Hacks. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 1, '2025-12-02 18:47:24.288264', 257),
(630, 'Growth Hacks - Part 2', 'Lorem ipsum content detail untuk Growth Hacks. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 2, '2025-12-02 18:47:24.293263', 257),
(631, 'Common Mistakes - Part 1', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 1, '2025-12-02 18:47:24.312264', 258),
(632, 'Common Mistakes - Part 2', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:24.317263', 258),
(633, 'Planning Strategy - Part 1', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:24.327264', 259),
(634, 'Planning Strategy - Part 2', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 2, '2025-12-02 18:47:24.332264', 259),
(635, 'Planning Strategy - Part 3', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 3, '2025-12-02 18:47:24.337265', 259),
(636, 'Mindset & Fundamentals - Part 1', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 1, '2025-12-02 18:47:24.351262', 260),
(637, 'Mindset & Fundamentals - Part 2', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 2, '2025-12-02 18:47:24.355264', 260),
(638, 'Mindset & Fundamentals - Part 3', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 3, '2025-12-02 18:47:24.360259', 260),
(639, 'Case Study Analysis - Part 1', 'Lorem ipsum content detail untuk Case Study Analysis. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:24.375264', 261),
(640, 'Case Study Analysis - Part 2', 'Lorem ipsum content detail untuk Case Study Analysis. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 2, '2025-12-02 18:47:24.380265', 261),
(641, 'Case Study Analysis - Part 3', 'Lorem ipsum content detail untuk Case Study Analysis. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 3, '2025-12-02 18:47:24.385261', 261),
(642, 'Conclusion - Part 1', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 1, '2025-12-02 18:47:24.405264', 262),
(643, 'Conclusion - Part 2', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 2, '2025-12-02 18:47:24.410264', 262),
(644, 'Conclusion - Part 3', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 3, '2025-12-02 18:47:24.415263', 262),
(645, 'Advanced Tips - Part 1', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 1, '2025-12-02 18:47:24.424264', 263),
(646, 'Advanced Tips - Part 2', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 2, '2025-12-02 18:47:24.429264', 263),
(647, 'Common Mistakes - Part 1', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 1, '2025-12-02 18:47:24.439264', 264),
(648, 'Common Mistakes - Part 2', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 2, '2025-12-02 18:47:24.444264', 264),
(649, 'Common Mistakes - Part 3', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 3, '2025-12-02 18:47:24.449264', 264),
(650, 'Execution Techniques - Part 1', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 1, '2025-12-02 18:47:24.464264', 265),
(651, 'Execution Techniques - Part 2', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 2, '2025-12-02 18:47:24.469264', 265),
(652, 'Execution Techniques - Part 3', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 3, '2025-12-02 18:47:24.474265', 265),
(653, 'Tools & Resources - Part 1', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 1, '2025-12-02 18:47:24.484263', 266),
(654, 'Tools & Resources - Part 2', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 2, '2025-12-02 18:47:24.489264', 266),
(655, 'Tools & Resources - Part 3', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 3, '2025-12-02 18:47:24.494490', 266),
(656, 'Planning Strategy - Part 1', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:24.513491', 267),
(657, 'Planning Strategy - Part 2', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 2, '2025-12-02 18:47:24.518492', 267),
(658, 'Execution Techniques - Part 1', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:24.528278', 268),
(659, 'Execution Techniques - Part 2', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 2, '2025-12-02 18:47:24.534280', 268),
(660, 'Conclusion - Part 1', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:24.545282', 269),
(661, 'Conclusion - Part 2', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:24.550285', 269),
(662, 'Conclusion - Part 3', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 3, '2025-12-02 18:47:24.555277', 269),
(663, 'Common Mistakes - Part 1', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:24.565282', 270),
(664, 'Common Mistakes - Part 2', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 2, '2025-12-02 18:47:24.571281', 270),
(665, 'Common Mistakes - Part 3', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 3, '2025-12-02 18:47:24.576281', 270),
(666, 'Execution Techniques - Part 1', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 1, '2025-12-02 18:47:24.595902', 271),
(667, 'Execution Techniques - Part 2', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 2, '2025-12-02 18:47:24.600898', 271),
(668, 'Monitoring & Evaluation - Part 1', 'Lorem ipsum content detail untuk Monitoring & Evaluation. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:24.614898', 272),
(669, 'Monitoring & Evaluation - Part 2', 'Lorem ipsum content detail untuk Monitoring & Evaluation. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:24.619563', 272),
(670, 'Advanced Tips - Part 1', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 1, '2025-12-02 18:47:24.629602', 273),
(671, 'Advanced Tips - Part 2', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:24.634600', 273),
(672, 'Advanced Tips - Part 3', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 3, '2025-12-02 18:47:24.639583', 273),
(673, 'Growth Hacks - Part 1', 'Lorem ipsum content detail untuk Growth Hacks. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 1, '2025-12-02 18:47:24.653583', 274),
(674, 'Growth Hacks - Part 2', 'Lorem ipsum content detail untuk Growth Hacks. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 2, '2025-12-02 18:47:24.658582', 274),
(675, 'Growth Hacks - Part 3', 'Lorem ipsum content detail untuk Growth Hacks. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 3, '2025-12-02 18:47:24.663581', 274),
(676, 'Case Study Analysis - Part 1', 'Lorem ipsum content detail untuk Case Study Analysis. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 1, '2025-12-02 18:47:24.682581', 275),
(677, 'Case Study Analysis - Part 2', 'Lorem ipsum content detail untuk Case Study Analysis. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 2, '2025-12-02 18:47:24.687581', 275),
(678, 'Planning Strategy - Part 1', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 1, '2025-12-02 18:47:24.697581', 276),
(679, 'Planning Strategy - Part 2', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 2, '2025-12-02 18:47:24.702581', 276),
(680, 'Mindset & Fundamentals - Part 1', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 1, '2025-12-02 18:47:24.716582', 277),
(681, 'Mindset & Fundamentals - Part 2', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 2, '2025-12-02 18:47:24.721580', 277),
(682, 'Mindset & Fundamentals - Part 3', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 3, '2025-12-02 18:47:24.726581', 277),
(683, 'Tools & Resources - Part 1', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 1, '2025-12-02 18:47:24.742589', 278),
(684, 'Tools & Resources - Part 2', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 2, '2025-12-02 18:47:24.748588', 278),
(685, 'Tools & Resources - Part 3', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 3, '2025-12-02 18:47:24.754590', 278),
(686, 'Common Mistakes - Part 1', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:24.770580', 279),
(687, 'Common Mistakes - Part 2', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:24.774581', 279),
(688, 'Conclusion - Part 1', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 1, '2025-12-02 18:47:24.789581', 280),
(689, 'Conclusion - Part 2', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 2, '2025-12-02 18:47:24.794585', 280),
(690, 'Tools & Resources - Part 1', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:24.809582', 281),
(691, 'Tools & Resources - Part 2', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 2, '2025-12-02 18:47:24.814584', 281),
(692, 'Tools & Resources - Part 3', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 3, '2025-12-02 18:47:24.819605', 281),
(693, 'Mindset & Fundamentals - Part 1', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 1, '2025-12-02 18:47:24.834581', 282),
(694, 'Mindset & Fundamentals - Part 2', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 2, '2025-12-02 18:47:24.838581', 282),
(695, 'Planning Strategy - Part 1', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 1, '2025-12-02 18:47:24.853582', 283),
(696, 'Planning Strategy - Part 2', 'Lorem ipsum content detail untuk Planning Strategy. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 2, '2025-12-02 18:47:24.858579', 283),
(697, 'Monitoring & Evaluation - Part 1', 'Lorem ipsum content detail untuk Monitoring & Evaluation. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 1, '2025-12-02 18:47:24.867582', 284),
(698, 'Monitoring & Evaluation - Part 2', 'Lorem ipsum content detail untuk Monitoring & Evaluation. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 2, '2025-12-02 18:47:24.872581', 284),
(699, 'Monitoring & Evaluation - Part 3', 'Lorem ipsum content detail untuk Monitoring & Evaluation. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 3, '2025-12-02 18:47:24.877582', 284),
(700, 'Execution Techniques - Part 1', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:24.886582', 285),
(701, 'Execution Techniques - Part 2', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 2, '2025-12-02 18:47:24.891580', 285),
(702, 'Execution Techniques - Part 3', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 3, '2025-12-02 18:47:24.896581', 285),
(703, 'Conclusion - Part 1', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 1, '2025-12-02 18:47:24.905581', 286),
(704, 'Conclusion - Part 2', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 2, '2025-12-02 18:47:24.910581', 286),
(705, 'Conclusion - Part 3', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 3, '2025-12-02 18:47:24.915581', 286),
(706, 'Case Study Analysis - Part 1', 'Lorem ipsum content detail untuk Case Study Analysis. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:24.933581', 287),
(707, 'Case Study Analysis - Part 2', 'Lorem ipsum content detail untuk Case Study Analysis. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 2, '2025-12-02 18:47:24.939579', 287),
(708, 'Case Study Analysis - Part 3', 'Lorem ipsum content detail untuk Case Study Analysis. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 3, '2025-12-02 18:47:24.943580', 287),
(709, 'Execution Techniques - Part 1', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 1, '2025-12-02 18:47:24.953581', 288),
(710, 'Execution Techniques - Part 2', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 2, '2025-12-02 18:47:24.958582', 288),
(711, 'Execution Techniques - Part 3', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 3, '2025-12-02 18:47:24.963579', 288),
(712, 'Common Mistakes - Part 1', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 1, '2025-12-02 18:47:24.973578', 289),
(713, 'Common Mistakes - Part 2', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 2, '2025-12-02 18:47:24.978581', 289),
(714, 'Advanced Tips - Part 1', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:24.994585', 290),
(715, 'Advanced Tips - Part 2', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 2, '2025-12-02 18:47:24.999582', 290),
(716, 'Tools & Resources - Part 1', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=VPvVD8t02U8', 1, '2025-12-02 18:47:25.009582', 291),
(717, 'Tools & Resources - Part 2', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 2, '2025-12-02 18:47:25.014579', 291),
(718, 'Tools & Resources - Part 3', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 3, '2025-12-02 18:47:25.019579', 291),
(719, 'Growth Hacks - Part 1', 'Lorem ipsum content detail untuk Growth Hacks. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 1, '2025-12-02 18:47:25.033580', 292),
(720, 'Growth Hacks - Part 2', 'Lorem ipsum content detail untuk Growth Hacks. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 2, '2025-12-02 18:47:25.038582', 292),
(721, 'Growth Hacks - Part 3', 'Lorem ipsum content detail untuk Growth Hacks. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 3, '2025-12-02 18:47:25.042581', 292),
(722, 'Tools & Resources - Part 1', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 1, '2025-12-02 18:47:25.057324', 293),
(723, 'Tools & Resources - Part 2', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 2, '2025-12-02 18:47:25.062323', 293),
(724, 'Execution Techniques - Part 1', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 1, '2025-12-02 18:47:25.077325', 294),
(725, 'Execution Techniques - Part 2', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 2, '2025-12-02 18:47:25.081324', 294),
(726, 'Growth Hacks - Part 1', 'Lorem ipsum content detail untuk Growth Hacks. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 1, '2025-12-02 18:47:25.091325', 295),
(727, 'Growth Hacks - Part 2', 'Lorem ipsum content detail untuk Growth Hacks. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 2, '2025-12-02 18:47:25.096326', 295),
(728, 'Mindset & Fundamentals - Part 1', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 1, '2025-12-02 18:47:25.106098', 296),
(729, 'Mindset & Fundamentals - Part 2', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 2, '2025-12-02 18:47:25.111100', 296),
(730, 'Common Mistakes - Part 1', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 1, '2025-12-02 18:47:25.126097', 297),
(731, 'Common Mistakes - Part 2', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 2, '2025-12-02 18:47:25.131095', 297),
(732, 'Execution Techniques - Part 1', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 1, '2025-12-02 18:47:25.150099', 298),
(734, 'Tools & Resources - Part 1', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:25.164098', 299),
(735, 'Tools & Resources - Part 2', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 2, '2025-12-02 18:47:25.169118', 299),
(736, 'Conclusion - Part 1', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 1, '2025-12-02 18:47:25.184097', 300),
(737, 'Conclusion - Part 2', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 2, '2025-12-02 18:47:25.188098', 300),
(738, 'Conclusion - Part 3', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 3, '2025-12-02 18:47:25.193097', 300),
(739, 'Monitoring & Evaluation - Part 1', 'Lorem ipsum content detail untuk Monitoring & Evaluation. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:25.208121', 301),
(740, 'Monitoring & Evaluation - Part 2', 'Lorem ipsum content detail untuk Monitoring & Evaluation. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 2, '2025-12-02 18:47:25.212098', 301),
(741, 'Advanced Tips - Part 1', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nzZkKoREEGo', 1, '2025-12-02 18:47:25.227098', 302),
(742, 'Advanced Tips - Part 2', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:25.231446', 302),
(743, 'Mindset & Fundamentals - Part 1', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 1, '2025-12-02 18:47:25.241445', 303),
(744, 'Mindset & Fundamentals - Part 2', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:25.246444', 303),
(745, 'Mindset & Fundamentals - Part 3', 'Lorem ipsum content detail untuk Mindset & Fundamentals. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 3, '2025-12-02 18:47:25.250444', 303),
(746, 'Conclusion - Part 1', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 1, '2025-12-02 18:47:25.260445', 304),
(747, 'Conclusion - Part 2', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 2, '2025-12-02 18:47:25.265442', 304),
(748, 'Execution Techniques - Part 1', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=ua-CiDNNj30', 1, '2025-12-02 18:47:25.279443', 305),
(749, 'Execution Techniques - Part 2', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 2, '2025-12-02 18:47:25.283444', 305),
(750, 'Execution Techniques - Part 3', 'Lorem ipsum content detail untuk Execution Techniques. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 3, '2025-12-02 18:47:25.288443', 305),
(751, 'Tools & Resources - Part 1', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 1, '2025-12-02 18:47:25.298445', 306),
(752, 'Tools & Resources - Part 2', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 2, '2025-12-02 18:47:25.303443', 306),
(753, 'Tools & Resources - Part 3', 'Lorem ipsum content detail untuk Tools & Resources. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=qz0aGYrrlhU', 3, '2025-12-02 18:47:25.308442', 306),
(754, 'Common Mistakes - Part 1', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 1, '2025-12-02 18:47:25.327446', 307),
(755, 'Common Mistakes - Part 2', 'Lorem ipsum content detail untuk Common Mistakes. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 2, '2025-12-02 18:47:25.332444', 307),
(756, 'Case Study Analysis - Part 1', 'Lorem ipsum content detail untuk Case Study Analysis. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 1, '2025-12-02 18:47:25.345442', 308),
(757, 'Case Study Analysis - Part 2', 'Lorem ipsum content detail untuk Case Study Analysis. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:25.350445', 308),
(758, 'Advanced Tips - Part 1', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 1, '2025-12-02 18:47:25.359449', 309),
(759, 'Advanced Tips - Part 2', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=nu_pCVPKzTk', 2, '2025-12-02 18:47:25.364445', 309);
INSERT INTO `module_contents` (`content_id`, `title`, `text_content`, `video_url`, `order`, `created_at`, `module_id`) VALUES
(760, 'Advanced Tips - Part 3', 'Lorem ipsum content detail untuk Advanced Tips. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 3, '2025-12-02 18:47:25.369445', 309),
(761, 'Conclusion - Part 1', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=1Rs2ND1ryYc', 1, '2025-12-02 18:47:25.383444', 310),
(762, 'Conclusion - Part 2', 'Lorem ipsum content detail untuk Conclusion. Pelajari materi ini dengan seksama.', 'https://www.youtube.com/watch?v=SqcY0GlETPk', 2, '2025-12-02 18:47:25.387445', 310);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int NOT NULL,
  `question_text` longtext NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` varchar(1) NOT NULL,
  `quiz_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `quiz_id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` longtext,
  `created_at` datetime(6) NOT NULL,
  `content_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(10, 'Admin'),
(11, 'Dosen'),
(12, 'Mahasiswa');

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `submission_id` int NOT NULL,
  `answer_text` longtext,
  `file_url` varchar(255) DEFAULT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `assignment_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `role_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `created_at`, `role_id`) VALUES
(43, 'Super Admin', 'admin@khacademy.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.265709', 10),
(44, 'Pak Budi', 'budi@dosen.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.298689', 11),
(45, 'Bu Rina', 'rina@dosen.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.320692', 11),
(46, 'Pak Joko', 'joko@dosen.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.354059', 11),
(47, 'Bu Sari', 'sari@dosen.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.380200', 11),
(48, 'Pak Teguh', 'teguh@dosen.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.402466', 11),
(49, 'Andi Saputra', 'andi@mhs.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.427326', 12),
(50, 'Siti Aminah', 'siti@mhs.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.456779', 12),
(51, 'Budi Kecil', 'budik@mhs.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.536064', 12),
(52, 'Citra Kirana', 'citra@mhs.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.563967', 12),
(53, 'Deni Sumargo', 'deni@mhs.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.598937', 12),
(54, 'Eko Patrio', 'eko@mhs.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.621619', 12),
(55, 'Fanny Ghassani', 'fanny@mhs.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.649564', 12),
(56, 'Gilang Dirga', 'gilang@mhs.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.678727', 12),
(57, 'Hesti Purwadinata', 'hesti@mhs.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.708778', 12),
(58, 'Irfan Hakim', 'irfan@mhs.ac.id', 'pbkdf2_sha256$1000000$8Bn9m6zWbw4GTkr1FphpSR$PB94bVqqjqdBqBXr4Zuez7HjCrgWdimZB7tuW00VL2g=', '2025-12-02 18:47:22.731906', 12),
(59, 'keivn', 'kevindzakyh25@s', 'pbkdf2_sha256$1000000$CF3XjV4r2Q1vGBiw6ef22D$bx7D2w8TV+Rlctnw0kBrRBGk75CHz9j40vso5+8aqko=', '2025-12-02 20:06:44.353861', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `assignments_module_id_d063c9c7_fk_modules_module_id` (`module_id`);

--
-- Indexes for table `assignment_files`
--
ALTER TABLE `assignment_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `assignment_files_assignment_id_97e01b1b_fk_assignmen` (`assignment_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `courses_lecturer_id_6920fe86_fk_users_user_id` (`lecturer_id`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`discussion_id`),
  ADD KEY `discussions_course_id_39b32bbf_fk_courses_course_id` (`course_id`),
  ADD KEY `discussions_user_id_b2701130_fk_users_user_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `enrollments_course_id_8964c6c8_fk_courses_course_id` (`course_id`),
  ADD KEY `enrollments_user_id_149cb742_fk_users_user_id` (`user_id`),
  ADD KEY `enrollments_last_module_id_eb24d8eb_fk_modules_module_id` (`last_module_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `grades_assignment_id_9e89a026_fk_assignments_assignment_id` (`assignment_id`),
  ADD KEY `grades_course_id_53228450_fk_courses_course_id` (`course_id`),
  ADD KEY `grades_quiz_id_624888a3_fk_quizzes_quiz_id` (`quiz_id`),
  ADD KEY `grades_user_id_78656eee_fk_users_user_id` (`user_id`),
  ADD KEY `grades_enrollment_id_0a02b45b_fk_enrollments_enrollment_id` (`enrollment_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `messages_receiver_id_874b4e0a_fk_users_user_id` (`receiver_id`),
  ADD KEY `messages_sender_id_dc5a0bbd_fk_users_user_id` (`sender_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`module_id`),
  ADD KEY `modules_course_id_23782a2b_fk_courses_course_id` (`course_id`);

--
-- Indexes for table `module_contents`
--
ALTER TABLE `module_contents`
  ADD PRIMARY KEY (`content_id`),
  ADD KEY `module_contents_module_id_bcfa4978_fk_modules_module_id` (`module_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `questions_quiz_id_5c84443f_fk_quizzes_quiz_id` (`quiz_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`quiz_id`),
  ADD UNIQUE KEY `content_id` (`content_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `submissions_assignment_id_835bcd69_fk_assignments_assignment_id` (`assignment_id`),
  ADD KEY `submissions_student_id_b2b21be5_fk_users_user_id` (`student_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `users_role_id_1900a745_fk_roles_role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `assignment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `assignment_files`
--
ALTER TABLE `assignment_files`
  MODIFY `file_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `discussion_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `module_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;

--
-- AUTO_INCREMENT for table `module_contents`
--
ALTER TABLE `module_contents`
  MODIFY `content_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=763;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `quiz_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `submission_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_module_id_d063c9c7_fk_modules_module_id` FOREIGN KEY (`module_id`) REFERENCES `modules` (`module_id`);

--
-- Constraints for table `assignment_files`
--
ALTER TABLE `assignment_files`
  ADD CONSTRAINT `assignment_files_assignment_id_97e01b1b_fk_assignmen` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`assignment_id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_lecturer_id_6920fe86_fk_users_user_id` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `discussions_course_id_39b32bbf_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `discussions_user_id_b2701130_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_course_id_8964c6c8_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `enrollments_last_module_id_eb24d8eb_fk_modules_module_id` FOREIGN KEY (`last_module_id`) REFERENCES `modules` (`module_id`),
  ADD CONSTRAINT `enrollments_user_id_149cb742_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_assignment_id_9e89a026_fk_assignments_assignment_id` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`assignment_id`),
  ADD CONSTRAINT `grades_course_id_53228450_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `grades_enrollment_id_0a02b45b_fk_enrollments_enrollment_id` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`enrollment_id`),
  ADD CONSTRAINT `grades_quiz_id_624888a3_fk_quizzes_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`),
  ADD CONSTRAINT `grades_user_id_78656eee_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_receiver_id_874b4e0a_fk_users_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `messages_sender_id_dc5a0bbd_fk_users_user_id` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_course_id_23782a2b_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `module_contents`
--
ALTER TABLE `module_contents`
  ADD CONSTRAINT `module_contents_module_id_bcfa4978_fk_modules_module_id` FOREIGN KEY (`module_id`) REFERENCES `modules` (`module_id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_quiz_id_5c84443f_fk_quizzes_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`);

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_content_id_540727c9_fk_module_contents_content_id` FOREIGN KEY (`content_id`) REFERENCES `module_contents` (`content_id`);

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `submissions_assignment_id_835bcd69_fk_assignments_assignment_id` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`assignment_id`),
  ADD CONSTRAINT `submissions_student_id_b2b21be5_fk_users_user_id` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_1900a745_fk_roles_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
