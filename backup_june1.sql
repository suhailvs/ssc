-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: 127.13.156.2:3306
-- Generation Time: Jun 01, 2014 at 12:23 PM
-- Server version: 5.5.37
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ssc`
--

-- --------------------------------------------------------

--
-- Table structure for table `appexam_optcorrect`
--

CREATE TABLE IF NOT EXISTS `appexam_optcorrect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` int(11) NOT NULL,
  `opt` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question` (`question`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `appexam_optcorrect`
--

INSERT INTO `appexam_optcorrect` (`id`, `question`, `opt`) VALUES
(1, 2, 2),
(2, 6, 4),
(3, 9, 2),
(4, 4, 2),
(5, 7, 1),
(6, 5, 4),
(7, 1, 4),
(8, 12, 3),
(9, 11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `appexam_score`
--

CREATE TABLE IF NOT EXISTS `appexam_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `tag` varchar(100) NOT NULL,
  `started_time` datetime NOT NULL,
  `finished_time` datetime NOT NULL,
  `total_questions` int(11) NOT NULL,
  `total_correct` int(11) NOT NULL,
  `total_wrong` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appexam_score_6340c63c` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `appexam_score`
--

INSERT INTO `appexam_score` (`id`, `user_id`, `tag`, `started_time`, `finished_time`, `total_questions`, `total_correct`, `total_wrong`) VALUES
(1, 5, 'multitasking', '2014-05-31 06:09:07', '2014-05-31 06:09:07', 7, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$ORbc5wcwCMzR$VSycpSSjUkGN1RWxE72c2YVFApf3QqtJdYSAHQvNLW4=', '2014-05-28 07:01:27', 1, 'suhail', '', '', 'suhailvs1@gmail.com', 1, 1, '2014-05-23 07:17:33'),
(2, 'pbkdf2_sha256$12000$w5zvdI4OkpgJ$HTxHrQrfMGjQIKwa6TltDQ5kFSn78WP5sXjPdzM8V0w=', '2014-05-28 06:14:21', 0, 'suhailvs', '', '', 'suhailvs0@gmail.com', 0, 1, '2014-05-23 07:20:39'),
(3, 'pbkdf2_sha256$12000$tWayBrcQzlFK$PYpySoZDZph42H1nb0+am0/Z95efuE1Au9DitshtvH4=', '2014-05-25 03:46:05', 0, 'sumeshcjacob', '', '', 'sumeshcjacob@gmail.com', 0, 1, '2014-05-25 03:46:02'),
(4, 'pbkdf2_sha256$12000$M24VBs8R9Gnw$wG8HXAVUVqk3QXzGRKJoTMA3Y8NW32PMaDITAFjXBFE=', '2014-05-31 05:54:40', 0, 'sibi4586', '', '', 'sibi4586@gmail.com', 0, 1, '2014-05-31 05:54:38'),
(5, 'pbkdf2_sha256$12000$Frd8PaHZTZeO$M5RCo8nf+Nn2fRXYtVdZHniZZ6jH+iMJT+xA/iXaRxE=', '2014-05-31 06:38:40', 0, 'falsetrue', '', '', 'suhailvs@gmail.com', 0, 1, '2014-05-31 05:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `forum_action`
--

CREATE TABLE IF NOT EXISTS `forum_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `real_user_id` int(11) DEFAULT NULL,
  `ip` varchar(39) NOT NULL,
  `node_id` int(11) DEFAULT NULL,
  `action_type` varchar(32) NOT NULL,
  `action_date` datetime NOT NULL,
  `extra` longtext,
  `canceled` tinyint(1) NOT NULL,
  `canceled_by_id` int(11) DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `canceled_ip` varchar(39) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_action_6340c63c` (`user_id`),
  KEY `forum_action_12fa9e6f` (`real_user_id`),
  KEY `forum_action_e453c5c5` (`node_id`),
  KEY `forum_action_6ce7ee9e` (`canceled_by_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `forum_action`
--

INSERT INTO `forum_action` (`id`, `user_id`, `real_user_id`, `ip`, `node_id`, `action_type`, `action_date`, `extra`, `canceled`, `canceled_by_id`, `canceled_at`, `canceled_ip`) VALUES
(1, 1, NULL, '127.13.156.1', NULL, 'userjoins', '2014-05-23 07:17:33', NULL, 0, NULL, NULL, ''),
(2, 1, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-23 07:17:33', NULL, 0, NULL, NULL, ''),
(3, 2, NULL, '127.13.156.1', NULL, 'userjoins', '2014-05-23 07:20:39', NULL, 0, NULL, NULL, ''),
(4, 2, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-23 07:20:41', NULL, 0, NULL, NULL, ''),
(5, 2, NULL, '127.13.156.1', 1, 'ask', '2014-05-23 07:27:58', NULL, 0, NULL, NULL, ''),
(6, 2, NULL, '127.13.156.1', 2, 'ask', '2014-05-23 07:31:02', NULL, 0, NULL, NULL, ''),
(7, 2, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-23 08:20:26', NULL, 0, NULL, NULL, ''),
(8, 3, NULL, '127.13.156.1', NULL, 'userjoins', '2014-05-25 03:46:02', NULL, 0, NULL, NULL, ''),
(9, 3, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-25 03:46:05', NULL, 0, NULL, NULL, ''),
(10, 3, NULL, '127.13.156.1', 3, 'answer', '2014-05-25 03:47:29', NULL, 0, NULL, NULL, ''),
(11, 3, NULL, '127.13.156.1', 3, 'revise', '2014-05-25 03:49:26', 'T[int]2', 0, NULL, NULL, ''),
(12, 3, NULL, '', NULL, 'award', '2014-05-25 03:49:26', NULL, 0, NULL, NULL, ''),
(13, 1, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-25 19:58:25', NULL, 0, NULL, NULL, ''),
(14, 1, NULL, '127.13.156.1', 3, 'revise', '2014-05-25 20:02:39', 'T[int]3', 0, NULL, NULL, ''),
(15, 1, NULL, '', NULL, 'award', '2014-05-25 20:02:40', NULL, 0, NULL, NULL, ''),
(16, 1, NULL, '127.13.156.1', 3, 'revise', '2014-05-25 20:04:04', 'T[int]4', 0, NULL, NULL, ''),
(17, 1, NULL, '127.13.156.1', 3, 'revise', '2014-05-25 20:04:23', 'T[int]5', 0, NULL, NULL, ''),
(18, 1, NULL, '127.13.156.1', 3, 'rollback', '2014-05-25 20:04:40', 'T[str]5:4', 0, NULL, NULL, ''),
(19, 1, NULL, '', NULL, 'award', '2014-05-25 20:04:40', NULL, 0, NULL, NULL, ''),
(20, 1, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-27 03:14:03', NULL, 0, NULL, NULL, ''),
(21, 1, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-27 09:05:26', NULL, 0, NULL, NULL, ''),
(22, 1, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-27 12:50:47', NULL, 0, NULL, NULL, ''),
(23, 2, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-27 13:42:21', NULL, 0, NULL, NULL, ''),
(24, 2, NULL, '127.13.156.1', 3, 'acceptanswer', '2014-05-27 13:43:27', NULL, 0, NULL, NULL, ''),
(25, 2, NULL, '', NULL, 'award', '2014-05-27 13:43:28', NULL, 0, NULL, NULL, ''),
(26, 1, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-28 00:32:58', NULL, 0, NULL, NULL, ''),
(27, 2, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-28 06:14:21', NULL, 0, NULL, NULL, ''),
(28, 2, NULL, '127.13.156.1', 4, 'ask', '2014-05-28 06:15:46', NULL, 0, NULL, NULL, ''),
(29, 2, NULL, '127.13.156.1', 5, 'ask', '2014-05-28 06:17:03', NULL, 0, NULL, NULL, ''),
(30, 2, NULL, '127.13.156.1', 6, 'ask', '2014-05-28 06:17:37', NULL, 0, NULL, NULL, ''),
(31, 2, NULL, '127.13.156.1', 7, 'ask', '2014-05-28 06:18:39', NULL, 0, NULL, NULL, ''),
(32, 1, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-28 07:01:27', NULL, 0, NULL, NULL, ''),
(33, 4, NULL, '127.13.156.1', NULL, 'userjoins', '2014-05-31 05:54:39', NULL, 0, NULL, NULL, ''),
(34, 4, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-31 05:54:40', NULL, 0, NULL, NULL, ''),
(35, 5, NULL, '127.13.156.1', NULL, 'userjoins', '2014-05-31 05:58:14', NULL, 0, NULL, NULL, ''),
(36, 5, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-31 05:58:15', NULL, 0, NULL, NULL, ''),
(37, 4, NULL, '127.13.156.1', 8, 'answer', '2014-05-31 05:59:56', NULL, 0, NULL, NULL, ''),
(38, 4, NULL, '127.13.156.1', 4, 'favorite', '2014-05-31 06:00:27', NULL, 1, 4, '2014-05-31 06:00:30', '127.13.156.1'),
(39, 5, NULL, '127.13.156.1', 9, 'ask', '2014-05-31 06:01:19', NULL, 0, NULL, NULL, ''),
(40, 4, NULL, '127.13.156.1', 10, 'answer', '2014-05-31 06:10:07', NULL, 0, NULL, NULL, ''),
(41, 5, NULL, '127.13.156.1', NULL, 'userlogin', '2014-05-31 06:38:40', NULL, 0, NULL, NULL, ''),
(42, 5, NULL, '127.13.156.1', 11, 'ask', '2014-05-31 06:45:20', NULL, 0, NULL, NULL, ''),
(43, 5, NULL, '127.13.156.1', 11, 'revise', '2014-05-31 06:45:54', 'T[int]2', 0, NULL, NULL, ''),
(44, 5, NULL, '', NULL, 'award', '2014-05-31 06:45:55', NULL, 0, NULL, NULL, ''),
(45, 5, NULL, '127.13.156.1', 12, 'ask', '2014-05-31 06:46:50', NULL, 0, NULL, NULL, ''),
(46, 5, NULL, '127.13.156.1', 12, 'revise', '2014-05-31 06:47:26', 'T[int]2', 0, NULL, NULL, ''),
(47, 5, NULL, '127.13.156.1', 11, 'revise', '2014-05-31 06:48:36', 'T[int]3', 0, NULL, NULL, ''),
(48, 5, NULL, '127.13.156.1', 13, 'ask', '2014-05-31 07:34:57', NULL, 0, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `forum_actionrepute`
--

CREATE TABLE IF NOT EXISTS `forum_actionrepute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `by_canceled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_actionrepute_e7c54ddc` (`action_id`),
  KEY `forum_actionrepute_6340c63c` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `forum_actionrepute`
--

INSERT INTO `forum_actionrepute` (`id`, `action_id`, `date`, `user_id`, `value`, `by_canceled`) VALUES
(1, 1, '2014-05-23 07:17:33', 1, 1, 0),
(2, 3, '2014-05-23 07:20:39', 2, 1, 0),
(3, 8, '2014-05-25 03:46:02', 3, 1, 0),
(4, 24, '2014-05-27 13:43:27', 2, 2, 0),
(5, 24, '2014-05-27 13:43:27', 3, 15, 0),
(6, 33, '2014-05-31 05:54:39', 4, 1, 0),
(7, 35, '2014-05-31 05:58:14', 5, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `forum_authkeyuserassociation`
--

CREATE TABLE IF NOT EXISTS `forum_authkeyuserassociation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `provider` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `forum_authkeyuserassociation_6340c63c` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `forum_award`
--

CREATE TABLE IF NOT EXISTS `forum_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `node_id` int(11) DEFAULT NULL,
  `awarded_at` datetime NOT NULL,
  `trigger_id` int(11) DEFAULT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `action_id` (`action_id`),
  UNIQUE KEY `user_id` (`user_id`,`badge_id`,`node_id`),
  KEY `forum_award_6340c63c` (`user_id`),
  KEY `forum_award_540bf7e8` (`badge_id`),
  KEY `forum_award_e453c5c5` (`node_id`),
  KEY `forum_award_9b771456` (`trigger_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `forum_award`
--

INSERT INTO `forum_award` (`id`, `user_id`, `badge_id`, `node_id`, `awarded_at`, `trigger_id`, `action_id`) VALUES
(1, 3, 18, NULL, '2014-05-25 03:49:26', 11, 12),
(2, 1, 18, NULL, '2014-05-25 20:02:40', 14, 15),
(3, 1, 20, NULL, '2014-05-25 20:04:40', 18, 19),
(4, 2, 19, NULL, '2014-05-27 13:43:28', 24, 25),
(5, 5, 18, NULL, '2014-05-31 06:45:55', 43, 44);

-- --------------------------------------------------------

--
-- Table structure for table `forum_badge`
--

CREATE TABLE IF NOT EXISTS `forum_badge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `cls` varchar(50) DEFAULT NULL,
  `awarded_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `forum_badge`
--

INSERT INTO `forum_badge` (`id`, `type`, `cls`, `awarded_count`) VALUES
(1, 3, 'PopularQuestion', 0),
(2, 2, 'NotableQuestion', 0),
(3, 1, 'FamousQuestion', 0),
(4, 3, 'NiceQuestion', 0),
(5, 2, 'GoodQuestion', 0),
(6, 1, 'GreatQuestion', 0),
(7, 3, 'NiceAnswer', 0),
(8, 2, 'GoodAnswer', 0),
(9, 1, 'GreatAnswer', 0),
(10, 2, 'FavoriteQuestion', 0),
(11, 1, 'StellarQuestion', 0),
(12, 3, 'Disciplined', 0),
(13, 3, 'PeerPressure', 0),
(14, 3, 'Critic', 0),
(15, 3, 'Supporter', 0),
(16, 3, 'CitizenPatrol', 0),
(17, 3, 'Organizer', 0),
(18, 3, 'Editor', 3),
(19, 3, 'Scholar', 1),
(20, 3, 'Cleanup', 1),
(21, 3, 'Autobiographer', 0),
(22, 2, 'CivicDuty', 0),
(23, 3, 'Pundit', 0),
(24, 3, 'SelfLearner', 0),
(25, 2, 'StrunkAndWhite', 0),
(26, 3, 'Student', 0),
(27, 3, 'Teacher', 0),
(28, 2, 'Enlightened', 0),
(29, 2, 'Guru', 0),
(30, 2, 'Necromancer', 0),
(31, 2, 'Taxonomist', 0),
(32, 3, 'ValidatedEmail', 0);

-- --------------------------------------------------------

--
-- Table structure for table `forum_flag`
--

CREATE TABLE IF NOT EXISTS `forum_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `reason` varchar(300) NOT NULL,
  `action_id` int(11) NOT NULL,
  `flagged_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `action_id` (`action_id`),
  UNIQUE KEY `user_id` (`user_id`,`node_id`),
  KEY `forum_flag_6340c63c` (`user_id`),
  KEY `forum_flag_e453c5c5` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `forum_keyvalue`
--

CREATE TABLE IF NOT EXISTS `forum_keyvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=185 ;

--
-- Dumping data for table `forum_keyvalue`
--

INSERT INTO `forum_keyvalue` (`id`, `key`, `value`) VALUES
(1, 'LATEST_UPDATES_DATETIME', 'eJxLTkksSS3JzE3lgjMKDLk0gtVjKgzMYypSUoG0GRAbArEFECcBsQkQp+oEq3OVBBUYcekBAP+AFTk='),
(2, 'UPDATE_MESSAGES_XML', 'T[str]'),
(3, 'FAQ_PAGE_TEXT', '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'),
(4, 'MAINTAINANCE_MODE', NULL),
(17, 'APP_DESCRIPTION', 'eJwViU0KwjAUBvc9xXcACXgE6UIFXQXcP5KvEpof7XuhHt90McPAvC66Qmoc6M4N30611KpiYxZjhDV4k2WBZ2Y4HuZWSlI9kj8p6nCvIfdIPHu2ZKJrqu8T5utj6OaHacFNn/Pk/jbsJ0A='),
(18, 'GOOGLE_ANALYTICS_KEY', 'T[str]'),
(19, 'SUPPORT_URL', 'T[str]'),
(20, 'CONTACT_URL', 'T[str]'),
(42, 'STORE_GREETING_IN_COOKIE', 'eJzzNDDk0gMAAwcA4w=='),
(43, 'SHOW_SUMMARY_ON_QUESTIONS_LIST', 'eJzzNDDg0gMAAwQA4g=='),
(44, 'RECENT_TAGS_SIZE', 'T[int]25'),
(45, 'RECENT_AWARD_SIZE', 'T[int]15'),
(46, 'FORM_EMPTY_QUESTION_BODY', 'eJzzNDDg0gMAAwQA4g=='),
(47, 'FORM_MIN_NUMBER_OF_TAGS', 'T[int]1'),
(48, 'FORM_MAX_NUMBER_OF_TAGS', 'T[int]5'),
(49, 'MIN_USERNAME_LENGTH', 'T[int]3'),
(50, 'DISCIPLINED_MIN_SCORE', 'T[int]3'),
(51, 'PEER_PRESSURE_MAX_SCORE', 'T[int]-3'),
(52, 'CIVIC_DUTY_VOTES', 'T[int]300'),
(53, 'PUNDIT_COMMENT_COUNT', 'T[int]10'),
(54, 'SELF_LEARNER_UP_VOTES', 'T[int]3'),
(55, 'STRUNK_AND_WHITE_EDITS', 'T[int]100'),
(56, 'ENLIGHTENED_UP_VOTES', 'T[int]10'),
(57, 'GURU_UP_VOTES', 'T[int]40'),
(58, 'NECROMANCER_DIF_DAYS', 'T[int]60'),
(59, 'NECROMANCER_UP_VOTES', 'T[int]5'),
(60, 'TAXONOMIST_USE_COUNT', 'T[int]50'),
(61, 'INCLUDE_ID_IN_USER_URLS', 'eJzzNDDk0gMAAwcA4w=='),
(62, 'APP_TITLE', 'T[unicode]SSC - Staff Selection Commission Exams Q&A Forum'),
(63, 'APP_KEYWORDS', 'T[unicode]SSC,StaffSelectionCommission,forum,community,exams,Multitasking,CGL,CHSL'),
(64, 'GOOGLE_SITEMAP_CODE', 'T[str]'),
(65, 'APP_FAVICON', 'T[str]/upfiles/favicon.ico'),
(66, 'USE_CUSTOM_CSS', 'eJzzNDDg0gMAAwQA4g=='),
(67, 'USE_CUSTOM_HEAD', 'eJzzNDDg0gMAAwQA4g=='),
(68, 'APP_SHORT_NAME', 'T[str]SSC'),
(69, 'USE_CUSTOM_HEADER', 'eJzzNDDg0gMAAwQA4g=='),
(70, 'ABOUT_PAGE_TEXT', 'eJxlU01zEzEMvfdXqDkw4GnScKZ0Bk5wgKEzHU5clLV218Qfi2wnLL8e2c7HFi47Xll6kt57/v4jb7dbVOqbJYwEXY4pOPOHII0mQqLfCYyXHwLUzngTE2MywQMySVkrb99PxARzyNChB6Uw7pUC9LqcfTwSy++vTLGUxzuJdsE58umM0lIPIZEk9oFr10sBhB6CRDhWTDkZhoYbN/BRrha5JeN0d16wDLUjYDqYSPo0mXEThwPpDTxdak+JSiUchpp5NGlsMGUiJksH9An2NB8Da2EpQBQka/oZ+pyy0IBdR7HNEXhA3xit8eyyxUQanHzZoN0sSXwutD/ESYboLMb4fhUY/UCrx6dX6KZ3Hx7uy+WjdEwEkuuCJq54uxlMkgC5nex9B2OYqM/WzrAWDTubtfFDEYgj2f629fvSyouibIZR6kVYGBh1xlIqI5jBC7osWRaobXMsMuzEMLKe/2+xlVJ7ZCekr1qTKRifRKXnkcRj7a/2Qa2v0A1VgEIWdo8j+bPgxRPVEULOvUSWrria4EzgosfrA/H8BjjkYZRlmHpLXardRESyxVSJxfP1INFiyexNml+I8jUsh/ZUtEWey+Di8usM/zh2DVEK28Naw09BkB1vl8Cf+/pgjiFbDdbsqUD2prgmJ5G2ULQrx/oaK/frM2KkZimleiZp6lOVay+EXkYQ80440GmZm+ntzeYv7LRkDw=='),
(71, 'APP_LOGO', 'T[str]/upfiles/logo_1.png'),
(72, 'USE_ANNOUNCEMENT_BAR', 'eJzzNDDg0gMAAwQA4g=='),
(73, 'SIDEBAR_UPPER_RENDER_MODE', 'T[str]markdown'),
(74, 'SIDEBAR_UPPER_TEXT', 'eJxNT71OwzAQ3vsUh8oAiWonHSshxFLBhKASHUIGJ74kBscX7AtR3x5HKWqXO+nu+/34HLMsU8VNccRqr2o25MBSS2WxLcsiL5f/eg3FO1qjKovwenh7gmcKbFx7gSzziOCxpr5Hp6FIkotqksxYaMgvAt0iIGAfL6PT6OE2z2RPjjvgDo2PSmfHgP4XfYAWeX7BF1WgyaGAAyLQ6GerwDhsqtNm3pHB4wDtaDRG47uOedhJOZlvIyj8KOGQpTZhsOokNdVBvrjAytqYKJ3jpeTSS/Z7cd0x1tjBv+I0iQmrZsGJ2PxRNY2JuRkfZqczZRspspcaGzValj1qo6TpVYtBXvEH166GfCX+ALiei2U='),
(75, 'SIDEBAR_UPPER_DONT_WRAP', 'eJzzNDDg0gMAAwQA4g=='),
(76, 'SIDEBAR_LOWER_RENDER_MODE', 'T[str]markdown'),
(77, 'SIDEBAR_LOWER_TEXT', 'eJxdUE1Lw0AQvfdXjASKDWw26kHaW68iSKl4UQ/bOG0Wk5l0dpbQf++uOaR6GXgz74t5+4h1XbuigGd0QtCzILgDR4WX/W47Xaf52iK8l2Vew4iH4BXL8vO2VR021o7jWHE4u4pQ7Qocfc1k/+2vmQn+oabEk6BTEAwcpcEAytBiN8CFI3T/i2kq8mvMAxJMEtgttxAuQbGvcvATe5qJTev05qpCj+rmCueIQT2TfVxbH0xSCRpHhqnzhCaLjTD3hsV4afKCCDtzTDibFA/1/Wr60WK4W1Q/r6ZxHA=='),
(78, 'SIDEBAR_LOWER_DONT_WRAP', 'eJzzNDDg0gMAAwQA4g=='),
(79, 'RESERVED_USERNAMES', 'eJwVzUsSwkAIBNA9J8kqJUnUeJHZUwE/5cxIZRLN8W12jwaqu+xM6b4vb/KBJLXnayMfIWmNfIrIDvJzJKrkF8A0jq6xk6+Rz5Batg2+wUWqPGA+YdhdJRbMGFYrn/jg6Kr2g9DV/wHexCkV'),
(80, 'EMAIL_UNIQUE', 'eJzzNDDk0gMAAwcA4w=='),
(81, 'ALLOW_NEGATIVE_REPUTATION', 'eJzzNDDk0gMAAwcA4w=='),
(82, 'INITIAL_REP', 'T[int]1'),
(83, 'EMAIL_SUBJECT_PREFIX', 'T[str]CEXAM'),
(84, 'EMAIL_PARAGRAPH_STYLE', 'eJw1jDEOwjAMAPe+IipDl6QiggG5H2DnBVblNJZcJ0pSRHk9FYjb7oZ79HOSVOB0+TKFpM0FXFl2GCLJkxrPaJQ2GqzBwijW3P/dmopaXaXCYRJWcpF4iQ38Lb9+r8pvAn89dMWysLqWMvjz4X2XfTd+ACjNK70='),
(85, 'EMAIL_ANCHOR_STYLE', 'T[str]text-decoration:none;color:#3060a8;font-weight:bold;'),
(86, 'EMAIL_BORDER_COLOR', 'T[str]#e5ebf8'),
(87, 'EMAIL_FOOTER_TEXT', 'T[str]Wishes from cexam'),
(88, 'EMAIL_HOST', 'T[str]smtp.gmail.com'),
(89, 'DONT_NOTIFY_UNVALIDATED', 'eJzzNDDk0gMAAwcA4w=='),
(90, 'ALLOW_UNICODE_IN_SLUGS', 'eJzzNDDg0gMAAwQA4g=='),
(91, 'EMAIL_HOST_USER', 'T[str]suhailvs@gmail.com'),
(92, 'EMAIL_HOST_PASSWORD', 'T[str]pnaoeogqwtqlgusd'),
(93, 'ONLINE_USERS', 'eJzTSNEDAAFxALs='),
(94, 'SHOW_INTERESTING_TAGS_BOX', 'eJzzNDDk0gMAAwcA4w=='),
(95, 'TEST_EMAIL_SETTINGS', 'T[str]'),
(96, 'EMAIL_PORT', 'T[int]587'),
(97, 'EMAIL_USE_TLS', 'eJzzNDDk0gMAAwcA4w=='),
(98, 'DEFAULT_FROM_EMAIL', 'T[str]noreplay@cexam.net'),
(99, 'DEFAULT_REPLY_TO_EMAIL', 'T[str]noreplay@cexam.net'),
(100, 'SEND_DIGEST_ONLY_TO_ACTIVE_USERS', 'eJzzNDDk0gMAAwcA4w=='),
(101, 'SEND_DIGEST_ONLY_TO_VALIDATED_USERS', 'eJzzNDDk0gMAAwcA4w=='),
(102, 'DJSTYLE_ADMIN_INTERFACE', 'eJzzNDDg0gMAAwQA4g=='),
(103, 'STATIC_PAGE_REGISTRY', 'eJzTSNEDAAFxALs='),
(104, 'SETTINGS_PACK', 'T[str]default'),
(105, 'USER_REPUTATION_TO_MAX_VOTES', 'eJzzNDDk0gMAAwcA4w=='),
(106, 'MAX_VOTES_PER_DAY', 'T[int]30'),
(107, 'TRUNCATE_USERNAMES_LONGER_THAN', 'T[int]15'),
(108, 'SHOW_STATUS_DIAMONDS', 'eJzzNDDk0gMAAwcA4w=='),
(109, 'GRAVATAR_DEFAULT_IMAGE', 'T[str]identicon'),
(110, 'GRAVATAR_ALLOWED_RATING', 'T[str]g'),
(111, 'CAPTCHA_IF_REP_LESS_THAN', 'T[int]0'),
(112, 'WIKI_ON', 'eJzzNDDk0gMAAwcA4w=='),
(113, 'REQUIRE_EMAIL_VALIDATION_TO', 'eJzTyNEDAAGBAMM='),
(114, 'QUESTION_TITLE_TIPS', 'eJxNjb0KwkAQhPs8xdQHSnwECwvBIkWwEmTNbczi/cS7vYCQhzcqBNv5Zr45X0pd14QNjKH8AOFZOKvEgMSOJwoKjdCBMe+b5toe29NhRhe9L0H0Zcwq+HRU1DF8yYobQ8I37GPyiP2fe92MKU5iGRxiuQ+wrCQur3hxdI4pgYJdPkMnmX+wGnfV9g173D7z'),
(115, 'QUESTION_TAG_TIPS', 'eJxdzsEKgkAQBuC7T/E/QIk9gkFGBxXMokOwrLm1C5tr7mwi+PBtKAldhpmBb+Y/X10URRxrlPxhwTuB3nS1BUlO6JXWIOGLISk6i/67JaksXk5YUqaB73llHIXLJSmGiUqh24nirpoag3HdTy4gXq7deAPJ3wKuBRmMSV6kLI0vLDul213B8oSV8f44gnzcFSpHUISnszQxH08L7qdZHrJ/Ob8N2k0QfgB95VVh'),
(116, 'FORM_MIN_QUESTION_TITLE', 'T[int]10'),
(117, 'FORM_MIN_QUESTION_BODY', 'T[int]10'),
(118, 'FORM_MAX_LENGTH_OF_TAG', 'T[int]20'),
(119, 'FORM_MIN_LENGTH_OF_TAG', 'T[int]1'),
(120, 'LIMIT_TAG_CREATION', 'eJzzNDDg0gMAAwQA4g=='),
(121, 'MERGE_MAPPINGS', 'eJzTSNEDAAFxALs='),
(122, 'FORCE_SINGLE_URL', 'eJzzNDDk0gMAAwcA4w=='),
(123, 'POPULAR_QUESTION_VIEWS', 'T[int]1000'),
(124, 'NOTABLE_QUESTION_VIEWS', 'T[int]2500'),
(125, 'FAMOUS_QUESTION_VIEWS', 'T[int]10000'),
(126, 'DISABLE_ACCEPTING_FEATURE', 'eJzzNDDg0gMAAwQA4g=='),
(127, 'SUMMARY_LENGTH', 'T[int]300'),
(128, 'EMBED_YOUTUBE_VIDEOS', 'eJzzNDDk0gMAAwcA4w=='),
(129, 'REP_TO_CLOSE_OWN', 'T[int]250'),
(130, 'REP_TO_CLOSE_OTHERS', 'T[int]3000'),
(131, 'SHOW_USER_ACCEPT_RATE', 'eJzzNDDk0gMAAwcA4w=='),
(132, 'FREEZE_ACCEPT_RATE_FOR', 'eJzTyCkw5ApWT0zJzcxT5yow4krUAwA1zAUv'),
(133, 'SHOW_LATEST_COMMENTS_FIRST', 'eJzzNDDg0gMAAwQA4g=='),
(134, 'CANNED_COMMENTS', 'eJxFjTsOwkAMRPucYrpQoJXgDhQ0fBQQtZU4WUurrON1QNyeTUU782beLumh6doXw3hZxRiUEjQXl3kq8IxI7xqiT0y2R1HuZZQe9+epe5yvF8gMjwwXT4xROA0BtwoXBg/itZQCkyk66EPf7dJYo23Af0ilOtSysmFZuerzHNpGjw2FHzyJOK8='),
(135, 'FORM_MIN_COMMENT_BODY', 'T[int]10'),
(136, 'FORM_MAX_COMMENT_BODY', 'T[int]600'),
(137, 'FORM_GRAVATAR_IN_COMMENTS', 'eJzzNDDg0gMAAwQA4g=='),
(138, 'LIMIT_RELATED_TAGS', 'T[int]0'),
(139, 'FAVORITE_QUESTION_FAVS', 'T[int]25'),
(140, 'GOOD_ANSWER_VOTES_UP', 'T[int]25'),
(141, 'GOOD_QUESTION_VOTES_UP', 'T[int]25'),
(142, 'GREAT_ANSWER_VOTES_UP', 'T[int]100'),
(143, 'GREAT_QUESTION_VOTES_UP', 'T[int]100'),
(144, 'NICE_ANSWER_VOTES_UP', 'T[int]10'),
(145, 'NICE_QUESTION_VOTES_UP', 'T[int]10'),
(146, 'STELLAR_QUESTION_FAVS', 'T[int]100'),
(147, 'SHOW_TAGS_IN_A_CLOUD', 'eJzzNDDk0gMAAwcA4w=='),
(148, 'TAGS_CLOUD_MIN_OCCURS', 'T[int]1'),
(149, 'TAGS_CLOUD_MAX_OCCURS', 'T[int]35'),
(150, 'TAGS_CLOUD_MIN_FONT_SIZE', 'T[int]10'),
(151, 'TAGS_CLOUD_MAX_FONT_SIZE', 'T[int]25'),
(152, 'REP_TO_EDIT_OTHERS', 'T[int]2000'),
(153, 'REP_TO_RETAG', 'T[int]500'),
(154, 'REP_TO_FLAG', 'T[int]15'),
(155, 'REP_TO_WIKIFY', 'T[int]2000'),
(156, 'REP_TO_COMMENT', 'T[int]50'),
(157, 'USERS_CAN_ACCEPT_OWN', 'eJzzNDDg0gMAAwQA4g=='),
(158, 'REP_TO_CONVERT_TO_COMMENT', 'T[int]2000'),
(159, 'REP_TO_CONVERT_TO_QUESTION', 'T[int]2000'),
(160, 'REPORT_OFFENSIVE_CONTROL_POSITION', 'T[str]more'),
(161, 'USE_CANNED_COMMENTS', 'eJzzNDDk0gMAAwcA4w=='),
(162, 'EXPORTER_BACKUP_STORAGE', 'T[str]/var/lib/openshift/537ed1c5e0b8cdb41100008c/app-root/runtime/repo/forum_modules/exporter/backups'),
(163, 'FLAG_TYPES', 'eJwljrsOgzAMAHe+whsd+qLvjqhTh7YDUvfQOmAJ7CgxSP37JrDFdyfHi84VWZVXzvR55naZqfLyO6JXCsRNRPuEXtYiBxpxCWU9zA/xcGfjnBfnySjG9pDam7AiK4wkXcQBFH0fQCwMIUXHOXI/T02r8J4yEo7qlNSDQofmO/9+TqSSHoURKACLQo3RAdMnbbuk4Bmpxw5Hw7oRa1cqjj7RXqfjtUUfh2KbmfUfWBFO2A=='),
(164, 'CLOSE_TYPES', 'eJxNjksOwjAMRPc9hXdlAUj8L8AeULmAm7g0KI1D4rTXJ6EgsXzjN9YsrN9UTX1O3hqFQnBLFMWwqyu/rbCpfwwmAnfdStgbBRzAsUAgSyM6yfKuyHdmiKl9khIzEqDTgOGRBnKCJcne/uP1BK+/x+jiRIH0EoJ59PJlmDCflCIvpHP1UKrXwK2lobTmBT6wTsrksKziJBpn/Vj0i/QUMpwqXL8Bzp5RKg=='),
(165, 'REP_GAIN_BY_UPVOTED', 'T[int]10'),
(166, 'REP_LOST_BY_DOWNVOTED', 'T[int]2'),
(167, 'REP_TO_DELETE_COMMENTS', 'T[int]2000'),
(168, 'REP_TO_REOPEN_OWN', 'T[int]500'),
(169, 'APP_COPYRIGHT', 'T[unicode]Copyright suhail, 2014. Some rights reserved under creative commons license.'),
(170, 'UPFILES_FOLDER', 'T[str]/var/lib/openshift/537ed1c5e0b8cdb41100008c/app-root/data/upfiles'),
(171, 'UPFILES_ALIAS', 'T[str]/upfiles/'),
(172, 'FB_API_KEY', 'T[str]'),
(173, 'QUESTIONS_SITEMAP_LIMIT', 'T[int]2500'),
(174, 'QUESTIONS_SITEMAP_CHANGEFREQ', 'T[str]daily'),
(175, 'REP_TO_VOTE_UP', 'T[int]15'),
(176, 'REP_TO_VOTE_DOWN', 'T[int]100'),
(177, 'MAXIMUM_ACCEPTED_ANSWERS', 'T[int]1'),
(178, 'MAXIMUM_ACCEPTED_PER_USER', 'T[int]1'),
(179, 'REP_GAIN_BY_ACCEPTING', 'T[int]2'),
(180, 'REP_GAIN_BY_ACCEPTED', 'T[int]15'),
(181, 'MYSQL_FTS_INSTALLED', 'eJzzNDDg0gMAAwQA4g=='),
(182, 'ALLOW_MAX_FILE_SIZE', 'eJxzM9Iz5dIDAAQ9ARQ='),
(183, 'ROBOTS_FILE', 'eJxdyrEKwyAQgOE9T+EWCETpKnQo9A1CNyHIVVSqp3hn28dvoJNZv//f5i2yy7ZqEZirVooI1hrhRbIFSKU/JZR88H+T35wMGnyQa+vNO2QtFoP3SDal8tFCWYDSkUkN2o//RM29I8WCJyZnG4SBsmUIEf3O1tNQFiqNrwbnqV4m+QMHnEn+'),
(184, 'REP_TO_VIEW_FLAGS', 'T[int]2000');

-- --------------------------------------------------------

--
-- Table structure for table `forum_markedtag`
--

CREATE TABLE IF NOT EXISTS `forum_markedtag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_markedtag_5659cca2` (`tag_id`),
  KEY `forum_markedtag_6340c63c` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `forum_mysqlftsindex`
--

CREATE TABLE IF NOT EXISTS `forum_mysqlftsindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL,
  `body` longtext NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `tagnames` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `node_id` (`node_id`),
  FULLTEXT KEY `body` (`body`,`title`,`tagnames`),
  FULLTEXT KEY `body_2` (`body`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `tagnames` (`tagnames`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `forum_node`
--

CREATE TABLE IF NOT EXISTS `forum_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `tagnames` varchar(125) NOT NULL,
  `author_id` int(11) NOT NULL,
  `body` longtext NOT NULL,
  `node_type` varchar(16) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `abs_parent_id` int(11) DEFAULT NULL,
  `added_at` datetime NOT NULL,
  `score` int(11) NOT NULL,
  `state_string` longtext NOT NULL,
  `last_edited_id` int(11) DEFAULT NULL,
  `last_activity_by_id` int(11) DEFAULT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  `active_revision_id` int(11) DEFAULT NULL,
  `extra` longtext,
  `extra_ref_id` int(11) DEFAULT NULL,
  `extra_count` int(11) NOT NULL,
  `marked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `last_edited_id` (`last_edited_id`),
  UNIQUE KEY `active_revision_id` (`active_revision_id`),
  KEY `forum_node_e969df21` (`author_id`),
  KEY `forum_node_410d0aac` (`parent_id`),
  KEY `forum_node_5ea4ba1e` (`abs_parent_id`),
  KEY `forum_node_02313ba1` (`last_activity_by_id`),
  KEY `forum_node_e33be75d` (`extra_ref_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `forum_node`
--

INSERT INTO `forum_node` (`id`, `title`, `tagnames`, `author_id`, `body`, `node_type`, `parent_id`, `abs_parent_id`, `added_at`, `score`, `state_string`, `last_edited_id`, `last_activity_by_id`, `last_activity_at`, `active_revision_id`, `extra`, `extra_ref_id`, `extra_count`, `marked`) VALUES
(1, '189LM3 2013 General Intelligence & Reasoning Question 1', 'multitasking qp2013 generalintelligence', 2, '<p>Identify the letter which can complete the letter sequences:<code>CDXWEFVUGHTSI</code></p>\n<p>(a) R   (b) Q  (c) K   (d) J</p>', 'question', NULL, NULL, '2014-05-23 07:27:58', 0, '', NULL, 2, '2014-05-23 07:27:58', 1, NULL, NULL, 9, 0),
(2, '189LM3 2013 General Intelligence & Reasoning Question 2', 'multitasking qp2013 generalintelligence', 2, '<h4>Select the number which does not belong to the given series.</h4>\n<h4><code>1,9,65,217,513,999</code></h4>\n<p>(A) 513  (B) 999 (C) 9   (D) 65</p>', 'question', NULL, NULL, '2014-05-23 07:31:02', 0, '', NULL, 1, '2014-05-25 20:04:40', 2, NULL, NULL, 21, 0),
(3, '', '', 3, '<p>$$\n1 = 0^3  + 1, 9 = 2^3 + 1, 65  = 4^3 + 1, 217 = 6^3 +1, 513 = 8^3 +1\n$$\n999 is the answer </p>', 'answer', 2, 2, '2014-05-25 03:47:29', 0, '(accepted)', 18, 1, '2014-05-25 20:04:40', 6, NULL, NULL, 0, 1),
(4, 'SSC 2013 General Intelligence & Reasoning 3', 'multitasking qp2013 189lm3 generalintelligence', 2, '<blockquote>\n<p>Ravi is older than Bheema and Bheema is older than Krishna. Dhanu is younger than Krishna. Then who is the Youngest?</p>\n</blockquote>\n<h3><code>A). Krishna B) Dhanu c) Ravi D) Bheema</code></h3>', 'question', NULL, NULL, '2014-05-28 06:15:46', 0, '', NULL, 4, '2014-05-31 05:59:56', 8, NULL, NULL, 7, 0),
(5, 'SSC 2013 General Intelligence & Reasoning 4', 'multitasking qp2013 189lm3 generalintelligence', 2, '<blockquote>\n<p>From the given alternative words, select the word which cannot be formed using the letters of the given word:\n<strong>AUTOMATICALLY</strong></p>\n</blockquote>\n<h3><code>A) TOMATO B) MALTA C)CALAMITY D) LACUNA</code></h3>', 'question', NULL, NULL, '2014-05-28 06:17:03', 0, '', NULL, 4, '2014-05-31 06:10:07', 9, NULL, NULL, 10, 0),
(6, 'SSC 2013 General Intelligence & Reasoning 5', 'multitasking qp2013 189lm3 generalintelligence', 2, '<blockquote>\n<p>In the code <strong>CENTRAL</strong> be written as <strong>GIRXVEP</strong>, how can <strong>CORNER</strong> be written in that code?</p>\n</blockquote>\n<h3><code>A) GVSRIV  B) GTSRIV  C) GSVRVI  D) GSVRIV</code></h3>', 'question', NULL, NULL, '2014-05-28 06:17:37', 0, '', NULL, 2, '2014-05-28 06:17:37', 10, NULL, NULL, 5, 0),
(7, 'SSC 2013 General Intelligence & Reasoning 6', 'multitasking qp2013 189lm3 generalintelligence', 2, '<blockquote>\n<p>Some equations are solved on the basis of certain system. Find out the correct answer for the unsolved equation on that basis.\n$$ 12 * 53 = 3521 ; 71 * 82 = 2817; 67 * 56 = ? $$</p>\n</blockquote>\n<h3><code>A) 6576  B) 6675  C) 6756  D) 6657</code></h3>', 'question', NULL, NULL, '2014-05-28 06:18:39', 0, '', NULL, 2, '2014-05-28 06:18:39', 11, NULL, NULL, 5, 0),
(8, '', '', 4, '<p>Ravi-&gt;Bheema-&gt;Krishna-&gt;Dhanu</p>\n<p>so Dhanu is youngest member</p>', 'answer', 4, 4, '2014-05-31 05:59:56', 0, '', NULL, 4, '2014-05-31 05:59:56', 12, NULL, NULL, 0, 0),
(9, 'SSC 2013 General Intelligence & Reasoning 7', 'multitasking qp2013 189lm3 generalintelligence', 5, '<blockquote>\n<p>Nine birds are sitting on a tree. One is shot dead. How many birds remain thereafter on the branch?</p>\n</blockquote>\n<h4><code>A) 9  B) None C) 8  D) 2</code></h4>', 'question', NULL, NULL, '2014-05-31 06:01:19', 0, '', NULL, 5, '2014-05-31 06:01:19', 13, NULL, NULL, 5, 0),
(10, '', '', 4, '<p>tomato, lacuna answer </p>', 'answer', 5, 5, '2014-05-31 06:10:07', 0, '', NULL, 4, '2014-05-31 06:10:07', 14, NULL, NULL, 0, 0),
(11, 'SSC 2013 General Intelligence & Reasoning 8', 'multitasking qp2013 generalintelligence 189lm3', 5, '<blockquote>\n<p>Which will appear fourth in the dictionary?</p>\n</blockquote>\n<h3><code>A) Lark  B) Larva C)  Larch  D)Laser</code></h3>', 'question', NULL, NULL, '2014-05-31 06:45:20', 0, '', 47, 5, '2014-05-31 06:48:36', 19, NULL, NULL, 6, 0),
(12, 'SSC 2013 General Intelligence & Reasoning 9', 'multitasking qp2013 generalintelligence 189lm3', 5, '<blockquote>\n<p>If $$ 496 + 824 = 266, 219 * 300 = 36 $$\nthen $$ 142 + 286 = ? $$</p>\n</blockquote>\n<h3><code>A)519  B)326  C) 112  D) 428</code></h3>', 'question', NULL, NULL, '2014-05-31 06:46:50', 0, '', 46, 5, '2014-05-31 06:47:26', 18, NULL, NULL, 5, 0),
(13, 'SSC 2013 General Intelligence & Reasoning 10', 'multitasking qp2013 189lm3 generalintelligence', 5, '<blockquote>\n<p>CAR:GARAGE :: AEROPLANE: ?</p>\n</blockquote>\n<h3><code>A) HANGAR  B) HELIPAD  C) AERODROME  D) AIRPORT</code></h3>', 'question', NULL, NULL, '2014-05-31 07:34:57', 0, '', NULL, 5, '2014-05-31 07:34:57', 20, NULL, NULL, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `forum_noderevision`
--

CREATE TABLE IF NOT EXISTS `forum_noderevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `tagnames` varchar(125) NOT NULL,
  `author_id` int(11) NOT NULL,
  `body` longtext NOT NULL,
  `node_id` int(11) NOT NULL,
  `summary` varchar(300) NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  `revised_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `node_id` (`node_id`,`revision`),
  KEY `forum_noderevision_e969df21` (`author_id`),
  KEY `forum_noderevision_e453c5c5` (`node_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `forum_noderevision`
--

INSERT INTO `forum_noderevision` (`id`, `title`, `tagnames`, `author_id`, `body`, `node_id`, `summary`, `revision`, `revised_at`) VALUES
(1, '189LM3 2013 General Intelligence & Reasoning Question 1', 'multitasking qp2013 generalintelligence', 2, 'Identify the letter which can complete the letter sequences:`CDXWEFVUGHTSI`\r\n\r\n(a) R   (b) Q  (c) K   (d) J', 1, '', 1, '2014-05-23 07:27:58'),
(2, '189LM3 2013 General Intelligence & Reasoning Question 2', 'multitasking qp2013 generalintelligence', 2, '#### Select the number which does not belong to the given series. \r\n\r\n####`1,9,65,217,513,999`\r\n\r\n(A) 513  (B) 999 (C) 9   (D) 65\r\n\r\n', 2, '', 1, '2014-05-23 07:31:02'),
(3, '', '', 3, '##1 = 0^3  + 1\r\n9 = 2^3 + 1\r\n ', 3, '', 1, '2014-05-25 03:47:29'),
(4, '', '', 3, '1 = 0^3  + 1\r\n9 = 2^3 + 1\r\n65  = 4^3 + 1\r\n217 = 6^3 +1\r\n513 = 8^3 +1\r\n999 is the answer\r\n ', 3, '', 2, '2014-05-25 03:49:26'),
(5, '', '', 1, '$$\r\n1 = 0^3  + 1\r\n9 = 2^3 + 1\r\n65  = 4^3 + 1\r\n217 = 6^3 +1\r\n513 = 8^3 +1\r\n$$\r\n999 is the answer ', 3, '', 3, '2014-05-25 20:02:39'),
(6, '', '', 1, '$$\r\n1 = 0^3  + 1, 9 = 2^3 + 1, 65  = 4^3 + 1, 217 = 6^3 +1, 513 = 8^3 +1\r\n$$\r\n999 is the answer ', 3, '', 4, '2014-05-25 20:04:04'),
(7, '', '', 1, '$$\r\n1 = 0^3  + 1\r\n9 = 2^3 + 1\r\n65  = 4^3 + 1\r\n217 = 6^3 +1\r\n513 = 8^3 +1\r\n$$\r\n###999 is the answer ', 3, '', 5, '2014-05-25 20:04:23'),
(8, 'SSC 2013 General Intelligence & Reasoning 3', 'multitasking qp2013 189lm3 generalintelligence', 2, '> Ravi is older than Bheema and Bheema is older than Krishna. Dhanu is younger than Krishna. Then who is the Youngest?\r\n\r\n###`A). Krishna B) Dhanu c) Ravi D) Bheema`', 4, '', 1, '2014-05-28 06:15:46'),
(9, 'SSC 2013 General Intelligence & Reasoning 4', 'multitasking qp2013 189lm3 generalintelligence', 2, '> From the given alternative words, select the word which cannot be formed using the letters of the given word:\r\n> **AUTOMATICALLY**\r\n\r\n###`A) TOMATO B) MALTA C)CALAMITY D) LACUNA`', 5, '', 1, '2014-05-28 06:17:03'),
(10, 'SSC 2013 General Intelligence & Reasoning 5', 'multitasking qp2013 189lm3 generalintelligence', 2, '> In the code **CENTRAL** be written as **GIRXVEP**, how can **CORNER** be written in that code?\r\n\r\n###`A) GVSRIV  B) GTSRIV  C) GSVRVI  D) GSVRIV`', 6, '', 1, '2014-05-28 06:17:37'),
(11, 'SSC 2013 General Intelligence & Reasoning 6', 'multitasking qp2013 189lm3 generalintelligence', 2, '> Some equations are solved on the basis of certain system. Find out the correct answer for the unsolved equation on that basis.\r\n> $$ 12 * 53 = 3521 ; 71 * 82 = 2817; 67 * 56 = ? $$\r\n\r\n### `A) 6576  B) 6675  C) 6756  D) 6657`', 7, '', 1, '2014-05-28 06:18:39'),
(12, '', '', 4, 'Ravi->Bheema->Krishna->Dhanu\r\n\r\nso Dhanu is youngest member\r\n', 8, '', 1, '2014-05-31 05:59:56'),
(13, 'SSC 2013 General Intelligence & Reasoning 7', 'multitasking qp2013 189lm3 generalintelligence', 5, '> Nine birds are sitting on a tree. One is shot dead. How many birds remain thereafter on the branch?\r\n\r\n#### `A) 9  B) None C) 8  D) 2`', 9, '', 1, '2014-05-31 06:01:19'),
(14, '', '', 4, 'tomato, lacuna answer \r\n', 10, '', 1, '2014-05-31 06:10:07'),
(15, 'SSC 2013 General Intelligence & Reasoning 8', 'multitasking qp2013 189lm3 generalintelligence', 5, '> Which will appear fourth in the dictionary?\r\n\r\n### `A) Lark  B) Larva--Larch--Laser`', 11, '', 1, '2014-05-31 06:45:20'),
(16, 'SSC 2013 General Intelligence & Reasoning 8', 'multitasking qp2013 generalintelligence 189lm3', 5, '> Which will appear fourth in the dictionary?\r\n\r\n### `A) Lark  B) Larva  C) Larch  D)Laser`', 11, '', 2, '2014-05-31 06:45:54'),
(17, 'SSC 2013 General Intelligence & Reasoning 9', 'multitasking qp2013 189lm3 generalintelligence', 5, '> If $$ 496 + 824 = 266, 219 * 300 = 36 $$\r\nthen $$ 142 + 286 = ? $$', 12, '', 1, '2014-05-31 06:46:50'),
(18, 'SSC 2013 General Intelligence & Reasoning 9', 'multitasking qp2013 generalintelligence 189lm3', 5, '> If $$ 496 + 824 = 266, 219 * 300 = 36 $$\r\nthen $$ 142 + 286 = ? $$\r\n\r\n### `A)519  B)326  C) 112  D) 428`', 12, '', 2, '2014-05-31 06:47:26'),
(19, 'SSC 2013 General Intelligence & Reasoning 8', 'multitasking qp2013 generalintelligence 189lm3', 5, '> Which will appear fourth in the dictionary?\r\n\r\n### `A) Lark  B) Larva C)  Larch  D)Laser`', 11, '', 3, '2014-05-31 06:48:36'),
(20, 'SSC 2013 General Intelligence & Reasoning 10', 'multitasking qp2013 189lm3 generalintelligence', 5, '> CAR:GARAGE :: AEROPLANE: ?\r\n\r\n### `A) HANGAR  B) HELIPAD  C) AERODROME  D) AIRPORT`', 13, '', 1, '2014-05-31 07:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `forum_nodestate`
--

CREATE TABLE IF NOT EXISTS `forum_nodestate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL,
  `state_type` varchar(16) NOT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `action_id` (`action_id`),
  UNIQUE KEY `node_id` (`node_id`,`state_type`),
  KEY `forum_nodestate_e453c5c5` (`node_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `forum_nodestate`
--

INSERT INTO `forum_nodestate` (`id`, `node_id`, `state_type`, `action_id`) VALUES
(1, 3, 'accepted', 24);

-- --------------------------------------------------------

--
-- Table structure for table `forum_node_tags`
--

CREATE TABLE IF NOT EXISTS `forum_node_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `node_id` (`node_id`,`tag_id`),
  KEY `forum_node_tags_e453c5c5` (`node_id`),
  KEY `forum_node_tags_5659cca2` (`tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `forum_node_tags`
--

INSERT INTO `forum_node_tags` (`id`, `node_id`, `tag_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 4, 1),
(8, 4, 2),
(9, 4, 3),
(10, 4, 4),
(11, 5, 1),
(12, 5, 2),
(13, 5, 3),
(14, 5, 4),
(15, 6, 1),
(16, 6, 2),
(17, 6, 3),
(18, 6, 4),
(19, 7, 1),
(20, 7, 2),
(21, 7, 3),
(22, 7, 4),
(23, 9, 1),
(24, 9, 2),
(25, 9, 3),
(26, 9, 4),
(31, 11, 1),
(32, 11, 2),
(33, 11, 3),
(34, 11, 4),
(39, 12, 1),
(40, 12, 2),
(41, 12, 3),
(42, 12, 4),
(43, 13, 1),
(44, 13, 2),
(45, 13, 3),
(46, 13, 4);

-- --------------------------------------------------------

--
-- Table structure for table `forum_questionsubscription`
--

CREATE TABLE IF NOT EXISTS `forum_questionsubscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `auto_subscription` tinyint(1) NOT NULL,
  `last_view` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_questionsubscription_6340c63c` (`user_id`),
  KEY `forum_questionsubscription_25110688` (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `forum_questionsubscription`
--

INSERT INTO `forum_questionsubscription` (`id`, `user_id`, `question_id`, `auto_subscription`, `last_view`) VALUES
(1, 2, 1, 1, '2014-05-27 13:44:49'),
(2, 2, 2, 1, '2014-05-27 13:42:27'),
(3, 3, 2, 1, '2014-05-25 03:47:30'),
(4, 2, 4, 1, '2014-05-28 06:15:47'),
(5, 2, 5, 1, '2014-05-28 06:17:04'),
(6, 2, 6, 1, '2014-05-28 06:17:37'),
(7, 2, 7, 1, '2014-05-28 06:18:40'),
(8, 4, 4, 1, '2014-05-31 05:59:57'),
(9, 5, 9, 1, '2014-05-31 06:01:20'),
(10, 4, 5, 1, '2014-05-31 06:10:10'),
(11, 5, 11, 1, '2014-05-31 06:49:08'),
(12, 5, 12, 1, '2014-05-31 06:48:47'),
(13, 5, 13, 1, '2014-05-31 07:34:58');

-- --------------------------------------------------------

--
-- Table structure for table `forum_subscriptionsettings`
--

CREATE TABLE IF NOT EXISTS `forum_subscriptionsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `enable_notifications` tinyint(1) NOT NULL,
  `member_joins` varchar(1) NOT NULL,
  `new_question` varchar(1) NOT NULL,
  `new_question_watched_tags` varchar(1) NOT NULL,
  `subscribed_questions` varchar(1) NOT NULL,
  `all_questions` tinyint(1) NOT NULL,
  `all_questions_watched_tags` tinyint(1) NOT NULL,
  `questions_viewed` tinyint(1) NOT NULL,
  `notify_answers` tinyint(1) NOT NULL,
  `notify_reply_to_comments` tinyint(1) NOT NULL,
  `notify_comments_own_post` tinyint(1) NOT NULL,
  `notify_comments` tinyint(1) NOT NULL,
  `notify_accepted` tinyint(1) NOT NULL,
  `send_digest` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `forum_subscriptionsettings`
--

INSERT INTO `forum_subscriptionsettings` (`id`, `user_id`, `enable_notifications`, `member_joins`, `new_question`, `new_question_watched_tags`, `subscribed_questions`, `all_questions`, `all_questions_watched_tags`, `questions_viewed`, `notify_answers`, `notify_reply_to_comments`, `notify_comments_own_post`, `notify_comments`, `notify_accepted`, `send_digest`) VALUES
(1, 1, 1, 'n', 'n', 'i', 'i', 0, 0, 0, 1, 1, 1, 0, 0, 1),
(2, 2, 1, 'n', 'n', 'i', 'i', 0, 0, 0, 1, 1, 1, 0, 0, 1),
(3, 3, 1, 'n', 'n', 'i', 'i', 0, 0, 0, 1, 1, 1, 0, 0, 1),
(4, 4, 1, 'n', 'n', 'i', 'i', 0, 0, 0, 1, 1, 1, 0, 0, 1),
(5, 5, 1, 'n', 'n', 'i', 'i', 0, 0, 0, 1, 1, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `forum_tag`
--

CREATE TABLE IF NOT EXISTS `forum_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `used_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `forum_tag_0c98d849` (`created_by_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `forum_tag`
--

INSERT INTO `forum_tag` (`id`, `name`, `created_by_id`, `created_at`, `used_count`) VALUES
(1, 'multitasking', 2, '2014-05-23 07:27:58', 10),
(2, 'qp2013', 2, '2014-05-23 07:27:58', 10),
(3, 'generalintelligence', 2, '2014-05-23 07:27:58', 10),
(4, '189lm3', 2, '2014-05-28 06:15:46', 8);

-- --------------------------------------------------------

--
-- Table structure for table `forum_user`
--

CREATE TABLE IF NOT EXISTS `forum_user` (
  `user_ptr_id` int(11) NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `email_isvalid` tinyint(1) NOT NULL,
  `reputation` int(11) NOT NULL,
  `gold` int(10) unsigned NOT NULL,
  `silver` int(10) unsigned NOT NULL,
  `bronze` int(10) unsigned NOT NULL,
  `last_seen` datetime NOT NULL,
  `real_name` varchar(100) NOT NULL,
  `website` varchar(200) NOT NULL,
  `location` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `about` longtext NOT NULL,
  PRIMARY KEY (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_user`
--

INSERT INTO `forum_user` (`user_ptr_id`, `is_approved`, `email_isvalid`, `reputation`, `gold`, `silver`, `bronze`, `last_seen`, `real_name`, `website`, `location`, `date_of_birth`, `about`) VALUES
(1, 0, 0, 1, 0, 0, 2, '2014-05-23 07:17:33', '', '', '', NULL, ''),
(2, 0, 0, 3, 0, 0, 1, '2014-05-23 07:20:39', '', '', '', NULL, ''),
(3, 0, 0, 16, 0, 0, 1, '2014-05-25 03:46:02', '', '', '', NULL, ''),
(4, 0, 0, 1, 0, 0, 0, '2014-05-31 05:54:38', '', '', '', NULL, ''),
(5, 0, 0, 1, 0, 0, 1, '2014-05-31 05:58:14', '', '', '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `forum_userproperty`
--

CREATE TABLE IF NOT EXISTS `forum_userproperty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(16) NOT NULL,
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`key`),
  KEY `forum_userproperty_6340c63c` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `forum_userproperty`
--

INSERT INTO `forum_userproperty` (`id`, `user_id`, `key`, `value`) VALUES
(1, 1, 'pagination', 'eJzTSCkw5ApWDwx1DQ7x9PcLjvfxDA5R5yow4tJIKTDmKg5WDw12DYqHycOkTUDSpiBpR7/gcKACqLgZSNwcLO7i6+kXH+Tq7OoXEu/oHOIZ5hkSCVRhAVJhCTcYVbuhAUjW0JCrWA8ArsQpyw=='),
(2, 2, 'pagination', 'eJzTSCkw5ApWd/QLDncNivfxDA5R5yow4tJIKTDmKg5WDw12DQqGCZuAhE1hwvGoesxAkuZwycBQ1+AQT38/mLQFSNoSJA2TgRtraACSMzQESYY4usOFwa4wBDpDDwCXmCx/'),
(3, 3, 'pagination', 'eJzTSCkw5ApWDwx1DQ7x9PcLjvfxDA5R5yow4tJIKTDmKg5Wd/QLDncNgombgMRNuYr1AMGqD0E='),
(4, 4, 'pagination', 'eJzTSCkw5ApWDwx1DQ7x9PcLjvfxDA5R5yow4tJIKTDmKg5WDw12DYqHycOkTUDSpiBpR7/gcKACqLgZSNwcrg1V0gIkaclVrAcAcOQgFQ=='),
(5, 5, 'pagination', 'eJzTSCkw5ApWd/QLDncNivfxDA5R5yow4tJIKTDmKg5WDw12DQqGCZuAhE1hwvGoesxAkuZwycBQ1+AQT38/mLQFSNoSJA2TgRtraACSMzQESYY4usOFwa4wBDpDDwCXmCx/');

-- --------------------------------------------------------

--
-- Table structure for table `forum_validationhash`
--

CREATE TABLE IF NOT EXISTS `forum_validationhash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash_code` varchar(255) NOT NULL,
  `seed` varchar(12) NOT NULL,
  `expiration` datetime NOT NULL,
  `type` varchar(12) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash_code` (`hash_code`),
  UNIQUE KEY `user_id` (`user_id`,`type`),
  KEY `forum_validationhash_6340c63c` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `forum_validationhash`
--

INSERT INTO `forum_validationhash` (`id`, `hash_code`, `seed`, `expiration`, `type`, `user_id`) VALUES
(1, 'b2440193a6fe2c3f50fc77526326ff5c', 'cyDrSIN4iF9h', '2014-05-24 07:17:33', 'email', 1),
(3, '135f31887b30e892dc489a26628c3da6', '9cpUNiOHQPyD', '2014-05-24 07:20:52', 'email', 2),
(4, 'f26e0f186379b499efae1bb78c7385d9', 'HKA4UIYywcDo', '2014-05-26 03:46:02', 'email', 3),
(5, '2f7f55479fa5e438b82723e9855bfe91', 'Y0Buer8WmQAd', '2014-06-01 05:54:39', 'email', 4),
(6, 'a2584efa1f5da7f7ae7ac812dda0f84c', 'FZnYmzLje9WI', '2014-06-01 05:58:14', 'email', 5);

-- --------------------------------------------------------

--
-- Table structure for table `forum_vote`
--

CREATE TABLE IF NOT EXISTS `forum_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `value` smallint(6) NOT NULL,
  `action_id` int(11) NOT NULL,
  `voted_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `action_id` (`action_id`),
  UNIQUE KEY `user_id` (`user_id`,`node_id`),
  KEY `forum_vote_6340c63c` (`user_id`),
  KEY `forum_vote_e453c5c5` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appexam_score`
--
ALTER TABLE `appexam_score`
  ADD CONSTRAINT `user_id_refs_id_faa7e373` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `forum_action`
--
ALTER TABLE `forum_action`
  ADD CONSTRAINT `canceled_by_id_refs_user_ptr_id_e0eff1d0` FOREIGN KEY (`canceled_by_id`) REFERENCES `forum_user` (`user_ptr_id`),
  ADD CONSTRAINT `node_id_refs_id_b597ccf7` FOREIGN KEY (`node_id`) REFERENCES `forum_node` (`id`),
  ADD CONSTRAINT `real_user_id_refs_user_ptr_id_e0eff1d0` FOREIGN KEY (`real_user_id`) REFERENCES `forum_user` (`user_ptr_id`),
  ADD CONSTRAINT `user_id_refs_user_ptr_id_e0eff1d0` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`user_ptr_id`);

--
-- Constraints for table `forum_actionrepute`
--
ALTER TABLE `forum_actionrepute`
  ADD CONSTRAINT `action_id_refs_id_83da8185` FOREIGN KEY (`action_id`) REFERENCES `forum_action` (`id`),
  ADD CONSTRAINT `user_id_refs_user_ptr_id_a5d27e44` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`user_ptr_id`);

--
-- Constraints for table `forum_authkeyuserassociation`
--
ALTER TABLE `forum_authkeyuserassociation`
  ADD CONSTRAINT `user_id_refs_user_ptr_id_96c9497d` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`user_ptr_id`);

