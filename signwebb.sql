-- phpMyAdmin SQL Dump
-- version 2.11.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 01, 2009 at 01:41 PM
-- Server version: 5.1.35
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `signwebb`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

CREATE TABLE IF NOT EXISTS `campaign` (
  `CampaignID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ClientID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CampaignName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CampaignSubject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FromName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FromEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ConfirmationEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ReplyTo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SendDate` datetime DEFAULT NULL,
  `SubscriberListIDs` longtext COLLATE utf8_unicode_ci,
  `ListSegments` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `campaign`
--


-- --------------------------------------------------------

--
-- Table structure for table `campaign_content`
--

CREATE TABLE IF NOT EXISTS `campaign_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `date_created` datetime DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `campaign_content`
--


-- --------------------------------------------------------

--
-- Table structure for table `campaign_content_cms_content`
--

CREATE TABLE IF NOT EXISTS `campaign_content_cms_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_content_id` int(11) DEFAULT NULL,
  `cms_content_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `campaign_content_cms_content`
--


-- --------------------------------------------------------

--
-- Table structure for table `campaign_monitor_model`
--

CREATE TABLE IF NOT EXISTS `campaign_monitor_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `campaign_monitor_model`
--


-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `ClientID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CampaignID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SentDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TotalRecipients` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client`
--


-- --------------------------------------------------------

--
-- Table structure for table `cms_category`
--

CREATE TABLE IF NOT EXISTS `cms_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cms_category`
--


-- --------------------------------------------------------

--
-- Table structure for table `cms_category_cms_content`
--

CREATE TABLE IF NOT EXISTS `cms_category_cms_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `join_order` int(11) DEFAULT NULL,
  `cms_category_id` int(11) DEFAULT NULL,
  `cms_content_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cms_category_cms_content`
--


-- --------------------------------------------------------

--
-- Table structure for table `cms_comment`
--

CREATE TABLE IF NOT EXISTS `cms_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attached_id` int(11) DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `author_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wildfire_user_id` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `karma` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `cms_content_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cms_comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `cms_configuration`
--

CREATE TABLE IF NOT EXISTS `cms_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cms_configuration`
--


-- --------------------------------------------------------

--
-- Table structure for table `cms_content`
--

CREATE TABLE IF NOT EXISTS `cms_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `status` int(2) DEFAULT NULL,
  `published` datetime DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `sort` int(3) DEFAULT NULL,
  `pageviews` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cms_section_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `preview_master_id` int(11) DEFAULT NULL,
  `language` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cms_content`
--


-- --------------------------------------------------------

--
-- Table structure for table `cms_content_wildfire_file`
--

CREATE TABLE IF NOT EXISTS `cms_content_wildfire_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `join_order` int(11) DEFAULT NULL,
  `cms_content_id` int(11) DEFAULT NULL,
  `wildfire_file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cms_content_wildfire_file`
--


-- --------------------------------------------------------

--
-- Table structure for table `cms_extra_content`
--

CREATE TABLE IF NOT EXISTS `cms_extra_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra_content` longtext COLLATE utf8_unicode_ci,
  `cms_content_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cms_extra_content`
--


-- --------------------------------------------------------

--
-- Table structure for table `cms_permission`
--

CREATE TABLE IF NOT EXISTS `cms_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wildfire_user_id` int(11) DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allowed` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=41 ;

--
-- Dumping data for table `cms_permission`
--

INSERT INTO `cms_permission` (`id`, `wildfire_user_id`, `class`, `operation`, `allowed`) VALUES
(1, 1, 'home', 'stats', 1),
(2, 1, 'sections', 'enabled', 1),
(3, 1, 'sections', 'menu', 1),
(4, 1, 'sections', 'create', 1),
(5, 1, 'sections', 'edit', 1),
(6, 1, 'sections', 'delete', 1),
(7, 1, 'categories', 'enabled', 1),
(8, 1, 'categories', 'menu', 1),
(9, 1, 'categories', 'create', 1),
(10, 1, 'categories', 'edit', 1),
(11, 1, 'categories', 'delete', 1),
(12, 1, 'content', 'enabled', 1),
(13, 1, 'content', 'menu', 1),
(14, 1, 'content', 'create', 1),
(15, 1, 'content', 'edit', 1),
(16, 1, 'content', 'delete', 1),
(17, 1, 'content', 'categories', 1),
(18, 1, 'content', 'attach_images', 1),
(19, 1, 'content', 'inline_images', 1),
(20, 1, 'content', 'html', 1),
(21, 1, 'content', 'video', 1),
(22, 1, 'content', 'audio', 1),
(23, 1, 'content', 'publish', 1),
(24, 1, 'comments', 'enabled', 1),
(25, 1, 'comments', 'menu', 1),
(26, 1, 'comments', 'create', 1),
(27, 1, 'comments', 'edit', 1),
(28, 1, 'comments', 'delete', 1),
(29, 1, 'comments', 'admin', 1),
(30, 1, 'files', 'enabled', 1),
(31, 1, 'files', 'menu', 1),
(32, 1, 'files', 'create', 1),
(33, 1, 'files', 'edit', 1),
(34, 1, 'files', 'delete', 1),
(35, 1, 'users', 'enabled', 1),
(36, 1, 'users', 'menu', 1),
(37, 1, 'users', 'create', 1),
(38, 1, 'users', 'edit', 1),
(39, 1, 'users', 'delete', 1),
(40, 1, 'users', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_section`
--

CREATE TABLE IF NOT EXISTS `cms_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduction` longtext COLLATE utf8_unicode_ci,
  `order` int(5) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_page_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `cms_section`
--

INSERT INTO `cms_section` (`id`, `title`, `introduction`, `order`, `url`, `default_page_id`, `parent_id`) VALUES
(1, 'Home', '', NULL, 'home', 0, 0),
(2, 'Projects', '', NULL, 'projects', 0, 0),
(3, 'Services', '', NULL, 'services', 0, 0),
(4, 'Our Strategy', '', NULL, 'our-strategy', 0, 0),
(5, 'News', NULL, NULL, 'news', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_section_wildfire_user`
--

CREATE TABLE IF NOT EXISTS `cms_section_wildfire_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cms_section_id` int(11) DEFAULT NULL,
  `wildfire_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cms_section_wildfire_user`
--


-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

CREATE TABLE IF NOT EXISTS `subscriber` (
  `ListID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `State` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CustomFields` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscriber`
--


-- --------------------------------------------------------

--
-- Table structure for table `wildfire_file`
--

CREATE TABLE IF NOT EXISTS `wildfire_file` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `downloads` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uploader` int(11) DEFAULT NULL,
  `flags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `date` datetime DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `oldid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wildfire_file`
--


-- --------------------------------------------------------

--
-- Table structure for table `wildfire_log`
--

CREATE TABLE IF NOT EXISTS `wildfire_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wildfire_user_id` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wildfire_log`
--

INSERT INTO `wildfire_log` (`id`, `action`, `wildfire_user_id`, `time`) VALUES
(1, 'login', 1, NULL),
(2, 'login', 1, NULL),
(3, 'login', 1, '2009-08-01 07:50:02'),
(4, 'login', 1, '2009-08-01 07:50:46');

-- --------------------------------------------------------

--
-- Table structure for table `wildfire_user`
--

CREATE TABLE IF NOT EXISTS `wildfire_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Enter Username Here',
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wildfire_user`
--

INSERT INTO `wildfire_user` (`id`, `username`, `firstname`, `surname`, `email`, `password`) VALUES
(1, 'admin', NULL, NULL, NULL, 's1gnw3bbn4t');
