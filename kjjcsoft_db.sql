-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2015 at 02:04 AM
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
  `customer_photo` varchar(2000) NOT NULL,
  `customer_thumb_print` varchar(2000) NOT NULL,
  `customer_joined_date` date NOT NULL,
  `customer_refferedby` varchar(100) DEFAULT NULL,
  `entry_by` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `user_id` (`entry_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `customer_name`, `customer_age`, `customer_gender`, `customer_dob`, `customer_nationality`, `customer_citizenshipno`, `customer_perm_district`, `customer_perm_vdc_municipality`, `customer_perm_extrainfo`, `customer_temp_district`, `customer_temp_vdc_municipality`, `customer_temp_extrainfo`, `customer_cell_number_first`, `customer_cell_number_second`, `customer_landline`, `customer_email`, `customer_marital_status`, `customer_spouse_name`, `customer_occupation`, `customer_father_name`, `customer_grandfather_name`, `customer_father_in_law_name`, `nominee_name`, `nominee_perm_district`, `nominee_perm_vdc_municipality`, `nominee_perm_extrainfo`, `nominee_temp_district`, `nominee_temp_vdc_municipality`, `nominee_temp_extrainfo`, `nominee_cell_number_first`, `nominee_cell_number_second`, `nominee_landline`, `nominee_email`, `guardian_name`, `guardian_relation`, `guardian_perm_district`, `guardian_perm_vdc_municipality`, `guardian_perm_extrainfo`, `guardian_temp_district`, `guardian_temp_vdc_municipality`, `guardian_temp_extrainfo`, `guardian_cell_number_one`, `guardian_cell_number_second`, `guardian_landline`, `guardian_email`, `customer_photo`, `customer_thumb_print`, `customer_joined_date`, `customer_refferedby`, `entry_by`) VALUES
(1, 'Ram Bahadur Shrestha', 20, 'Male', '2014-04-01', 'Nepali', '1256/120', 'Kathmandu', 'Jorpati', NULL, '', '', NULL, '9841152345', NULL, NULL, NULL, 'Single', NULL, 'Student', 'Shyam Bahadur Shrestha', 'Gyan Bahadur Shrestha', NULL, 'Ravi Bahadur Shrestha', 'Kathmandu', 'Jorpati - 4', NULL, '', '', NULL, '9841525354', NULL, NULL, NULL, '', NULL, '', '', NULL, '', '', NULL, NULL, NULL, NULL, NULL, 'adfasdfasdf', 'adsfdasdfsadf', '2015-11-04', NULL, 1),
(2, 'Hari Subedi', 20, 'Male', '1995-01-01', 'Nepali', '9874/214', 'Kathmandu', 'Jorpati - 2', '', '', '', '', '9845124632', '9841256325', '012458796', 'hari@gmail.com', 'Married', 'Hari Maya Subedi', 'Officer', 'Ramesh Subedi', 'Mahesh Subedi', '', 'Hari Maya Subedi', 'Kathmandu', 'Jorpati - 4', '', 'Kathmandu', 'Jorpati - 2', '', '9841576235', '9841563725', '', 'harimaya@gmail.com', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/avatar.jpg', 'customer_finger_prints/f.jpg', '2015-11-06', 'Prana Subedi', 1),
(3, 'adfasdf', 20, 'Male', '1995-01-01', 'afdasf', 'adsfasfd', 'asdfasf', 'asfdasf', '', '', '', '', 'asdfasf', '', '', '', 'Single', '', 'asdfasdf', 'asdfas', 'asdfasdf', '', 'asdfasfd', 'afdsaf', 'asdfasfd', '', '', '', '', 'sadfasfd', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/DSC_0167.JPG', 'customer_finger_prints/DSC_0207.JPG', '2015-11-06', 'adfas', 1),
(4, 'adfasfd', 22, 'Male', '1987-12-27', 'adfasf', 'asdfsaf', 'asdfasf', 'sadfasf', '', '', '', '', 'asfdasf', '', '', '', 'Single', '', 'afsaf', 'asfdasf', 'asfdasf', '', 'asdfasf', 'asdfasf', 'asdfasf', '', '', '', '', 'asfasf', 'asdfasfd', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/DSC_0168.JPG', 'customer_finger_prints/download (3).jpg', '2015-11-06', 'asfdasfd', 1),
(5, 'adfasfd', 21, 'Male', '1989-12-31', 'afaasdf', 'asdfasfd', 'asfdasf', 'asfdasf', '', 'afdsa', 'asfdasfd', '', 'asfdsaf', '', '', '', 'Single', '', 'afdasf', 'aasdfsaf', 'asdfasf', '', 'afdasf', 'asdfasfd', 'asdfsdf', '', '', '', '', 'asfdasfd', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/rawseek.png', 'customer_finger_prints/seanrow.jpg', '2015-11-06', 'asddfsaf', 1),
(6, 'afasdfas', 22, 'Female', '1989-12-31', 'adfsafaf', 'asdfasf', 'afdasdf', 'asfasf', '', 'asfdasf', 'saddfsafd', '', 'adsfasf', 'asfasfd', '', '', 'Single', '', 'afdasdfasf', 'sadfsaf', 'asdfasf', '', 'dsfasdf', 'asfdasf', 'asdfasfd', '', 'asdfasf', 'asdfsafd', '', 'adsfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'customer_photos/seanrow.jpg', 'customer_finger_prints/rawseek.png', '2015-11-06', 'asdfasfd', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_c_fixed_deposit`
--

INSERT INTO `tbl_c_fixed_deposit` (`cfd_id`, `customer_id`, `interest_rate`, `maturity_date`, `creation_date`, `approved_by`, `entry_by`) VALUES
(1, 1, 11, '2018-11-06', '2015-11-06', 'sabin', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_daily_savings`
--

INSERT INTO `tbl_daily_savings` (`ds_id`, `customer_id`, `interest_rate`, `creation_date`, `approved_by`, `entry_by`) VALUES
(1, 3, 11, '2015-11-06', 'afdasf', 1),
(2, 4, 11, '2015-11-06', 'asdfasf', 1),
(3, 5, 11, '2015-11-06', 'adfasdf', 1);

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
(1, 'John Doe', 30, 'Male', '2015-10-01', 'Single', 'somewhere', '', '', 'somewhere', '', NULL, '', '', '', '2015-10-14', '2015-10-15', 'example@example.com', 'John D', 'CEO', 'admin', '', NULL),
(2, 'jane doe', 25, 'Female', '2014-12-01', 'Married', 'somewhere', '', '', 'somewhere', '', NULL, '', '', '', '2015-09-07', NULL, 'someone@example.com', 'john doe', 'Data Entry operator', 'user', '', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_fixed_deposit`
--

INSERT INTO `tbl_fixed_deposit` (`fds_id`, `customer_id`, `interest_rate`, `fd_amount`, `maturity_date`, `creation_date`, `approved_by`, `entry_by`) VALUES
(1, 1, 11, 250000, '2018-11-06', '2015-11-06', 'adfasdf', 1),
(2, 2, 23, 26000, '2019-11-06', '2015-11-06', 'adfasdf', 2),
(3, 3, 12, 560000, '2019-11-06', '2015-11-06', 'ram', 2),
(4, 5, 14, 300000, '2018-11-06', '2015-11-06', 'ram', 1),
(5, 3, 14, 260000, '2019-11-06', '2015-11-06', 'sabin', 1),
(6, 1, 16, 400000, '2020-11-06', '2015-11-06', 'sabin', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_monthly_savings`
--

INSERT INTO `tbl_monthly_savings` (`ms_id`, `customer_id`, `interest_rate`, `creation_date`, `approved_by`, `entry_by`) VALUES
(1, 6, 11, '2015-11-06', 'adfsafd', 1),
(2, 1, 11, '2015-11-06', 'assdfasdf', 1),
(3, 1, 11, '2015-11-06', 'adfdsf', 2),
(4, 2, 12, '2015-11-06', 'dafasdf', 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `username`, `password`, `role`, `employee_id`, `user_enabled`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 1, 1),
(2, 'dummy', '275876e34cf609db118f3d84b799a790', 'User', 2, 1);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
