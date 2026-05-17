-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2024 at 10:23 AM
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
-- Database: `fuelpilot`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aemail` varchar(100) NOT NULL,
  `apassword` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aemail`, `apassword`) VALUES
('1.5707963267948966', 'admin'),
('admin@gmail.com', '@admin'),
('kiran@gmail.com', '@kiran'),
('kiran@gmail.com', '@kiran'),
('admin@gmail.com', '@admin');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `bid` int(20) NOT NULL,
  `uid` int(20) NOT NULL,
  `fid` int(20) NOT NULL,
  `dpid` int(20) NOT NULL,
  `fueltype` varchar(100) NOT NULL,
  `quantity` float NOT NULL,
  `totalbill` float NOT NULL,
  `status` varchar(100) NOT NULL,
  `dcode` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`bid`, `uid`, `fid`, `dpid`, `fueltype`, `quantity`, `totalbill`, `status`, `dcode`) VALUES
(1, 101, 10, 1001, 'Petrol', 20, 300, 'Assigned', '2024-07-20'),
(2, 102, 11, 1002, 'Diesel', 30, 450, 'Assigned', '2024-07-20'),
(3, 103, 12, 1, 'Petrol', 25, 375, 'assigned', '2024-07-20'),
(4, 104, 13, 1004, 'Diesel', 40, 600, 'Delivered', '2024-07-20'),
(5, 105, 14, 1005, 'Petrol', 15, 225, 'Assigned', '2024-07-20'),
(6, 106, 15, 1006, 'Diesel', 35, 525, 'rejected', '2024-07-20'),
(7, 107, 16, 1007, 'Petrol', 10, 150, 'Rejected', '2024-07-20'),
(8, 108, 17, 1008, 'Diesel', 20, 300, 'Pending', '2024-07-20'),
(9, 109, 18, 1009, 'Petrol', 30, 450, 'Assigned', '2024-07-20'),
(10, 110, 19, 1010, 'Diesel', 25, 375, 'Assigned', '2024-07-20'),
(11, 11, 11, 12, 'petrol', 45, 345, 'Pneding', '0.0002217786646'),
(23, 23, 23, 23, '23', 23, 34, '23', '2443-02-02'),
(3330, 0, 4, 3330, 'Petrol', 34, 3060, 'Pending', '2024-07-22'),
(4241, 0, 4, 0, 'Disel', 3, 256.5, 'assigned', '2024-07-22'),
(5934, 0, 4, 5934, 'Petrol', 56, 5040, 'Pending', '2024-07-22'),
(6179, 0, 4, 6179, 'Petrol', 56, 5040, 'Pending', '2024-07-22'),
(7415, 0, 4, 7415, 'Petrol', 34, 3060, 'Pending', '2024-07-22'),
(7416, 0, 4, 0, 'Disel', 7, 598.5, 'Pending', '5392'),
(7417, 0, 4, 0, 'Petrol', 23, 2070, 'Pending', '9871');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryperson`
--

CREATE TABLE `deliveryperson` (
  `dpid` int(20) NOT NULL,
  `fid` int(20) NOT NULL,
  `dname` varchar(100) NOT NULL,
  `dcity` varchar(100) NOT NULL,
  `dcontact` varchar(100) NOT NULL,
  `daddress` varchar(100) NOT NULL,
  `dpincode` varchar(100) NOT NULL,
  `demail` varchar(100) NOT NULL,
  `dpassword` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveryperson`
--

INSERT INTO `deliveryperson` (`dpid`, `fid`, `dname`, `dcity`, `dcontact`, `daddress`, `dpincode`, `demail`, `dpassword`) VALUES
(4, 104, 'JKL Station', 'Houston', '4567890123', '101 Pine St', '77001', 'jkl@station.com', 'password101'),
(5, 105, 'MNO Station', 'Phoenix', '5678901234', '202 Oak St', '85001', 'mno@station.com', 'password202'),
(6, 106, 'PQR Station', 'Philadelphia', '6789012345', '303 Birch St', '19101', 'pqr@station.com', 'password303'),
(7, 107, 'STU Station', 'San Antonio', '7890123456', '404 Cedar St', '78201', 'stu@station.com', 'password404'),
(8, 108, 'VWX Station', 'San Diego', '8901234567', '505 Spruce St', '92101', 'vwx@station.com', 'password505'),
(9, 109, 'YZA Station', 'Dallas', '9012345678', '606 Willow St', '75201', 'yza@station.com', 'password606'),
(10, 110, 'BCD Station', 'San Jose', '0123456789', '707 Redwood St', '95101', 'bcd@station.com', 'password707'),
(56, 678, 'fuelIndeed', 'shirpur', '345678908', 'Dhule', '425427', 'FuelIndeed@gmail.com', 'wee');

-- --------------------------------------------------------

