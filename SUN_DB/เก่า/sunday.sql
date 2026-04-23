-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2022 at 07:45 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sunday`
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

-- --------------------------------------------------------

--
-- Table structure for table `buycar`
--

CREATE TABLE `buycar` (
  `buycarID` int(11) NOT NULL,
  `buycarX` float NOT NULL,
  `buycarY` float NOT NULL,
  `buycarZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'สถานีตำรวจ', 0, 1555.5, -1675.51, 16.1953, 268.184, 1561.48, -1674.22, 19.853, 267.451, 15, 0, 0, 0, 0, 0, 0, 7001, -1),
(2, 'โรงพยาบาล', 0, 607.158, -1459.26, 14.3916, 88.3251, 1399.92, -26.2157, 1000.86, 178.397, 0, 0, 0, 0, 0, 0, 0, 7002, -1),
(3, 'ร้านพิซซ่า', 0, 2104.09, -1806.5, 13.5546, 270.809, 372.359, -133.525, 1001.49, 171.23, 5, 0, 0, 0, 0, 0, 0, 7003, -1);

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
(1, ': ตำรวจ :', -256, 1, 5, 1571.48, -1690.26, 19.8381, 15, 7001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', 'Rank 8', 'Rank 9', 'Rank 10', 'Rank 11', 'Rank 12', 'Rank 13', 'Rank 14', 'Rank 15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5),
(2, ': แพทย์ :', -256, 3, 5, 1397.14, -30.6022, 1000.86, 0, 7002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', 'Rank 8', 'Rank 9', 'Rank 10', 'Rank 11', 'Rank 12', 'Rank 13', 'Rank 14', 'Rank 15', 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5),
(3, ': ช่างยนต์ :', -256, 6, 5, 1880.4, -1389.67, 14.3974, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', 'Rank 8', 'Rank 9', 'Rank 10', 'Rank 11', 'Rank 12', 'Rank 13', 'Rank 14', 'Rank 15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5);

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
(1, 1871.48, -1381.06, 14.3771);

-- --------------------------------------------------------

--
-- Table structure for table `garagevehs`
--

CREATE TABLE `garagevehs` (
  `garagevehID` int(11) NOT NULL,
  `garagevehX` float NOT NULL,
  `garagevehY` float NOT NULL,
  `garagevehZ` float NOT NULL,
  `garagevehInterior` int(11) NOT NULL,
  `garagevehWorld` int(11) NOT NULL,
  `garagevehType` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `garagevehs`
--

INSERT INTO `garagevehs` (`garagevehID`, `garagevehX`, `garagevehY`, `garagevehZ`, `garagevehInterior`, `garagevehWorld`, `garagevehType`) VALUES
(1, 682.912, -1546.17, 14.8516, 0, 0, 1),
(2, 680.815, -1450.42, 14.8516, 0, 0, 2),
(3, -1115.1, -1054.03, 129.219, 0, 0, 1),
(4, -1101.4, -1053.73, 129.212, 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

CREATE TABLE `gates` (
  `gateID` int(12) NOT NULL,
  `gateModel` int(12) DEFAULT 0,
  `gateSpeed` float DEFAULT 0,
  `gateTime` int(12) DEFAULT 0,
  `gateX` float DEFAULT 0,
  `gateY` float DEFAULT 0,
  `gateZ` float DEFAULT 0,
  `gateRX` float DEFAULT 0,
  `gateRY` float DEFAULT 0,
  `gateRZ` float DEFAULT 0,
  `gateInterior` int(12) DEFAULT 0,
  `gateWorld` int(12) DEFAULT 0,
  `gateMoveX` float DEFAULT 0,
  `gateMoveY` float DEFAULT 0,
  `gateMoveZ` float DEFAULT 0,
  `gateMoveRX` float DEFAULT 0,
  `gateMoveRY` float DEFAULT 0,
  `gateMoveRZ` float DEFAULT 0,
  `gateLinkID` int(12) DEFAULT 0,
  `gateFaction` int(12) DEFAULT 0,
  `gatePass` smallint(4) DEFAULT 0,
  `gateRadius` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

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
(1, 'location : ทางเข้าเมืองมาซารุเอ', 1657.16, -2286.54, -1.2132, 1),
(2, 'location : สถานีตำรวจ', 1535.22, -1674.81, 13.3828, 1),
(3, 'rentcar : จุดเบิกรถ [ทางเข้าเมื', 1729.51, -2300.22, -2.8516, 6),
(4, 'rentcar : จุดเบิกรถ [สถานีตำรวจ', 1536.11, -1665.27, 13.3828, 6),
(5, 'garage : การาจ [โรงพยาบาล]', 647.6, -1493.26, 14.8147, 4),
(6, 'location : โรงพยาบาล', 621.32, -1463.08, 14.4783, 1),
(7, 'location : อู่ช่างมาซารุ', 1857.62, -1377.93, 13.5625, 1),
(8, 'loaction : เลเบล [พื้นที่ไร้กฏห', 282.369, 2033.26, 17.6406, 1),
(9, 'location : ร้านพิซซ่า', 2089.59, -1806.4, 13.5469, 1),
(10, 'location : 24/7 ผุพัง', 1930.97, -1779.83, 13.5469, 1),
(11, 'location : คุกใหญ่', 1824.75, -1546.22, 13.4888, 1),
(12, 'location : สวนฟิวเจอร์-มาซารุ', -1193.7, -1040.14, 129.219, 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `objectt`
--

CREATE TABLE `objectt` (
  `ID` int(11) NOT NULL DEFAULT 0,
  `ObjectModel` int(11) NOT NULL DEFAULT 0,
  `ObjectPosX` float NOT NULL,
  `ObjectPosY` float NOT NULL,
  `ObjectPosZ` float NOT NULL,
  `ObjectPosRX` float NOT NULL,
  `ObjectPosRY` float NOT NULL,
  `ObjectPosRZ` float NOT NULL,
  `ObjectWolrd` int(11) NOT NULL DEFAULT 0,
  `Textrueindex` int(11) NOT NULL DEFAULT 0,
  `TextrueModel` int(11) DEFAULT 0,
  `Textrue_Name1` varchar(64) NOT NULL,
  `Textrue_Name2` varchar(64) NOT NULL,
  `Textrue_Color` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

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
(1, 1939.98, -1775.53, 13.3906);

-- --------------------------------------------------------

--
-- Table structure for table `rentcar`
--

CREATE TABLE `rentcar` (
  `rentcarID` int(11) NOT NULL,
  `rentcarX` float NOT NULL,
  `rentcarY` float NOT NULL,
  `rentcarZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rentcar`
--

INSERT INTO `rentcar` (`rentcarID`, `rentcarX`, `rentcarY`, `rentcarZ`) VALUES
(1, 1730.12, -2300.37, -2.8516),
(2, 1536.13, -1665.27, 13.3828);

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
(1, 1929.82, -1777.4, 13.5469, 0, 0, 1),
(2, -1159.55, -1057.54, 129.219, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trunklog`
--

CREATE TABLE `trunklog` (
  `giveID` int(15) NOT NULL,
  `givePlayerID` int(6) NOT NULL,
  `givePlayerName` varchar(32) NOT NULL,
  `giveItem` varchar(32) NOT NULL,
  `giveAmount` int(8) NOT NULL,
  `carID` int(6) NOT NULL,
  `giveTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

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

--
-- Dumping data for table `vehiclegang`
--

INSERT INTO `vehiclegang` (`ID`, `bPosX`, `bPosY`, `bPosZ`, `Leader`, `Slot1`, `Slot2`, `Slot3`, `Slot4`, `Slot5`, `Slot6`, `Slot7`, `Slot8`, `Slot9`, `Slot10`) VALUES
(0, 1585.21, -1671.8, 5.89241, 0, 1111, 596, 523, 599, 0, 0, 0, 0, 0, 0),
(1, 597.353, -1515.49, 15.108, 1, 1111, 586, 416, 0, 0, 0, 0, 0, 0, 0);

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
  `carTune` float NOT NULL DEFAULT 0,
  `carMoney` int(11) DEFAULT 0,
  `carRMoney` int(11) DEFAULT 0,
  `carKnuckles` int(11) DEFAULT 0,
  `carFlower` int(11) DEFAULT 0,
  `carDildo` int(11) DEFAULT 0,
  `carPool` int(11) DEFAULT 0,
  `carGolf` int(11) DEFAULT 0,
  `carSholver` int(11) DEFAULT 0,
  `carKatana` int(11) DEFAULT 0,
  `carPDbong` int(11) DEFAULT 0,
  `carWooden` int(11) DEFAULT 0,
  `carKnife` int(11) DEFAULT 0,
  `carGunShot` int(11) DEFAULT 0,
  `carAmmo` int(11) DEFAULT 0,
  `carProtect` int(11) DEFAULT 0,
  `carShrkKnife` int(11) DEFAULT 0,
  `carBasball` int(11) DEFAULT 0,
  `carMangoPack` int(11) DEFAULT 0,
  `carTomatoPack` int(11) DEFAULT 0,
  `carLyncheePack` int(11) DEFAULT 0,
  `carCoconutPack` int(11) DEFAULT 0,
  `carApplePack` int(11) DEFAULT 0,
  `carFishGou` int(11) DEFAULT 0,
  `carFishChon` int(11) DEFAULT 0,
  `carFishDolly` int(11) DEFAULT 0,
  `carFishNil` int(11) DEFAULT 0,
  `carFishKrapong` int(11) DEFAULT 0,
  `carFishTaptim` int(11) DEFAULT 0,
  `carFishDuk` int(11) DEFAULT 0,
  `carFishToona` int(11) DEFAULT 0,
  `carFishSalmon` int(11) DEFAULT 0,
  `carFishKraben` int(11) DEFAULT 0,
  `carFishShark` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

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
  ADD PRIMARY KEY (`playerID`),
  ADD UNIQUE KEY `Username` (`playerName`);

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
  MODIFY `arrestID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atm`
--
ALTER TABLE `atm`
  MODIFY `atmID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buycar`
--
ALTER TABLE `buycar`
  MODIFY `buycarID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carshop`
--
ALTER TABLE `carshop`
  MODIFY `carshopID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contactID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entrances`
--
ALTER TABLE `entrances`
  MODIFY `entranceID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `factionID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `garages`
--
ALTER TABLE `garages`
  MODIFY `garageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `garagevehs`
--
ALTER TABLE `garagevehs`
  MODIFY `garagevehID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gates`
--
ALTER TABLE `gates`
  MODIFY `gateID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gps`
--
ALTER TABLE `gps`
  MODIFY `gpsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `houseID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `icu`
--
ALTER TABLE `icu`
  MODIFY `icuID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `invID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `playerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pumps`
--
ALTER TABLE `pumps`
  MODIFY `pumpID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rentcar`
--
ALTER TABLE `rentcar`
  MODIFY `rentcarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `shopID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `carID` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
