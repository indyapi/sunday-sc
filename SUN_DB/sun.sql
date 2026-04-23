-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2022 at 02:18 PM
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
-- Database: `sun`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `ActorID` int(3) NOT NULL,
  `ActorSkin` int(12) NOT NULL,
  `ActorX` float DEFAULT NULL,
  `ActorY` float DEFAULT NULL,
  `ActorZ` float DEFAULT NULL,
  `ActorA` float DEFAULT NULL,
  `ActorMessage` varchar(64) NOT NULL,
  `ActorWorld` int(12) NOT NULL DEFAULT 0,
  `actorAnimation` int(12) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `arrestpoints`
--

CREATE TABLE `arrestpoints` (
  `arrestID` int(11) NOT NULL,
  `arrestX` float NOT NULL,
  `arrestY` float NOT NULL,
  `arrestZ` float NOT NULL,
  `arrestInterior` int(11) NOT NULL,
  `arrestWorld` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `arrestpoints`
--

INSERT INTO `arrestpoints` (`arrestID`, `arrestX`, `arrestY`, `arrestZ`, `arrestInterior`, `arrestWorld`) VALUES
(2, 251.086, 118.537, 1003.22, 10, 7006);

-- --------------------------------------------------------

--
-- Table structure for table `atm`
--

CREATE TABLE `atm` (
  `atmID` int(11) NOT NULL,
  `atmX` float NOT NULL,
  `atmY` float NOT NULL,
  `atmZ` float NOT NULL,
  `atmA` float NOT NULL,
  `atmInterior` int(11) NOT NULL,
  `atmWorld` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `atm`
--

INSERT INTO `atm` (`atmID`, `atmX`, `atmY`, `atmZ`, `atmA`, `atmInterior`, `atmWorld`) VALUES
(1, 2313.53, -17.2283, 26.7496, 179.929, 0, 7011);

-- --------------------------------------------------------

--
-- Table structure for table `callcar`
--

CREATE TABLE `callcar` (
  `callcarID` int(11) NOT NULL,
  `callcarX` float NOT NULL,
  `callcarY` float NOT NULL,
  `callcarZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `callcar`
--

INSERT INTO `callcar` (`callcarID`, `callcarX`, `callcarY`, `callcarZ`) VALUES
(1, 870.248, -1658.78, 13.5469),
(2, 1552.7, -2209.34, 13.5547),
(3, 1546.2, -2209.71, 13.5547),
(6, 2139.09, 1398.79, 10.8125),
(7, 2139.01, 1407.98, 10.8203),
(8, 2126.4, 1407.92, 10.8203),
(9, 2126.41, 1398.78, 10.8125),
(10, 2461.74, 1336.18, 10.8203),
(11, 2455.22, 1336.16, 10.8203),
(12, -2571.23, 622.292, 14.4531),
(13, -2570.87, 632.726, 14.4592),
(14, -1990.28, 243.256, 35.1719),
(15, -1990.2, 252.515, 35.1719),
(16, 879.38, -1658.55, 13.5469),
(17, 662.221, -1532.31, 15.0208);

-- --------------------------------------------------------

--
-- Table structure for table `carshop`
--

CREATE TABLE `carshop` (
  `carshopID` int(11) NOT NULL,
  `carshopModel` smallint(3) NOT NULL DEFAULT 0,
  `carshopPrice` int(11) NOT NULL DEFAULT 0,
  `carshopType` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `carshop`
--

INSERT INTO `carshop` (`carshopID`, `carshopModel`, `carshopPrice`, `carshopType`) VALUES
(1, 402, 20000, 4);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `ID` int(12) DEFAULT 0,
  `contactID` int(12) NOT NULL,
  `contactName` varchar(32) DEFAULT NULL,
  `contactNumber` int(12) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `entrances`
--

CREATE TABLE `entrances` (
  `entranceID` int(12) NOT NULL,
  `entranceName` varchar(32) DEFAULT NULL,
  `entranceIcon` int(12) DEFAULT 0,
  `entrancePosX` float DEFAULT 0,
  `entrancePosY` float DEFAULT 0,
  `entrancePosZ` float DEFAULT 0,
  `entrancePosA` float DEFAULT 0,
  `entranceIntX` float DEFAULT 0,
  `entranceIntY` float DEFAULT 0,
  `entranceIntZ` float DEFAULT 0,
  `entranceIntA` float DEFAULT 0,
  `entranceInterior` int(12) DEFAULT 0,
  `entranceExterior` int(12) DEFAULT 0,
  `entranceExteriorVW` int(12) DEFAULT 0,
  `entranceType` int(12) DEFAULT 0,
  `entrancePass` smallint(4) DEFAULT 0,
  `entranceLocked` int(12) DEFAULT 0,
  `entranceCustom` int(4) DEFAULT 0,
  `entranceWorld` int(12) DEFAULT 0,
  `entranceFaction` int(11) DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `entrances`
--

INSERT INTO `entrances` (`entranceID`, `entranceName`, `entranceIcon`, `entrancePosX`, `entrancePosY`, `entrancePosZ`, `entrancePosA`, `entranceIntX`, `entranceIntY`, `entranceIntZ`, `entranceIntA`, `entranceInterior`, `entranceExterior`, `entranceExteriorVW`, `entranceType`, `entrancePass`, `entranceLocked`, `entranceCustom`, `entranceWorld`, `entranceFaction`) VALUES
(1, 'สถานีตำรวจ', 0, 1555.31, -1675.63, 16.1953, 267.363, 1562.05, -1674.18, 19.853, 81.8565, 0, 0, 0, 0, 0, 0, 0, 7001, -1),
(2, 'โรงพยาบาล', 0, 606.585, -1460.72, 14.4159, 84.6719, 1402.58, -26.306, 1000.86, 175.926, 0, 0, 0, 0, 0, 0, 0, 7002, -1),
(3, 'อพาร์ทเมตน์คุณซัน', 31, 1420.93, -1180.18, 25.9922, 179.796, 1429.2, -1221.28, 152.818, 82.3487, 0, 0, 0, 0, 0, 0, 0, 7003, -1),
(4, 'ร้านเปลี่ยนสกิน', 0, 1025.61, -1770.76, 13.5469, 51.5788, 161.476, -97.1106, 1001.8, 190.387, 18, 0, 0, 0, 0, 0, 0, 7004, -1),
(6, 'เรือนจำกลาง', 0, 1798.06, -1578.64, 14.0898, 104.411, 246.4, 107.614, 1003.22, 177.849, 10, 0, 0, 0, 0, 0, 0, 7006, -1),
(7, 'ทางเข้าในเรือนจำ', 0, 259.151, 108.125, 1003.22, 268.325, 1772.3, -1548.22, 9.9063, 213.828, 0, 10, 7006, 0, 0, 0, 0, 7007, 0),
(8, 'บ้านหรูริมเขา', 0, 1123.25, -2036.95, 69.8935, 85.0675, 1700.54, -1667.76, 20.2188, 85.377, 18, 0, 0, 0, 0, 0, 0, 7008, -1),
(10, 'ทางเข้า [เยี่ยมผู้ต้องขัง]', 0, 1824.06, -1538.01, 13.5469, 74.4379, 1822.89, -1537.78, 13.5326, 258.447, 0, 0, 0, 0, 0, 0, 0, 7010, -1),
(11, 'ธนาคาร', 0, 1481, -1772.29, 18.7958, 176.464, 2304.69, -16.1739, 26.7422, 92.1933, 0, 0, 0, 2, 0, 0, 0, 7011, -1),
(13, 'ห้องขังเดี่ยว', 0, 1754.12, -1582.26, 12.5135, 171.669, 1753.95, -1583.19, 12.6853, 351.586, 0, 0, 7007, 0, 0, 0, 0, 7013, 0);

-- --------------------------------------------------------

--
-- Table structure for table `factions`
--

CREATE TABLE `factions` (
  `factionID` int(12) NOT NULL,
  `factionName` varchar(32) DEFAULT NULL,
  `factionColor` int(12) DEFAULT 0,
  `factionType` int(12) DEFAULT 0,
  `factionRanks` int(12) DEFAULT 0,
  `factionLockerX` float DEFAULT 0,
  `factionLockerY` float DEFAULT 0,
  `factionLockerZ` float DEFAULT 0,
  `factionLockerInt` int(12) DEFAULT 0,
  `factionLockerWorld` int(12) DEFAULT 0,
  `factionWeapon1` int(12) DEFAULT 0,
  `factionAmmo1` int(12) DEFAULT 0,
  `factionWeapon2` int(12) DEFAULT 0,
  `factionAmmo2` int(12) DEFAULT 0,
  `factionWeapon3` int(12) DEFAULT 0,
  `factionAmmo3` int(12) DEFAULT 0,
  `factionWeapon4` int(12) DEFAULT 0,
  `factionAmmo4` int(12) DEFAULT 0,
  `factionWeapon5` int(12) DEFAULT 0,
  `factionAmmo5` int(12) DEFAULT 0,
  `factionWeapon6` int(12) DEFAULT 0,
  `factionAmmo6` int(12) DEFAULT 0,
  `factionWeapon7` int(12) DEFAULT 0,
  `factionAmmo7` int(12) DEFAULT 0,
  `factionWeapon8` int(12) DEFAULT 0,
  `factionAmmo8` int(12) DEFAULT 0,
  `factionWeapon9` int(12) DEFAULT 0,
  `factionAmmo9` int(12) DEFAULT 0,
  `factionWeapon10` int(12) DEFAULT 0,
  `factionAmmo10` int(12) DEFAULT 0,
  `factionRank1` varchar(32) DEFAULT NULL,
  `factionRank2` varchar(32) DEFAULT NULL,
  `factionRank3` varchar(32) DEFAULT NULL,
  `factionRank4` varchar(32) DEFAULT NULL,
  `factionRank5` varchar(32) DEFAULT NULL,
  `factionRank6` varchar(32) DEFAULT NULL,
  `factionRank7` varchar(32) DEFAULT NULL,
  `factionRank8` varchar(32) DEFAULT NULL,
  `factionRank9` varchar(32) DEFAULT NULL,
  `factionRank10` varchar(32) DEFAULT NULL,
  `factionRank11` varchar(32) DEFAULT NULL,
  `factionRank12` varchar(32) DEFAULT NULL,
  `factionRank13` varchar(32) DEFAULT NULL,
  `factionRank14` varchar(32) DEFAULT NULL,
  `factionRank15` varchar(32) DEFAULT NULL,
  `factionSkin1` int(12) DEFAULT 0,
  `factionSkin2` int(12) DEFAULT 0,
  `factionSkin3` int(12) DEFAULT 0,
  `factionSkin4` int(12) DEFAULT 0,
  `factionSkin5` int(12) DEFAULT 0,
  `factionSkin6` int(12) DEFAULT 0,
  `factionSkin7` int(12) DEFAULT 0,
  `factionSkin8` int(12) DEFAULT 0,
  `SpawnX` float DEFAULT NULL,
  `SpawnY` float DEFAULT NULL,
  `SpawnZ` float DEFAULT NULL,
  `SpawnInterior` int(11) DEFAULT NULL,
  `SpawnVW` int(1) DEFAULT NULL,
  `factionEntrance` int(11) DEFAULT 0,
  `fLocker0` int(12) NOT NULL DEFAULT 0,
  `fLocker1` int(12) NOT NULL DEFAULT 0,
  `fLocker2` int(12) NOT NULL DEFAULT 0,
  `fLocker3` int(12) NOT NULL DEFAULT 0,
  `fLocker4` int(12) NOT NULL DEFAULT 0,
  `fLocker5` int(12) NOT NULL DEFAULT 0,
  `fLocker6` int(12) NOT NULL DEFAULT 0,
  `fLocker7` int(12) NOT NULL DEFAULT 0,
  `fLocker8` int(12) NOT NULL DEFAULT 0,
  `fLocker9` int(12) NOT NULL DEFAULT 0,
  `fLocker10` int(12) NOT NULL DEFAULT 0,
  `factionMember` int(12) NOT NULL DEFAULT 0,
  `factionMax` int(12) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `factions`
--

INSERT INTO `factions` (`factionID`, `factionName`, `factionColor`, `factionType`, `factionRanks`, `factionLockerX`, `factionLockerY`, `factionLockerZ`, `factionLockerInt`, `factionLockerWorld`, `factionWeapon1`, `factionAmmo1`, `factionWeapon2`, `factionAmmo2`, `factionWeapon3`, `factionAmmo3`, `factionWeapon4`, `factionAmmo4`, `factionWeapon5`, `factionAmmo5`, `factionWeapon6`, `factionAmmo6`, `factionWeapon7`, `factionAmmo7`, `factionWeapon8`, `factionAmmo8`, `factionWeapon9`, `factionAmmo9`, `factionWeapon10`, `factionAmmo10`, `factionRank1`, `factionRank2`, `factionRank3`, `factionRank4`, `factionRank5`, `factionRank6`, `factionRank7`, `factionRank8`, `factionRank9`, `factionRank10`, `factionRank11`, `factionRank12`, `factionRank13`, `factionRank14`, `factionRank15`, `factionSkin1`, `factionSkin2`, `factionSkin3`, `factionSkin4`, `factionSkin5`, `factionSkin6`, `factionSkin7`, `factionSkin8`, `SpawnX`, `SpawnY`, `SpawnZ`, `SpawnInterior`, `SpawnVW`, `factionEntrance`, `fLocker0`, `fLocker1`, `fLocker2`, `fLocker3`, `fLocker4`, `fLocker5`, `fLocker6`, `fLocker7`, `fLocker8`, `fLocker9`, `fLocker10`, `factionMember`, `factionMax`) VALUES
(3, 'POLICE', 65535, 1, 5, 1570.18, -1690.08, 19.8381, 0, 7001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', 'Rank 8', 'Rank 9', 'Rank 10', 'Rank 11', 'Rank 12', 'Rank 13', 'Rank 14', 'Rank 15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5),
(4, 'MEDIC', -4800001, 3, 5, 1402.5, -41.3697, 1000.86, 0, 7002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', 'Rank 8', 'Rank 9', 'Rank 10', 'Rank 11', 'Rank 12', 'Rank 13', 'Rank 14', 'Rank 15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5),
(5, 'MEC', -256, 6, 5, 1880, -1389.69, 14.3974, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', 'Rank 8', 'Rank 9', 'Rank 10', 'Rank 11', 'Rank 12', 'Rank 13', 'Rank 14', 'Rank 15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5),
(6, 'CHEF', -256, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', 'Rank 8', 'Rank 9', 'Rank 10', 'Rank 11', 'Rank 12', 'Rank 13', 'Rank 14', 'Rank 15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5),
(7, 'GOV', -256, 4, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', 'Rank 8', 'Rank 9', 'Rank 10', 'Rank 11', 'Rank 12', 'Rank 13', 'Rank 14', 'Rank 15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `gangwarzone`
--

CREATE TABLE `gangwarzone` (
  `ID` int(12) NOT NULL,
  `GangWarIs` int(12) DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `garages`
--

CREATE TABLE `garages` (
  `garageID` int(11) NOT NULL,
  `garageX` float NOT NULL,
  `garageY` float NOT NULL,
  `garageZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `garages`
--

INSERT INTO `garages` (`garageID`, `garageX`, `garageY`, `garageZ`) VALUES
(1, 1866.07, -1404.96, 14.639);

-- --------------------------------------------------------

--
-- Table structure for table `gps`
--

CREATE TABLE `gps` (
  `gpsID` int(11) NOT NULL,
  `gpsName` varchar(32) DEFAULT NULL,
  `gpsX` float NOT NULL,
  `gpsY` float NOT NULL,
  `gpsZ` float NOT NULL,
  `gpsType` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `gps`
--

INSERT INTO `gps` (`gpsID`, `gpsName`, `gpsX`, `gpsY`, `gpsZ`, `gpsType`) VALUES
(9, 'งานเก็บหอย', 562.823, -1891.92, 3.4606, 2),
(11, 'งานฆ่าวัว', -925.629, -526.547, 25.9536, 2),
(12, 'จุดแร่เนื้อวัว', -955.501, -503.613, 27.4752, 2),
(13, 'งานฆ่าไก่', -1387.62, -1504.48, 101.975, 2),
(14, 'จุดแร่เนื้อไก่', -1336.28, -1452.43, 103.675, 2),
(19, 'งานขุดเหมือง', 671.81, 911.212, -40.439, 2),
(21, 'งานเก็บแอปเปิ้ล', -1103.37, -1270.89, 129.219, 2),
(22, 'งานตัดไม้', -512.394, -154.386, 73.9965, 2),
(23, 'จุดแปรรูปไม้', -533.552, -176.756, 78.4047, 2),
(39, 'แลกเงินแดง', 2485.07, -1464.71, 24.0189, 3),
(40, 'กัญชา', -1052.74, -1638.81, 76.3672, 3),
(41, 'โคเคน', 2846.23, 983.17, 10.75, 3),
(54, 'งานเก็บส้ม', 18.1541, -2620.41, 40.3684, 2),
(63, 'ร้านอาหาร1', 2105.5, -1806.44, 13.5547, 1),
(65, 'ตลาดเซิฟเวอร์', 1129.2, -1413.13, 13.6115, 1),
(67, 'ร้านขายรถ', 557.3, -1258.3, 17.2422, 1),
(69, 'Home', 1902.06, 703.155, 10.8203, 1),
(70, 'งานจกปูน (NEW)', 1763.82, -1640.65, 14.4116, 3),
(72, 'สอบใบขับขี่', 1168.62, 1363.81, 10.8203, 1),
(73, 'ที่คราฟกาชาปองสายฟรี', -1476.29, 2562.86, 57.3074, 1),
(75, 'Label', 1862.02, -1380.97, 15.0482, 1),
(76, 'สถานีตำรวจ', 1540.33, -1676.01, 13.5504, 1),
(77, 'โรงพยาบาล', 614.612, -1461.55, 14.4506, 1),
(78, 'อู่ซ่อมรถ', 1858.68, -1378.11, 13.6764, 1),
(79, 'จุดเกิดเด็กใหม่', 1655.75, -2286.41, -1.2127, 1),
(82, 'จุดเปิดสตอรี่', 1156.33, -2015.25, 69.0078, 1),
(83, 'งานเก็บกระดูกผี', 815.478, -1100.97, 25.3716, 2),
(84, 'ที่ท่องเที่ยว', 953.625, -0.0411, 92.0227, 1),
(85, 'งานเก็บฟักทอง', 1485.92, -66.9137, 20.2868, 2),
(86, 'จุดแพ็คฟักทอง', 1544.86, -32.5369, 21.2891, 2),
(87, 'งานเก็บกล้วย', 1093.86, -305.641, 73.5562, 2),
(88, 'งานเก็บทุเรียน', 1912.96, -486.243, 18.0368, 2),
(89, 'งานเก็บมะพร้าว', -356.606, -435.491, 7.9214, 2),
(90, 'เก็บทราย', -1.9377, 1366.11, 11.2425, 3),
(91, 'งานเก็บแมงกระพรุน', -768.828, -1911.36, 4.72, 2),
(92, 'งานเก็บรังผึ้ง', -2812.22, -1557.53, 140.649, 2),
(93, 'งานตกปลา', 2103.1, -103.684, 2.2942, 2),
(94, 'งานเก็บสมบัติ', 2907.97, -2061.03, 1.7778, 2),
(95, 'เลเบลใหม่', 2715.62, -2527.49, 13.6394, 1),
(96, 'โรงพยาบาลใหม่', 608.455, -1462.94, 14.4489, 1),
(99, 'ร้านเปลี่ยนสกิน ', 1029.65, -1773.03, 13.5506, 1),
(100, 'เรือนจำกลาง', 1826.66, -1538.5, 13.5469, 1),
(101, 'Garage [LS]', 1549.43, -2211.42, 13.5547, 4),
(103, 'Garage [LV]', 2120.67, 1403.13, 11.1328, 4),
(104, 'Garage [LV]', 2458.33, 1332.48, 10.8203, 4),
(105, 'Garage [SF]', -2567.76, 627.278, 14.4531, 4),
(106, 'Garage [SF]', -1986.42, 248.108, 35.1719, 4),
(107, 'ปั้มน้ำมัน [SF]', -2021.24, 157.838, 28.6973, 5),
(108, 'ปั้มน้ำมัน [LS-SF]', -1614.58, -2724.49, 48.5391, 5),
(109, 'จุดเช่ารถ [LS]', 1220.22, -1413.35, 13.3247, 6),
(110, 'จุดเช่ารถ [LS]', 1090.96, -1776.71, 13.3399, 6),
(111, 'Garage [LS]', 874.709, -1662.07, 13.5469, 4),
(112, 'จุดเช่ารถ [LS]', 1604.28, -1015.2, 23.9063, 6),
(113, 'จุดเช่ารถ [LV]', 1858.53, 2257.03, 10.8203, 6),
(114, 'จุดเช่ารถ [LV]', 2610.55, 2285.65, 10.8203, 6),
(115, 'จุดเช่ารถ [LV]', 1701.88, 1302.22, 10.8279, 6),
(118, 'บ้านหรูริมเขา', 1131.43, -2037.06, 69.0078, 1),
(119, 'จุดเช่ารถ [SF]', -2262.03, 168.335, 35.1641, 6),
(120, 'จุดเช่ารถ [SF]', -2464.05, 735.514, 35.0156, 6),
(121, 'ปั้มน้ำมัน [SF]', -2400.47, 958.193, 45.3016, 5),
(122, 'ปั้มน้ำมัน [SF]', -1659.35, 415.283, 7.1797, 5),
(123, 'จุดเช่ารถ [SF]', -1820.77, 160.352, 15.1172, 6),
(124, 'ปั้มน้ำมัน [LS]', -95.6962, -1159.1, 2.0788, 5),
(125, 'ปั้มน้ำมัน [LV]', 600.697, 1686.97, 6.9922, 5),
(126, 'ปั้มน้ำมัน [LV]', -1319.92, 2676.49, 50.0643, 5),
(127, 'ปั้มน้ำมัน [LV]', 2200.17, 2463.95, 10.8203, 5),
(128, 'ปั้มน้ำมัน [LV]', 1605.69, 2188.77, 10.8203, 5);

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `houseID` int(12) NOT NULL,
  `houseOwner` int(12) DEFAULT 0,
  `housePrice` int(12) DEFAULT 0,
  `houseAddress` varchar(32) DEFAULT NULL,
  `housePosX` float DEFAULT 0,
  `housePosY` float DEFAULT 0,
  `housePosZ` float DEFAULT 0,
  `housePosA` float DEFAULT 0,
  `houseIntX` float DEFAULT 0,
  `houseIntY` float DEFAULT 0,
  `houseIntZ` float DEFAULT 0,
  `houseIntA` float DEFAULT 0,
  `houseInterior` int(12) DEFAULT 0,
  `houseExterior` int(12) DEFAULT 0,
  `houseExteriorVW` int(12) DEFAULT 0,
  `houseLocked` int(4) DEFAULT 0,
  `houseWeapon1` int(12) DEFAULT 0,
  `houseAmmo1` int(12) DEFAULT 0,
  `houseWeapon2` int(12) DEFAULT 0,
  `houseAmmo2` int(12) DEFAULT 0,
  `houseWeapon3` int(12) DEFAULT 0,
  `houseAmmo3` int(12) DEFAULT 0,
  `houseWeapon4` int(12) DEFAULT 0,
  `houseAmmo4` int(12) DEFAULT 0,
  `houseWeapon5` int(12) DEFAULT 0,
  `houseAmmo5` int(12) DEFAULT 0,
  `houseWeapon6` int(12) DEFAULT 0,
  `houseAmmo6` int(12) DEFAULT 0,
  `houseWeapon7` int(12) DEFAULT 0,
  `houseAmmo7` int(12) DEFAULT 0,
  `houseWeapon8` int(12) DEFAULT 0,
  `houseAmmo8` int(12) DEFAULT 0,
  `houseWeapon9` int(12) DEFAULT 0,
  `houseAmmo9` int(12) DEFAULT 0,
  `houseWeapon10` int(12) DEFAULT 0,
  `houseAmmo10` int(12) DEFAULT 0,
  `houseMoney` int(12) DEFAULT 0,
  `houseRedMoney` int(12) NOT NULL DEFAULT 0,
  `houseCannabis` int(12) NOT NULL DEFAULT 0,
  `houseCocain` int(12) NOT NULL DEFAULT 0,
  `housePoon` int(12) NOT NULL DEFAULT 0,
  `houseDrug` int(12) NOT NULL DEFAULT 0,
  `housePackWeed` int(12) NOT NULL DEFAULT 0,
  `housePackCocain` int(12) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `icu`
--

CREATE TABLE `icu` (
  `icuID` int(11) NOT NULL,
  `icuX` float NOT NULL,
  `icuY` float NOT NULL,
  `icuZ` float NOT NULL,
  `icuA` float NOT NULL,
  `icuInterior` int(11) NOT NULL,
  `icuWorld` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `icu`
--

INSERT INTO `icu` (`icuID`, `icuX`, `icuY`, `icuZ`, `icuA`, `icuInterior`, `icuWorld`) VALUES
(1, 1388.74, -42.0139, 1001.08, 180.312, 0, 7002);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `invID` int(12) NOT NULL,
  `invOwner` int(11) NOT NULL DEFAULT 0,
  `invItem` varchar(32) DEFAULT NULL,
  `invQuantity` int(12) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`invID`, `invOwner`, `invItem`, `invQuantity`) VALUES
(1, 1, 'น้ำเปล่า', 27),
(2, 1, 'พิซซ่า', 27),
(3, 1, 'มือถือ', 4),
(4, 3, 'น้ำเปล่า', 20),
(5, 3, 'พิซซ่า', 20),
(6, 3, 'มือถือ', 3),
(7, 1, 'หอย', 10),
(8, 3, 'หอย', 1),
(9, 1, 'กาชาปอง', 2),
(10, 3, 'กาชาปอง', 1),
(11, 61, 'น้ำเปล่า', 5),
(12, 61, 'พิซซ่า', 5),
(13, 61, 'มือถือ', 1),
(14, 2, 'น้ำเปล่า', 15),
(15, 2, 'พิซซ่า', 15),
(16, 2, 'มือถือ', 2),
(17, 4, 'น้ำเปล่า', 15),
(18, 4, 'พิซซ่า', 15),
(19, 4, 'มือถือ', 2),
(20, 5, 'น้ำเปล่า', 5),
(21, 5, 'พิซซ่า', 5),
(22, 5, 'มือถือ', 1),
(23, 6, 'น้ำเปล่า', 5),
(24, 6, 'พิซซ่า', 5),
(25, 6, 'มือถือ', 1),
(26, 1, 'กล่องซ่อม', 5),
(27, 1, 'ถังน้ำมัน', 10),
(28, 7, 'น้ำเปล่า', 5),
(29, 7, 'พิซซ่า', 5),
(30, 8, 'น้ำเปล่า', 5),
(31, 8, 'พิซซ่า', 5),
(33, 4, 'กาชาปอง', 1),
(34, 4, 'Katana', 1),
(35, 4, 'ปืนช็อตไฟฟ้า', 1),
(37, 2, 'กล่องซ่อม2', 5),
(38, 2, 'ยาเพิ่มเลือด', 50),
(39, 2, 'เสื้อเกราะ', 50),
(40, 1, 'กล่องซ่อมใหญ่', 9),
(41, 2, 'กาชาปอง', 1),
(42, 4, 'กระเป๋าติดหลัง', 1),
(43, 2, 'กล่องซ่อม', 50),
(44, 4, 'ผ้าปิดปาก', 1),
(45, 4, 'แว่นตา', 1),
(46, 4, 'กล่องซ่อมใหญ่', 5),
(47, 4, 'ปืนคู่', 1),
(48, 1, 'หมวกฮู้ดดำ', 1),
(49, 9, 'น้ำเปล่า', 5),
(50, 9, 'พิซซ่า', 5);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `playerID` int(11) NOT NULL,
  `playerName` varchar(24) NOT NULL,
  `playerPassword` char(129) NOT NULL,
  `playerRegDate` char(90) NOT NULL DEFAULT 'None',
  `playerGender` tinyint(2) NOT NULL DEFAULT 0,
  `playerBirthday` char(24) NOT NULL DEFAULT 'แก้ไข',
  `playerAdmin` tinyint(2) NOT NULL DEFAULT 0,
  `playerKills` mediumint(8) NOT NULL DEFAULT 0,
  `playerDeaths` mediumint(8) NOT NULL DEFAULT 0,
  `playerMoney` int(11) NOT NULL DEFAULT 0,
  `playerBank` int(11) NOT NULL DEFAULT 0,
  `playerRedMoney` int(11) NOT NULL DEFAULT 0,
  `playerLevel` smallint(3) NOT NULL DEFAULT 0,
  `playerExp` int(11) NOT NULL DEFAULT 0,
  `playerMinutes` tinyint(2) NOT NULL DEFAULT 0,
  `playerHours` int(11) NOT NULL DEFAULT 0,
  `playerPosX` float NOT NULL DEFAULT 0,
  `playerPosY` float NOT NULL DEFAULT 0,
  `playerPosZ` float NOT NULL DEFAULT 0,
  `playerPosA` float NOT NULL DEFAULT 0,
  `playerSkin` smallint(3) NOT NULL DEFAULT 0,
  `playerInterior` tinyint(2) NOT NULL DEFAULT 0,
  `playerWorld` int(11) NOT NULL DEFAULT 0,
  `playerTutorial` tinyint(1) NOT NULL DEFAULT 0,
  `playerSpawn` tinyint(1) NOT NULL DEFAULT 0,
  `playerThirsty` float NOT NULL DEFAULT 0,
  `playerHungry` float NOT NULL DEFAULT 0,
  `playerHealth` float NOT NULL DEFAULT 0,
  `playerInjured` tinyint(1) NOT NULL DEFAULT 0,
  `playerInjuredTime` int(11) NOT NULL DEFAULT 0,
  `playerFaction` tinyint(2) NOT NULL DEFAULT -1,
  `playerFactionRank` tinyint(2) NOT NULL DEFAULT 0,
  `playerPrisoned` tinyint(1) NOT NULL DEFAULT 0,
  `playerPrisonOut` smallint(3) NOT NULL DEFAULT 0,
  `playerJailTime` smallint(3) NOT NULL DEFAULT 0,
  `playerEntrance` int(11) NOT NULL DEFAULT -1,
  `playerMaxItem` int(11) NOT NULL DEFAULT 8,
  `playerItemAmount` int(11) NOT NULL DEFAULT 20,
  `playerPhone` int(11) NOT NULL DEFAULT 0,
  `playerVIP` tinyint(1) NOT NULL DEFAULT 0,
  `playerQuest` smallint(5) NOT NULL DEFAULT 0,
  `playerQuestProgress` int(11) NOT NULL DEFAULT 0,
  `playerBan` tinyint(1) NOT NULL DEFAULT 0,
  `playerBanReason` varchar(128) NOT NULL DEFAULT 'None',
  `playerWhitelist` int(12) NOT NULL DEFAULT 0,
  `GiftBox` int(12) NOT NULL DEFAULT 0,
  `Coin` int(12) NOT NULL DEFAULT 0,
  `Boombox` int(12) NOT NULL DEFAULT 0,
  `Chaya` int(12) NOT NULL DEFAULT 0,
  `ChayaText` varchar(256) NOT NULL,
  `pElegy` int(12) NOT NULL DEFAULT 0,
  `pFlash` int(12) NOT NULL DEFAULT 0,
  `pSultantuning` int(12) NOT NULL DEFAULT 0,
  `pJester` int(12) NOT NULL DEFAULT 0,
  `pPhoenix` int(12) NOT NULL DEFAULT 0,
  `pCheetah` int(12) NOT NULL DEFAULT 0,
  `pUranus` int(12) NOT NULL DEFAULT 0,
  `pSlamvantune` int(12) NOT NULL DEFAULT 0,
  `pStratum` int(12) NOT NULL DEFAULT 0,
  `pBroadway` int(12) NOT NULL DEFAULT 0,
  `pRemingtontune` int(12) NOT NULL DEFAULT 0,
  `pSafeRedMoney` int(12) NOT NULL DEFAULT 0,
  `pSafePassword` int(12) NOT NULL DEFAULT 0,
  `pSafeMoney` int(12) NOT NULL DEFAULT 0,
  `pSafeKetamine` int(12) NOT NULL DEFAULT 0,
  `pSafeCannabis` int(12) NOT NULL DEFAULT 0,
  `pSafe` int(12) NOT NULL DEFAULT 0,
  `pPets0` int(12) NOT NULL DEFAULT 0,
  `pPets1` int(12) NOT NULL DEFAULT 0,
  `pPets2` int(12) NOT NULL DEFAULT 0,
  `pPets3` int(12) NOT NULL DEFAULT 0,
  `pChangePass` int(12) NOT NULL DEFAULT 0,
  `pChangeName` int(12) NOT NULL DEFAULT 0,
  `pSkate` int(12) NOT NULL DEFAULT 0,
  `pKatanaDamage` int(12) NOT NULL DEFAULT 0,
  `Camp` int(12) NOT NULL DEFAULT 0,
  `Siren` int(12) NOT NULL DEFAULT 0,
  `Cuffed` int(12) NOT NULL DEFAULT 0,
  `MudFire` int(12) NOT NULL DEFAULT 0,
  `CopPoints` int(12) NOT NULL DEFAULT 0,
  `MedicPoints` int(12) NOT NULL DEFAULT 0,
  `SkillCraft` int(12) NOT NULL DEFAULT 1,
  `ExpCraft` int(12) NOT NULL DEFAULT 0,
  `Materials` int(12) NOT NULL DEFAULT 0,
  `Irons` int(12) NOT NULL DEFAULT 0,
  `Woods` int(12) NOT NULL DEFAULT 0,
  `MarryOn` int(12) NOT NULL DEFAULT 0,
  `Wornz` int(12) NOT NULL DEFAULT 0,
  `pCocain` int(12) NOT NULL DEFAULT 0,
  `pKetamine` int(12) NOT NULL DEFAULT 0,
  `pCocainPack` int(12) NOT NULL DEFAULT 0,
  `pPoon` int(12) NOT NULL DEFAULT 0,
  `Daily` int(11) NOT NULL DEFAULT 0,
  `Sleep` int(11) NOT NULL DEFAULT 0,
  `Fixcar` int(11) NOT NULL DEFAULT 0,
  `RunBar` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`playerID`, `playerName`, `playerPassword`, `playerRegDate`, `playerGender`, `playerBirthday`, `playerAdmin`, `playerKills`, `playerDeaths`, `playerMoney`, `playerBank`, `playerRedMoney`, `playerLevel`, `playerExp`, `playerMinutes`, `playerHours`, `playerPosX`, `playerPosY`, `playerPosZ`, `playerPosA`, `playerSkin`, `playerInterior`, `playerWorld`, `playerTutorial`, `playerSpawn`, `playerThirsty`, `playerHungry`, `playerHealth`, `playerInjured`, `playerInjuredTime`, `playerFaction`, `playerFactionRank`, `playerPrisoned`, `playerPrisonOut`, `playerJailTime`, `playerEntrance`, `playerMaxItem`, `playerItemAmount`, `playerPhone`, `playerVIP`, `playerQuest`, `playerQuestProgress`, `playerBan`, `playerBanReason`, `playerWhitelist`, `GiftBox`, `Coin`, `Boombox`, `Chaya`, `ChayaText`, `pElegy`, `pFlash`, `pSultantuning`, `pJester`, `pPhoenix`, `pCheetah`, `pUranus`, `pSlamvantune`, `pStratum`, `pBroadway`, `pRemingtontune`, `pSafeRedMoney`, `pSafePassword`, `pSafeMoney`, `pSafeKetamine`, `pSafeCannabis`, `pSafe`, `pPets0`, `pPets1`, `pPets2`, `pPets3`, `pChangePass`, `pChangeName`, `pSkate`, `pKatanaDamage`, `Camp`, `Siren`, `Cuffed`, `MudFire`, `CopPoints`, `MedicPoints`, `SkillCraft`, `ExpCraft`, `Materials`, `Irons`, `Woods`, `MarryOn`, `Wornz`, `pCocain`, `pKetamine`, `pCocainPack`, `pPoon`, `Daily`, `Sleep`, `Fixcar`, `RunBar`) VALUES
(1, 'SUNDAY', 'C79D3DCEE7087EF9DD416A877F62C2C009EF3AEEF8996E71082ADB3A81EDEBCAEBDE5B15E10E6EB326227ADAEA3AADE28F6C9362899E511513C44909A3028F3A', '13-07-2022 14:34:21', 1, '01/01/2002', 127, 0, 0, 2390, 8000, 0, 1, 15, 56, 8, 1872.84, -1375.48, 14.102, 252.828, 0, 0, 0, 1, 0, 60, 60, 20, 0, 0, 4, 5, 1, 0, 0, -1, 30, 50, 0, 4, 0, 0, 0, 'None', 1, 1, 100, 65535, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(2, 'ADMIN_GIEX2', 'E02A13C2F71B7345231CED7C0D53FFA391E862430ED3086322B27396E0B9CC86C36078D31E74394B17334001987AB5EC2A483412C189746E849A43D3C0668730', '13-07-2022 14:35:01', 1, '10/4/1997', 127, 0, 0, 21250, 4000, 0, 1, 0, 38, 2, 2173.37, -1553.23, 1.93266, 162.876, 120, 0, 0, 1, 0, 10, 10, 100, 0, 0, 5, 5, 0, 0, 0, -1, 8, 50, 7684, 0, 0, 1, 0, 'None', 0, 1, 200, 65535, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(3, 'Zero_Kname', '0A7B36C131D638998F26EDC9D066CF21773BCBC62869B2D9A79D2A44C59029F257595A277B983D767DFE3E90CE27DF7C01E663C7BACC07FA5F6695B714765650', '13-07-2022 14:45:33', 1, '1/1/1990', 0, 0, 0, 5000, 0, 0, 1, 0, 1, 0, 2308.06, 1393.65, 42.8203, 269.008, 264, 0, 0, 1, 0, 100, 100, 100, 0, 0, -1, 0, 0, 0, 0, -1, 8, 50, 806235, 0, 0, 0, 0, 'None', 0, 0, 0, 65535, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'EvicwareUi', '6B4DCA031C4329A9794423A1A85CFA26E7A0EAC6081BF0CBD5401D7BDD3ABDD046EC90C4E542068C6285958968E545076479048D13290FA87FEA315B74A4663F', '13-07-2022 17:52:52', 1, '9/9/1999', 127, 0, 0, 5031400, 2000, 0, 82, 0, 17, 2, 1756.76, -1579.61, 12.0223, 314.837, 171, 0, 0, 1, 0, 60, 60, 100, 0, 0, 3, 5, 0, 0, 0, 13, 22, 50, 5755, 4, 0, 0, 0, 'None', 1, 1, 100, 65535, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 'Al_Vis', 'C5F5ADF620B4B6FA3B8C6F7920896A1B7EB9DF35D9968124726E3BD38B92FE0160090202DB55A7C00A1796D3473B66A563C3D2C4435E10C3FD670FE62D7727F6', '13-07-2022 18:10:20', 1, '17/04/2002', 0, 0, 0, 5000, 0, 0, 1, 0, 0, 0, 0, 0, -59.666, 0, 264, 0, 0, 1, 0, 100, 100, 100, 0, 0, -1, 0, 0, 0, 0, -1, 8, 50, 606140, 0, 0, 0, 0, 'None', 0, 0, 0, 65535, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 'Dismo_Redofstar', '2C0EA4B50DD0F6271BACDABF231DF8D4FBCE1FEE0DF2E8C0DB39FC521168C6249BBB5697F82A9A62780AF9C59506B536CD54A8864FB56EC1CA41EB95C48FEA47', '13-07-2022 18:32:42', 1, '8/4/2003', 0, 0, 0, 5000, 0, 0, 1, 0, 0, 0, 0, 0, -18.3922, 0, 264, 0, 0, 1, 0, 100, 100, 100, 0, 0, -1, 0, 0, 0, 0, -1, 8, 50, 643002, 0, 0, 0, 0, 'None', 0, 0, 0, 65535, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 'Potare', 'C5F5ADF620B4B6FA3B8C6F7920896A1B7EB9DF35D9968124726E3BD38B92FE0160090202DB55A7C00A1796D3473B66A563C3D2C4435E10C3FD670FE62D7727F6', '13-07-2022 19:18:18', 1, '17/04/2002', 0, 0, 0, 5000, 0, 0, 1, 0, 0, 0, 0, 0, -66.6822, 0, 264, 0, 0, 1, 0, 100, 100, 100, 0, 0, -1, 0, 0, 0, 0, -1, 8, 50, 6268, 0, 0, 0, 0, 'None', 0, 0, 0, 65535, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 'Evicware', '6B4DCA031C4329A9794423A1A85CFA26E7A0EAC6081BF0CBD5401D7BDD3ABDD046EC90C4E542068C6285958968E545076479048D13290FA87FEA315B74A4663F', '13-07-2022 19:21:48', 1, '9/9/1999', 0, 0, 0, 5000, 0, 0, 1, 0, 0, 0, 0, 0, -8.74208, 0, 264, 0, 0, 1, 0, 100, 100, 100, 0, 0, -1, 0, 0, 0, 0, -1, 8, 50, 1211, 0, 0, 0, 0, 'None', 0, 0, 0, 65535, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 'FosSil', 'FD9D94340DBD72C11B37EBB0D2A19B4D05E00FD78E4E2CE8923B9EA3A54E900DF181CFB112A8A73228D1F3551680E2AD9701A4FCFB248FA7FA77B95180628BB2', '14-07-2022 16:10:24', 1, '1/1/1991', 0, 0, 0, 5000, 0, 0, 1, 0, 0, 0, 0, 0, 0.276483, 0, 264, 0, 0, 1, 0, 100, 100, 100, 0, 0, -1, 0, 0, 0, 0, -1, 8, 50, 4911, 0, 0, 0, 0, 'None', 0, 0, 0, 65535, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pumps`
--

CREATE TABLE `pumps` (
  `pumpID` int(11) NOT NULL,
  `pumpX` float NOT NULL,
  `pumpY` float NOT NULL,
  `pumpZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `pumps`
--

INSERT INTO `pumps` (`pumpID`, `pumpX`, `pumpY`, `pumpZ`) VALUES
(1, 1943.26, -1772.82, 13.3906),
(2, 1940.32, -1772.77, 13.3906),
(3, 1873.1, -1373.65, 14.3771);

-- --------------------------------------------------------

--
-- Table structure for table `safezonedata`
--

CREATE TABLE `safezonedata` (
  `ID` int(11) NOT NULL,
  `szPosX` float NOT NULL,
  `szPosY` float NOT NULL,
  `szPosZ` float NOT NULL,
  `szSize` int(11) NOT NULL DEFAULT 200
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `safezonedata`
--

INSERT INTO `safezonedata` (`ID`, `szPosX`, `szPosY`, `szPosZ`, `szSize`) VALUES
(1, 606.698, -1460.91, 14.4188, 5);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `shopID` int(11) NOT NULL,
  `shopX` float NOT NULL,
  `shopY` float NOT NULL,
  `shopZ` float NOT NULL,
  `shopInterior` int(11) NOT NULL,
  `shopWorld` int(11) NOT NULL,
  `shopType` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`shopID`, `shopX`, `shopY`, `shopZ`, `shopInterior`, `shopWorld`, `shopType`) VALUES
(4, 1572.57, -1691.21, 19.8381, 0, 7001, 5),
(5, 1397.14, -30.5312, 1000.86, 0, 7002, 6);

-- --------------------------------------------------------

--
-- Table structure for table `vehiclegang`
--

CREATE TABLE `vehiclegang` (
  `ID` int(11) NOT NULL DEFAULT 0,
  `bPosX` float NOT NULL,
  `bPosY` float NOT NULL,
  `bPosZ` float NOT NULL,
  `Leader` int(11) NOT NULL DEFAULT 0,
  `Slot1` int(12) NOT NULL DEFAULT 0,
  `Slot2` int(12) NOT NULL DEFAULT 0,
  `Slot3` int(12) NOT NULL DEFAULT 0,
  `Slot4` int(12) NOT NULL DEFAULT 0,
  `Slot5` int(12) NOT NULL DEFAULT 0,
  `Slot6` int(12) NOT NULL DEFAULT 0,
  `Slot7` int(12) NOT NULL DEFAULT 0,
  `Slot8` int(12) NOT NULL DEFAULT 0,
  `Slot9` int(12) NOT NULL DEFAULT 0,
  `Slot10` int(12) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `carID` int(10) NOT NULL,
  `carOwnerID` int(10) DEFAULT 0,
  `carOwner` varchar(24) DEFAULT 'Nobody',
  `carModel` smallint(3) DEFAULT 0,
  `carPrice` int(10) DEFAULT 0,
  `carTickets` int(10) DEFAULT 0,
  `carLocked` tinyint(1) DEFAULT 0,
  `carPlate` varchar(32) DEFAULT 'None',
  `carFuel` float DEFAULT 0,
  `carHealth` float DEFAULT 1000,
  `carPosX` float DEFAULT 0,
  `carPosY` float DEFAULT 0,
  `carPosZ` float DEFAULT 0,
  `carPosA` float DEFAULT 0,
  `carColor1` smallint(3) DEFAULT 1,
  `carColor2` smallint(3) DEFAULT 1,
  `carPaintjob` tinyint(2) DEFAULT -1,
  `carInterior` tinyint(2) DEFAULT 0,
  `carWorld` int(10) DEFAULT 0,
  `carNeon` smallint(5) DEFAULT 0,
  `carNeonEnabled` tinyint(1) DEFAULT 0,
  `carTrunk` tinyint(1) DEFAULT 0,
  `carMod1` smallint(4) DEFAULT 0,
  `carMod2` smallint(4) DEFAULT 0,
  `carMod3` smallint(4) DEFAULT 0,
  `carMod4` smallint(4) DEFAULT 0,
  `carMod5` smallint(4) DEFAULT 0,
  `carMod6` smallint(4) DEFAULT 0,
  `carMod7` smallint(4) DEFAULT 0,
  `carMod8` smallint(4) DEFAULT 0,
  `carMod9` smallint(4) DEFAULT 0,
  `carMod10` smallint(4) DEFAULT 0,
  `carMod11` smallint(4) DEFAULT 0,
  `carMod12` smallint(4) DEFAULT 0,
  `carMod13` smallint(4) DEFAULT 0,
  `carMod14` smallint(4) DEFAULT 0,
  `carCash` int(10) DEFAULT 0,
  `carFaction` tinyint(2) DEFAULT -1,
  `carLevel` int(12) NOT NULL DEFAULT 0,
  `carTune` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`carID`, `carOwnerID`, `carOwner`, `carModel`, `carPrice`, `carTickets`, `carLocked`, `carPlate`, `carFuel`, `carHealth`, `carPosX`, `carPosY`, `carPosZ`, `carPosA`, `carColor1`, `carColor2`, `carPaintjob`, `carInterior`, `carWorld`, `carNeon`, `carNeonEnabled`, `carTrunk`, `carMod1`, `carMod2`, `carMod3`, `carMod4`, `carMod5`, `carMod6`, `carMod7`, `carMod8`, `carMod9`, `carMod10`, `carMod11`, `carMod12`, `carMod13`, `carMod14`, `carCash`, `carFaction`, `carLevel`, `carTune`) VALUES
(1, 1, 'SUNDAY', 402, 20000, 0, 0, 'None', 47, 994.79, 562.397, -1283.85, 17.0007, 0, 1, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`ActorID`);

--
-- Indexes for table `arrestpoints`
--
ALTER TABLE `arrestpoints`
  ADD PRIMARY KEY (`arrestID`);

--
-- Indexes for table `atm`
--
ALTER TABLE `atm`
  ADD PRIMARY KEY (`atmID`);

--
-- Indexes for table `callcar`
--
ALTER TABLE `callcar`
  ADD PRIMARY KEY (`callcarID`);

--
-- Indexes for table `carshop`
--
ALTER TABLE `carshop`
  ADD PRIMARY KEY (`carshopID`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contactID`);

--
-- Indexes for table `entrances`
--
ALTER TABLE `entrances`
  ADD PRIMARY KEY (`entranceID`);

--
-- Indexes for table `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`factionID`);

--
-- Indexes for table `gangwarzone`
--
ALTER TABLE `gangwarzone`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `garages`
--
ALTER TABLE `garages`
  ADD PRIMARY KEY (`garageID`);

--
-- Indexes for table `gps`
--
ALTER TABLE `gps`
  ADD PRIMARY KEY (`gpsID`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`houseID`);

--
-- Indexes for table `icu`
--
ALTER TABLE `icu`
  ADD PRIMARY KEY (`icuID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`invID`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`playerID`),
  ADD UNIQUE KEY `Username` (`playerName`);

--
-- Indexes for table `pumps`
--
ALTER TABLE `pumps`
  ADD PRIMARY KEY (`pumpID`);

--
-- Indexes for table `safezonedata`
--
ALTER TABLE `safezonedata`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`shopID`);

--
-- Indexes for table `vehiclegang`
--
ALTER TABLE `vehiclegang`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`carID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `ActorID` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `arrestpoints`
--
ALTER TABLE `arrestpoints`
  MODIFY `arrestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `atm`
--
ALTER TABLE `atm`
  MODIFY `atmID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `callcar`
--
ALTER TABLE `callcar`
  MODIFY `callcarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `carshop`
--
ALTER TABLE `carshop`
  MODIFY `carshopID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contactID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entrances`
--
ALTER TABLE `entrances`
  MODIFY `entranceID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `factionID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `garages`
--
ALTER TABLE `garages`
  MODIFY `garageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gps`
--
ALTER TABLE `gps`
  MODIFY `gpsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `houseID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `icu`
--
ALTER TABLE `icu`
  MODIFY `icuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `invID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `playerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pumps`
--
ALTER TABLE `pumps`
  MODIFY `pumpID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `shopID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `carID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
