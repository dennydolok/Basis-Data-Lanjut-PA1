-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2023 at 10:18 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pemesananfilm`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `ID` int(10) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`ID`, `First_Name`, `Last_Name`, `Last_Update`) VALUES
(1, 'Yudhistira', 'Kusuma', '2023-03-02 05:47:21'),
(2, 'Muhammad', 'Ilham', '2023-03-02 05:47:21');

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `ID` int(10) NOT NULL,
  `CityID` int(10) DEFAULT NULL,
  `Address` varchar(50) NOT NULL,
  `Address2` varchar(50) NOT NULL,
  `District` int(20) NOT NULL,
  `Postal_Code` varchar(10) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`ID`, `CityID`, `Address`, `Address2`, `District`, `Postal_Code`, `Phone`, `Last_Update`) VALUES
(1, 1, 'Jl Farmasi I BF 12', 'Bumi Menteng Asri', 1, '12111', '081234567890', '2023-03-02 05:51:46'),
(2, 2, 'Jl. Kenanga no.17', 'Lembang', 2, '13111', '081212345678', '2023-03-02 05:51:46'),
(3, 1, 'Jl Farmasi I BF 15', 'Bumi Menteng Asri', 1, '12111', '081234567891', '2023-03-02 05:54:35'),
(4, 2, 'Jl. Kenanga no.22', 'Lembang', 2, '13111', '081212345679', '2023-03-02 05:54:35'),
(5, 1, 'Jl. Aja Dulu', '-', 3, '15111', '081234567892', '2023-03-02 06:05:48'),
(6, 2, 'Jl. Jalan Mulu', '-', 3, '16111', '081212345670', '2023-03-02 06:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(10) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `LastUpdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `Name`, `LastUpdate`) VALUES
(1, 'Horror', '2023-03-02 05:18:16'),
(2, 'Thriller', '2023-03-02 05:23:09');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `ID` int(10) NOT NULL,
  `CountryID` int(10) DEFAULT NULL,
  `City` varchar(50) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`ID`, `CountryID`, `City`, `Last_Update`) VALUES
(1, 1, 'Bogor', '2023-03-02 05:51:30'),
(2, 1, 'Bandung', '2023-03-02 05:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `ID` int(10) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`ID`, `Country`, `Last_Update`) VALUES
(1, 'Indonesia', '2023-03-02 05:51:12'),
(2, 'Singapura', '2023-03-02 05:51:12');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(10) NOT NULL,
  `AddressID` int(10) DEFAULT NULL,
  `AddressColumn` int(10) DEFAULT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Active` char(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `AddressID`, `AddressColumn`, `First_Name`, `Last_Name`, `Email`, `Active`, `Create_Date`, `Last_Update`) VALUES
(1, 3, 1, 'Mervin', 'Ruswan', 'MervinRuswan@gmail.com', 'Y', '2023-03-02', '2023-03-02 05:56:19'),
(2, 4, 2, 'Ryan', 'Sachio', 'RyanSachio@gmail.com', 'Y', '2023-03-02', '2023-03-02 05:56:19');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `ID` int(10) NOT NULL,
  `LanguageID` int(10) DEFAULT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Release_Year` int(4) NOT NULL,
  `Rental_Duration` int(10) NOT NULL,
  `Rental_Rate` decimal(19,0) NOT NULL,
  `Length` int(2) NOT NULL,
  `Replacement_Cost` decimal(19,0) NOT NULL,
  `Rating` int(10) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Special_Features` varchar(255) NOT NULL,
  `Fullteks` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`ID`, `LanguageID`, `Title`, `Description`, `Release_Year`, `Rental_Duration`, `Rental_Rate`, `Length`, `Replacement_Cost`, `Rating`, `Last_Update`, `Special_Features`, `Fullteks`) VALUES
(1, 1, 'Kabar Baik', 'Lorem Ipsum1', 2022, 120, '5', 90, '1500000', 4, '2023-03-02 05:59:43', '-', '-'),
(2, 1, 'Kabar Baik', 'Lorem Ipsum1', 2022, 120, '5', 90, '1500000', 4, '2023-03-02 06:00:36', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `film_actor`
--

CREATE TABLE `film_actor` (
  `FilmID` int(10) DEFAULT NULL,
  `ActorID` int(10) DEFAULT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `film_actor`
--

INSERT INTO `film_actor` (`FilmID`, `ActorID`, `Last_Update`) VALUES
(1, 1, '2023-03-02 06:01:36'),
(1, 2, '2023-03-02 06:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `film_category`
--

CREATE TABLE `film_category` (
  `FilmID` int(10) DEFAULT NULL,
  `CategoryID` int(10) DEFAULT NULL,
  `LastUpdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `film_category`
--

INSERT INTO `film_category` (`FilmID`, `CategoryID`, `LastUpdate`) VALUES
(1, 1, '2023-03-02 06:02:12'),
(2, 1, '2023-03-02 06:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `ID` int(10) NOT NULL,
  `FilmID` int(10) DEFAULT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`ID`, `FilmID`, `Last_Update`) VALUES
(1, 1, '2023-03-02 06:02:53'),
(2, 2, '2023-03-02 06:02:53');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `ID` int(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`ID`, `Name`, `Last_Update`) VALUES
(1, 'Indonesia', '2023-03-02 05:59:29'),
(2, 'Inggris', '2023-03-02 05:59:29'),
(3, 'Jepang', '2023-03-02 05:59:29');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `ID` int(10) NOT NULL,
  `RentalID` int(10) DEFAULT NULL,
  `CustomerID` int(10) DEFAULT NULL,
  `StaffID` int(10) DEFAULT NULL,
  `Amount` decimal(19,0) NOT NULL,
  `Payment_Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`ID`, `RentalID`, `CustomerID`, `StaffID`, `Amount`, `Payment_Date`) VALUES
(1, 1, 1, 1, '2', '2023-03-02 06:10:17'),
(2, 2, 2, 2, '5', '2023-03-02 06:10:17');

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `ID` int(10) NOT NULL,
  `StaffID` int(10) DEFAULT NULL,
  `CustomerID` int(10) DEFAULT NULL,
  `InventoryID` int(10) DEFAULT NULL,
  `Rental_Date` date NOT NULL,
  `Return_Date` date NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rental`
--

INSERT INTO `rental` (`ID`, `StaffID`, `CustomerID`, `InventoryID`, `Rental_Date`, `Return_Date`, `Last_Update`) VALUES
(1, 1, 1, 1, '2023-03-02', '2023-03-02', '2023-03-02 06:09:35'),
(2, 2, 2, 2, '2023-03-02', '2023-03-02', '2023-03-02 06:09:35');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `ID` int(10) NOT NULL,
  `AddressID` int(10) DEFAULT NULL,
  `StoreID` int(10) DEFAULT NULL,
  `PaymentID` int(10) DEFAULT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Active` char(1) NOT NULL,
  `Username` varchar(16) NOT NULL,
  `Passwords` varchar(40) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PictureURL` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`ID`, `AddressID`, `StoreID`, `PaymentID`, `First_Name`, `Last_Name`, `Email`, `Active`, `Username`, `Passwords`, `Last_Update`, `PictureURL`) VALUES