--
-- Constraints for table `forum_award`
--
ALTER TABLE `forum_award`
  ADD CONSTRAINT `action_id_refs_id_f9c3eb8f` FOREIGN KEY (`action_id`) REFERENCES `forum_action` (`id`),
  ADD CONSTRAINT `badge_id_refs_id_b0c7e586` FOREIGN KEY (`badge_id`) REFERENCES `forum_badge` (`id`),
  ADD CONSTRAINT `node_id_refs_id_f7ce3e81` FOREIGN KEY (`node_id`) REFERENCES `forum_node` (`id`),
  ADD CONSTRAINT `trigger_id_refs_id_f9c3eb8f` FOREIGN KEY (`trigger_id`) REFERENCES `forum_action` (`id`),
  ADD CONSTRAINT `user_id_refs_user_ptr_id_8f46bcdb` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`user_ptr_id`);

--
-- Constraints for table `forum_flag`
--
ALTER TABLE `forum_flag`
  ADD CONSTRAINT `action_id_refs_id_83f35e27` FOREIGN KEY (`action_id`) REFERENCES `forum_action` (`id`),
  ADD CONSTRAINT `node_id_refs_id_67831f33` FOREIGN KEY (`node_id`) REFERENCES `forum_node` (`id`),
  ADD CONSTRAINT `user_id_refs_user_ptr_id_a877842e` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`user_ptr_id`);

