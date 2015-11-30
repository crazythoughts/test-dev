-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2015 at 06:42 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kjjcsoft_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE IF NOT EXISTS `tbl_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `customer_age` int(11) NOT NULL,
  `customer_gender` enum('Male','Female') NOT NULL,
  `customer_dob` date NOT NULL,
  `customer_nationality` varchar(100) NOT NULL,
  `customer_citizenshipno` varchar(200) NOT NULL,
  `customer_perm_district` varchar(500) NOT NULL,
  `customer_perm_vdc_municipality` varchar(1000) NOT NULL,
  `customer_perm_extrainfo` varchar(1000) DEFAULT NULL,
  `customer_temp_district` varchar(500) NOT NULL,
  `customer_temp_vdc_municipality` varchar(1000) NOT NULL,
  `customer_temp_extrainfo` varchar(1000) DEFAULT NULL,
  `customer_cell_number_first` varchar(50) DEFAULT NULL,
  `customer_cell_number_second` varchar(50) DEFAULT NULL,
  `customer_landline` varchar(50) DEFAULT NULL,
  `customer_email` varchar(200) DEFAULT NULL,
  `customer_marital_status` enum('Married','Single') NOT NULL,
  `customer_spouse_name` varchar(100) DEFAULT NULL,
  `customer_occupation` varchar(500) NOT NULL,
  `customer_father_name` varchar(100) NOT NULL,
  `customer_grandfather_name` varchar(100) DEFAULT NULL,
  `customer_father_in_law_name` varchar(100) DEFAULT NULL,
  `nominee_name` varchar(200) NOT NULL,
  `nominee_relation` varchar(100) NOT NULL,
  `nominee_perm_district` varchar(100) NOT NULL,
  `nominee_perm_vdc_municipality` varchar(200) NOT NULL,
  `nominee_perm_extrainfo` varchar(200) DEFAULT NULL,
  `nominee_temp_district` varchar(200) NOT NULL,
  `nominee_temp_vdc_municipality` varchar(200) NOT NULL,
  `nominee_temp_extrainfo` varchar(200) DEFAULT NULL,
  `nominee_cell_number_first` varchar(50) DEFAULT NULL,
  `nominee_cell_number_second` varchar(50) DEFAULT NULL,
  `nominee_landline` varchar(50) DEFAULT NULL,
  `nominee_email` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(200) NOT NULL,
  `guardian_relation` varchar(1000) DEFAULT NULL,
  `guardian_perm_district` varchar(200) NOT NULL,
  `guardian_perm_vdc_municipality` varchar(200) NOT NULL,
  `guardian_perm_extrainfo` varchar(200) DEFAULT NULL,
  `guardian_temp_district` varchar(200) NOT NULL,
  `guardian_temp_vdc_municipality` varchar(200) NOT NULL,
  `guardian_temp_extrainfo` varchar(200) DEFAULT NULL,
  `guardian_cell_number_one` varchar(50) DEFAULT NULL,
  `guardian_cell_number_second` varchar(50) DEFAULT NULL,
  `guardian_landline` varchar(50) DEFAULT NULL,
  `guardian_email` varchar(100) DEFAULT NULL,
  `customer_photo` varchar(2000) DEFAULT NULL,
  `customer_thumb_print` varchar(2000) DEFAULT NULL,
  `customer_joined_date` date NOT NULL,
  `customer_refferedby` varchar(100) DEFAULT NULL,
  `customer_approved_by` varchar(100) NOT NULL,
  `entry_by` int(11) NOT NULL,
  `customer_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`customer_id`),
  KEY `user_id` (`entry_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `customer_name`, `customer_age`, `customer_gender`, `customer_dob`, `customer_nationality`, `customer_citizenshipno`, `customer_perm_district`, `customer_perm_vdc_municipality`, `customer_perm_extrainfo`, `customer_temp_district`, `customer_temp_vdc_municipality`, `customer_temp_extrainfo`, `customer_cell_number_first`, `customer_cell_number_second`, `customer_landline`, `customer_email`, `customer_marital_status`, `customer_spouse_name`, `customer_occupation`, `customer_father_name`, `customer_grandfather_name`, `customer_father_in_law_name`, `nominee_name`, `nominee_relation`, `nominee_perm_district`, `nominee_perm_vdc_municipality`, `nominee_perm_extrainfo`, `nominee_temp_district`, `nominee_temp_vdc_municipality`, `nominee_temp_extrainfo`, `nominee_cell_number_first`, `nominee_cell_number_second`, `nominee_landline`, `nominee_email`, `guardian_name`, `guardian_relation`, `guardian_perm_district`, `guardian_perm_vdc_municipality`, `guardian_perm_extrainfo`, `guardian_temp_district`, `guardian_temp_vdc_municipality`, `guardian_temp_extrainfo`, `guardian_cell_number_one`, `guardian_cell_number_second`, `guardian_landline`, `guardian_email`, `customer_photo`, `customer_thumb_print`, `customer_joined_date`, `customer_refferedby`, `customer_approved_by`, `entry_by`, `customer_status`) VALUES
(1, 'Adfasdf Shrestha', 22, 'Male', '1990-10-10', 'Asdfasdfsdaf', '', 'Asdfasdf', 'Asddfasdf', '', '', '', '', '9874563210', '', '', '', 'Single', '', 'Assdffsad', 'Asfasdf', 'Asddfasdf', '', 'Asddfasdf', 'Asdfasdf', 'Asdfasdf', 'Asdfsadf', '', '', '', '', '9845632102', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/love.jpg', 'customer_finger_prints/rc.JPG', '2015-11-18', '', 'Asdfsadfsa', 1, 1),
(2, 'Adfasdf', 22, 'Male', '1990-10-10', 'Asdfasdfsdaf', '', 'Asdfasdf', 'Asddfasdf', '', '', '', '', '9874563210', '', '', '', 'Single', '', 'Assdffsad', 'Asfasdf', 'Asddfasdf', '', 'Asddfasdf', 'Asdfasdf', 'Asdfasdf', 'Asdfsadf', '', '', '', '', '9845632102', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/342fc.JPG', 'customer_finger_prints/love.jpg', '2015-11-18', '', 'Asdfsadfsa', 1, 1),
(3, 'Adfasdf', 22, 'Male', '1990-10-10', 'Asdfasdfsdaf', '', 'Asdfasdf', 'Asddfasdf', '', '', '', '', '9874563210', '', '', '', 'Single', '', 'Assdffsad', 'Asfasdf', 'Asddfasdf', '', 'Asddfasdf', 'Asdfasdf', 'Asdfasdf', 'Asdfsadf', '', '', '', '', '9845632102', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '2015-11-18', '', 'Asdfsadfsa', 1, 1),
(4, 'Adfasdf', 22, 'Male', '1990-10-10', 'Asdfasdfsdaf', '', 'Asdfasdf', 'Asddfasdf', '', '', '', '', '9874563210', '', '', '', 'Single', '', 'Assdffsad', 'Asfasdf', 'Asddfasdf', '', 'Asddfasdf', 'Asdfasdf', 'Asdfasdf', 'Asdfsadf', '', '', '', '', '9845632102', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '2015-11-18', '', 'Asdfsadfsa', 1, 1),
(5, 'Adfasdf', 22, 'Male', '1990-10-10', 'Asdfasdfsdaf', '', 'Asdfasdf', 'Asddfasdf', '', '', '', '', '9874563210', '', '', '', 'Single', '', 'Assdffsad', 'Asfasdf', 'Asddfasdf', '', 'Asddfasdf', 'Asdfasdf', 'Asdfasdf', 'Asdfsadf', '', '', '', '', '9845632102', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '2015-11-18', '', 'Asdfsadfsa', 1, 1),
(6, 'Adfasdf', 22, 'Male', '1990-10-10', 'Asdfasdfsdaf', '', 'Asdfasdf', 'Asddfasdf', '', '', '', '', '9874563210', '', '', '', 'Single', '', 'Assdffsad', 'Asfasdf', 'Asddfasdf', '', 'Asddfasdf', 'Asdfasdf', 'Asdfasdf', 'Asdfsadf', '', '', '', '', '9845632102', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/1.jpg', 'customer_finger_prints/2.jpg', '2015-11-18', '', 'Asdfsadfsa', 1, 1),
(7, 'Adfasdf', 22, 'Male', '1990-10-10', 'Asdfasdfsdaf', '', 'Asdfasdf', 'Asddfasdf', '', '', '', '', '9874563210', '', '', '', 'Single', '', 'Assdffsad', 'Asfasdf', 'Asddfasdf', '', 'Asddfasdf', 'Asdfasdf', 'Asdfasdf', 'Asdfsadf', '', '', '', '', '9845632102', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/11.jpg', 'customer_finger_prints/avatar.jpg', '2015-11-18', '', 'Asdfsadfsa', 1, 1),
(8, 'Wqerwerwqer', 17, 'Male', '1990-10-10', 'Asdfasdfsdaf', '', 'Asdfasdf', 'Asddfasdf', '', '', '', '', '9874563210', '', '', '', 'Single', '', 'Assdffsad', 'Asfasdf', 'Asddfasdf', '', 'Asddfasdf', 'Asdfasdf', 'Asdfasdf', 'Asdfsadf', '', '', '', '', '9845632102', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/1.jpg', 'customer_finger_prints/DSC_0089.jpg', '2015-11-21', '', 'Asdfsadfsa', 1, 1),
(9, 'Rajesh Lam', 20, 'Male', '1990-10-10', 'Nepali', '489756', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '9841257896', '', '', 'rajesh@gmail.com', 'Single', '', 'Student', 'Mahesh Lama', 'Ganesh Lama', '', 'Mahesh Lama', 'Father', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '9874562356', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/1.jpg', 'customer_finger_prints/2.jpg', '2015-11-22', 'Hari Kumar Basnet', 'Sabin Kaji Shrestha', 1, 1),
(10, 'Rajesh Lam', 22, 'Male', '1990-10-10', 'Asdfasdfsdaf', '', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '9874563210', '', '', '', 'Single', '', 'Assdffsad', 'Mahesh Lama', 'Ganesh Lama', '', 'Mahesh Lama', 'Asdfasdf', 'Asdfasdf', 'Jorpati - 4', '', '', '', '', '9874562356', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/1.jpg', 'customer_finger_prints/2.jpg', '2015-11-22', 'Hari Kumar Basnet', 'Sabin Kaji Shrestha', 1, 1),
(11, 'Adfasdf Shrestha', 19, 'Female', '1990-10-14', 'Nepali', '124875', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '9874561235', '', '', '', 'Single', '', 'Student', 'Adfsdf', 'Adfsdaf', '', 'Ssdfsdf', 'Adfdsf', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '3214569871', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/11.jpg', 'customer_finger_prints/DSC_0089.jpg', '2015-11-29', '', 'Sabin Kaji Shrestha', 1, 1),
(12, 'Adfasdf Shrestha', 19, 'Male', '1990-10-14', 'Nepali', '124875', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '9874561235', '', '', '', 'Single', '', 'Student', 'Adfsdf', 'Adfsdaf', '', 'Ssdfsdf', 'Adfdsf', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '3214569871', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/1.jpg', 'customer_photos/dummy-person.jpg', '2015-11-29', '', 'Sabin Kaji Shrestha', 1, 1),
(13, 'Adfasdf Shrestha', 19, 'Male', '1990-10-14', 'Nepali', '124875', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '9874561235', '', '', '', 'Single', '', 'Student', 'Adfsdf', 'Adfsdaf', '', 'Ssdfsdf', 'Adfdsf', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '3214569871', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/1.jpg', 'customer_photos/dummy-person.jpg', '2015-11-29', '', 'Sabin Kaji Shrestha', 1, 1),
(14, 'Adfasdf Shrestha', 19, 'Male', '1990-10-14', 'Nepali', '124875', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '9874561235', '', '', '', 'Single', '', 'Student', 'Adfsdf', 'Adfsdaf', '', 'Ssdfsdf', 'Adfdsf', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '3214569871', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/1.jpg', 'customer_photos/dummy-person.jpg', '2015-11-29', '', 'Sabin Kaji Shrestha', 1, 1),
(15, 'Adfasdf Shrestha', 19, 'Male', '1990-10-14', 'Nepali', '124875', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '9874561235', '', '', '', 'Single', '', 'Student', 'Adfsdf', 'Adfsdaf', '', 'Ssdfsdf', 'Adfdsf', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '3214569871', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/1.jpg', 'customer_finger_prints/dummy-person.jpg', '2015-11-29', '', 'Sabin Kaji Shrestha', 1, 1),
(16, 'Adfasdf Shrestha', 19, 'Male', '1990-10-14', 'Nepali', '124875', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '9874561235', '', '', '', 'Single', '', 'Student', 'Adfsdf', 'Adfsdaf', '', 'Ssdfsdf', 'Adfdsf', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '3214569871', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/1.jpg', 'customer_finger_prints/dummy-person.jpg', '2015-11-29', '', 'Sabin Kaji Shrestha', 1, 1),
(17, 'Adfasdf Shrestha', 19, 'Male', '1990-10-14', 'Nepali', '124875', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '9874561235', '', '', '', 'Single', '', 'Student', 'Adfsdf', 'Adfsdaf', '', 'Ssdfsdf', 'Adfdsf', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '3214569871', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/4411.jpg', 'customer_finger_prints/dummy-person.jpg', '2015-11-29', '', 'Sabin Kaji Shrestha', 1, 1),
(18, 'Aman Shrestha', 19, 'Male', '1990-10-14', 'Nepali', '124875', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '9874561235', '', '', '', 'Single', '', 'Student', 'Adfsdf', 'Adfsdaf', '', 'Ssdfsdf', 'Adfdsf', 'Kathmandu', 'Jorpati - 4', '', '', '', '', '3214569871', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/9391.jpg', 'customer_finger_prints/276dummy-person.jpg', '2015-11-29', '', 'Sabin Kaji Shrestha', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_c_fixed_deposit`
--

CREATE TABLE IF NOT EXISTS `tbl_c_fixed_deposit` (
  `cfd_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `interest_rate` float NOT NULL,
  `maturity_date` date NOT NULL,
  `creation_date` date NOT NULL,
  `approved_by` varchar(500) NOT NULL,
  `entry_by` int(11) NOT NULL,
  PRIMARY KEY (`cfd_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_daily_savings`
--

CREATE TABLE IF NOT EXISTS `tbl_daily_savings` (
  `ds_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `interest_rate` float NOT NULL,
  `creation_date` date NOT NULL,
  `approved_by` varchar(500) NOT NULL,
  `entry_by` int(11) NOT NULL,
  PRIMARY KEY (`ds_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE IF NOT EXISTS `tbl_employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(100) NOT NULL,
  `employee_age` int(11) NOT NULL,
  `employee_gender` enum('Male','Female') NOT NULL,
  `employee_dob` date NOT NULL,
  `employee_marital_status` enum('Married','Single') NOT NULL,
  `employee_perm_district` varchar(100) NOT NULL,
  `employee_perm_vdc_municipality` varchar(200) NOT NULL,
  `employee_perm_extrainfo` varchar(200) DEFAULT NULL,
  `employee_temp_district` varchar(100) NOT NULL,
  `employee_temp_vdc_municipality` varchar(200) NOT NULL,
  `employee_temp_extrainfo` varchar(200) DEFAULT NULL,
  `employee_cell_number_first` varchar(50) DEFAULT NULL,
  `employee_cell_number_second` varchar(50) DEFAULT NULL,
  `employee_landline` varchar(50) DEFAULT NULL,
  `employee_joined_date` date NOT NULL,
  `employee_retired_date` date DEFAULT NULL,
  `employee_email` varchar(200) DEFAULT NULL,
  `employee_fathers_name` varchar(100) NOT NULL,
  `employee_designation` enum('CEO','Manager','Collector','Data Entry operator') NOT NULL,
  `employee_access_level` enum('admin','user') DEFAULT NULL,
  `employee_photo` varchar(2000) NOT NULL,
  `entry_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`employee_id`, `employee_name`, `employee_age`, `employee_gender`, `employee_dob`, `employee_marital_status`, `employee_perm_district`, `employee_perm_vdc_municipality`, `employee_perm_extrainfo`, `employee_temp_district`, `employee_temp_vdc_municipality`, `employee_temp_extrainfo`, `employee_cell_number_first`, `employee_cell_number_second`, `employee_landline`, `employee_joined_date`, `employee_retired_date`, `employee_email`, `employee_fathers_name`, `employee_designation`, `employee_access_level`, `employee_photo`, `entry_by`) VALUES
(1, 'John Doe', 30, 'Male', '2015-10-01', 'Single', 'somewhere', '', '', 'somewhere', '', NULL, '', '', '', '2015-10-14', '2015-10-15', 'example@example.com', 'John D', 'CEO', 'admin', 'employee/dummy-person.jpg', NULL),
(2, 'jane doe', 25, 'Female', '2014-12-01', 'Married', 'somewhere', '', '', 'somewhere', '', NULL, '', '', '', '2015-09-07', NULL, 'someone@example.com', 'john doe', 'Data Entry operator', 'user', 'employee/dummy-person.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fixed_deposit`
--

CREATE TABLE IF NOT EXISTS `tbl_fixed_deposit` (
  `fds_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `interest_rate` float NOT NULL,
  `fd_amount` double NOT NULL,
  `maturity_date` date NOT NULL,
  `creation_date` date NOT NULL,
  `approved_by` varchar(500) NOT NULL,
  `entry_by` int(11) NOT NULL,
  PRIMARY KEY (`fds_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_monthly_savings`
--

CREATE TABLE IF NOT EXISTS `tbl_monthly_savings` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `interest_rate` float NOT NULL,
  `creation_date` date NOT NULL,
  `approved_by` varchar(500) NOT NULL,
  `entry_by` int(11) NOT NULL,
  PRIMARY KEY (`ms_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `role` enum('Administrator','User') NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `Username` (`username`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `username`, `password`, `role`, `employee_id`, `user_enabled`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 1, 1),
(2, 'dummy', '275876e34cf609db118f3d84b799a790', 'User', 2, 1),
(3, 'nothing', '827ccb0eea8a706c4c34a16891f84e7b', 'User', 2, 0),
(4, 'hariram', '62ee25ba9eba3ed2b071b06a7a4fc1e9', 'User', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_log`
--

CREATE TABLE IF NOT EXISTS `tbl_user_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `last_login` datetime NOT NULL,
  `last_logout` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=135 ;

--
-- Dumping data for table `tbl_user_log`
--

INSERT INTO `tbl_user_log` (`log_id`, `user_id`, `last_login`, `last_logout`) VALUES
(1, 1, '2015-11-18 02:36:21', '2015-11-18 02:37:13'),
(2, 1, '2015-11-18 03:03:09', '2015-11-18 03:05:30'),
(3, 1, '2015-11-18 03:05:55', '2015-11-18 03:09:09'),
(4, 1, '2015-11-18 03:09:33', '2015-11-18 03:11:14'),
(5, 1, '2015-11-18 03:12:34', NULL),
(6, 1, '2015-11-18 03:17:32', '2015-11-18 03:19:19'),
(7, 1, '2015-11-18 03:31:46', '2015-11-18 03:32:43'),
(8, 1, '2015-11-18 03:33:46', '2015-11-18 03:40:09'),
(9, 1, '2015-11-18 03:43:54', '2015-11-18 03:53:32'),
(10, 1, '2015-11-18 10:22:11', '2015-11-18 10:22:44'),
(11, 1, '2015-11-18 10:25:13', '2015-11-18 10:26:53'),
(12, 1, '2015-11-18 11:23:29', '2015-11-18 11:23:41'),
(13, 1, '2015-11-18 11:24:33', '2015-11-18 11:25:20'),
(14, 1, '2015-11-18 11:26:21', '2015-11-18 11:32:27'),
(15, 1, '2015-11-18 11:34:09', '2015-11-18 11:35:01'),
(16, 1, '2015-11-18 12:01:58', '2015-11-18 12:02:16'),
(17, 1, '2015-11-18 12:06:12', NULL),
(18, 1, '2015-11-18 12:10:37', '2015-11-18 12:15:08'),
(19, 1, '2015-11-18 12:20:30', '2015-11-18 12:21:05'),
(20, 1, '2015-11-18 12:23:43', '2015-11-18 12:26:18'),
(21, 1, '2015-11-18 12:41:01', '2015-11-18 12:41:32'),
(22, 1, '2015-11-18 12:42:26', '2015-11-18 12:43:29'),
(23, 1, '2015-11-18 13:15:34', '2015-11-18 13:15:47'),
(24, 1, '2015-11-21 07:03:01', '2015-11-21 07:03:57'),
(25, 1, '2015-11-21 07:04:28', '2015-11-21 07:04:51'),
(26, 1, '2015-11-21 07:06:26', '2015-11-21 07:07:18'),
(27, 1, '2015-11-21 07:08:13', '2015-11-21 07:08:39'),
(28, 1, '2015-11-21 07:21:59', '2015-11-21 07:22:13'),
(29, 1, '2015-11-21 07:52:17', '2015-11-21 07:52:38'),
(30, 1, '2015-11-21 08:05:21', '2015-11-21 08:07:26'),
(31, 1, '2015-11-21 11:53:16', NULL),
(32, 1, '2015-11-21 11:59:00', '2015-11-21 12:17:05'),
(33, 1, '2015-11-21 12:38:25', NULL),
(34, 1, '2015-11-22 12:50:56', '2015-11-22 12:55:57'),
(35, 1, '2015-11-22 12:56:28', '2015-11-22 12:58:11'),
(36, 1, '2015-11-22 13:01:12', '2015-11-22 13:28:18'),
(37, 1, '2015-11-25 01:08:56', '2015-11-25 01:17:32'),
(38, 1, '2015-11-25 01:24:57', '2015-11-25 01:26:11'),
(39, 1, '2015-11-25 01:26:28', '2015-11-25 01:26:34'),
(40, 1, '2015-11-25 01:27:42', '2015-11-25 01:35:44'),
(41, 1, '2015-11-25 01:39:55', '2015-11-25 01:42:29'),
(42, 1, '2015-11-25 01:43:10', '2015-11-25 01:43:28'),
(43, 1, '2015-11-25 01:44:17', '2015-11-25 01:44:31'),
(44, 1, '2015-11-25 01:46:01', '2015-11-25 01:46:29'),
(45, 1, '2015-11-25 01:48:08', '2015-11-25 01:57:42'),
(46, 1, '2015-11-25 03:00:25', '2015-11-25 03:04:52'),
(47, 1, '2015-11-25 03:08:18', '2015-11-25 03:09:46'),
(48, 1, '2015-11-25 03:22:54', '2015-11-25 03:35:49'),
(49, 1, '2015-11-25 03:43:14', '2015-11-25 03:43:22'),
(50, 1, '2015-11-25 03:49:32', '2015-11-25 03:49:36'),
(51, 1, '2015-11-25 03:51:05', '2015-11-25 04:23:39'),
(52, 1, '2015-11-25 04:32:37', '2015-11-25 04:36:31'),
(53, 1, '2015-11-25 06:21:31', '2015-11-25 06:53:50'),
(54, 1, '2015-11-25 06:58:32', '2015-11-25 07:00:42'),
(55, 1, '2015-11-25 07:03:03', '2015-11-25 07:05:18'),
(56, 1, '2015-11-25 07:14:26', '2015-11-25 07:19:17'),
(57, 1, '2015-11-25 07:23:02', '2015-11-25 07:27:28'),
(58, 1, '2015-11-25 07:27:53', '2015-11-25 07:40:02'),
(59, 1, '2015-11-25 09:20:42', NULL),
(60, 1, '2015-11-25 11:33:48', '2015-11-25 11:57:31'),
(61, 1, '2015-11-25 12:03:59', NULL),
(62, 1, '2015-11-25 12:15:12', '2015-11-25 12:15:21'),
(63, 1, '2015-11-25 13:38:48', '2015-11-25 13:40:42'),
(64, 1, '2015-11-25 13:40:56', '2015-11-25 13:43:16'),
(65, 1, '2015-11-25 13:43:33', '2015-11-25 13:44:00'),
(66, 1, '2015-11-25 13:45:39', '2015-11-25 13:46:35'),
(67, 1, '2015-11-26 06:38:51', '2015-11-26 06:39:53'),
(68, 1, '2015-11-26 06:40:00', NULL),
(69, 1, '2015-11-26 06:59:01', '2015-11-26 06:59:57'),
(70, 1, '2015-11-26 07:01:16', '2015-11-26 07:03:59'),
(71, 1, '2015-11-26 07:12:01', '2015-11-26 07:12:34'),
(72, 1, '2015-11-26 07:13:06', '2015-11-26 07:27:05'),
(73, 1, '2015-11-26 07:38:35', NULL),
(74, 1, '2015-11-26 08:07:07', '2015-11-26 08:08:46'),
(75, 1, '2015-11-26 08:17:32', '2015-11-26 08:19:04'),
(76, 1, '2015-11-26 08:20:47', '2015-11-26 08:21:23'),
(77, 1, '2015-11-26 08:26:51', '2015-11-26 08:27:38'),
(78, 1, '2015-11-26 08:30:20', '2015-11-26 08:30:52'),
(79, 1, '2015-11-26 08:33:35', '2015-11-26 08:36:18'),
(80, 1, '2015-11-26 08:40:29', '2015-11-26 08:41:43'),
(81, 1, '2015-11-26 08:42:08', '2015-11-26 08:44:29'),
(82, 1, '2015-11-26 08:45:25', '2015-11-26 08:46:27'),
(83, 1, '2015-11-26 09:00:44', '2015-11-26 09:02:33'),
(84, 1, '2015-11-26 12:01:02', '2015-11-26 12:02:00'),
(85, 1, '2015-11-26 12:02:14', '2015-11-26 12:03:31'),
(86, 1, '2015-11-28 00:27:39', '2015-11-28 00:31:15'),
(87, 1, '2015-11-28 00:32:05', '2015-11-28 00:37:12'),
(88, 1, '2015-11-28 00:59:00', '2015-11-28 01:02:22'),
(89, 1, '2015-11-28 01:04:53', '2015-11-28 01:07:24'),
(90, 1, '2015-11-28 05:55:15', '2015-11-28 05:55:54'),
(91, 1, '2015-11-28 05:56:51', NULL),
(92, 1, '2015-11-28 06:01:49', NULL),
(93, 1, '2015-11-28 06:47:45', '2015-11-28 06:53:27'),
(94, 1, '2015-11-28 06:53:58', '2015-11-28 06:58:09'),
(95, 1, '2015-11-28 07:50:22', '2015-11-28 07:58:11'),
(96, 1, '2015-11-28 08:04:55', NULL),
(97, 1, '2015-11-28 08:06:41', '2015-11-28 08:07:16'),
(98, 1, '2015-11-28 08:08:19', '2015-11-28 08:17:02'),
(99, 1, '2015-11-28 08:17:20', NULL),
(100, 1, '2015-11-28 08:19:09', '2015-11-28 08:19:32'),
(101, 1, '2015-11-28 09:01:31', '2015-11-28 09:02:16'),
(102, 1, '2015-11-28 09:05:18', '2015-11-28 09:05:55'),
(103, 1, '2015-11-28 09:06:08', '2015-11-28 09:08:23'),
(104, 1, '2015-11-28 09:08:38', '2015-11-28 09:11:35'),
(105, 1, '2015-11-28 09:12:58', '2015-11-28 09:13:15'),
(106, 1, '2015-11-28 09:16:42', NULL),
(107, 1, '2015-11-28 09:25:49', '2015-11-28 09:30:37'),
(108, 1, '2015-11-29 10:28:10', '2015-11-29 10:47:20'),
(109, 1, '2015-11-29 10:49:03', '2015-11-29 10:50:57'),
(110, 1, '2015-11-29 10:51:27', NULL),
(111, 1, '2015-11-29 10:54:44', '2015-11-29 10:55:58'),
(112, 1, '2015-11-29 14:25:47', '2015-11-29 14:26:49'),
(113, 1, '2015-11-29 14:27:23', '2015-11-29 14:29:00'),
(114, 1, '2015-11-29 14:29:14', '2015-11-29 14:30:47'),
(115, 1, '2015-11-29 14:30:59', '2015-11-29 14:38:01'),
(116, 1, '2015-11-29 14:56:39', '2015-11-29 14:59:20'),
(117, 1, '2015-11-29 15:18:30', '2015-11-29 15:22:28'),
(118, 1, '2015-11-29 15:23:02', '2015-11-29 15:23:42'),
(119, 1, '2015-11-29 16:00:41', NULL),
(120, 1, '2015-11-29 16:01:26', '2015-11-29 16:04:14'),
(121, 1, '2015-11-29 16:30:45', NULL),
(122, 1, '2015-11-29 16:34:23', '2015-11-29 16:42:17'),
(123, 1, '2015-11-29 16:42:42', NULL),
(124, 1, '2015-11-29 16:47:42', '2015-11-29 16:51:42'),
(125, 1, '2015-11-29 16:53:02', '2015-11-29 17:03:10'),
(126, 1, '2015-11-29 17:37:26', '2015-11-29 17:40:11'),
(127, 1, '2015-11-29 17:40:26', '2015-11-29 17:42:41'),
(128, 1, '2015-11-29 18:55:45', '2015-11-29 19:08:50'),
(129, 1, '2015-11-29 19:11:35', '2015-11-29 19:14:39'),
(130, 1, '2015-11-30 11:13:36', '2015-11-30 11:14:36'),
(131, 1, '2015-11-30 11:14:53', '2015-11-30 11:15:16'),
(132, 1, '2015-11-30 11:15:48', '2015-11-30 11:19:28'),
(133, 1, '2015-11-30 11:20:04', '2015-11-30 11:22:12'),
(134, 1, '2015-11-30 11:23:24', '2015-11-30 11:25:17');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_c_fixed_deposit`
--
ALTER TABLE `tbl_c_fixed_deposit`
  ADD CONSTRAINT `tbl_c_fixed_deposit_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_daily_savings`
--
ALTER TABLE `tbl_daily_savings`
  ADD CONSTRAINT `tbl_daily_savings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_fixed_deposit`
--
ALTER TABLE `tbl_fixed_deposit`
  ADD CONSTRAINT `tbl_fixed_deposit_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_monthly_savings`
--
ALTER TABLE `tbl_monthly_savings`
  ADD CONSTRAINT `tbl_monthly_savings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `FOREIGN_KEY` FOREIGN KEY (`employee_id`) REFERENCES `tbl_employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_user_log`
--
ALTER TABLE `tbl_user_log`
  ADD CONSTRAINT `tbl_user_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
