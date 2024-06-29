-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 03, 2021 at 08:40 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `plant`
--
CREATE DATABASE IF NOT EXISTS `plant` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `plant`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add client', 8, 'add_client'),
(30, 'Can change client', 8, 'change_client'),
(31, 'Can delete client', 8, 'delete_client'),
(32, 'Can view client', 8, 'view_client'),
(33, 'Can add disease', 9, 'add_disease'),
(34, 'Can change disease', 9, 'change_disease'),
(35, 'Can delete disease', 9, 'delete_disease'),
(36, 'Can view disease', 9, 'view_disease'),
(37, 'Can add soil_ report', 10, 'add_soil_report'),
(38, 'Can change soil_ report', 10, 'change_soil_report'),
(39, 'Can delete soil_ report', 10, 'delete_soil_report'),
(40, 'Can view soil_ report', 10, 'view_soil_report'),
(41, 'Can add new', 11, 'add_new'),
(42, 'Can change new', 11, 'change_new'),
(43, 'Can delete new', 11, 'delete_new'),
(44, 'Can view new', 11, 'view_new'),
(45, 'Can add contact', 12, 'add_contact'),
(46, 'Can change contact', 12, 'change_contact'),
(47, 'Can delete contact', 12, 'delete_contact'),
(48, 'Can view contact', 12, 'view_contact');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `client_client`
--

CREATE TABLE IF NOT EXISTS `client_client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `address` varchar(250) NOT NULL,
  `email` varchar(30) NOT NULL,
  `date` varchar(10) NOT NULL,
  `phone` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `client_new`
--

CREATE TABLE IF NOT EXISTS `client_new` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `disease` varchar(50) NOT NULL,
  `solutions` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'client', 'client'),
(11, 'client', 'new'),
(5, 'contenttypes', 'contenttype'),
(12, 'projectadmin', 'contact'),
(10, 'projectadmin', 'soil_report'),
(6, 'sessions', 'session'),
(9, 'user', 'disease'),
(7, 'user', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-08-24 10:00:52.189340'),
(2, 'auth', '0001_initial', '2021-08-24 10:01:01.689199'),
(3, 'admin', '0001_initial', '2021-08-24 10:01:04.208876'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-08-24 10:01:04.255753'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-08-24 10:01:04.309142'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-08-24 10:01:05.642765'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-08-24 10:01:06.496761'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-08-24 10:01:07.144446'),
(9, 'auth', '0004_alter_user_username_opts', '2021-08-24 10:01:07.178206'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-08-24 10:01:07.860813'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-08-24 10:01:07.898591'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-08-24 10:01:07.945469'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-08-24 10:01:08.483657'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-08-24 10:01:09.081786'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-08-24 10:01:09.986239'),
(16, 'auth', '0011_update_proxy_permissions', '2021-08-24 10:01:10.033165'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-08-24 10:01:10.634563'),
(18, 'sessions', '0001_initial', '2021-08-24 10:01:11.319712'),
(19, 'user', '0001_initial', '2021-08-24 11:47:37.846787'),
(20, 'user', '0002_alter_user_phone', '2021-08-24 11:47:37.909400'),
(21, 'client', '0001_initial', '2021-08-24 12:46:06.897022'),
(22, 'user', '0003_alter_user_username', '2021-08-24 12:46:07.444035'),
(23, 'user', '0004_disease', '2021-08-30 04:22:10.388648'),
(24, 'user', '0005_alter_disease_image', '2021-08-30 05:56:51.508313'),
(25, 'user', '0006_alter_disease_image', '2021-08-30 06:39:22.838113'),
(26, 'user', '0007_alter_disease_image', '2021-08-30 06:45:50.141786'),
(27, 'user', '0008_alter_disease_image', '2021-08-30 06:45:51.192248'),
(28, 'user', '0009_alter_disease_image', '2021-08-30 06:46:48.883276'),
(29, 'user', '0010_alter_disease_image', '2021-08-30 06:47:29.289506'),
(30, 'user', '0011_disease_admin', '2021-08-30 09:47:05.143864'),
(31, 'user', '0012_disease_user', '2021-08-30 11:42:20.421129'),
(32, 'user', '0013_alter_disease_user', '2021-08-30 11:42:56.241525'),
(33, 'user', '0014_disease_plant_disease', '2021-08-31 03:58:37.337325'),
(34, 'client', '0002_new', '2021-08-31 07:19:35.371872'),
(35, 'projectadmin', '0001_initial', '2021-08-31 07:19:35.756945'),
(36, 'user', '0015_auto_20210831_1358', '2021-08-31 08:29:15.735998'),
(37, 'projectadmin', '0002_contact', '2021-09-02 04:06:29.551235'),
(38, 'user', '0016_alter_disease_plant_disease', '2021-09-02 07:29:10.870268');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('c22aja1roqz44uc9mhy7hf9zf0tslszm', 'eyJ1c2VyIjoic2FuZHkxMiJ9:1mM16F:KYZ1bcmnyjpWfDJNT_pW2EgGvRQw0uaED-2GE9Nf02A', '2021-09-17 04:46:47.632655'),
('efhlsrugiy1xog1kkav6o98ccpwqoiye', 'eyJ1c2VyIjoic2FuZHkiLCJhZG1pbiI6ImFkbWluIn0:1mLHbv:9pBgrjKmmLStqZr3-8Tgil77ij0s_24u0f-7ab_ssBs', '2021-09-15 04:12:27.587371');

-- --------------------------------------------------------

--
-- Table structure for table `projectadmin_contact`
--

CREATE TABLE IF NOT EXISTS `projectadmin_contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `projectadmin_contact`
--