--
-- Constraints for table `forum_markedtag`
--
ALTER TABLE `forum_markedtag`
  ADD CONSTRAINT `tag_id_refs_id_0a0bfb93` FOREIGN KEY (`tag_id`) REFERENCES `forum_tag` (`id`),
  ADD CONSTRAINT `user_id_refs_user_ptr_id_2c5b9d1a` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`user_ptr_id`);

--
-- Constraints for table `forum_node`
--
ALTER TABLE `forum_node`
  ADD CONSTRAINT `abs_parent_id_refs_id_66065bc7` FOREIGN KEY (`abs_parent_id`) REFERENCES `forum_node` (`id`),
  ADD CONSTRAINT `active_revision_id_refs_id_6df99954` FOREIGN KEY (`active_revision_id`) REFERENCES `forum_noderevision` (`id`),
  ADD CONSTRAINT `author_id_refs_user_ptr_id_a51ca923` FOREIGN KEY (`author_id`) REFERENCES `forum_user` (`user_ptr_id`),
  ADD CONSTRAINT `extra_ref_id_refs_id_66065bc7` FOREIGN KEY (`extra_ref_id`) REFERENCES `forum_node` (`id`),
  ADD CONSTRAINT `last_activity_by_id_refs_user_ptr_id_a51ca923` FOREIGN KEY (`last_activity_by_id`) REFERENCES `forum_user` (`user_ptr_id`),
  ADD CONSTRAINT `last_edited_id_refs_id_912e28d7` FOREIGN KEY (`last_edited_id`) REFERENCES `forum_action` (`id`),
  ADD CONSTRAINT `parent_id_refs_id_66065bc7` FOREIGN KEY (`parent_id`) REFERENCES `forum_node` (`id`);