--
-- Table structure for table `fuelstation`
--

CREATE TABLE `fuelstation` (
  `fid` int(20) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `fcontact` varchar(100) NOT NULL,
  `femail` varchar(100) NOT NULL,
  `fpassword` varchar(100) NOT NULL,
  `fcity` varchar(100) NOT NULL,
  `faddress` varchar(100) NOT NULL,
  `farea` varchar(100) NOT NULL,
  `fpincode` varchar(100) NOT NULL,
  `fpetrolqty` double NOT NULL,
  `fpetrolrate` double NOT NULL,
  `fdiselqty` double NOT NULL,
  `fdiselrate` double NOT NULL,
  `fopentime` varchar(100) NOT NULL,
  `fclosetime` varchar(100) NOT NULL,
  `fstatus` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fuelstation`
--

INSERT INTO `fuelstation` (`fid`, `fname`, `fcontact`, `femail`, `fpassword`, `fcity`, `faddress`, `farea`, `fpincode`, `fpetrolqty`, `fpetrolrate`, `fdiselqty`, `fdiselrate`, `fopentime`, `fclosetime`, `fstatus`) VALUES
(1, 'indianoil', '234567890', 'indianoil@gmail.com', '@indianoil', 'dhule', 'india', 'india', '23456', 45, 45, 45, 45, '5.00', '5.00', 'Approved'),
(2, 'Blue Sky Petroleum', '987-654-3210', 'info@blueskypetroleum.com', 'securepass456', 'Rivertown', '456 Blue Ave', 'East Zone', '654321', 23, 45, 45, 45, '05:30', '23:00', 'Disapproved'),
(3, 'Red Flame Fuels', '456-789-0123', 'support@redflamefuels.com', 'mypassword789', 'Mountainview', '789 Red Blvd', 'West Zone', '789012', 6000, 92, 5000, 87, '07:00', '21:00', 'Assigned'),
(4, 'Yellow Sun Oil', '321-654-9870', 'hello@yellowsunoil.com', 'yellow1234', 'Lakeside', '321 Yellow Rd', 'South Zone', '210987', 7000, 90, 8000, 85.5, '06:30', '22:30', 'Approve'),
(9, 'Green Fuel Station', '123-456-7890', 'contact@greenfuel.com', 'password123', 'Springfield', '123 Green St', 'North Zone', '123456', 5000, 90.5, 7000, 85, '06:00', '22:00', 'Approve'),
(10, 'Indian Oil', '34568679650430', 'indianoil@gmail.com', '@indianfuel', 'Shirpur', 'dhule', 'india', '425427', 3, 0.04, 8, 0.03, '23:12', '23:56', 'DisApprove'),
(19, 'indianoil', '234567890', 'indianoil@gmail.com', '@indianoil', 'dhule', 'india', 'india', '23456', 45, 45, 45, 45, '5.00', '5.00', 'Pending'),
(20, 'Indi', '', '', '', '', '', '', '', 0, 0, 0, 0, '', '', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(10) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `ucity` varchar(100) NOT NULL,
  `ucontact` varchar(100) NOT NULL,
  `uaddress` varchar(100) NOT NULL,
  `upincode` varchar(100) NOT NULL,
  `uemail` varchar(100) NOT NULL,
  `upassword` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `uname`, `ucity`, `ucontact`, `uaddress`, `upincode`, `uemail`, `upassword`) VALUES
(1, 'John Doe', 'New York', '1234567890', '123 Main St, New York, NY', '10001', 'john.doe@example.com', 'password123'),
(2, 'Jane Smith', 'Los Angeles', '0987654321', '456 Elm St, Los Angeles, CA', '90001', 'jane.smith@example.com', ''),
(3, 'Alice Johnson', 'Chicago', '5556667777', '789 Oak St, Chicago, IL', '60601', 'alice.johnson@example.com', 'wee'),
(4, 'Bob Brown', 'Houston', '4445556666', '101 Pine St, Houston, TX', '77001', 'bob.brown@example.com', 'password101'),
(5, 'Charlie Davis', 'Phoenix', '3334445555', '202 Cedar St, Phoenix, AZ', '85001', 'charlie.davis@example.com', 'password202'),
(6, 'damini', 'shipur', '345678976543', 'shirpur', '425427', 'charlie.davis@example.com', 'password202');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `deliveryperson`
--
ALTER TABLE `deliveryperson`
  ADD PRIMARY KEY (`dpid`);

--
-- Indexes for table `fuelstation`
--
ALTER TABLE `fuelstation`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `bid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7418;

--
-- AUTO_INCREMENT for table `deliveryperson`
--
ALTER TABLE `deliveryperson`
  MODIFY `dpid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `fuelstation`
--
ALTER TABLE `fuelstation`
  MODIFY `fid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
