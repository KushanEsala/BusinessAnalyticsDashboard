-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 03, 2025 at 04:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_v2`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `position` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `hire_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `employee_name`, `email`, `phone_number`, `position`, `salary`, `hire_date`, `created_at`) VALUES
(3, 'amal da silva', 'amal@gmail.com', '1231231275', 'worker', 28500.00, '2024-12-18', '2024-12-16 07:36:32'),
(4, 'saman', 'saman@gmail.com', '1234560000', 'worker', 12341.00, '2024-12-16', '2024-12-16 07:47:07'),
(6, 'roman', 'roman@gmail.com', '1231231234', 'worker', 50000.00, '2024-12-17', '2024-12-16 08:08:08'),
(7, 'kamal', 'kamal@gmail.com', '1231231234', 'worker', 25000.00, '2024-12-18', '2024-12-17 16:35:12');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_performance_summary`
-- (See below for the actual view)
--
CREATE TABLE `employee_performance_summary` (
`employee_id` int(11)
,`employee_name` varchar(100)
,`position` varchar(50)
,`email` varchar(100)
,`phone_number` varchar(15)
,`performance_date` date
,`rating` int(11)
,`remarks` text
);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock_added` int(11) NOT NULL,
  `stock_removed` int(11) NOT NULL DEFAULT 0,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `product_id`, `stock_added`, `stock_removed`, `update_date`) VALUES
(3, 9, 100, 200, '2024-12-18 09:57:25'),
(4, 10, 100, 1000, '2024-12-18 09:58:23'),
(5, 11, 50, 115, '2024-12-18 10:20:05'),
(6, 12, 200, 15, '2024-12-18 23:09:30');

-- --------------------------------------------------------

