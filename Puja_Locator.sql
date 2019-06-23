-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 23, 2019 at 07:47 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Puja_Locator`
--

-- --------------------------------------------------------

--
-- Table structure for table `quizDetails`
--

CREATE TABLE `quizDetails` (
  `userID` int(11) NOT NULL,
  `week1Score` int(11) NOT NULL,
  `week1Time` datetime DEFAULT NULL,
  `week2Score` int(11) NOT NULL,
  `week2Time` datetime DEFAULT NULL,
  `week3Score` int(11) NOT NULL,
  `week3Time` datetime DEFAULT NULL,
  `week4Score` int(11) NOT NULL,
  `week4Time` datetime DEFAULT NULL,
  `totalScore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quizDetails`
--

INSERT INTO `quizDetails` (`userID`, `week1Score`, `week1Time`, `week2Score`, `week2Time`, `week3Score`, `week3Time`, `week4Score`, `week4Time`, `totalScore`) VALUES
(15, 100, '2019-06-23 10:39:58', 50, '2019-06-23 10:42:22', 150, '2019-06-23 10:42:53', 150, '2019-06-23 10:43:12', 450);

-- --------------------------------------------------------

--
-- Table structure for table `userRegistration`
--

CREATE TABLE `userRegistration` (
  `userID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `emailID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userRegistration`
--

INSERT INTO `userRegistration` (`userID`, `name`, `emailID`, `phoneNo`, `city`, `time`) VALUES
(15, 'Harman', 'harmanrayat@gmail.com', '545', 'mumbai', '2019-06-23 17:39:49.064933');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `quizDetails`
--
ALTER TABLE `quizDetails`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `userRegistration`
--
ALTER TABLE `userRegistration`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `emailID` (`emailID`),
  ADD UNIQUE KEY `phoneNo` (`phoneNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `userRegistration`
--
ALTER TABLE `userRegistration`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `quizDetails`
--
ALTER TABLE `quizDetails`
  ADD CONSTRAINT `quizdetails_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userRegistration` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
