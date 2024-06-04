-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2024 at 05:45 AM
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
-- Database: `food_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending',
  `reference_number` varchar(255) NOT NULL,
  `order_status` enum('to ship','to receive','delivered','cancelled') NOT NULL DEFAULT 'to ship'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`, `reference_number`, `order_status`) VALUES
(2, 1, 'Hazel Bino', '0949660318', 'hazelbino837@gmail.com', 'cash on delivery', '1, tuscano, Albay, Polangui, Balinad, 4506', 'Hatsu Soda (50 x 1) - ', 50, '2024-06-01', 'pending', '', 'to receive'),
(9, 1, 'Hazel Bino', '0949660318', 'hazelbino837@gmail.com', 'cash on delivery', '1, tuscano, Albay, Polangui, Balinad, 4506', 'Vita Drink (50 x 2) - ', 100, '2024-06-02', 'pending', '', 'to ship'),
(10, 1, 'Hazel Bino', '0949660318', 'hazelbino837@gmail.com', 'cash on delivery', '1, tuscano, Albay, Polangui, Balinad, 4506', 'Orange (150 x 1) - ', 150, '2024-06-02', 'pending', '', 'to ship'),
(12, 1, 'Hazel Bino', '0949660318', 'hazelbino837@gmail.com', 'gcash', '1, tuscano, Albay, Polangui, Balinad, 4506', 'Sun Puffs (25 x 1) - Hatsu Soda (50 x 1) - ', 75, '2024-06-02', 'completed', '09496603189', 'to ship'),
(14, 1, 'Hazel Bino', '0949660318', 'hazelbino837@gmail.com', 'cash on delivery', '1, tuscano, Albay, Polangui, Balinad, 4506', 'Hatsu Soda (50 x 1) - apple (25 x 1) - ', 75, '2024-06-02', 'pending', '', 'to ship'),
(15, 1, 'Hazel Bino', '0949660318', 'hazelbino837@gmail.com', 'cash on delivery', '1, tuscano, Albay, Polangui, Balinad, 4506', 'apple (25 x 1) - ', 25, '2024-06-02', 'pending', '', 'to ship'),
(16, 1, 'Hazel Bino', '0949660318', 'hazelbino837@gmail.com', 'cash on delivery', '1, tuscano, Albay, Polangui, Balinad, 4506', 'apple (25 x 1) - ', 25, '2024-06-02', 'pending', '', 'to ship'),
(17, 1, 'Hazel Bino', '0949660318', 'hazelbino837@gmail.com', 'cash on delivery', '1, tuscano, Albay, Polangui, Balinad, 4506', 'apple (25 x 1) - ', 25, '2024-06-02', 'pending', '', 'to ship');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `date_added` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'available',
  `stocks` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`, `date_added`, `status`, `stocks`) VALUES
(3, 'Chinese Cabbage', 'Vegetables', 200, 'Chinese Cabbage.jpg', '2024-06-01', 'sold out', 0),
(4, 'Hatsu Soda', 'Beverages', 50, 'Hatsu Soda.png', '2024-06-01', 'available', 0),
(5, 'Sun Puffs', 'Snacks', 25, 'Sun Puffs.jpg', '2024-06-01', 'available', 0),
(6, 'Capsicum', 'Vegetables', 50, 'capsicum.png', '2024-06-01', 'available', 0),
(7, 'Vita Drink', 'Beverages', 50, 'Vita Drink.png', '2024-06-01', 'available', 0),
(8, 'Orange', 'Fruits', 150, 'orange.png', '2024-06-01', 'available', 0),
(9, 'apple', 'Fruits', 25, 'apple.png', '2024-06-02', 'available', 100);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `reviews` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `name`, `email`, `reviews`) VALUES
(1, 0, 'Hazel Bino', 'hazelbino837@gmail.com', 'nice service!');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `number`, `password`, `address`) VALUES
(1, 'Hazel Bino', 'hazelbino837@gmail.com', '0949660318', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '1, tuscano, Albay, Polangui, Balinad, 4506');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
