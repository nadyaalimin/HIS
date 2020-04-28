-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2020 at 08:33 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `allhis`
--

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `bed_id` int(11) NOT NULL,
  `inpatient_id` int(128) NOT NULL,
  `room_id` int(11) NOT NULL,
  `nurse_id` int(11) NOT NULL,
  `bed_availability` enum('available','not available','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bed`
--

INSERT INTO `bed` (`bed_id`, `inpatient_id`, `room_id`, `nurse_id`, `bed_availability`) VALUES
(1, 0, 1, 1, 'available'),
(2, 0, 1, 2, 'available'),
(3, 0, 1, 3, 'available'),
(4, 0, 2, 1, 'available'),
(5, 0, 2, 2, 'available'),
(6, 0, 3, 3, 'available'),
(7, 0, 3, 4, 'available'),
(8, 0, 4, 5, 'available'),
(9, 0, 5, 5, 'available'),
(10, 0, 6, 6, 'available');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bills_id` int(11) NOT NULL,
  `total_price` int(128) NOT NULL,
  `bill_status` enum('done','not done','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `completed_requests`
--

CREATE TABLE `completed_requests` (
  `id` int(11) NOT NULL,
  `item_name` varchar(128) NOT NULL,
  `notes` varchar(128) NOT NULL,
  `completed_on` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(128) NOT NULL,
  `symptoms` varchar(128) NOT NULL,
  `blood_type` varchar(128) NOT NULL,
  `blood_pressure` varchar(128) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `blood_glucose` varchar(128) NOT NULL,
  `allergies` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `completed_requests`
--

INSERT INTO `completed_requests` (`id`, `item_name`, `notes`, `completed_on`, `user_id`, `user_email`, `symptoms`, `blood_type`, `blood_pressure`, `height`, `weight`, `blood_glucose`, `allergies`) VALUES
(35, 'Hayasaka', 'collected', '1586294169', 14, 'admin@gmail.com', 'abc', 'B', 'abc', 55, 55, 'abc', 'abc'),
(36, 'Matius', 'pusing', '1586931403', 12, 'noach@gmail.com', 'pusing', 'A', '1', 1, 1, '1', 'lebah'),
(37, 'Noach', 'test', '1587105217', 15, 'farrel@gmail.com', 'test', 'AB', 'test', 59, 55, 'abc', 'abc'),
(38, 'ade', 'test', '1587105332', 15, 'farrel@gmail.com', 'test', 'A', '122', 12, 12, 'gygsyd', 'gdhdv');

-- --------------------------------------------------------

--
-- Table structure for table `completed_requests_radiology`
--

CREATE TABLE `completed_requests_radiology` (
  `id` int(11) NOT NULL,
  `item_name` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `notes` varchar(128) NOT NULL,
  `completed_on` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `completed_requests_radiology`
--

INSERT INTO `completed_requests_radiology` (`id`, `item_name`, `image`, `notes`, `completed_on`, `user_id`, `user_email`) VALUES
(1, 'Matius', '', 'gila', '1586931770', 12, 'noach@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `diagnoses`
--

CREATE TABLE `diagnoses` (
  `diagnose_id` int(11) NOT NULL,
  `patient_id` int(128) NOT NULL,
  `diagnose_by_doctor_id` int(128) NOT NULL,
  `details` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `phonenumber` varchar(200) NOT NULL,
  `doctor_schedule` datetime NOT NULL,
  `doctor_speciality` varchar(128) NOT NULL,
  `doctor_department` varchar(200) NOT NULL,
  `gender` enum('male','female') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `first_name`, `last_name`, `phonenumber`, `doctor_schedule`, `doctor_speciality`, `doctor_department`, `gender`) VALUES
(2, 'Markus', 'Star', '08121305959', '2020-03-01 12:38:50', 'Heart', 'Cardiology', 'male'),
(3, 'Noach', 'Lupin', '08121309292', '2020-04-13 13:27:04', 'Heart', 'Cardiology', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `doctors_assigned_to_patient`
--

CREATE TABLE `doctors_assigned_to_patient` (
  `date_from` datetime NOT NULL,
  `patient_id` int(128) NOT NULL,
  `doctor_id` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `drug_id` int(11) NOT NULL,
  `drug_name` varchar(128) NOT NULL,
  `drug_type` varchar(128) NOT NULL,
  `drug_price` int(128) NOT NULL,
  `drug_desc` varchar(128) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`drug_id`, `drug_name`, `drug_type`, `drug_price`, `drug_desc`, `supplier_id`) VALUES
(1, 'Tempra', 'Paracetamol', 70000, 'ENAK RASA ANGGUR', 1),
(2, 'Panadol', 'Paracetamol', 30000, 'Pait bro', 1),
(3, 'Ibu dan Anak', 'Obat Batuk', 50000, 'Enak bro mint mint gitu deh', 1),
(4, 'Tolak Angin', 'Masuk Angin', 20000, 'Biar gak aasuk angin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `drugs_for_indications`
--

CREATE TABLE `drugs_for_indications` (
  `drugs_indications_id` int(11) NOT NULL,
  `diagnose_id` int(128) NOT NULL,
  `drug_id` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `drugs_item`
--

CREATE TABLE `drugs_item` (
  `drug_id` int(11) NOT NULL,
  `drug_code` varchar(50) NOT NULL,
  `drug_name` varchar(128) NOT NULL,
  `drug_type` varchar(128) NOT NULL,
  `drug_price` int(128) NOT NULL,
  `drug_desc` varchar(128) NOT NULL,
  `drug_loc` int(11) NOT NULL,
  `drug_exp_date` date NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drugs_item`
--

INSERT INTO `drugs_item` (`drug_id`, `drug_code`, `drug_name`, `drug_type`, `drug_price`, `drug_desc`, `drug_loc`, `drug_exp_date`, `supplier_id`) VALUES
(1, 'NDC0777310502', 'Tempra', 'Paraetamol', 70000, 'ENAK RASA ANGGUR', 3, '2020-06-05', 1),
(2, 'NDC0777310503', 'Panadol', 'Anti Nyeri', 12000, 'berbagai jenis', 3, '2020-10-02', 1),
(3, 'NDC0777310506', 'Troches', 'Antibiotik', 40000, 'meredakan radang tenggorokan', 3, '2020-10-09', 2);

-- --------------------------------------------------------

--
-- Table structure for table `drugs_loc`
--

CREATE TABLE `drugs_loc` (
  `drug_id` int(11) NOT NULL,
  `drug_loc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drugs_loc`
--

INSERT INTO `drugs_loc` (`drug_id`, `drug_loc`) VALUES
(1, 'Laboratory'),
(2, 'Nursing'),
(3, 'Pharmacy'),
(4, 'Warehouse');

-- --------------------------------------------------------

--
-- Table structure for table `inpatient`
--

CREATE TABLE `inpatient` (
  `inpatient_id` int(11) NOT NULL,
  `patientMedicalRecord_id` int(128) NOT NULL,
  `reference` enum('Inpatient','Outpatient','UGD','Other Hospital') NOT NULL,
  `date_in` int(128) NOT NULL,
  `date_out` int(128) NOT NULL,
  `bed_id` int(128) NOT NULL,
  `inpatient_status` enum('Waiting','Inpatient','Discharge','') NOT NULL,
  `doctor_id` int(128) NOT NULL,
  `nurse_id` int(128) NOT NULL,
  `payment_method` enum('Debit','Cash','Installment','BPJS','Insurance') NOT NULL,
  `room_grade` varchar(128) NOT NULL,
  `payment_total` bigint(128) NOT NULL,
  `payment_status` enum('Paid','Not Paid','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inpatient`
--

INSERT INTO `inpatient` (`inpatient_id`, `patientMedicalRecord_id`, `reference`, `date_in`, `date_out`, `bed_id`, `inpatient_status`, `doctor_id`, `nurse_id`, `payment_method`, `room_grade`, `payment_total`, `payment_status`) VALUES
(2, 1233, 'Other Hospital', 1587103726, 1587103726, 0, 'Waiting', 3, 1, 'BPJS', 'vip', 0, 'Not Paid'),
(3, 122, 'Outpatient', 1587104761, 0, 10, 'Inpatient', 3, 4, '', 'vvip', 0, 'Not Paid');

-- --------------------------------------------------------

--
-- Table structure for table `inpatient_treatment`
--

CREATE TABLE `inpatient_treatment` (
  `id` int(11) NOT NULL,
  `patientMedicalRecord_id` int(128) NOT NULL,
  `diagnose` varchar(128) NOT NULL,
  `lab_schedule` int(128) NOT NULL,
  `lab_pic` int(128) NOT NULL,
  `lab_result` varchar(128) NOT NULL,
  `visit_schedule` int(128) NOT NULL,
  `prescription` varchar(128) NOT NULL,
  `date_added` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inpatient_treatment`
--

INSERT INTO `inpatient_treatment` (`id`, `patientMedicalRecord_id`, `diagnose`, `lab_schedule`, `lab_pic`, `lab_result`, `visit_schedule`, `prescription`, `date_added`) VALUES
(18, 1233, 'grrrr', 0, 0, '', 0, '', 1587103726),
(19, 122, 'sakit perut', 0, 0, '', 0, '', 1587104761),
(20, 122, 'usus buntu', 1, 0, '', 0, 'abc', 1587104840);

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `nurse_id` int(11) NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `gender` enum('male','female','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`nurse_id`, `first_name`, `last_name`, `gender`) VALUES
(1, 'Dion', 'Krisnadi', 'male'),
(2, 'Robertus', 'Hudi', 'male'),
(3, 'Angel', 'Lica', 'female'),
(4, 'Alessandro', 'Kartika', 'male'),
(5, 'Nadya', 'Alimin', 'female'),
(6, 'Kayleen', 'Priscilia', 'female');

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `order_date` int(11) NOT NULL,
  `drug_name` varchar(128) NOT NULL,
  `quantity` varchar(128) NOT NULL,
  `price` int(128) NOT NULL,
  `recieved_date` int(11) NOT NULL,
  `pharmacy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_history`
--

INSERT INTO `order_history` (`id`, `supplier_id`, `order_date`, `drug_name`, `quantity`, `price`, `recieved_date`, `pharmacy_id`) VALUES
(1, 2, 2147483647, 'Panadol', '4 lsn', 60000, 2147483647, 2);

-- --------------------------------------------------------

--
-- Table structure for table `outpatient`
--

CREATE TABLE `outpatient` (
  `outpatient_id` int(11) NOT NULL,
  `patient_id` int(128) NOT NULL,
  `doctor_id` int(128) NOT NULL,
  `visit_schedule` int(128) NOT NULL,
  `prescription_id` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `patientMedicalRecord_id` int(128) NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `DOB` date NOT NULL,
  `phonenum` varchar(128) NOT NULL,
  `date_added` varchar(200) NOT NULL,
  `patient_status` enum('discharged','outpatient','inpatient','') NOT NULL,
  `patient_address` varchar(128) NOT NULL,
  `diagnoses` varchar(200) NOT NULL,
  `drug_name` varchar(200) NOT NULL,
  `quantity` int(11) NOT NULL,
  `dosage` int(11) NOT NULL,
  `prescriber` varchar(200) NOT NULL,
  `process_status` varchar(200) NOT NULL,
  `date_issued` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `patientMedicalRecord_id`, `first_name`, `last_name`, `gender`, `DOB`, `phonenum`, `date_added`, `patient_status`, `patient_address`, `diagnoses`, `drug_name`, `quantity`, `dosage`, `prescriber`, `process_status`, `date_issued`) VALUES
(1, 71, 'Noach', 'Tjahjadi', 'male', '2020-03-10', '087853332920', '1586329474', 'outpatient', 'Jalan Bumi Indah Damai Nomor 5 Jakarta Barat Daya', '              test', 'Ibu dan Anak', 12, 3, 'Markus-Star', 'on progress', 1587097878),
(2, 111, 'Matius', 'Ebenhaezer', 'male', '2020-03-01', '08121030492', '1586329474', 'discharged', 'Jalan Binong Meledak Nomor 20 ', '              batuk', 'Ibu dan Anak', 3, 2, 'Noach-Lupin', 'on progress', 1587476982),
(3, 90, 'Denny', 'Raymond', 'male', '2020-03-25', '081310430429', '1586329474', 'inpatient', 'Jalan Kebanggaan Mama Nomor 5 Jakarta Barat', '              Demam', 'Tolak Angin', 1, 1, 'Noach-Lupin', 'on progress', 1586785087),
(4, 1233, 'Denny', 'Raymond', 'male', '2020-04-07', '083567236812', '1587103664', 'outpatient', 'papua', '              pusing', 'Panadol', 1, 1, 'Markus-Star', 'on progress', 1587105074),
(5, 122, 'raysa', 'goh', 'female', '2020-04-08', '081567258739', '1587104705', 'outpatient', 'karawaci', '             pilek ', 'Panadol', 3, 2, 'Markus-Star', 'on progress', 1587477036),
(6, 90, 'nadya', 'Alimin', 'female', '2019-12-30', '081173463733', '1587481679', 'outpatient', 'karawaci', '', '', 0, 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `patient_drug_treatment`
--

CREATE TABLE `patient_drug_treatment` (
  `patient_drug_treatment_id` int(11) NOT NULL,
  `patient_id` int(128) NOT NULL,
  `drug_id` int(128) NOT NULL,
  `diagnose_id` int(128) NOT NULL,
  `dosage` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient_record`
--

CREATE TABLE `patient_record` (
  `patientMedicalRecord_id` int(11) NOT NULL,
  `complaint` varchar(128) NOT NULL,
  `updated_date` date NOT NULL,
  `illness` varchar(128) NOT NULL,
  `blood_type` enum('A','B','AB','O') NOT NULL,
  `height` int(128) NOT NULL,
  `weight` int(128) NOT NULL,
  `blood_pressure` varchar(128) NOT NULL,
  `blood_glucose` varchar(128) NOT NULL,
  `allergies` varchar(128) NOT NULL,
  `patient_id` int(128) NOT NULL,
  `updated_by_staff_id` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_record`
--

INSERT INTO `patient_record` (`patientMedicalRecord_id`, `complaint`, `updated_date`, `illness`, `blood_type`, `height`, `weight`, `blood_pressure`, `blood_glucose`, `allergies`, `patient_id`, `updated_by_staff_id`) VALUES
(71, '', '2020-04-02', 'corona', 'A', 160, 40, '79', '78', '', 13, 6),
(90, '', '2020-03-03', 'bone cancer', 'B', 150, 50, '60', '60', 'dust', 4, 1),
(111, '', '2020-04-06', 'corona', 'B', 170, 55, '67', '77', 'orange', 5, 0),
(122, '', '2020-04-21', 'obesity', 'AB', 150, 80, '80', '80', 'gluten', 14, 3),
(1233, '', '2020-03-11', 'usus buntu', 'A', 166, 56, '70', '50', 'spicy', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `staff_id` int(11) NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `phonenum` varchar(128) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `staff_schedule` datetime NOT NULL,
  `staff_position` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `report_type` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `report_type`) VALUES
(1, 'outcoming drugs'),
(2, 'incoming drugs');

-- --------------------------------------------------------

--
-- Table structure for table `report_list`
--

CREATE TABLE `report_list` (
  `id` int(11) NOT NULL,
  `date_issued` int(11) NOT NULL DEFAULT current_timestamp(),
  `report_type` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `drug_name` varchar(128) NOT NULL,
  `drug_qty` varchar(50) NOT NULL,
  `issued_to` varchar(128) NOT NULL,
  `issued_by` varchar(128) NOT NULL,
  `note` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_list`
--

INSERT INTO `report_list` (`id`, `date_issued`, `report_type`, `drug_id`, `drug_name`, `drug_qty`, `issued_to`, `issued_by`, `note`) VALUES
(1, 2147483647, 1, 2, 'Panadol', '3 stripes', 'Noach', 'Nadya', 'resep an matius');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `item_name` varchar(128) NOT NULL,
  `notes` varchar(128) NOT NULL,
  `last_modified` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `item_name`, `notes`, `last_modified`, `user_id`, `user_email`) VALUES
(68, 'Chika Fujiwara', 'wiener', '1586295100', 14, 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `request_radiology`
--

CREATE TABLE `request_radiology` (
  `id` int(11) NOT NULL,
  `item_name` varchar(128) NOT NULL,
  `notes` varchar(128) NOT NULL,
  `last_modified` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(128) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request_radiology`
--

INSERT INTO `request_radiology` (`id`, `item_name`, `notes`, `last_modified`, `user_id`, `user_email`, `image`) VALUES
(3, 'Ferinzhy Halik', 'test', '1586295651', 14, 'admin@gmail.com', ''),
(5, 'dede', 'dede', '1587099197', 15, 'farrel@gmail.com', 'labdefault.png'),
(6, 'ade', 'test', '1587105278', 15, 'farrel@gmail.com', 'labdefault.png');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `room_grade` varchar(128) NOT NULL,
  `room_price` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `room_grade`, `room_price`) VALUES
(1, 'Standard', 500000),
(2, 'UGD', 700000),
(3, 'UGD', 700000),
(4, 'VIP', 1200000),
(5, 'VIP', 1200000),
(6, 'VVIP', 1800000);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(128) NOT NULL,
  `supplier_address` varchar(256) NOT NULL,
  `supplier_phone` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `symptoms_indications`
--

CREATE TABLE `symptoms_indications` (
  `symptoms_id` int(11) NOT NULL,
  `diagnose_id` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(2, 'raymond', 'raymond@gmail.com', 'default.jpg', '$2y$10$WNrTKAOWSYy4BaB7t.km3.WClsO5FFMZ6TFaHqt8T8DDteeEBzyge', 2, 1, 1583908692),
(3, 'Hendra', 'hendra@gmail.com', 'default.jpg', '$2y$10$JccIBBXtCDuCpQEj24FTvOcWgtHe3wcGplVyzCKvGpzo6y4tuKSzi', 1, 1, 1583910893),
(4, 'testuser', 'test@gmail.com', 'default.jpg', '$2y$10$/jxlZ.cbcZC3sAgV1jgxVeLjGG6d/mET3PVmVMCJhaG9kbzYpRT9O', 1, 1, 1584411172),
(5, 'Denny Raymond', 'rayden@gmail.com', 'default.jpg', '$2y$10$wHrZvdbo.75oLNL5oefFAeZbMT3EY.71aSjpD3b6ux7b.JIq8BQFG', 1, 1, 1585471858),
(10, 'Test User 1', 'test1@gmail.com', 'default.jpg', '$2y$10$v3lpYaXBMhVrqpoUiVkymOrh5Ill3ZP0SkbbPm.RNJoFmvQWOO.pi', 2, 1, 1585709895),
(11, 'Test User 2', 'test2@gmail.com', 'default.jpg', '$2y$10$AxIFpralfdwhQDmqbe7ZNepzoaLHM.TMHg126fSOmdtaF7sghv8oe', 3, 1, 1585709923),
(12, 'Noach T', 'noach@gmail.com', '2986071.jpg', '$2y$10$ce.bZruCm2PBAD5utcIkuOm1j0oxX8nH3dQJ65kuyYwl6gFVDWN4e', 3, 1, 1585710770),
(13, 'Denny Raymond', 'denny@gmail.com', '2986071.jpg', '$2y$10$HRdP6UDUYd6ifE1WnLpIV.zHQN74B6VtKwwdJY47iQ2YQIHc1M7Ou', 1, 1, 1585722596),
(14, 'testuser99', 'testuser99@gmail.com', 'default.jpg', '$2y$10$8kyJx4j6UDOBHcOTkE8L0.NV4fT/4.n0Be/99X/h698d8ncjU4Rv2', 3, 1, 1586343930),
(15, 'farrel', 'farrel@gmail.com', '298607.jpg', '$2y$10$qDUnBV0dICtdxw0oon4a8ur8a5vRPVuAwBZ6q5TGNwwRfIDe0XDEm', 5, 1, 1586786734),
(16, 'Raysa', 'raysa@gmail.com', 'default.jpg', '$2y$10$qX0nvhPC1IP/rBFbDbsZAOqfMkq3cuVp.tiOsPglTld1U2r2NZv86', 2, 1, 1586966113),
(17, 'Nadya', 'nadya@gmail.com', 'default.jpg', '$2y$10$eljTWTAuI/Xl.FNch4JiSuSgq9z6od778KVvlglSyEettIjFygS1a', 4, 1, 1587097398),
(18, 'dennybary', 'dennybary@gmail.com', 'default.jpg', '$2y$10$98I0ldD0ggXZvqHsF.AW5eEEJqpBnQ97zTUZvSFnQgcNwOTpvf9oC', 3, 1, 1587104133);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 2, 3),
(5, 1, 4),
(6, 3, 3),
(12, 3, 2),
(13, 3, 11),
(15, 5, 12),
(16, 3, 12),
(18, 2, 13),
(19, 1, 11),
(20, 1, 12),
(21, 1, 13),
(22, 5, 2),
(24, 4, 2),
(25, 4, 14),
(26, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Patient'),
(4, 'Menu'),
(11, 'Medication'),
(12, 'Lab'),
(13, 'Inpatient'),
(14, 'Pharmacy');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Super Admin'),
(2, 'Admin Inpatient'),
(3, 'Doctor'),
(4, 'Pharmacy'),
(5, 'Lab'),
(9, 'Role test ');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard ', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user-md', 1),
(4, 2, 'Edit Profile', 'user/editprofile', 'fas fa-fw fa-user-edit', 1),
(5, 4, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(7, 3, 'View Patient List', 'patient', 'fas fa-fw fa-procedures', 1),
(8, 4, 'Submenu management', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(13, 1, 'Role', 'admin/role', 'fas fa-user-tie', 1),
(15, 11, 'Request new prescription', 'medication/requestprescription', 'fas fa-fw fa-clipboard-list', 1),
(16, 11, 'View request', 'medication/viewrequest', 'fa-fw fas fa-eye', 1),
(17, 2, 'Change Password', 'user/changepassword', 'fas fa-fw fa-key', 1),
(19, 11, 'View completed request', 'medication/requestcompleted', 'fa-fw far fa-check-circle', 1),
(21, 12, 'Lab Request', 'lab/request', 'fas fa-cloud-upload-alt', 1),
(22, 12, 'Lab Request - Radiology', 'lab/request_radiology', 'fas fa-cloud-upload-alt', 1),
(23, 12, 'Completed Request', 'lab/completed_list', 'far fa-address-book', 1),
(24, 12, 'Completed Request - Radiology', 'lab/completed_list_radiology', 'far fa-address-book', 1),
(25, 13, 'View Inpatient', 'inpatient', 'fas fa-procedures', 1),
(26, 13, 'Register New Inpatient', 'auth/registerInpatient', 'fas fa-fw fa fa-user-plus', 1),
(27, 13, 'Room', 'inpatient/room', 'fas fa fa-door-closed', 1),
(28, 3, 'Register New Patient', 'auth/registerPatient', 'fas fa fa-user-plus', 1),
(29, 14, 'Request List', 'pharmacy/reqlist', 'fas fa-fw fa-clipboard-list', 1),
(30, 14, 'Inventory Reports', 'pharmacy/reqreports', 'fas fa-fw fa-clipboard-list', 1),
(31, 14, 'Order History', 'pharmacy/order', 'fas fa-fw fa-folder-open', 1);

-- --------------------------------------------------------

--
-- Table structure for table `view_completed_prescription`
--

CREATE TABLE `view_completed_prescription` (
  `id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `patient_id` int(50) NOT NULL,
  `diagnoses` varchar(200) NOT NULL,
  `drug_name` varchar(200) NOT NULL,
  `date_issued` int(11) NOT NULL,
  `quantity` int(50) NOT NULL,
  `dosage` int(50) NOT NULL,
  `prescriber` varchar(128) NOT NULL,
  `status` varchar(200) NOT NULL,
  `pharmacy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `view_completed_prescription`
--

INSERT INTO `view_completed_prescription` (`id`, `first_name`, `last_name`, `patient_id`, `diagnoses`, `drug_name`, `date_issued`, `quantity`, `dosage`, `prescriber`, `status`, `pharmacy_id`) VALUES
(2, 'Denny', 'Raymond', 2, 'Sakit Kepala', 'Panadol', 1586329474, 1, 1, 'Noach-Lupin', 'Completed', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`bed_id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bills_id`);

--
-- Indexes for table `completed_requests`
--
ALTER TABLE `completed_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `completed_requests_radiology`
--
ALTER TABLE `completed_requests_radiology`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diagnoses`
--
ALTER TABLE `diagnoses`
  ADD PRIMARY KEY (`diagnose_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `doctors_assigned_to_patient`
--
ALTER TABLE `doctors_assigned_to_patient`
  ADD PRIMARY KEY (`date_from`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`drug_id`);

--
-- Indexes for table `drugs_for_indications`
--
ALTER TABLE `drugs_for_indications`
  ADD PRIMARY KEY (`drugs_indications_id`);

--
-- Indexes for table `drugs_item`
--
ALTER TABLE `drugs_item`
  ADD PRIMARY KEY (`drug_id`);

--
-- Indexes for table `drugs_loc`
--
ALTER TABLE `drugs_loc`
  ADD PRIMARY KEY (`drug_id`);

--
-- Indexes for table `inpatient`
--
ALTER TABLE `inpatient`
  ADD PRIMARY KEY (`inpatient_id`);

--
-- Indexes for table `inpatient_treatment`
--
ALTER TABLE `inpatient_treatment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_list`
--
ALTER TABLE `report_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_radiology`
--
ALTER TABLE `request_radiology`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `view_completed_prescription`
--
ALTER TABLE `view_completed_prescription`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_id` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `completed_requests`
--
ALTER TABLE `completed_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `completed_requests_radiology`
--
ALTER TABLE `completed_requests_radiology`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `drugs_item`
--
ALTER TABLE `drugs_item`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `drugs_loc`
--
ALTER TABLE `drugs_loc`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inpatient`
--
ALTER TABLE `inpatient`
  MODIFY `inpatient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inpatient_treatment`
--
ALTER TABLE `inpatient_treatment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_history`
--
ALTER TABLE `order_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report_list`
--
ALTER TABLE `report_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `request_radiology`
--
ALTER TABLE `request_radiology`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `view_completed_prescription`
--
ALTER TABLE `view_completed_prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
