-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2015 at 01:33 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `acifreelancecpdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `article_has_attachments`
--

CREATE TABLE IF NOT EXISTS `article_has_attachments` (
`id` bigint(20) NOT NULL,
  `article_id` bigint(20) DEFAULT '0',
  `filename` varchar(250) DEFAULT '0',
  `savename` varchar(250) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
`id` int(11) NOT NULL,
  `company_id` int(140) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(180) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `mobile` varchar(25) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `zipcode` varchar(30) NOT NULL,
  `userpic` varchar(150) NOT NULL DEFAULT 'no-pic.png',
  `city` varchar(45) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `inactive` tinyint(4) DEFAULT '0',
  `access` varchar(150) DEFAULT '0',
  `last_active` varchar(50) DEFAULT NULL,
  `last_login` varchar(50) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `company_id`, `firstname`, `lastname`, `email`, `phone`, `mobile`, `address`, `zipcode`, `userpic`, `city`, `password`, `inactive`, `access`, `last_active`, `last_login`) VALUES
(27, 25, 'Alpiyan', 'Purwanto', 'sico@gmail.com', '', '', '', '', 'no-pic.png', '', '123456', 0, '14,12,13,15,17', '1440396619', '1440396376');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
`id` int(11) NOT NULL,
  `reference` int(11) NOT NULL,
  `name` varchar(140) DEFAULT NULL,
  `client_id` varchar(140) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `mobile` varchar(25) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `zipcode` varchar(30) NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  `inactive` tinyint(4) DEFAULT '0',
  `website` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `vat` varchar(250) DEFAULT NULL,
  `note` longtext
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=26 ;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `reference`, `name`, `client_id`, `phone`, `mobile`, `address`, `zipcode`, `city`, `inactive`, `website`, `country`, `vat`, `note`) VALUES
(25, 41001, 'Sico', '27', '', '', '', '', '', 0, '-', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `core`
--

CREATE TABLE IF NOT EXISTS `core` (
`id` int(11) NOT NULL,
  `version` char(10) NOT NULL DEFAULT '0',
  `domain` varchar(65) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `tax` varchar(5) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `autobackup` int(11) DEFAULT NULL,
  `cronjob` int(11) DEFAULT NULL,
  `last_cronjob` int(11) DEFAULT NULL,
  `last_autobackup` int(11) DEFAULT NULL,
  `invoice_terms` mediumtext,
  `company_reference` int(6) DEFAULT NULL,
  `project_reference` int(6) DEFAULT NULL,
  `invoice_reference` int(6) DEFAULT NULL,
  `subscription_reference` int(6) DEFAULT NULL,
  `ticket_reference` int(10) DEFAULT NULL,
  `date_format` varchar(20) DEFAULT NULL,
  `date_time_format` varchar(20) DEFAULT NULL,
  `invoice_mail_subject` varchar(150) DEFAULT NULL,
  `pw_reset_mail_subject` varchar(150) DEFAULT NULL,
  `pw_reset_link_mail_subject` varchar(150) DEFAULT NULL,
  `credentials_mail_subject` varchar(150) DEFAULT NULL,
  `notification_mail_subject` varchar(150) DEFAULT NULL,
  `language` varchar(150) DEFAULT NULL,
  `invoice_address` varchar(200) DEFAULT NULL,
  `invoice_city` varchar(200) DEFAULT NULL,
  `invoice_contact` varchar(200) DEFAULT NULL,
  `invoice_tel` varchar(50) DEFAULT NULL,
  `subscription_mail_subject` varchar(250) DEFAULT NULL,
  `logo` varchar(150) DEFAULT NULL,
  `template` varchar(200) DEFAULT 'default',
  `paypal` varchar(5) DEFAULT '1',
  `paypal_currency` varchar(200) DEFAULT 'EUR',
  `paypal_account` varchar(200) DEFAULT 'luxsys@luxsys-apps.com',
  `invoice_logo` varchar(150) DEFAULT 'assets/blackline/img/invoice_logo.png',
  `pc` varchar(150) DEFAULT NULL,
  `vat` varchar(150) DEFAULT NULL,
  `ticket_email` varchar(250) DEFAULT NULL,
  `ticket_default_owner` int(10) DEFAULT '1',
  `ticket_default_queue` int(10) DEFAULT '1',
  `ticket_default_type` int(10) DEFAULT '1',
  `ticket_default_status` varchar(200) DEFAULT 'new',
  `ticket_config_host` varchar(250) DEFAULT NULL,
  `ticket_config_login` varchar(250) DEFAULT NULL,
  `ticket_config_pass` varchar(250) DEFAULT NULL,
  `ticket_config_port` varchar(250) DEFAULT NULL,
  `ticket_config_ssl` varchar(250) DEFAULT NULL,
  `ticket_config_email` varchar(250) DEFAULT NULL,
  `ticket_config_flags` varchar(250) DEFAULT '/notls',
  `ticket_config_search` varchar(250) DEFAULT 'UNSEEN',
  `ticket_config_timestamp` int(11) DEFAULT '0',
  `ticket_config_mailbox` varchar(250) DEFAULT NULL,
  `ticket_config_delete` int(11) DEFAULT '0',
  `ticket_config_active` int(11) DEFAULT '0',
  `ticket_config_imap` int(11) DEFAULT '1'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `core`
--

INSERT INTO `core` (`id`, `version`, `domain`, `email`, `company`, `tax`, `currency`, `autobackup`, `cronjob`, `last_cronjob`, `last_autobackup`, `invoice_terms`, `company_reference`, `project_reference`, `invoice_reference`, `subscription_reference`, `ticket_reference`, `date_format`, `date_time_format`, `invoice_mail_subject`, `pw_reset_mail_subject`, `pw_reset_link_mail_subject`, `credentials_mail_subject`, `notification_mail_subject`, `language`, `invoice_address`, `invoice_city`, `invoice_contact`, `invoice_tel`, `subscription_mail_subject`, `logo`, `template`, `paypal`, `paypal_currency`, `paypal_account`, `invoice_logo`, `pc`, `vat`, `ticket_email`, `ticket_default_owner`, `ticket_default_queue`, `ticket_default_type`, `ticket_default_status`, `ticket_config_host`, `ticket_config_login`, `ticket_config_pass`, `ticket_config_port`, `ticket_config_ssl`, `ticket_config_email`, `ticket_config_flags`, `ticket_config_search`, `ticket_config_timestamp`, `ticket_config_mailbox`, `ticket_config_delete`, `ticket_config_active`, `ticket_config_imap`) VALUES
(1, '2.1.7', 'remata.org', 'remata.org', 'remata.org', '0', 'Rp.', 1, 1, 0, 0, 'Thank you for your business. We do expect payment within {due_date}, so please process this invoice within that time.', 41002, 51001, 31001, 61001, 10002, 'd/m/Y', 'H:i', 'New Invoice', 'Password Reset', 'Password Reset', 'Login Details', 'Notification', 'english', 'remata.org', 'remata.org', 'remata.org', '+6281210390406', 'New Subscription', 'assets/blackline/img/logo.png', 'blackline', '0', 'USD', '', 'assets/blackline/img/invoice_logo.png', '', NULL, NULL, 1, 1, 1, 'new', NULL, NULL, NULL, NULL, NULL, NULL, '/notls', 'UNSEEN', 0, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `custom_quotations`
--

CREATE TABLE IF NOT EXISTS `custom_quotations` (
`id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT '''''',
  `formcontent` longtext,
  `inactive` tinyint(4) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `created` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_quotation_requests`
--

CREATE TABLE IF NOT EXISTS `custom_quotation_requests` (
`id` int(11) NOT NULL,
  `form` longtext NOT NULL,
  `custom_quotation_id` int(11) unsigned NOT NULL,
  `date` varchar(50) DEFAULT '''''',
  `status` varchar(50) DEFAULT '''''',
  `user_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
