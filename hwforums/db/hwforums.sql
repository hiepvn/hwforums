-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 18, 2012 at 11:17 PM
-- Server version: 5.5.25a
-- PHP Version: 5.3.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hwforums`
--

-- --------------------------------------------------------

--
-- Table structure for table `GROUP`
--

CREATE TABLE IF NOT EXISTS `GROUP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` text NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `GROUP`
--

INSERT INTO `GROUP` (`id`, `groupname`, `permission`) VALUES
(1, 'Guest', 4),
(2, 'Member', 6),
(3, 'Admin', 7);

-- --------------------------------------------------------

--
-- Table structure for table `POST`
--

CREATE TABLE IF NOT EXISTS `POST` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `datecreate` datetime NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `POST`
--

INSERT INTO `POST` (`id`, `thread`, `owner`, `datecreate`, `title`, `content`) VALUES
(1, 1, 1, '2012-08-02 02:27:05', 'post 11111111111', 'post 11111111111post 11111111111post 11111111111post 11111111111post 11111111111post 11111111111post 11111111111post 11111111111post 11111111111post 11111111111post 11111111111post 11111111111post 11111111111post 11111111111'),
(2, 1, 1, '2012-08-11 00:00:00', 'post 2222222222222', 'post 2222222222222post 2222222222222post 2222222222222post 2222222222222post 2222222222222post 2222222222222post 2222222222222'),
(3, 1, 2, '2012-08-09 02:09:00', 'tttttttttttttttt', 'tvgrefdsfds fds fs fds stvgrefdsfds fds fs fds s\r\ntvgrefdsfds fds fs fds stvgrefdsfds fds fs fds stvgrefdsfds fds fs fds stvgrefdsfds fds fs fds stvgrefdsfds fds fs fds stvgrefdsfds fds fs fds stvgrefdsfds fds fs fds stvgrefdsfds fds fs fds s'),
(4, 10, 1, '2012-08-18 11:49:01', 'com ca loc binh dan de eeeeee', ' asd as da dsa d'),
(6, 2, 3, '2012-08-18 13:11:54', 'asdasd', ' ad'),
(7, 2, 3, '2012-08-18 13:12:06', 'ddddddddddddddddd', ' dddddddddddsa dsa das                   dsad'),
(18, 4, 3, '2012-08-18 13:19:00', 'sdf', ' sdf'),
(19, 1, 3, '2012-08-18 15:24:43', 'im guest', 'guestsa das da '),
(20, 1, 3, '2012-08-18 15:25:13', 'fgh gf', ' hgf '),
(21, 2, 3, '2012-08-18 15:26:53', 'dsf', ' sdf '),
(22, 12, 3, '2012-08-18 16:17:30', '10sd ds fsdf ', ' sdf'),
(23, 13, 3, '2012-08-18 16:17:36', 'df sdf sdfg ', ' sdfg '),
(24, 14, 3, '2012-08-18 16:18:06', '11 edsf ', ' sdf '),
(25, 15, 3, '2012-08-18 16:18:11', '12 ds ', ' df '),
(26, 3, 3, '2012-08-18 18:06:26', 'df sdf sdfgsdf', ' sdf'),
(27, 16, 3, '2012-08-18 19:29:45', 'fgdhgfdh', ' dfgh'),
(28, 17, 3, '2012-08-18 19:31:06', 'sdffsdf', ' sdf'),
(29, 18, 3, '2012-08-18 22:46:40', '13  this is tittle ', '13 content content content content content content \r\n13 content content content content content content \r\n13 content content content content content content \r\n13 content content content content content content '),
(30, 19, 2, '2012-08-18 22:48:59', 'asd adsa dadf fd  14', ' asd'),
(31, 20, 3, '2012-08-18 23:01:14', 'asd', ' asd'),
(32, 21, 3, '2012-08-18 23:01:30', 'sdfd f4sf', ' sdf'),
(33, 21, 3, '2012-08-18 23:01:44', 'dfgh', ' arg'),
(34, 21, 3, '2012-08-18 23:03:22', 'sdfd f4sd', ' sdfsdf'),
(35, 22, 2, '2012-08-18 23:08:42', 'daf', ' sdf'),
(36, 23, 3, '2012-08-18 23:11:01', 'title', 'content  content content content content content '),
(37, 23, 3, '2012-08-18 23:11:44', 'title reply ', ' content reply content reply content reply content reply'),
(38, 23, 3, '2012-08-18 23:12:10', 'hiepav reply', 'content '),
(39, 24, 2, '2012-08-18 23:12:37', 'hiepav thread', 'content '),
(40, 25, 3, '2012-08-18 23:14:34', 'new thread', 'content  content content content '),
(41, 25, 3, '2012-08-18 23:14:55', 'this is reply', 'content reply  content reply content reply content reply '),
(42, 25, 2, '2012-08-18 23:15:17', 'hiepav reply', 'hiepav content  '),
(43, 26, 2, '2012-08-18 23:15:34', 'hiepav thread', 'content '),
(44, 26, 15, '2012-08-18 23:16:52', 'hung reply', 'content '),
(45, 26, 3, '2012-08-18 23:17:11', 'im guest', 'GUEST REPLY ');

-- --------------------------------------------------------

--
-- Table structure for table `THREAD`
--

CREATE TABLE IF NOT EXISTS `THREAD` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `owner` int(11) NOT NULL,
  `datecreate` datetime NOT NULL,
  `topic` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `THREAD`
--

INSERT INTO `THREAD` (`id`, `title`, `owner`, `datecreate`, `topic`) VALUES
(1, 'The test thread', 1, '2012-08-02 00:22:11', 1),
(2, '222222222222222222222', 1, '2012-08-06 06:10:04', 1),
(3, '333333333333333333333333333333', 2, '2012-08-11 09:08:00', 2),
(4, 'asd', 1, '2012-08-18 11:26:50', 1),
(5, 'sdfd f4 ', 1, '2012-08-18 11:27:25', 1),
(6, 'asd adsa da', 1, '2012-08-18 11:34:52', 1),
(7, 'asd adsa dadf fd', 1, '2012-08-18 11:35:04', 1),
(8, 'may tinh gia re hpit', 1, '2012-08-18 11:46:11', 1),
(9, 'gia re binh dan ', 1, '2012-08-18 11:47:29', 1),
(10, 'com ca loc binh dan de eeeeee', 1, '2012-08-18 11:49:01', 1),
(12, '10sd ds fsdf ', 3, '2012-08-18 16:17:29', 1),
(13, 'df sdf sdfg ', 3, '2012-08-18 16:17:36', 1),
(14, '11 edsf ', 3, '2012-08-18 16:18:06', 1),
(15, '12 ds ', 3, '2012-08-18 16:18:10', 1),
(16, 'fgdhgfdh', 3, '2012-08-18 19:29:45', 2),
(17, 'sdffsdf', 3, '2012-08-18 19:31:05', 2),
(18, '13  this is tittle ', 3, '2012-08-18 22:46:40', 1),
(19, 'asd adsa dadf fd  14', 2, '2012-08-18 22:48:59', 1),
(20, 'asd', 3, '2012-08-18 23:01:14', 2),
(21, 'sdfd f4sf', 3, '2012-08-18 23:01:30', 2),
(22, 'daf', 2, '2012-08-18 23:08:42', 4),
(23, 'title', 3, '2012-08-18 23:11:00', 3),
(24, 'hiepav thread', 2, '2012-08-18 23:12:37', 3),
(25, 'new thread', 3, '2012-08-18 23:14:33', 3),
(26, 'hiepav thread', 2, '2012-08-18 23:15:34', 4);

-- --------------------------------------------------------

--
-- Table structure for table `TOPIC`
--

CREATE TABLE IF NOT EXISTS `TOPIC` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `TOPIC`
--

INSERT INTO `TOPIC` (`id`, `name`, `parent_id`) VALUES
(1, 'Vi tinh', 0),
(2, 'Xe may', 0),
(3, 'Thoi trang', 0),
(4, 'Mi pham', 0),
(5, 'May tinh de ban', 1),
(6, 'Laptop', 1),
(7, 'Honda', 2),
(8, 'Converse', 3);

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE IF NOT EXISTS `USER` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `fullname` text NOT NULL,
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usergroup` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`id`, `username`, `password`, `fullname`, `joindate`, `usergroup`, `active`) VALUES
(1, 'admin', '123', 'Adminstrator', '2012-07-31 17:00:00', 0, 0),
(2, 'hiepav', '123', 'Vo Nguyen Hiep', '2012-07-31 17:00:00', 0, 0),
(3, 'Guest', '', 'Guest', '2012-07-31 17:00:00', 0, 0),
(13, 'asd', 'asd', 'asd', '2012-08-12 07:13:35', 2, 0),
(14, 'abc', 'abc', 'abc', '2012-08-12 07:17:47', 2, 0),
(15, 'hung', '123', 'Vo Nguyen Hung', '2012-08-18 16:16:36', 2, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
