-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Mar 2023 pada 12.19
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penyewaan_film`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `actor`
--

CREATE TABLE `actor` (
  `ID` int(10) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `address`
--

CREATE TABLE `address` (
  `ID` int(10) NOT NULL,
  `CityID` int(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Address2` varchar(50) NOT NULL,
  `District` int(20) NOT NULL,
  `Postal_Code` varchar(10) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `ID` int(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `city`
--

CREATE TABLE `city` (
  `ID` int(10) NOT NULL,
  `CountryID` int(10) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `country`
--

CREATE TABLE `country` (
  `ID` int(10) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `ID` int(10) NOT NULL,
  `AddressID` int(10) NOT NULL,
  `AddressColumn` int(10) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Active` char(1) NOT NULL,
  `Create_Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `film`
--

CREATE TABLE `film` (
  `ID` int(10) NOT NULL,
  `LanguageID` int(10) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Release_Year` int(4) NOT NULL,
  `Rental_Duration` int(10) NOT NULL,
  `Rental_Rate` float(19,0) NOT NULL,
  `Length` int(2) NOT NULL,
  `Replacement_Cost` float(19,0) NOT NULL,
  `Rating` int(10) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Special_Features` varchar(255) NOT NULL,
  `Fulltext` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `film_actor`
--

CREATE TABLE `film_actor` (
  `FilmID` int(10) NOT NULL,
  `ActorID` int(10) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `film_category`
--

CREATE TABLE `film_category` (
  `FilmID` int(10) NOT NULL,
  `CategoryID` int(10) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory`
--

CREATE TABLE `inventory` (
  `ID` int(11) NOT NULL,
  `FilmID` int(10) NOT NULL,
  `Last_Update` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `language`
--

CREATE TABLE `language` (
  `ID` int(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `ID` int(10) NOT NULL,
  `RentalID` int(10) NOT NULL,
  `CustomerID` int(10) NOT NULL,
  `StaffID` int(10) NOT NULL,
  `Amount` float NOT NULL,
  `Payment_Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rental`
--

CREATE TABLE `rental` (
  `ID` int(10) NOT NULL,
  `StaffID` int(10) NOT NULL,
  `CustomerID` int(10) NOT NULL,
  `InventoryID` int(10) NOT NULL,
  `Rental_Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `return_Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `staff`
--

CREATE TABLE `staff` (
  `ID` int(10) NOT NULL,
  `AddressID` int(10) NOT NULL,
  `StoreID` int(10) NOT NULL,
  `PaymentID` int(10) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Active` char(1) NOT NULL,
  `Username` varchar(16) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PictureURL` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `store`
--

CREATE TABLE `store` (
  `ID` int(10) NOT NULL,
  `AddressID` int(10) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_City_ID` (`CityID`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Country_ID` (`CountryID`);

--
-- Indeks untuk tabel `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Address` (`AddressID`);

--
-- Indeks untuk tabel `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Film_Language` (`LanguageID`);

--
-- Indeks untuk tabel `film_actor`
--
ALTER TABLE `film_actor`
  ADD PRIMARY KEY (`FilmID`),
  ADD KEY `FK_aktor` (`ActorID`);

--
-- Indeks untuk tabel `film_category`
--
ALTER TABLE `film_category`
  ADD KEY `FK_FilmID` (`FilmID`),
  ADD KEY `FK_CategotyID` (`CategoryID`);

--
-- Indeks untuk tabel `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Film_ID` (`FilmID`);

--
-- Indeks untuk tabel `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Rental_ID` (`RentalID`),
  ADD KEY `FK_Staff` (`StaffID`),
  ADD KEY `FK_Customer` (`CustomerID`);

--
-- Indeks untuk tabel `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Inventory_ID` (`InventoryID`),
  ADD KEY `FK_Staff_ID` (`StaffID`),
  ADD KEY `FK_Customer_ID` (`CustomerID`);

--
-- Indeks untuk tabel `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Address_ID` (`AddressID`),
  ADD KEY `FK_Store_ID` (`StoreID`);

--
-- Indeks untuk tabel `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_AddressID` (`AddressID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `film`
--
ALTER TABLE `film`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_City_ID` FOREIGN KEY (`CityID`) REFERENCES `city` (`ID`);

--
-- Ketidakleluasaan untuk tabel `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FK_Country_ID` FOREIGN KEY (`CountryID`) REFERENCES `country` (`ID`);

--
-- Ketidakleluasaan untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_Address` FOREIGN KEY (`AddressID`) REFERENCES `address` (`ID`);

--
-- Ketidakleluasaan untuk tabel `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `FK_Film_Language` FOREIGN KEY (`LanguageID`) REFERENCES `language` (`ID`);

--
-- Ketidakleluasaan untuk tabel `film_actor`
--
ALTER TABLE `film_actor`
  ADD CONSTRAINT `FK_Film` FOREIGN KEY (`FilmID`) REFERENCES `film` (`ID`),
  ADD CONSTRAINT `FK_aktor` FOREIGN KEY (`ActorID`) REFERENCES `actor` (`ID`);

--
-- Ketidakleluasaan untuk tabel `film_category`
--
ALTER TABLE `film_category`
  ADD CONSTRAINT `FK_CategotyID` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`),
  ADD CONSTRAINT `FK_FilmID` FOREIGN KEY (`FilmID`) REFERENCES `film` (`ID`);

--
-- Ketidakleluasaan untuk tabel `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `FK_Film_ID` FOREIGN KEY (`FilmID`) REFERENCES `film` (`ID`);

--
-- Ketidakleluasaan untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `FK_Rental_ID` FOREIGN KEY (`RentalID`) REFERENCES `rental` (`ID`),
  ADD CONSTRAINT `FK_Staff` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`ID`);

--
-- Ketidakleluasaan untuk tabel `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `FK_Customer_ID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `FK_Inventory_ID` FOREIGN KEY (`InventoryID`) REFERENCES `inventory` (`ID`),
  ADD CONSTRAINT `FK_Staff_ID` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`ID`);

--
-- Ketidakleluasaan untuk tabel `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `FK_Address_ID` FOREIGN KEY (`AddressID`) REFERENCES `address` (`ID`),
  ADD CONSTRAINT `FK_Store_ID` FOREIGN KEY (`StoreID`) REFERENCES `store` (`ID`);

--
-- Ketidakleluasaan untuk tabel `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `FK_AddressID` FOREIGN KEY (`AddressID`) REFERENCES `address` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