`id` int(11) NOT NULL,
  `reference` int(11) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `issue_date` varchar(20) DEFAULT NULL,
  `due_date` varchar(20) DEFAULT NULL,
  `sent_date` varchar(20) DEFAULT NULL,
  `paid_date` varchar(20) DEFAULT NULL,
  `terms` mediumtext,
  `discount` varchar(50) DEFAULT '0',
  `subscription_id` varchar(50) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_has_items`
--

CREATE TABLE IF NOT EXISTS `invoice_has_items` (
`id` int(10) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `amount` char(11) DEFAULT NULL,
  `description` mediumtext,
  `value` float DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
`id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
`id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT '0',
  `media_id` int(11) DEFAULT '0',
  `from` varchar(120) DEFAULT NULL,
  `text` text,
  `datetime` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
`id` int(10) NOT NULL,
  `name` varchar(250) DEFAULT '0',
  `link` varchar(250) DEFAULT '0',
  `type` varchar(250) DEFAULT '0',
  `icon` varchar(150) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES
(1, 'Dashboard', 'dashboard', 'main', 'icon-th', 1),
(2, 'Messages', 'messages', 'main', 'icon-inbox', 2),
(3, 'Projects', 'projects', 'main', 'icon-briefcase', 3),
(4, 'Clients', 'clients', 'main', 'icon-user', 4),
(5, 'Invoices', 'invoices', 'main', 'icon-list-alt', 5),
(6, 'Items', 'items', 'main', 'icon-file', 7),
(7, 'Quotations', 'quotations', 'main', 'icon-list-alt', 8),
(8, 'Subscriptions', 'subscriptions', 'main', 'icon-calendar', 6),
(9, 'Settings', 'settings', 'main', 'icon-cog', 20),
(10, 'QuickAccess', 'quickaccess', 'widget', NULL, 50),
(11, 'User Online', 'useronline', 'widget', NULL, 51),
(12, 'Projects', 'cprojects', 'client', 'icon-briefcase', 2),
(13, 'Invoices', 'cinvoices', 'client', 'icon-list-alt', 3),
(14, 'Messages', 'cmessages', 'client', 'icon-inbox', 1),
(15, 'Subscriptions', 'csubscriptions', 'client', 'icon-calendar', 4),
(16, 'Tickets', 'tickets', 'main', 'icon-tag', 8),
(17, 'Tickets', 'ctickets', 'client', 'icon-tag', 4);

-- --------------------------------------------------------

--
-- Table structure for table `privatemessages`
--

CREATE TABLE IF NOT EXISTS `privatemessages` (
`id` int(11) unsigned NOT NULL,
  `status` varchar(150) NOT NULL,
  `sender` varchar(250) NOT NULL,
  `recipient` varchar(250) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `time` varchar(100) NOT NULL,
  `conversation` varchar(32) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=130 ;

--
-- Dumping data for table `privatemessages`
--

INSERT INTO `privatemessages` (`id`, `status`, `sender`, `recipient`, `subject`, `message`, `time`, `conversation`) VALUES
(125, 'Read', 'c27', 'u9', 'biling ', 'harap segera ya pak<br>', '2015-02-18 05:44', 'dcaa366c7b87ba850ee87bfae203fee7'),
(126, 'Read', 'u9', 'c27', 'biling ', 'ok<br><br>', '2015-02-18 05:46', 'dcaa366c7b87ba850ee87bfae203fee7'),
(127, 'Read', 'c27', 'u9', 'biling ', ':)<br><br>', '2015-02-18 05:47', 'dcaa366c7b87ba850ee87bfae203fee7'),
(128, 'Read', 'u9', 'c27', 'biling ', 'hehehe<br>', '2015-02-18 05:50', 'dcaa366c7b87ba850ee87bfae203fee7'),
(129, 'Read', 'c27', 'u9', 'biling ', 'hahahahah', '2015-02-18 05:50', 'dcaa366c7b87ba850ee87bfae203fee7');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
`id` int(11) NOT NULL,
  `reference` int(11) DEFAULT NULL,
  `name` varchar(65) DEFAULT NULL,
  `description` text,
  `start` varchar(20) DEFAULT NULL,
  `end` varchar(20) DEFAULT NULL,
  `progress` decimal(3,0) DEFAULT NULL,
  `phases` varchar(150) DEFAULT NULL,
  `tracking` int(11) DEFAULT NULL,
  `time_spent` int(11) DEFAULT NULL,
  `datetime` int(11) DEFAULT NULL,
  `sticky` enum('1','0') DEFAULT '0',
  `category` varchar(150) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `note` longtext NOT NULL,
  `progress_calc` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_has_files`