--
-- Stand-in structure for view `monthly_revenue_summary`
-- (See below for the actual view)
--
CREATE TABLE `monthly_revenue_summary` (
`year` int(4)
,`month` int(2)
,`total_revenue` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE `performance` (
  `performance_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `performance_date` date NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`performance_id`, `employee_id`, `performance_date`, `rating`, `remarks`) VALUES
(5, 3, '2024-12-18', 4, 'good'),
(6, 4, '2024-12-18', 2, 'somewhat good'),
(7, 6, '2024-12-18', 4, 'very good'),
(8, 3, '2024-12-18', 5, 'excelent'),
(9, 6, '2024-12-18', 3, 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category`, `price`, `stock_quantity`, `created_at`, `last_updated`) VALUES
(3, 'rice', 'food', 180.00, 200, '2024-12-16 07:38:04', '2024-12-18 23:10:27'),
(4, 'pen', 'Books', 100.00, 100, '2024-12-17 15:24:56', '2024-12-17 15:24:56'),
(5, 'pen', 'Books', 100.00, 100, '2024-12-17 15:25:53', '2024-12-17 15:25:53'),
(6, 'Book', 'Statinary', 160.00, 100, '2024-12-17 21:34:14', '2024-12-17 21:34:25'),
(7, 'Cr books', 'Stationary', 100.00, 50, '2024-12-18 08:13:44', '2024-12-18 08:13:44'),
(8, 'Book', 'Stationary', 120.00, 100, '2024-12-18 08:15:51', '2024-12-18 08:15:51'),
(9, 'pen', 'Stationary', 10.00, 100, '2024-12-18 08:19:54', '2024-12-18 08:19:54'),
(10, 'Glue', 'Stationary', 50.00, 100, '2024-12-18 09:58:00', '2024-12-18 09:58:00'),
(11, 'Milk Powder', 'Food', 1850.00, 50, '2024-12-18 10:08:51', '2024-12-18 10:08:51'),
(12, 'Dhal', 'food', 100.00, 200, '2024-12-18 23:08:36', '2024-12-18 23:08:36');

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `add_product_to_inventory` AFTER INSERT ON `products` FOR EACH ROW BEGIN
    INSERT INTO inventory (product_id, stock_added, stock_removed, update_date)
    VALUES (NEW.product_id, NEW.stock_quantity, 0, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `report_type` enum('Sales','Inventory','Performance') NOT NULL,
  `generated_by` int(11) NOT NULL,
  `generated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sale_date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `product_id`, `sale_date`, `quantity`, `total_price`) VALUES
(2, 3, '2024-12-17', 20, 875.00),
(4, 3, '2024-12-17', 10, 1800.00),
(5, 3, '2024-12-18', 20, 780.00),
(7, 3, '2024-12-18', 20, 2566.00),
(8, 5, '2024-12-19', 10, 1500.00),
(9, 6, '2024-12-18', 20, 1600.00),
(10, 9, '2024-12-18', 20, 200.00),
(11, 9, '2024-12-18', 10, 100.00),
(12, 9, '2024-12-18', 120, 1200.00),
(13, 9, '2024-12-18', 50, 500.00),
(14, 10, '2024-12-18', 1000, 50000.00),
(15, 11, '2024-12-18', 55, 25000.00),
(16, 11, '2024-12-18', 60, 65000.00),
(17, 12, '2024-12-19', 15, 1500.00);

--
-- Triggers `sales`
--
DELIMITER $$
CREATE TRIGGER `remove_stock_on_sale` AFTER INSERT ON `sales` FOR EACH ROW BEGIN
    UPDATE inventory
    SET stock_removed = stock_removed + NEW.quantity,
        update_date = CURRENT_TIMESTAMP
    WHERE product_id = NEW.product_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'esala', 'kushanesalakck@gmail.com', '1234567890-', 'admin', '2024-12-02 23:31:25'),
(2, 'test', 'kushanesalakck@gmail.com', 'qwertyuiop', 'user', '2024-12-15 09:13:21'),
(4, 'test2', 'test2@gmial.com', 'test2@123', 'user', '2024-12-15 09:35:02'),
(6, 'test9', 'test9@gmail.com', 'test2@123', 'user', '2024-12-16 05:34:40'),
(7, 'test8', 'test8@gmail.com', 'test8', 'user', '2024-12-16 06:20:38'),
(8, 'test10', 'test10@gmail.com', 'test10', 'user', '2024-12-16 06:57:37'),
(9, 'test11', 'test11@gmail.com', 'test11', 'user', '2024-12-16 07:26:50'),
(10, 'test12', 'test12@gmail.c0m', 'test12', 'user', '2024-12-16 08:19:41'),
(11, 'test13', 'test13@gmail.com', 'test13', 'user', '2024-12-16 08:47:03'),
(12, 'test14', 'test14@gmail.com', 'test14', 'user', '2024-12-16 11:58:48'),
(13, 'test15', 'test15@gmail.com', 'test15', 'user', '2024-12-16 13:12:37'),
(14, 'test16', 'test16@gmail.com', 'test16', 'user', '2024-12-16 14:02:24'),
(16, 'test17', 'test16@gmail.com', 'test17', 'user', '2024-12-16 14:51:32'),
(17, 'test20', 'test20@gmail.com', 'test20', 'user', '2024-12-17 11:55:52'),
(18, 'test21', 'test21@gmail.com', 'test21', 'user', '2024-12-17 13:16:16'),
(19, 'test22', 'test22@gmail.com', 'tes22', 'user', '2024-12-17 15:48:07'),
(20, 'test25', 'test25@gmail.com', 'test25', 'user', '2024-12-17 16:12:44'),
(21, 'test26', 'test26@gmail.com', 'test26', 'user', '2024-12-17 16:34:04'),
(22, 'test27', 'test27@gmail.com', 'test27', 'user', '2024-12-17 21:28:03'),
(23, 'user', 'user@gmail.com', 'user1234', 'user', '2024-12-17 21:33:17'),
(24, 'test28', 'test28@gmail.com', 'test28', 'user', '2024-12-17 21:43:54'),
(26, 'test29', 'test29@gmail.com', 'test28', 'user', '2024-12-17 22:11:17'),
(28, 'test30', 'test29@gmail.com', 'test29', 'user', '2024-12-18 08:13:09'),
(29, 'test201', 'test@gmail.com', 'test201', 'user', '2024-12-18 22:35:27'),
(30, 'tesmp', 'temp@gmail.com', 'tesmp', 'user', '2024-12-18 23:07:17'),
(31, 'temp11', 'temp@gmail.com', 'team11', 'user', '2024-12-20 08:42:04');

-- --------------------------------------------------------

--
-- Structure for view `employee_performance_summary`
--
DROP TABLE IF EXISTS `employee_performance_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_performance_summary`  AS SELECT `e`.`employee_id` AS `employee_id`, `e`.`employee_name` AS `employee_name`, `e`.`position` AS `position`, `e`.`email` AS `email`, `e`.`phone_number` AS `phone_number`, `p`.`performance_date` AS `performance_date`, `p`.`rating` AS `rating`, `p`.`remarks` AS `remarks` FROM (`employees` `e` join `performance` `p` on(`e`.`employee_id` = `p`.`employee_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `monthly_revenue_summary`
--
DROP TABLE IF EXISTS `monthly_revenue_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `monthly_revenue_summary`  AS SELECT year(`s`.`sale_date`) AS `year`, month(`s`.`sale_date`) AS `month`, sum(`s`.`total_price`) AS `total_revenue` FROM `sales` AS `s` GROUP BY year(`s`.`sale_date`), month(`s`.`sale_date`) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