--
-- Constraints for table `forum_noderevision`
--
ALTER TABLE `forum_noderevision`
  ADD CONSTRAINT `author_id_refs_user_ptr_id_4cf8038b` FOREIGN KEY (`author_id`) REFERENCES `forum_user` (`user_ptr_id`),
  ADD CONSTRAINT `node_id_refs_id_15769c8f` FOREIGN KEY (`node_id`) REFERENCES `forum_node` (`id`);

--
-- Constraints for table `forum_nodestate`
--
ALTER TABLE `forum_nodestate`
  ADD CONSTRAINT `action_id_refs_id_817c1515` FOREIGN KEY (`action_id`) REFERENCES `forum_action` (`id`),
  ADD CONSTRAINT `node_id_refs_id_aaf39fb7` FOREIGN KEY (`node_id`) REFERENCES `forum_node` (`id`);

--
-- Constraints for table `forum_node_tags`
--
ALTER TABLE `forum_node_tags`
  ADD CONSTRAINT `node_id_refs_id_696ed2ce` FOREIGN KEY (`node_id`) REFERENCES `forum_node` (`id`),
  ADD CONSTRAINT `tag_id_refs_id_c640cb8e` FOREIGN KEY (`tag_id`) REFERENCES `forum_tag` (`id`);

--
-- Constraints for table `forum_questionsubscription`
--
ALTER TABLE `forum_questionsubscription`
  ADD CONSTRAINT `question_id_refs_id_053d03a8` FOREIGN KEY (`question_id`) REFERENCES `forum_node` (`id`),
  ADD CONSTRAINT `user_id_refs_user_ptr_id_42fd2b22` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`user_ptr_id`);

