-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2020 at 02:46 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `capstone`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Contact` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Username`, `Password`, `FirstName`, `LastName`, `Email`, `Contact`) VALUES
(1, 'test', 'test', 'sad', 'sad', '', 0),
(2, 'tre', 'tre', 'ert', 'ret', '', 0),
(3, 'asdsad', 'ad', 'sadsad', 'dsad', '', 0),
(4, 'rwe', 'werwer', 'erwwe', 'rwer', '', 0),
(5, 'rwer', 'rwerwerew', 'rewrew', 'rewr', '', 0),
(6, 'wqeqw', 'weqwqewqewq', 'ewqewq', 'ewqew', '', 0),
(7, 'das', 'sadasdasdas', 'da', 'dsad', '', 0),
(8, 'eqw', 'asd', 'asdasss', 'dddddddd', '', 0),
(9, 'asdas', 'asd', 'w', 'ew', '', 0),
(10, 'admin', 'qwekqwek123', 'jo', 'jo', '', 0),
(11, 'V', 'V', 'V', 'V', '', 0),
(12, 'andrew', 'qwekqwek', 'eqwe', 'wqeqw', '', 0),
(13, 'windowsjp13', 'qwekqwek', 'john patrick', 'pasion', '', 0),
(14, 'test1', 'test', 'ewqw', 'qweq', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
