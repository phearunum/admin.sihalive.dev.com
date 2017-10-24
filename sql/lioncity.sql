-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-12-02 12:00:21
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lioncity`
--

-- --------------------------------------------------------

--
-- 表的结构 `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `em_id` int(11) NOT NULL AUTO_INCREMENT,
  `em_name` varchar(50) NOT NULL,
  `em_country` char(2) NOT NULL,
  `em_is_leaving` enum('0','1') NOT NULL,
  `em_leaving_datetime` datetime NOT NULL,
  `em_add_datetime` datetime NOT NULL,
  PRIMARY KEY (`em_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `employee`
--

INSERT INTO `employee` (`em_id`, `em_name`, `em_country`, `em_is_leaving`, `em_leaving_datetime`, `em_add_datetime`) VALUES
(1, '11', '1', '0', '0000-00-00 00:00:00', '2016-12-01 14:04:54'),
(2, '11', '1', '0', '0000-00-00 00:00:00', '2016-12-01 14:07:47'),
(3, '11', '1', '0', '0000-00-00 00:00:00', '2016-12-01 14:08:27'),
(4, '11', '1', '0', '0000-00-00 00:00:00', '2016-12-01 14:09:17'),
(5, '11', '1', '0', '0000-00-00 00:00:00', '2016-12-01 14:09:45'),
(6, '11', '1', '0', '0000-00-00 00:00:00', '2016-12-01 14:10:32'),
(7, '111', 'kh', '0', '0000-00-00 00:00:00', '2016-12-01 14:47:46');

-- --------------------------------------------------------

--
-- 表的结构 `handlog_action`
--

CREATE TABLE IF NOT EXISTS `handlog_action` (
  `ha_id` int(11) DEFAULT NULL,
  `ht_id` int(11) NOT NULL,
  `ht_position` char(3) NOT NULL,
  `ht_action` varchar(10) NOT NULL,
  `ht_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `handlog_card`
--

CREATE TABLE IF NOT EXISTS `handlog_card` (
  `hc_id` int(11) NOT NULL AUTO_INCREMENT,
  `ht_id` int(11) NOT NULL,
  `flop_card_1` char(1) NOT NULL,
  `flop_color_1` char(1) NOT NULL,
  `flop_card_2` char(1) NOT NULL,
  `flop_color_2` char(1) NOT NULL,
  `flop_card_3` char(1) NOT NULL,
  `flop_color_3` char(1) NOT NULL,
  `turn_card` char(1) NOT NULL,
  `turn_color` char(1) NOT NULL,
  `river_card` char(1) NOT NULL,
  `river_color` char(1) NOT NULL,
  `flop_pool` int(11) NOT NULL,
  `turn_pool` int(11) NOT NULL,
  `river_pool` int(11) NOT NULL,
  PRIMARY KEY (`hc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `handlog_title`
--

CREATE TABLE IF NOT EXISTS `handlog_title` (
  `ht_id` int(11) NOT NULL AUTO_INCREMENT,
  `ht_write` varchar(50) NOT NULL,
  `ht_player_nums` int(11) NOT NULL,
  `ht_write_ position` char(3) NOT NULL,
  `ht_add_time` datetime NOT NULL,
  PRIMARY KEY (`ht_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `player`
--

CREATE TABLE IF NOT EXISTS `player` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(50) NOT NULL,
  `p_country` char(2) NOT NULL DEFAULT 'NA',
  `p_add_time` datetime NOT NULL,
  `p_isban` enum('0','1') NOT NULL DEFAULT '0',
  `m_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `p_name` (`p_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `player`
--

INSERT INTO `player` (`p_id`, `p_name`, `p_country`, `p_add_time`, `p_isban`, `m_id`) VALUES
(1, 'tryion', 'TW', '2016-11-29 02:05:10', '0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(50) NOT NULL,
  `m_isdel` enum('0','1') NOT NULL DEFAULT '0',
  `m_add_time` datetime NOT NULL,
  PRIMARY KEY (`s_id`),
  UNIQUE KEY `m_name` (`m_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sales`
--

INSERT INTO `sales` (`s_id`, `m_name`, `m_isdel`, `m_add_time`) VALUES
(1, 'ann Kim', '0', '2016-11-17 11:12:21');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
