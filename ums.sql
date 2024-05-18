-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2024 at 07:08 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ums`
--

-- --------------------------------------------------------

--
-- Table structure for table `pond1`
--

CREATE TABLE `pond1` (
  `id` int(11) NOT NULL,
  `temp` int(11) NOT NULL,
  `humidity` int(11) NOT NULL,
  `ph` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pond2`
--

CREATE TABLE `pond2` (
  `id` int(11) NOT NULL,
  `temp` int(11) NOT NULL,
  `humidity` int(11) NOT NULL,
  `ph` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pond3`
--

CREATE TABLE `pond3` (
  `id` int(11) NOT NULL,
  `temp` int(11) NOT NULL,
  `humidity` int(11) NOT NULL,
  `ph` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

CREATE TABLE `sensor` (
  `id` int(11) NOT NULL,
  `temp` int(11) NOT NULL,
  `turbidity` int(11) NOT NULL,
  `ph` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sensor`
--

INSERT INTO `sensor` (`id`, `temp`, `turbidity`, `ph`, `datetime`) VALUES
(335, 32, 3, 6, '2024-05-16 02:34:05'),
(336, 32, 3, 6, '2024-05-16 02:34:11'),
(337, 32, 3, 9, '2024-05-16 02:34:16'),
(338, 32, 3, 9, '2024-05-16 02:34:21'),
(339, 32, 3, 6, '2024-05-16 02:34:26'),
(340, 32, 3, 6, '2024-05-16 02:34:31'),
(341, 32, 3, 6, '2024-05-16 02:34:36'),
(342, 32, 3, 9, '2024-05-16 02:34:41'),
(343, 32, 3, 15, '2024-05-16 02:34:47'),
(344, 32, 3, 12, '2024-05-16 02:34:52'),
(345, 32, 3, 6, '2024-05-16 02:34:57'),
(346, 32, 3, 6, '2024-05-16 02:35:02'),
(347, 32, 3, 15, '2024-05-16 02:35:07'),
(348, 32, 3, 6, '2024-05-16 02:35:12'),
(349, 32, 3, 6, '2024-05-16 02:35:17'),
(350, 32, 3, 6, '2024-05-16 02:35:23'),
(351, 32, 3, 6, '2024-05-16 02:35:28'),
(352, 32, 3, 15, '2024-05-16 02:35:33'),
(353, 32, 3, 15, '2024-05-16 02:35:38'),
(354, 32, 3, 3, '2024-05-16 02:35:43'),
(355, 32, 3, 6, '2024-05-16 02:35:48'),
(356, 32, 3, 6, '2024-05-16 02:35:54'),
(357, 32, 3, 6, '2024-05-16 02:35:59'),
(358, 32, 3, 6, '2024-05-16 02:36:04'),
(359, 32, 3, 12, '2024-05-16 02:36:09'),
(360, 32, 3, 6, '2024-05-16 02:36:14'),
(361, 32, 3, 15, '2024-05-16 02:36:19'),
(362, 32, 3, 6, '2024-05-16 02:36:24'),
(363, 32, 3, 6, '2024-05-16 02:36:30'),
(364, 32, 3, 9, '2024-05-16 02:36:35'),
(365, 32, 3, 6, '2024-05-16 02:36:40'),
(366, 32, 3, 6, '2024-05-16 02:36:45'),
(367, 32, 3, 6, '2024-05-16 02:36:50'),
(368, 32, 3, 6, '2024-05-16 02:36:55'),
(369, 32, 3, 6, '2024-05-16 02:37:00'),
(370, 32, 3, 6, '2024-05-16 02:37:06'),
(371, 32, 3, 15, '2024-05-16 02:37:11'),
(372, 32, 3, 6, '2024-05-16 02:37:16'),
(373, 32, 3, 6, '2024-05-16 02:37:21'),
(374, 32, 3, 6, '2024-05-16 02:37:26'),
(375, 32, 3, 6, '2024-05-16 02:37:31'),
(376, 32, 3, 15, '2024-05-16 02:37:36'),
(377, 32, 3, 6, '2024-05-16 02:37:42'),
(378, 32, 3, 6, '2024-05-16 02:37:47'),
(379, 32, 3, 12, '2024-05-16 02:37:52'),
(380, 32, 3, 15, '2024-05-16 02:37:57'),
(381, 32, 3, 15, '2024-05-16 02:38:02'),
(382, 32, 3, 6, '2024-05-16 02:38:07'),
(383, 32, 3, 15, '2024-05-16 02:38:12'),
(384, 32, 3, 6, '2024-05-16 02:38:18'),
(385, 32, 3, 6, '2024-05-16 02:38:23'),
(386, 32, 3, 6, '2024-05-16 02:38:28'),
(387, 32, 3, 15, '2024-05-16 02:38:33'),
(388, 32, 3, 15, '2024-05-16 02:38:38'),
(389, 32, 3, 9, '2024-05-16 02:38:43'),
(390, 25, 2, 7, '2024-05-17 02:27:05'),
(391, 27, 4, 6, '2024-05-17 02:28:50'),
(392, 27, 8, 8, '2024-05-17 02:31:00'),
(393, 25, 5, 7, '2024-05-17 03:12:43'),
(394, 20, 9, 12, '2024-05-17 03:18:50'),
(395, 25, 5, 6, '2024-05-17 12:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(125) DEFAULT NULL,
  `password` varchar(125) DEFAULT NULL,
  `email` varchar(125) DEFAULT NULL,
  `role` enum('farmer','owner','officer','admin') DEFAULT 'farmer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`) VALUES
(1, 'opu', '$2b$12$l2HlF91UTljb2MeSrObrh.qJ.B4znPO7vaKl6t0j7G8EgBMOlRLRW', '1901036@iot.bdu.ac.bd', 'owner'),
(8, 'Ifrad', '$2b$12$M76ZYSBFLbBIG3wsF3jpLuTsGUlTjZDtv7h2AMhKVtPF8auoAapHK', '1901033@iot.bdu.ac.bd', 'farmer'),
(9, 'Opu', '$2b$12$VWYeBCG3pfODqX8b.0eAN.xOsDBTEoUi3gTTJEGV9pkAZeCk1whhO', '1901036@iot.bdu.ac.bd', 'farmer'),
(10, 'Shahriar Hossain ', '$2b$12$ZgHesucsHbr3gQzcfbKuH.LWRdy3V2V0PZo0xkRhbbK0JlUEFMyQm', '1901036@iot.bdu.ac.bd', 'owner'),
(11, 'Shahriar ', '$2b$12$3J1WHo0Frt2efSfBD24vZethTlLw37qFTL1yXa2ancNtn9mg4jOMi', '1901036@iot.bdu.ac.bd', 'farmer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pond1`
--
ALTER TABLE `pond1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pond2`
--
ALTER TABLE `pond2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pond3`
--
ALTER TABLE `pond3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pond1`
--
ALTER TABLE `pond1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pond2`
--
ALTER TABLE `pond2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pond3`
--
ALTER TABLE `pond3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensor`
--
ALTER TABLE `sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
