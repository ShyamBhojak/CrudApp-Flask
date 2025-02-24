-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 24, 2025 at 04:47 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_sessions`
--

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `lecture_time` time NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `course`, `lecture_time`, `timestamp`) VALUES
(2, 'Jitendra Chavda', 'Python', '20:30:00', '2025-02-12 15:39:38'),
(3, 'Nishant', 'Python', '20:30:00', '2025-02-12 15:39:59'),
(4, 'Palak', 'Data Analytics', '10:00:00', '2025-02-12 15:40:22'),
(6, 'Bhargavi', 'Microsoft Excel', '10:00:00', '2025-02-14 16:07:00'),
(7, 'Keyur Vara', 'Data Analytics', '21:00:00', '2025-02-18 15:24:49'),
(8, 'Karan', 'Microsoft Excel', '17:00:00', '2025-02-18 15:28:44'),
(9, 'Raksha', 'Data Analytics', '19:00:00', '2025-02-18 15:30:59'),
(11, 'Prashant', 'Machine Learning', '21:00:00', '2025-02-18 15:32:17'),
(13, 'Hetvi', 'Microsoft Excel', '20:30:00', '2025-02-24 15:00:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