--
-- Constraints for table `forum_subscriptionsettings`
--
ALTER TABLE `forum_subscriptionsettings`
  ADD CONSTRAINT `user_id_refs_user_ptr_id_ca4770af` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`user_ptr_id`);

--
-- Constraints for table `forum_tag`
--
ALTER TABLE `forum_tag`
  ADD CONSTRAINT `created_by_id_refs_user_ptr_id_5c378f91` FOREIGN KEY (`created_by_id`) REFERENCES `forum_user` (`user_ptr_id`);

--
-- Constraints for table `forum_user`
--
ALTER TABLE `forum_user`
  ADD CONSTRAINT `user_ptr_id_refs_id_40d8c03f` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `forum_userproperty`
--
ALTER TABLE `forum_userproperty`
  ADD CONSTRAINT `user_id_refs_user_ptr_id_521cb0ff` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`user_ptr_id`);

--
-- Constraints for table `forum_validationhash`
--
ALTER TABLE `forum_validationhash`
  ADD CONSTRAINT `user_id_refs_user_ptr_id_4d9f5cab` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`user_ptr_id`);

--
-- Constraints for table `forum_vote`
--
ALTER TABLE `forum_vote`
  ADD CONSTRAINT `action_id_refs_id_edd7df78` FOREIGN KEY (`action_id`) REFERENCES `forum_action` (`id`),
  ADD CONSTRAINT `node_id_refs_id_df8c5829` FOREIGN KEY (`node_id`) REFERENCES `forum_node` (`id`),
  ADD CONSTRAINT `user_id_refs_user_ptr_id_f57a9556` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`user_ptr_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