(1, 5, 1, 1, 'Ahmad', 'Robani', 'AhmadRobani@gmail.com', 'Y', 'AhmadRobani', 'AhmadRobani123', '2023-03-02 06:08:40', '-'),
(2, 6, 2, 2, 'Dadang', 'Suherman', 'DadangSuherman@gmail.com', 'Y', 'DadangSuherman', 'DadangSuherman123', '2023-03-02 06:08:40', '-');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `ID` int(10) NOT NULL,
  `AddressID` int(10) DEFAULT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`ID`, `AddressID`, `Last_Update`) VALUES
(1, 5, '2023-03-02 06:06:16'),
(2, 6, '2023-03-02 06:06:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CityID` (`CityID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CountryID` (`CountryID`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AddressID` (`AddressID`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LanguageID` (`LanguageID`);

--
-- Indexes for table `film_actor`
--
ALTER TABLE `film_actor`
  ADD KEY `FilmID` (`FilmID`),
  ADD KEY `ActorID` (`ActorID`);

--
-- Indexes for table `film_category`
--
ALTER TABLE `film_category`
  ADD KEY `FilmID` (`FilmID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FilmID` (`FilmID`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RentalID` (`RentalID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `StaffID` (`StaffID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `InventoryID` (`InventoryID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AddressID` (`AddressID`),
  ADD KEY `StoreID` (`StoreID`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AddressID` (`AddressID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actor`
--
ALTER TABLE `actor`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rental`
--
ALTER TABLE `rental`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `city` (`ID`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `country` (`ID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`AddressID`) REFERENCES `address` (`ID`);

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`LanguageID`) REFERENCES `language` (`ID`);

--
-- Constraints for table `film_actor`
--
ALTER TABLE `film_actor`
  ADD CONSTRAINT `film_actor_ibfk_1` FOREIGN KEY (`FilmID`) REFERENCES `film` (`ID`),
  ADD CONSTRAINT `film_actor_ibfk_2` FOREIGN KEY (`ActorID`) REFERENCES `actor` (`ID`);

--
-- Constraints for table `film_category`
--
ALTER TABLE `film_category`
  ADD CONSTRAINT `film_category_ibfk_1` FOREIGN KEY (`FilmID`) REFERENCES `film` (`ID`),
  ADD CONSTRAINT `film_category_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`FilmID`) REFERENCES `film` (`ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`RentalID`) REFERENCES `rental` (`ID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`ID`);

--
-- Constraints for table `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`ID`),
  ADD CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `rental_ibfk_3` FOREIGN KEY (`InventoryID`) REFERENCES `inventory` (`ID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`AddressID`) REFERENCES `address` (`ID`),
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`StoreID`) REFERENCES `store` (`ID`);

--
-- Constraints for table `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`AddressID`) REFERENCES `address` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
