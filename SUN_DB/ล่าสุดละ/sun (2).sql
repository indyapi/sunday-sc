-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2022 at 06:26 AM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sun`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE IF NOT EXISTS `actors` (
  `ActorID` int(3) NOT NULL,
  `ActorSkin` int(12) NOT NULL,
  `ActorX` float DEFAULT NULL,
  `ActorY` float DEFAULT NULL,
  `ActorZ` float DEFAULT NULL,
  `ActorA` float DEFAULT NULL,
  `ActorMessage` varchar(64) NOT NULL,
  `ActorWorld` int(12) NOT NULL DEFAULT '0',
  `actorAnimation` int(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `arrestpoints`
--

CREATE TABLE IF NOT EXISTS `arrestpoints` (
  `arrestID` int(11) NOT NULL,
  `arrestX` float NOT NULL,
  `arrestY` float NOT NULL,
  `arrestZ` float NOT NULL,
  `arrestInterior` int(11) NOT NULL,
  `arrestWorld` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=tis620;

--
-- Dumping data for table `arrestpoints`
--

INSERT INTO `arrestpoints` (`arrestID`, `arrestX`, `arrestY`, `arrestZ`, `arrestInterior`, `arrestWorld`) VALUES
(2, 251.086, 118.537, 1003.22, 10, 7006);

-- --------------------------------------------------------

--
-- Table structure for table `atm`
--

CREATE TABLE IF NOT EXISTS `atm` (
  `atmID` int(11) NOT NULL,
  `atmX` float NOT NULL,
  `atmY` float NOT NULL,
  `atmZ` float NOT NULL,
  `atmA` float NOT NULL,
  `atmInterior` int(11) NOT NULL,
  `atmWorld` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=tis620;

--
-- Dumping data for table `atm`
--

INSERT INTO `atm` (`atmID`, `atmX`, `atmY`, `atmZ`, `atmA`, `atmInterior`, `atmWorld`) VALUES
(1, 2313.53, -17.2283, 26.7496, 179.929, 0, 7011);

-- --------------------------------------------------------

--
-- Table structure for table `buycar`
--

CREATE TABLE IF NOT EXISTS `buycar` (
  `buycarID` int(11) NOT NULL,
  `buycarX` float NOT NULL,
  `buycarY` float NOT NULL,
  `buycarZ` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buycar`
--

INSERT INTO `buycar` (`buycarID`, `buycarX`, `buycarY`, `buycarZ`) VALUES
(1, 2131.91, -1151.09, 24.0868);

-- --------------------------------------------------------

--
-- Table structure for table `carshop`
--