--

CREATE TABLE IF NOT EXISTS `project_has_files` (
`id` int(10) NOT NULL,
  `project_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `client_id` int(10) DEFAULT '0',
  `type` varchar(80) DEFAULT '0',
  `name` varchar(120) DEFAULT '0',
  `filename` varchar(150) DEFAULT '0',
  `description` text,
  `savename` varchar(200) DEFAULT '0',
  `phase` varchar(100) DEFAULT '0',
  `date` varchar(50) DEFAULT '0',
  `download_counter` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_has_tasks`
--

CREATE TABLE IF NOT EXISTS `project_has_tasks` (
`id` int(10) NOT NULL,
  `project_id` int(10) DEFAULT '0',
  `name` varchar(250) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `status` varchar(50) DEFAULT '0',
  `public` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_has_workers`
--

CREATE TABLE IF NOT EXISTS `project_has_workers` (
`id` int(10) NOT NULL,
  `project_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pw_reset`
--

CREATE TABLE IF NOT EXISTS `pw_reset` (
`id` int(10) NOT NULL,
  `email` varchar(250) DEFAULT '0',
  `timestamp` varchar(250) DEFAULT '0',
  `token` varchar(250) DEFAULT '0',
  `user` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pw_reset`
--

INSERT INTO `pw_reset` (`id`, `email`, `timestamp`, `token`, `user`) VALUES
(1, 'anton.takaful@gmail.com', '1424233503', 'c006dd575f0a8fe2f8545b39e10372c2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `queues`
--

CREATE TABLE IF NOT EXISTS `queues` (
`id` bigint(20) NOT NULL,
  `name` varchar(250) DEFAULT '0',
  `description` varchar(250) DEFAULT '0',
  `inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `queues`
--

INSERT INTO `queues` (`id`, `name`, `description`, `inactive`) VALUES
(1, 'Service', 'First service queue', 0),
(2, 'Second Level', 'Second Level Queue', 0);

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE IF NOT EXISTS `quotations` (
`id` int(11) NOT NULL,
  `q1` varchar(50) DEFAULT NULL,
  `q2` varchar(50) DEFAULT NULL,
  `q3` varchar(50) DEFAULT NULL,
  `q4` varchar(150) DEFAULT NULL,
  `q5` text,
  `q6` varchar(50) DEFAULT NULL,
  `company` varchar(150) DEFAULT '-',
  `fullname` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `zip` varchar(150) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `comment` text,
  `date` varchar(50) DEFAULT NULL,
  `status` varchar(150) DEFAULT '0',
  `user_id` int(50) DEFAULT '0',
  `replied` varchar(50) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE IF NOT EXISTS `subscriptions` (
`id` int(10) NOT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `company_id` int(10) DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `issue_date` varchar(20) DEFAULT NULL,
  `end_date` varchar(20) DEFAULT NULL,
  `frequency` varchar(20) DEFAULT NULL,
  `next_payment` varchar(20) DEFAULT NULL,
  `terms` mediumtext,
  `discount` varchar(50) DEFAULT '0',
  `subscribed` varchar(50) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_has_items`
--

CREATE TABLE IF NOT EXISTS `subscription_has_items` (
`id` int(10) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `amount` char(11) DEFAULT NULL,
  `description` mediumtext,
  `value` float DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
`id` bigint(20) NOT NULL,
  `from` varchar(250) DEFAULT '0',
  `reference` varchar(250) DEFAULT '0',
  `type_id` smallint(6) DEFAULT '1',
  `lock` smallint(6) DEFAULT '0',
  `subject` varchar(250) DEFAULT '0',
  `text` text,
  `status` varchar(50) DEFAULT '0',
  `client_id` int(11) DEFAULT '0',
  `company_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `escalation_time` int(11) DEFAULT '0',
  `priority` varchar(50) DEFAULT '0',
  `created` int(11) DEFAULT '0',
  `queue_id` int(11) DEFAULT '0',
  `updated` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `from`, `reference`, `type_id`, `lock`, `subject`, `text`, `status`, `client_id`, `company_id`, `user_id`, `escalation_time`, `priority`, `created`, `queue_id`, `updated`) VALUES
(52, 'Alpiyan Purwanto - sico@gmail.com', '10000', 1, 0, 'minta penawaran ', 'detil seperti dalam lampiran<br>', 'open', 27, 25, 1, 0, '0', 1424234594, 1, 0),
(53, 'Alpiyan Purwanto - sico@gmail.com', '10001', 1, 0, 'noij', 'huihijo', 'new', 27, 25, 1, 0, '0', 1440396518, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_has_articles`
--

CREATE TABLE IF NOT EXISTS `ticket_has_articles` (
`id` bigint(20) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `from` varchar(250) NOT NULL DEFAULT '0',
  `reply_to` varchar(250) DEFAULT '0',
  `to` varchar(250) DEFAULT '0',
  `cc` varchar(250) DEFAULT '0',
  `subject` varchar(250) DEFAULT '0',
  `message` text,
  `datetime` varchar(250) DEFAULT NULL,
  `internal` int(10) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_has_attachments`
--

CREATE TABLE IF NOT EXISTS `ticket_has_attachments` (
`id` bigint(20) NOT NULL,
  `ticket_id` bigint(20) DEFAULT '0',
  `filename` varchar(250) DEFAULT '0',
  `savename` varchar(250) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE IF NOT EXISTS `types` (
`id` bigint(20) NOT NULL,
  `name` varchar(250) DEFAULT '0',
  `description` varchar(250) DEFAULT '0',
  `inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=2 ;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`, `description`, `inactive`) VALUES
(1, 'Service Request', 'Service Requests', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `firstname` varchar(120) DEFAULT NULL,
  `lastname` varchar(120) DEFAULT NULL,
  `hashed_password` varchar(128) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `status` enum('active','inactive','deleted') DEFAULT NULL,
  `admin` enum('0','1') DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `userpic` varchar(250) DEFAULT 'no-pic.png',
  `title` varchar(150) NOT NULL,
  `access` varchar(150) NOT NULL DEFAULT '1,2',
  `last_active` varchar(50) DEFAULT NULL,
  `last_login` varchar(50) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstname`, `lastname`, `hashed_password`, `email`, `status`, `admin`, `created`, `userpic`, `title`, `access`, `last_active`, `last_login`) VALUES
(9, 'admin', 'Anton', 'Purwanto', 'b2d35ae7d2e510466d65957c1967d8f26090e3607594450dbdeb6a4fc244fb31ca9d0d1b7796e28770d82cc68e73c803a8b5030900b67f509a76ea3228778e74', 'anton.takaful@gmail.com', 'active', '1', '2012-12-31 20:00:00', 'df42caf9e725b132b505c0f2b8498dd7.jpg', 'Administrator', '1,2,3,4,5,8,6,7,9,10,11,16', '1440396340', '1440396193');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article_has_attachments`
--
ALTER TABLE `article_has_attachments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core`
--
ALTER TABLE `core`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_quotations`
--
ALTER TABLE `custom_quotations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_quotation_requests`
--
ALTER TABLE `custom_quotation_requests`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_has_items`
--
ALTER TABLE `invoice_has_items`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privatemessages`
--
ALTER TABLE `privatemessages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_projects_clients1` (`company_id`);

--
-- Indexes for table `project_has_files`
--
ALTER TABLE `project_has_files`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_has_tasks`
--
ALTER TABLE `project_has_tasks`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_has_workers`
--
ALTER TABLE `project_has_workers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pw_reset`
--
ALTER TABLE `pw_reset`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queues`
--
ALTER TABLE `queues`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_has_items`
--
ALTER TABLE `subscription_has_items`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_has_articles`
--
ALTER TABLE `ticket_has_articles`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_has_attachments`
--
ALTER TABLE `ticket_has_attachments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article_has_attachments`
--
ALTER TABLE `article_has_attachments`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `core`
--
ALTER TABLE `core`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custom_quotations`
--
ALTER TABLE `custom_quotations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custom_quotation_requests`
--
ALTER TABLE `custom_quotation_requests`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice_has_items`
--
ALTER TABLE `invoice_has_items`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `privatemessages`
--
ALTER TABLE `privatemessages`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_has_files`
--
ALTER TABLE `project_has_files`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_has_tasks`
--
ALTER TABLE `project_has_tasks`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_has_workers`
--
ALTER TABLE `project_has_workers`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pw_reset`
--
ALTER TABLE `pw_reset`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `queues`
--
ALTER TABLE `queues`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscription_has_items`
--
ALTER TABLE `subscription_has_items`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `ticket_has_articles`
--
ALTER TABLE `ticket_has_articles`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ticket_has_attachments`
--
ALTER TABLE `ticket_has_attachments`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
