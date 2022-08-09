-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Aug 09, 2022 at 01:20 PM
-- Server version: 10.6.5-MariaDB-1:10.6.5+maria~focal
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_master`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `image_id` int(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `image_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'buena foto de la familia!!', '2022-06-16 12:21:45', '2022-06-16 12:21:45'),
(2, 1, 2, 'lindo paisaje!!', '2022-06-16 12:21:45', '2022-06-16 12:21:45'),
(3, 2, 3, 'con mi amiguiss :)!!', '2022-06-16 12:21:45', '2022-06-16 12:21:45'),
(4, 3, 1, 'que lindos se ven todos juntos!!', '2022-06-16 12:21:45', '2022-06-16 12:21:45'),
(5, 6, 7, 'kfjdfdlfnldjkfnsdklfnsdklfn', '2022-06-22 19:30:16', '2022-06-22 19:30:16'),
(7, 6, 7, 'que lindas florcitas', '2022-06-23 12:11:55', '2022-06-23 12:11:55'),
(8, 6, 7, '2', '2022-06-24 13:33:25', '2022-06-24 13:33:25');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `user_id`, `image_path`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'test.jpg', 'descripcion de prueba 1', '2022-06-16 11:50:43', '2022-06-16 11:50:43'),
(2, 2, 'test2.jpg', 'descripcion de prueba 2', '2022-06-16 11:50:43', '2022-06-16 11:50:43'),
(3, 1, 'test3.jpg', 'descripcion de prueba 3', '2022-06-16 11:50:43', '2022-06-16 11:50:43'),
(4, 3, 'test4.jpg', 'descripcion de prueba 4', '2022-06-16 11:50:43', '2022-06-16 11:50:43'),
(6, 6, '1655916999index.jpeg', 'feliz navidad', '2022-06-22 16:56:39', '2022-06-22 16:56:39'),
(7, 6, '1655923153sakura.jpeg', 'florcitas <3<3', '2022-06-22 18:39:13', '2022-06-24 12:11:36');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `image_id` int(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `image_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2022-06-16 12:24:42', '2022-06-16 12:24:42'),
(2, 2, 4, '2022-06-16 12:24:42', '2022-06-16 12:24:42'),
(3, 3, 1, '2022-06-16 12:24:42', '2022-06-16 12:24:42'),
(4, 3, 2, '2022-06-16 12:24:42', '2022-06-16 12:24:42'),
(5, 2, 1, '2022-06-16 12:24:42', '2022-06-16 12:24:42'),
(15, 6, 6, '2022-06-24 13:33:03', '2022-06-24 13:33:03'),
(16, 6, 4, '2022-06-24 13:33:05', '2022-06-24 13:33:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(200) DEFAULT NULL,
  `nick` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `surname`, `nick`, `email`, `password`, `image`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 'user', 'victor', 'Robles', 'victorroblesweb', 'victor@victor.com', 'pass', NULL, '2022-06-16 11:43:42', '2022-06-16 11:43:42', NULL),
(2, 'user', 'cecilia', 'garcia', 'ceciG', 'ceci@mail.com', 'pass', NULL, '2022-06-16 11:46:46', '2022-06-16 11:46:46', NULL),
(3, 'user', 'silvina', 'lopez', 'silvi027', 'silvi@mail.com', 'pass', NULL, '2022-06-16 11:46:46', '2022-06-16 11:46:46', NULL),
(4, NULL, 'Admin', NULL, NULL, 'admin@admin.com', '$2y$10$Mrgb4CEnURTjCKHdzyReze73QuWc/zCQVzcxKGTXWDdgv3y1Z05.G', NULL, '2022-06-16 14:21:05', '2022-06-16 14:21:05', NULL),
(5, NULL, 'David', 'Perez', 'DPerez', 'david@mail.com', '$2y$10$ZZLOL8lBmL0kAyJUAt6v9uwxwBkVzBp3r/qDWeTeX47jPOb8raatq', NULL, '2022-06-16 14:51:00', '2022-06-16 14:51:00', NULL),
(6, 'user', 'Lucia xd', 'Mendez', 'luciMendez', 'lucia@mail.com', '$2y$10$KnmRz//7EWUjNC31n9fJlO8BW1oVbkoS0BfS0roVFG6pzklxRLDZu', '1656077702Screenshot from 2022-04-28 16-00-47.png', '2022-06-16 14:55:27', '2022-06-24 13:35:02', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_users` (`user_id`),
  ADD KEY `fk_comments_images` (`image_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_images_users` (`user_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_likes_users` (`user_id`),
  ADD KEY `fk_likes_images` (`image_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `fk_comments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_images_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_likes_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `fk_likes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