INSERT INTO `projectadmin_contact` (`id`, `name`, `email`, `subject`, `msg`) VALUES
(1, 'asdf', 'prasanna1.surya@gmail.com', 'asdf', 'asdf'),
(2, 'asdfasfasdf', 'prasanna1.surya@gmail.com', 'asdfasdfasg', 'asdgfafgg');

-- --------------------------------------------------------

--
-- Table structure for table `projectadmin_soil_report`
--

CREATE TABLE IF NOT EXISTS `projectadmin_soil_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `month` varchar(30) NOT NULL,
  `product` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `projectadmin_soil_report`
--

INSERT INTO `projectadmin_soil_report` (`id`, `name`, `month`, `product`) VALUES
(1, 'Tiruchirapalli', '(June - July ,Dec - May)', 'sugar cane'),
(2, 'Perambalur', '(June - July ,Dec - May)', 'sugar cane'),
(3, 'Karur', '(June - July ,Dec - May)', 'sugar cane'),
(4, 'Salem', '(June - July ,Dec - May)', 'sugar cane'),
(5, 'Namakkal', '(June - July ,Dec - May)', 'sugar cane'),
(6, 'Vellore', '(Jan-Feb, April - May, June-Ju', 'sorghum'),
(7, 'Thiruvannamalai', '(Jan-Feb, April - May, June-Ju', 'sorghum'),
(8, 'Villupuram', '(Jan-Feb, April - May, June-Ju', 'sorghum'),
(9, 'Thiruvallur', '(Jan-Feb, April - May, June-Ju', 'sorghum'),
(10, 'Kancheepuram  ', '(Jan-Feb, April - May, June-Ju', 'sorghum'),
(11, 'Cuddalore', '(Jan-Feb, April - May, June-Ju', 'sorghum');

-- --------------------------------------------------------

--
-- Table structure for table `user_disease`
--

CREATE TABLE IF NOT EXISTS `user_disease` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plant_name` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  `plant_disease` varchar(255) NOT NULL,
  `client` tinyint(1) NOT NULL,
  `fertilizer` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_user`
--

CREATE TABLE IF NOT EXISTS `user_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `address` varchar(250) NOT NULL,
  `email` varchar(30) NOT NULL,
  `date` varchar(10) NOT NULL,
  `phone` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_username_e2bdfe0c_uniq` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