CREATE TABLE IF NOT EXISTS `carshop` (
  `carshopID` int(11) NOT NULL,
  `carshopModel` smallint(3) NOT NULL DEFAULT '0',
  `carshopPrice` int(11) NOT NULL DEFAULT '0',
  `carshopType` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=tis620;

--
-- Dumping data for table `carshop`
--

INSERT INTO `carshop` (`carshopID`, `carshopModel`, `carshopPrice`, `carshopType`) VALUES
(4, 565, 250000, 4),
(5, 589, 400000, 4),
(6, 602, 470000, 4),
(7, 543, 50000, 2),
(8, 410, 35000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `ID` int(12) DEFAULT '0',
  `contactID` int(12) NOT NULL,
  `contactName` varchar(32) DEFAULT NULL,
  `contactNumber` int(12) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `entrances`
--

CREATE TABLE IF NOT EXISTS `entrances` (
  `entranceID` int(12) NOT NULL,
  `entranceName` varchar(32) DEFAULT NULL,
  `entranceIcon` int(12) DEFAULT '0',
  `entrancePosX` float DEFAULT '0',
  `entrancePosY` float DEFAULT '0',
  `entrancePosZ` float DEFAULT '0',
  `entrancePosA` float DEFAULT '0',
  `entranceIntX` float DEFAULT '0',
  `entranceIntY` float DEFAULT '0',
  `entranceIntZ` float DEFAULT '0',
  `entranceIntA` float DEFAULT '0',
  `entranceInterior` int(12) DEFAULT '0',
  `entranceExterior` int(12) DEFAULT '0',
  `entranceExteriorVW` int(12) DEFAULT '0',
  `entranceType` int(12) DEFAULT '0',
  `entrancePass` smallint(4) DEFAULT '0',
  `entranceLocked` int(12) DEFAULT '0',
  `entranceCustom` int(4) DEFAULT '0',
  `entranceWorld` int(12) DEFAULT '0',
  `entranceFaction` int(11) DEFAULT '-1'
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=tis620;

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
(13, 'ห้องขังเดี่ยว', 0, 1754.12, -1582.26, 12.5135, 171.669, 1753.95, -1583.19, 12.6853, 351.586, 0, 0, 7007, 0, 0, 0, 0, 7013, 0),
(14, '=ช็อปปิ้ง  ', 0, 1685.83, -2238.61, -2.7128, 358.986, 203.797, -50.0915, 1001.8, 183.228, 1, 0, 0, 0, 0, 0, 0, 7014, -1),
(15, 'แหกคุก', 0, 1755.6, -1560.86, 9.6074, 172.781, -2498.08, 2337.06, 4.9837, 175.769, 0, 0, 7007, 0, 0, 0, 0, 7015, -1),
(16, 'ร้านรถ', 0, 546.68, -1293.09, 17.2482, 183.489, 546.68, -1293.09, 10017.2, 0, 0, 0, 0, 0, 0, 0, 0, 7016, -1),
(17, 'ร้านรถหรู', 0, 2485.43, -1963.28, 16.7578, 3.1338, 2485.43, -1963.28, 10016.8, 0, 0, 0, 0, 0, 0, 0, 0, 7017, -1);

-- --------------------------------------------------------

--
-- Table structure for table `factions`
--

CREATE TABLE IF NOT EXISTS `factions` (
  `factionID` int(12) NOT NULL,
  `factionName` varchar(32) DEFAULT NULL,
  `factionColor` int(12) DEFAULT '0',
  `factionType` int(12) DEFAULT '0',
  `factionRanks` int(12) DEFAULT '0',
  `factionLockerX` float DEFAULT '0',
  `factionLockerY` float DEFAULT '0',
  `factionLockerZ` float DEFAULT '0',
  `factionLockerInt` int(12) DEFAULT '0',
  `factionLockerWorld` int(12) DEFAULT '0',
  `factionWeapon1` int(12) DEFAULT '0',
  `factionAmmo1` int(12) DEFAULT '0',
  `factionWeapon2` int(12) DEFAULT '0',
  `factionAmmo2` int(12) DEFAULT '0',
  `factionWeapon3` int(12) DEFAULT '0',
  `factionAmmo3` int(12) DEFAULT '0',
  `factionWeapon4` int(12) DEFAULT '0',
  `factionAmmo4` int(12) DEFAULT '0',
  `factionWeapon5` int(12) DEFAULT '0',
  `factionAmmo5` int(12) DEFAULT '0',
  `factionWeapon6` int(12) DEFAULT '0',
  `factionAmmo6` int(12) DEFAULT '0',
  `factionWeapon7` int(12) DEFAULT '0',
  `factionAmmo7` int(12) DEFAULT '0',
  `factionWeapon8` int(12) DEFAULT '0',
  `factionAmmo8` int(12) DEFAULT '0',
  `factionWeapon9` int(12) DEFAULT '0',
  `factionAmmo9` int(12) DEFAULT '0',
  `factionWeapon10` int(12) DEFAULT '0',
  `factionAmmo10` int(12) DEFAULT '0',
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
  `factionSkin1` int(12) DEFAULT '0',
  `factionSkin2` int(12) DEFAULT '0',
  `factionSkin3` int(12) DEFAULT '0',
  `factionSkin4` int(12) DEFAULT '0',
  `factionSkin5` int(12) DEFAULT '0',
  `factionSkin6` int(12) DEFAULT '0',
  `factionSkin7` int(12) DEFAULT '0',
  `factionSkin8` int(12) DEFAULT '0',
  `SpawnX` float DEFAULT NULL,
  `SpawnY` float DEFAULT NULL,
  `SpawnZ` float DEFAULT NULL,
  `SpawnInterior` int(11) DEFAULT NULL,
  `SpawnVW` int(1) DEFAULT NULL,
  `factionEntrance` int(11) DEFAULT '0',
  `fLocker0` int(12) NOT NULL DEFAULT '0',
  `fLocker1` int(12) NOT NULL DEFAULT '0',
  `fLocker2` int(12) NOT NULL DEFAULT '0',
  `fLocker3` int(12) NOT NULL DEFAULT '0',
  `fLocker4` int(12) NOT NULL DEFAULT '0',
  `fLocker5` int(12) NOT NULL DEFAULT '0',
  `fLocker6` int(12) NOT NULL DEFAULT '0',
  `fLocker7` int(12) NOT NULL DEFAULT '0',
  `fLocker8` int(12) NOT NULL DEFAULT '0',
  `fLocker9` int(12) NOT NULL DEFAULT '0',
  `fLocker10` int(12) NOT NULL DEFAULT '0',
  `factionMember` int(12) NOT NULL DEFAULT '0',
  `factionMax` int(12) NOT NULL DEFAULT '5'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=tis620;

--
-- Dumping data for table `factions`
--

INSERT INTO `factions` (`factionID`, `factionName`, `factionColor`, `factionType`, `factionRanks`, `factionLockerX`, `factionLockerY`, `factionLockerZ`, `factionLockerInt`, `factionLockerWorld`, `factionWeapon1`, `factionAmmo1`, `factionWeapon2`, `factionAmmo2`, `factionWeapon3`, `factionAmmo3`, `factionWeapon4`, `factionAmmo4`, `factionWeapon5`, `factionAmmo5`, `factionWeapon6`, `factionAmmo6`, `factionWeapon7`, `factionAmmo7`, `factionWeapon8`, `factionAmmo8`, `factionWeapon9`, `factionAmmo9`, `factionWeapon10`, `factionAmmo10`, `factionRank1`, `factionRank2`, `factionRank3`, `factionRank4`, `factionRank5`, `factionRank6`, `factionRank7`, `factionRank8`, `factionRank9`, `factionRank10`, `factionRank11`, `factionRank12`, `factionRank13`, `factionRank14`, `factionRank15`, `factionSkin1`, `factionSkin2`, `factionSkin3`, `factionSkin4`, `factionSkin5`, `factionSkin6`, `factionSkin7`, `factionSkin8`, `SpawnX`, `SpawnY`, `SpawnZ`, `SpawnInterior`, `SpawnVW`, `factionEntrance`, `fLocker0`, `fLocker1`, `fLocker2`, `fLocker3`, `fLocker4`, `fLocker5`, `fLocker6`, `fLocker7`, `fLocker8`, `fLocker9`, `fLocker10`, `factionMember`, `factionMax`) VALUES
(3, 'POLICE', 65535, 1, 5, 1570.18, -1690.08, 19.8381, 0, 7001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', 'Rank 8', 'Rank 9', 'Rank 10', 'Rank 11', 'Rank 12', 'Rank 13', 'Rank 14', 'Rank 15', 0, 0, 0, 0, 0, 0, 0, 0, 627.251, -1590.68, 15.5364, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5),
(4, 'MEDIC', -4800001, 3, 5, 1402.5, -41.3697, 1000.86, 0, 7002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', 'Rank 8', 'Rank 9', 'Rank 10', 'Rank 11', 'Rank 12', 'Rank 13', 'Rank 14', 'Rank 15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5),
(5, 'MEC', -256, 6, 5, 1880, -1389.69, 14.3974, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', 'Rank 8', 'Rank 9', 'Rank 10', 'Rank 11', 'Rank 12', 'Rank 13', 'Rank 14', 'Rank 15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5),
(6, 'CHEF', -256, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', 'Rank 8', 'Rank 9', 'Rank 10', 'Rank 11', 'Rank 12', 'Rank 13', 'Rank 14', 'Rank 15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5),
(7, 'GOV', -256, 4, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', 'Rank 8', 'Rank 9', 'Rank 10', 'Rank 11', 'Rank 12', 'Rank 13', 'Rank 14', 'Rank 15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `gangwarzone`
--

CREATE TABLE IF NOT EXISTS `gangwarzone` (
  `ID` int(12) NOT NULL,
  `GangWarIs` int(12) DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `garages`
--

CREATE TABLE IF NOT EXISTS `garages` (
  `garageID` int(11) NOT NULL,
  `garageX` float NOT NULL,
  `garageY` float NOT NULL,
  `garageZ` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=tis620;

--
-- Dumping data for table `garages`
--

INSERT INTO `garages` (`garageID`, `garageX`, `garageY`, `garageZ`) VALUES
(1, 1866.07, -1404.96, 14.639);

-- --------------------------------------------------------

--
-- Table structure for table `garagevehs`
--

CREATE TABLE IF NOT EXISTS `garagevehs` (
  `garagevehID` int(11) NOT NULL,
  `garagevehX` float NOT NULL,
  `garagevehY` float NOT NULL,
  `garagevehZ` float NOT NULL,
  `garagevehInterior` int(11) NOT NULL,
  `garagevehWorld` int(11) NOT NULL,
  `garagevehType` tinyint(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=tis620;

--
-- Dumping data for table `garagevehs`
--

INSERT INTO `garagevehs` (`garagevehID`, `garagevehX`, `garagevehY`, `garagevehZ`, `garagevehInterior`, `garagevehWorld`, `garagevehType`) VALUES
(1, 1518.48, -2211.42, 13.5547, 0, 0, 1),
(2, 1508.63, -2212.16, 13.5469, 0, 0, 2),
(3, -2482.46, 2225.93, 4.829, 0, 0, 1),
(4, -2476.53, 2225.28, 4.8438, 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

CREATE TABLE IF NOT EXISTS `gates` (
  `gateID` int(12) NOT NULL,
  `gateModel` int(12) DEFAULT '0',
  `gateSpeed` float DEFAULT '0',
  `gateTime` int(12) DEFAULT '0',
  `gateX` float DEFAULT '0',
  `gateY` float DEFAULT '0',
  `gateZ` float DEFAULT '0',
  `gateRX` float DEFAULT '0',
  `gateRY` float DEFAULT '0',
  `gateRZ` float DEFAULT '0',
  `gateInterior` int(12) DEFAULT '0',
  `gateWorld` int(12) DEFAULT '0',
  `gateMoveX` float DEFAULT '0',
  `gateMoveY` float DEFAULT '0',
  `gateMoveZ` float DEFAULT '0',
  `gateMoveRX` float DEFAULT '0',
  `gateMoveRY` float DEFAULT '0',
  `gateMoveRZ` float DEFAULT '0',
  `gateLinkID` int(12) DEFAULT '0',
  `gateFaction` int(12) DEFAULT '0',
  `gatePass` smallint(4) DEFAULT '0',
  `gateRadius` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `gps`
--

CREATE TABLE IF NOT EXISTS `gps` (
  `gpsID` int(11) NOT NULL,
  `gpsName` varchar(32) DEFAULT NULL,
  `gpsX` float NOT NULL,
  `gpsY` float NOT NULL,
  `gpsZ` float NOT NULL,
  `gpsType` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=tis620;

--
-- Dumping data for table `gps`
--

INSERT INTO `gps` (`gpsID`, `gpsName`, `gpsX`, `gpsY`, `gpsZ`, `gpsType`) VALUES
(63, 'ร้านขายรถ', 2131.95, -1148.01, 24.4241, 1),
(65, 'ตลาดเซิฟเวอร์', 1129.2, -1413.13, 13.6115, 1),
(67, 'ร้านขายรถ', 2124.85, -1125.51, 25.5197, 1),
(69, 'Home', 1902.06, 703.155, 10.8203, 1),
(72, 'สอบใบขับขี่', 1168.62, 1363.81, 10.8203, 1),
(73, 'ที่คราฟกาชาปองสายฟรี', -1476.29, 2562.86, 57.3074, 1),
(75, 'Label', 1862.02, -1380.97, 15.0482, 1),
(76, 'สถานีตำรวจ', 1540.33, -1676.01, 13.5504, 1),
(77, 'โรงพยาบาล', 614.612, -1461.55, 14.4506, 1),
(78, 'อู่ซ่อมรถ', 1858.68, -1378.11, 13.6764, 1),
(79, 'จุดเกิดเด็กใหม่', 1655.75, -2286.41, -1.2127, 1),
(82, 'จุดเปิดสตอรี่', 1156.33, -2015.25, 69.0078, 1),
(84, 'ที่ท่องเที่ยว', 953.625, -0.0411, 92.0227, 1),
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
(126, '24/7 ผุพัง', 1934.65, -1775.39, 13.3828, 5),
(127, 'ปั้มน้ำมัน [LV]', 2200.17, 2463.95, 10.8203, 5),
(128, 'ปั้มน้ำมัน [LV]', 1605.69, 2188.77, 10.8203, 5),
(129, '24/7 ผุพัง', 1931.54, -1775.91, 13.5469, 1),
(130, 'ปั้มน้ำมัน [LS]', 838.315, -1752.1, 13.547, 5),
(131, 'ร้านพิซซ่า', 2100.04, -1806.54, 13.5546, 1),
(132, 'สวนฟิวเจอร์', -1194.29, -1040.41, 129.219, 1),
(133, 'จุดขายของในฟาร์ม', 682.755, -1274.37, 13.569, 1),
(134, 'จุดขายปลา', 1930.08, -1769.24, 13.5469, 1),
(135, '<MARK> [JOB:มะม่วง]', -1151.17, -954.692, 129.219, 2),
(136, '<MARK> [JOB:มะเขือเทศ]', -1100.55, -957.878, 129.219, 2),
(137, '<MARK> [JOB:ลิ้นจี่]', -1054.33, -929.939, 129.219, 2),
(138, '<MARK> [JOB:มะพร้าว]', -1054.93, -979.818, 129.219, 2),
(139, '<MARK> [JOB:แอปเปิ้ล]', -1056.42, -1030.69, 129.212, 2),
(140, '<MARK> [JOB:ตกปลา]', 723.986, -1592.27, 14.4278, 2);

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
  `houseID` int(12) NOT NULL,
  `houseOwner` int(12) DEFAULT '0',
  `housePrice` int(12) DEFAULT '0',
  `houseAddress` varchar(32) DEFAULT NULL,
  `housePosX` float DEFAULT '0',
  `housePosY` float DEFAULT '0',
  `housePosZ` float DEFAULT '0',
  `housePosA` float DEFAULT '0',
  `houseIntX` float DEFAULT '0',
  `houseIntY` float DEFAULT '0',
  `houseIntZ` float DEFAULT '0',
  `houseIntA` float DEFAULT '0',
  `houseInterior` int(12) DEFAULT '0',
  `houseExterior` int(12) DEFAULT '0',
  `houseExteriorVW` int(12) DEFAULT '0',
  `houseLocked` int(4) DEFAULT '0',
  `houseWeapon1` int(12) DEFAULT '0',
  `houseAmmo1` int(12) DEFAULT '0',
  `houseWeapon2` int(12) DEFAULT '0',
  `houseAmmo2` int(12) DEFAULT '0',
  `houseWeapon3` int(12) DEFAULT '0',
  `houseAmmo3` int(12) DEFAULT '0',
  `houseWeapon4` int(12) DEFAULT '0',
  `houseAmmo4` int(12) DEFAULT '0',
  `houseWeapon5` int(12) DEFAULT '0',
  `houseAmmo5` int(12) DEFAULT '0',
  `houseWeapon6` int(12) DEFAULT '0',
  `houseAmmo6` int(12) DEFAULT '0',
  `houseWeapon7` int(12) DEFAULT '0',
  `houseAmmo7` int(12) DEFAULT '0',
  `houseWeapon8` int(12) DEFAULT '0',
  `houseAmmo8` int(12) DEFAULT '0',
  `houseWeapon9` int(12) DEFAULT '0',
  `houseAmmo9` int(12) DEFAULT '0',
  `houseWeapon10` int(12) DEFAULT '0',
  `houseAmmo10` int(12) DEFAULT '0',
  `houseMoney` int(12) DEFAULT '0',
  `houseRedMoney` int(12) NOT NULL DEFAULT '0',
  `houseCannabis` int(12) NOT NULL DEFAULT '0',
  `houseCocain` int(12) NOT NULL DEFAULT '0',
  `housePoon` int(12) NOT NULL DEFAULT '0',
  `houseDrug` int(12) NOT NULL DEFAULT '0',
  `housePackWeed` int(12) NOT NULL DEFAULT '0',
  `housePackCocain` int(12) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `icu`
--

CREATE TABLE IF NOT EXISTS `icu` (
  `icuID` int(11) NOT NULL,
  `icuX` float NOT NULL,
  `icuY` float NOT NULL,
  `icuZ` float NOT NULL,
  `icuA` float NOT NULL,
  `icuInterior` int(11) NOT NULL,
  `icuWorld` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `invID` int(12) NOT NULL,
  `invOwner` int(11) NOT NULL DEFAULT '0',
  `invItem` varchar(32) DEFAULT NULL,
  `invQuantity` int(12) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=tis620;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`invID`, `invOwner`, `invItem`, `invQuantity`) VALUES
(1, 1, 'น้ำเปล่า', 15),
(2, 1, 'พิซซ่า', 15),
(4, 1, 'มือถือ', 1),
(5, 1, 'กาชาปอง', 1),
(6, 1, 'ตะกร้า', 1),
(8, 1, 'เบ็ดฝรั่ง', 5),
(9, 1, 'เหยื่อ', 2),
(10, 1, 'ปลาดุก', 2),
(11, 1, 'กล่องซ่อม', 8),
(12, 1, 'ถังน้ำมัน', 7),
(13, 1, 'ดาบมณี', 1),
(14, 1, 'มีดสั้นติดไฟ', 1),
(15, 1, 'กล่องชุบ', 10),
(16, 2, 'กล่องชุบ', 15),
(17, 3, 'น้ำเปล่า', 4),
(18, 3, 'พิซซ่า', 6),
(19, 3, 'กุญแจตู้เซฟ', 1),
(20, 3, 'มือถือ', 1),
(21, 3, 'กาชาปอง', 1),
(22, 3, 'กล่องซ่อม', 9),
(23, 3, 'ถังน้ำมัน', 9);

-- --------------------------------------------------------

--
-- Table structure for table `objectt`
--

CREATE TABLE IF NOT EXISTS `objectt` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `ObjectModel` int(11) NOT NULL DEFAULT '0',
  `ObjectPosX` float NOT NULL,
  `ObjectPosY` float NOT NULL,
  `ObjectPosZ` float NOT NULL,
  `ObjectPosRX` float NOT NULL,
  `ObjectPosRY` float NOT NULL,
  `ObjectPosRZ` float NOT NULL,
  `ObjectWolrd` int(11) NOT NULL DEFAULT '0',
  `Textrueindex` int(11) NOT NULL DEFAULT '0',
  `TextrueModel` int(11) DEFAULT '0',
  `Textrue_Name1` varchar(64) NOT NULL,
  `Textrue_Name2` varchar(64) NOT NULL,
  `Textrue_Color` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `playerID` int(11) NOT NULL,
  `playerName` varchar(24) NOT NULL,
  `playerPassword` char(129) NOT NULL,
  `playerRegDate` char(90) NOT NULL DEFAULT 'None',
  `playerGender` tinyint(2) NOT NULL DEFAULT '0',
  `playerBirthday` char(24) NOT NULL DEFAULT 'แก้ไข',
  `playerAdmin` tinyint(2) NOT NULL DEFAULT '0',
  `playerKills` mediumint(8) NOT NULL DEFAULT '0',
  `playerDeaths` mediumint(8) NOT NULL DEFAULT '0',
  `playerMoney` int(11) NOT NULL DEFAULT '0',
  `playerBank` int(11) NOT NULL DEFAULT '0',
  `playerRedMoney` int(11) NOT NULL DEFAULT '0',
  `playerLevel` smallint(3) NOT NULL DEFAULT '0',
  `playerExp` int(11) NOT NULL DEFAULT '0',
  `playerMinutes` tinyint(2) NOT NULL DEFAULT '0',
  `playerHours` int(11) NOT NULL DEFAULT '0',
  `playerPosX` float NOT NULL DEFAULT '0',
  `playerPosY` float NOT NULL DEFAULT '0',
  `playerPosZ` float NOT NULL DEFAULT '0',
  `playerPosA` float NOT NULL DEFAULT '0',
  `playerSkin` smallint(3) NOT NULL DEFAULT '0',
  `playerInterior` tinyint(2) NOT NULL DEFAULT '0',
  `playerWorld` int(11) NOT NULL DEFAULT '0',
  `playerTutorial` tinyint(1) NOT NULL DEFAULT '0',
  `playerSpawn` tinyint(1) NOT NULL DEFAULT '0',
  `playerThirsty` float NOT NULL DEFAULT '0',
  `playerHungry` float NOT NULL DEFAULT '0',
  `playerHealth` float NOT NULL DEFAULT '0',
  `playerInjured` tinyint(1) NOT NULL DEFAULT '0',
  `playerInjuredTime` int(11) NOT NULL DEFAULT '0',
  `playerFaction` tinyint(2) NOT NULL DEFAULT '-1',
  `playerFactionRank` tinyint(2) NOT NULL DEFAULT '0',
  `playerPrisoned` tinyint(1) NOT NULL DEFAULT '0',
  `playerPrisonOut` smallint(3) NOT NULL DEFAULT '0',
  `playerJailTime` smallint(3) NOT NULL DEFAULT '0',
  `playerEntrance` int(11) NOT NULL DEFAULT '-1',
  `playerMaxItem` int(11) NOT NULL DEFAULT '8',
  `playerItemAmount` int(11) NOT NULL DEFAULT '20',
  `playerPhone` int(11) NOT NULL DEFAULT '0',
  `playerVIP` tinyint(1) NOT NULL DEFAULT '0',
  `playerQuest` smallint(5) NOT NULL DEFAULT '0',
  `playerQuestProgress` int(11) NOT NULL DEFAULT '0',
  `playerBan` tinyint(1) NOT NULL DEFAULT '0',
  `playerBanReason` varchar(128) NOT NULL DEFAULT 'None',
  `playerWhitelist` int(12) NOT NULL DEFAULT '0',
  `GiftBox` int(12) NOT NULL DEFAULT '0',
  `Coin` int(12) NOT NULL DEFAULT '0',
  `Boombox` int(12) NOT NULL DEFAULT '0',
  `Chaya` int(12) NOT NULL DEFAULT '0',
  `ChayaText` varchar(256) NOT NULL,
  `pElegy` int(12) NOT NULL DEFAULT '0',
  `pFlash` int(12) NOT NULL DEFAULT '0',
  `pSultantuning` int(12) NOT NULL DEFAULT '0',
  `pJester` int(12) NOT NULL DEFAULT '0',
  `pPhoenix` int(12) NOT NULL DEFAULT '0',
  `pCheetah` int(12) NOT NULL DEFAULT '0',
  `pUranus` int(12) NOT NULL DEFAULT '0',
  `pSlamvantune` int(12) NOT NULL DEFAULT '0',
  `pStratum` int(12) NOT NULL DEFAULT '0',
  `pBroadway` int(12) NOT NULL DEFAULT '0',
  `pRemingtontune` int(12) NOT NULL DEFAULT '0',
  `pSafeRedMoney` int(12) NOT NULL DEFAULT '0',
  `pSafePassword` int(12) NOT NULL DEFAULT '0',
  `pSafeMoney` int(12) NOT NULL DEFAULT '0',
  `pSafeKetamine` int(12) NOT NULL DEFAULT '0',
  `pSafeCannabis` int(12) NOT NULL DEFAULT '0',
  `pSafe` int(12) NOT NULL DEFAULT '0',
  `pPets0` int(12) NOT NULL DEFAULT '0',
  `pPets1` int(12) NOT NULL DEFAULT '0',
  `pPets2` int(12) NOT NULL DEFAULT '0',
  `pPets3` int(12) NOT NULL DEFAULT '0',
  `pChangePass` int(12) NOT NULL DEFAULT '0',
  `pChangeName` int(12) NOT NULL DEFAULT '0',
  `pSkate` int(12) NOT NULL DEFAULT '0',
  `pKatanaDamage` int(12) NOT NULL DEFAULT '0',
  `Camp` int(12) NOT NULL DEFAULT '0',
  `Siren` int(12) NOT NULL DEFAULT '0',
  `Cuffed` int(12) NOT NULL DEFAULT '0',
  `MudFire` int(12) NOT NULL DEFAULT '0',
  `CopPoints` int(12) NOT NULL DEFAULT '0',
  `MedicPoints` int(12) NOT NULL DEFAULT '0',
  `SkillCraft` int(12) NOT NULL DEFAULT '1',
  `ExpCraft` int(12) NOT NULL DEFAULT '0',
  `Materials` int(12) NOT NULL DEFAULT '0',
  `Irons` int(12) NOT NULL DEFAULT '0',
  `Woods` int(12) NOT NULL DEFAULT '0',
  `MarryOn` int(12) NOT NULL DEFAULT '0',
  `Wornz` int(12) NOT NULL DEFAULT '0',
  `pCocain` int(12) NOT NULL DEFAULT '0',
  `pKetamine` int(12) NOT NULL DEFAULT '0',
  `pCocainPack` int(12) NOT NULL DEFAULT '0',
  `pPoon` int(12) NOT NULL DEFAULT '0',
  `Daily` int(11) NOT NULL DEFAULT '0',
  `Sleep` int(11) NOT NULL DEFAULT '0',
  `Fixcar` int(11) NOT NULL DEFAULT '0',
  `RunBar` int(11) NOT NULL DEFAULT '0',
  `DevMode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=tis620;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`playerID`, `playerName`, `playerPassword`, `playerRegDate`, `playerGender`, `playerBirthday`, `playerAdmin`, `playerKills`, `playerDeaths`, `playerMoney`, `playerBank`, `playerRedMoney`, `playerLevel`, `playerExp`, `playerMinutes`, `playerHours`, `playerPosX`, `playerPosY`, `playerPosZ`, `playerPosA`, `playerSkin`, `playerInterior`, `playerWorld`, `playerTutorial`, `playerSpawn`, `playerThirsty`, `playerHungry`, `playerHealth`, `playerInjured`, `playerInjuredTime`, `playerFaction`, `playerFactionRank`, `playerPrisoned`, `playerPrisonOut`, `playerJailTime`, `playerEntrance`, `playerMaxItem`, `playerItemAmount`, `playerPhone`, `playerVIP`, `playerQuest`, `playerQuestProgress`, `playerBan`, `playerBanReason`, `playerWhitelist`, `GiftBox`, `Coin`, `Boombox`, `Chaya`, `ChayaText`, `pElegy`, `pFlash`, `pSultantuning`, `pJester`, `pPhoenix`, `pCheetah`, `pUranus`, `pSlamvantune`, `pStratum`, `pBroadway`, `pRemingtontune`, `pSafeRedMoney`, `pSafePassword`, `pSafeMoney`, `pSafeKetamine`, `pSafeCannabis`, `pSafe`, `pPets0`, `pPets1`, `pPets2`, `pPets3`, `pChangePass`, `pChangeName`, `pSkate`, `pKatanaDamage`, `Camp`, `Siren`, `Cuffed`, `MudFire`, `CopPoints`, `MedicPoints`, `SkillCraft`, `ExpCraft`, `Materials`, `Irons`, `Woods`, `MarryOn`, `Wornz`, `pCocain`, `pKetamine`, `pCocainPack`, `pPoon`, `Daily`, `Sleep`, `Fixcar`, `RunBar`, `DevMode`) VALUES
(1, 'SUNDAY', 'C79D3DCEE7087EF9DD416A877F62C2C009EF3AEEF8996E71082ADB3A81EDEBCAEBDE5B15E10E6EB326227ADAEA3AADE28F6C9362899E511513C44909A3028F3A', '05-08-2022 18:11:12', 1, '1/1/2000', 127, 0, 0, 54464, 4000, 0, 1, 212, 47, 2, 1551.66, -1431.84, 23.6172, 144.995, 250, 0, 0, 1, 0, 90, 90, 100, 0, 0, 4, 5, 0, 0, 0, -1, 30, 50, 2196, 4, 0, 0, 0, 'None', 1, 1, 100, 65535, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7),
(2, 'Pyp', 'C79D3DCEE7087EF9DD416A877F62C2C009EF3AEEF8996E71082ADB3A81EDEBCAEBDE5B15E10E6EB326227ADAEA3AADE28F6C9362899E511513C44909A3028F3A', '05-08-2022 18:11:12', 1, '1/1/2000', 127, 0, 1, 60828, 2000, 0, 1, 175, 26, 1, 837.336, -1751.25, 13.547, 287.534, 250, 0, 0, 1, 0, 10, 10, 95, 0, 0, 4, 5, 0, 0, 0, -1, 30, 50, 2196, 4, 0, 0, 0, 'None', 1, 1, 0, 65535, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7),
(3, 'Pyp_Organize', 'C79D3DCEE7087EF9DD416A877F62C2C009EF3AEEF8996E71082ADB3A81EDEBCAEBDE5B15E10E6EB326227ADAEA3AADE28F6C9362899E511513C44909A3028F3A', '07-08-2022 13:06:14', 1, '1/1/2000', 127, 0, 0, 66495, 0, 0, 1, 0, 1, 6, -2480.33, 2211.11, 4.98438, 178.822, 250, 0, 0, 1, 0, 45, 70, 75, 0, 0, -1, 0, 0, 0, 0, -1, 8, 50, 9757, 0, 0, 0, 0, 'None', 0, 1, 100, 65535, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `pumps`
--

CREATE TABLE IF NOT EXISTS `pumps` (
  `pumpID` int(11) NOT NULL,
  `pumpX` float NOT NULL,
  `pumpY` float NOT NULL,
  `pumpZ` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=tis620;

--
-- Dumping data for table `pumps`
--

INSERT INTO `pumps` (`pumpID`, `pumpX`, `pumpY`, `pumpZ`) VALUES
(3, 1873.1, -1373.65, 14.3771),
(4, 1939.58, -1775.32, 13.3906),
(5, 1943.16, -1775.33, 13.3906),
(6, 618.982, 1685.08, 6.9922),
(7, 838.353, -1751.1, 13.547);

-- --------------------------------------------------------

--
-- Table structure for table `rentcar`
--

CREATE TABLE IF NOT EXISTS `rentcar` (
  `rentcarID` int(11) NOT NULL,
  `rentcarX` float NOT NULL,
  `rentcarY` float NOT NULL,
  `rentcarZ` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rentcar`
--

INSERT INTO `rentcar` (`rentcarID`, `rentcarX`, `rentcarY`, `rentcarZ`) VALUES
(1, 1729.94, -2298.19, -2.8516),
(2, 1222.14, -1420.63, 13.2798),
(3, -2624.38, 2263.45, 8.1301);

-- --------------------------------------------------------

--
-- Table structure for table `safezonedata`
--

CREATE TABLE IF NOT EXISTS `safezonedata` (
  `ID` int(11) NOT NULL,
  `szPosX` float NOT NULL,
  `szPosY` float NOT NULL,
  `szPosZ` float NOT NULL,
  `szSize` int(11) NOT NULL DEFAULT '200'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE IF NOT EXISTS `shops` (
  `shopID` int(11) NOT NULL,
  `shopX` float NOT NULL,
  `shopY` float NOT NULL,
  `shopZ` float NOT NULL,
  `shopInterior` int(11) NOT NULL,
  `shopWorld` int(11) NOT NULL,
  `shopType` tinyint(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=tis620;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`shopID`, `shopX`, `shopY`, `shopZ`, `shopInterior`, `shopWorld`, `shopType`) VALUES
(7, 1929.73, -1773.58, 13.5469, 0, 0, 8),
(8, 1929.61, -1778.35, 13.5469, 0, 0, 9),
(9, 1928.94, -1784.69, 13.5469, 0, 0, 1),
(10, 161.398, -81.1914, 1001.8, 18, 7004, 2),
(13, 720.256, -1578.21, 14.4423, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sunsafety`
--

CREATE TABLE IF NOT EXISTS `sunsafety` (
  `safetyID` int(11) NOT NULL,
  `safetyX` float NOT NULL,
  `safetyY` float NOT NULL,
  `safetyZ` float NOT NULL,
  `safetyRMoney` int(12) NOT NULL DEFAULT '0',
  `safetyMoney` int(12) NOT NULL DEFAULT '0',
  `safetyKnuckles` int(12) NOT NULL DEFAULT '0',
  `safetyPoon` int(12) NOT NULL DEFAULT '0',
  `safetyHematite` int(12) NOT NULL DEFAULT '0',
  `ID` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `trunklog`
--

CREATE TABLE IF NOT EXISTS `trunklog` (
  `giveID` int(15) NOT NULL,
  `givePlayerID` int(6) NOT NULL,
  `givePlayerName` varchar(32) NOT NULL,
  `giveItem` varchar(32) NOT NULL,
  `giveAmount` int(8) NOT NULL,
  `carID` int(6) NOT NULL,
  `giveTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `vehiclegang`
--

CREATE TABLE IF NOT EXISTS `vehiclegang` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `bPosX` float NOT NULL,
  `bPosY` float NOT NULL,
  `bPosZ` float NOT NULL,
  `Leader` int(11) NOT NULL DEFAULT '0',
  `Slot1` int(12) NOT NULL DEFAULT '0',
  `Slot2` int(12) NOT NULL DEFAULT '0',
  `Slot3` int(12) NOT NULL DEFAULT '0',
  `Slot4` int(12) NOT NULL DEFAULT '0',
  `Slot5` int(12) NOT NULL DEFAULT '0',
  `Slot6` int(12) NOT NULL DEFAULT '0',
  `Slot7` int(12) NOT NULL DEFAULT '0',
  `Slot8` int(12) NOT NULL DEFAULT '0',
  `Slot9` int(12) NOT NULL DEFAULT '0',
  `Slot10` int(12) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE IF NOT EXISTS `vehicles` (
  `carID` int(10) NOT NULL,
  `carOwnerID` int(10) DEFAULT '0',
  `carOwner` varchar(24) DEFAULT 'Nobody',
  `carModel` smallint(3) DEFAULT '0',
  `carPrice` int(10) DEFAULT '0',
  `carTickets` int(10) DEFAULT '0',
  `carLocked` tinyint(1) DEFAULT '0',
  `carPlate` varchar(32) DEFAULT 'None',
  `carFuel` float DEFAULT '0',
  `carHealth` float DEFAULT '1000',
  `carPosX` float DEFAULT '0',
  `carPosY` float DEFAULT '0',
  `carPosZ` float DEFAULT '0',
  `carPosA` float DEFAULT '0',
  `carColor1` smallint(3) DEFAULT '1',
  `carColor2` smallint(3) DEFAULT '1',
  `carPaintjob` tinyint(2) DEFAULT '-1',
  `carInterior` tinyint(2) DEFAULT '0',
  `carWorld` int(10) DEFAULT '0',
  `carNeon` smallint(5) DEFAULT '0',
  `carNeonEnabled` tinyint(1) DEFAULT '0',
  `carTrunk` tinyint(1) DEFAULT '0',
  `carMod1` smallint(4) DEFAULT '0',
  `carMod2` smallint(4) DEFAULT '0',
  `carMod3` smallint(4) DEFAULT '0',
  `carMod4` smallint(4) DEFAULT '0',
  `carMod5` smallint(4) DEFAULT '0',
  `carMod6` smallint(4) DEFAULT '0',
  `carMod7` smallint(4) DEFAULT '0',
  `carMod8` smallint(4) DEFAULT '0',
  `carMod9` smallint(4) DEFAULT '0',
  `carMod10` smallint(4) DEFAULT '0',
  `carMod11` smallint(4) DEFAULT '0',
  `carMod12` smallint(4) DEFAULT '0',
  `carMod13` smallint(4) DEFAULT '0',
  `carMod14` smallint(4) DEFAULT '0',
  `carCash` int(10) DEFAULT '0',
  `carFaction` tinyint(2) DEFAULT '-1',
  `carLevel` int(12) NOT NULL DEFAULT '0',
  `carTune` float NOT NULL DEFAULT '0',
  `carMoney` int(11) DEFAULT '0',
  `carRMoney` int(11) DEFAULT '0',
  `carKnuckles` int(11) DEFAULT '0',
  `carFlower` int(11) DEFAULT '0',
  `carDildo` int(11) DEFAULT '0',
  `carPool` int(11) DEFAULT '0',
  `carGolf` int(11) DEFAULT '0',
  `carSholver` int(11) DEFAULT '0',
  `carKatana` int(11) DEFAULT '0',
  `carPDbong` int(11) DEFAULT '0',
  `carWooden` int(11) DEFAULT '0',
  `carKnife` int(11) DEFAULT '0',
  `carGunShot` int(11) DEFAULT '0',
  `carAmmo` int(11) DEFAULT '0',
  `carProtect` int(11) DEFAULT '0',
  `carShrkKnife` int(11) DEFAULT '0',
  `carBasball` int(11) DEFAULT '0',
  `carMangoPack` int(11) DEFAULT '0',
  `carTomatoPack` int(11) DEFAULT '0',
  `carLyncheePack` int(11) DEFAULT '0',
  `carCoconutPack` int(11) DEFAULT '0',
  `carApplePack` int(11) DEFAULT '0',
  `carFishGou` int(11) DEFAULT '0',
  `carFishChon` int(11) DEFAULT '0',
  `carFishDolly` int(11) DEFAULT '0',
  `carFishNil` int(11) DEFAULT '0',
  `carFishKrapong` int(11) DEFAULT '0',
  `carFishTaptim` int(11) DEFAULT '0',
  `carFishDuk` int(11) DEFAULT '0',
  `carFishToona` int(11) DEFAULT '0',
  `carFishSalmon` int(11) DEFAULT '0',
  `carFishKraben` int(11) DEFAULT '0',
  `carFishShark` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=tis620;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`carID`, `carOwnerID`, `carOwner`, `carModel`, `carPrice`, `carTickets`, `carLocked`, `carPlate`, `carFuel`, `carHealth`, `carPosX`, `carPosY`, `carPosZ`, `carPosA`, `carColor1`, `carColor2`, `carPaintjob`, `carInterior`, `carWorld`, `carNeon`, `carNeonEnabled`, `carTrunk`, `carMod1`, `carMod2`, `carMod3`, `carMod4`, `carMod5`, `carMod6`, `carMod7`, `carMod8`, `carMod9`, `carMod10`, `carMod11`, `carMod12`, `carMod13`, `carMod14`, `carCash`, `carFaction`, `carLevel`, `carTune`, `carMoney`, `carRMoney`, `carKnuckles`, `carFlower`, `carDildo`, `carPool`, `carGolf`, `carSholver`, `carKatana`, `carPDbong`, `carWooden`, `carKnife`, `carGunShot`, `carAmmo`, `carProtect`, `carShrkKnife`, `carBasball`, `carMangoPack`, `carTomatoPack`, `carLyncheePack`, `carCoconutPack`, `carApplePack`, `carFishGou`, `carFishChon`, `carFishDolly`, `carFishNil`, `carFishKrapong`, `carFishTaptim`, `carFishDuk`, `carFishToona`, `carFishSalmon`, `carFishKraben`, `carFishShark`) VALUES
(1, 1, 'SUNDAY', 402, 0, 0, 0, 'None', 99, 995.977, 562.397, -1283.85, 17.0007, 0, 1, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 3, 'Pyp_Organize', 402, 0, 0, 0, 'None', 100, 1000, 562.397, -1283.85, 17.0007, 0, 1, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

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
-- Indexes for table `buycar`
--
ALTER TABLE `buycar`
  ADD PRIMARY KEY (`buycarID`);

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
-- Indexes for table `garagevehs`
--
ALTER TABLE `garagevehs`
  ADD PRIMARY KEY (`garagevehID`);

--
-- Indexes for table `gates`
--
ALTER TABLE `gates`
  ADD PRIMARY KEY (`gateID`);

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
-- Indexes for table `objectt`
--
ALTER TABLE `objectt`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`playerID`), ADD UNIQUE KEY `Username` (`playerName`);

--
-- Indexes for table `pumps`
--
ALTER TABLE `pumps`
  ADD PRIMARY KEY (`pumpID`);

--
-- Indexes for table `rentcar`
--
ALTER TABLE `rentcar`
  ADD PRIMARY KEY (`rentcarID`);

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
  MODIFY `arrestID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `atm`
--
ALTER TABLE `atm`
  MODIFY `atmID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `buycar`
--
ALTER TABLE `buycar`
  MODIFY `buycarID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `carshop`
--
ALTER TABLE `carshop`
  MODIFY `carshopID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contactID` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `entrances`
--
ALTER TABLE `entrances`
  MODIFY `entranceID` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `factionID` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `garages`
--
ALTER TABLE `garages`
  MODIFY `garageID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `garagevehs`
--
ALTER TABLE `garagevehs`
  MODIFY `garagevehID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `gates`
--
ALTER TABLE `gates`
  MODIFY `gateID` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gps`
--
ALTER TABLE `gps`
  MODIFY `gpsID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `houseID` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `icu`
--
ALTER TABLE `icu`
  MODIFY `icuID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `invID` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `playerID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pumps`
--
ALTER TABLE `pumps`
  MODIFY `pumpID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `rentcar`
--
ALTER TABLE `rentcar`
  MODIFY `rentcarID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `shopID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `carID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
