-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:13306
-- Tiempo de generación: 04-10-2023 a las 11:44:24
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `uni_2023_students`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `advisor`
--

DROP TABLE IF EXISTS `advisor`;
CREATE TABLE IF NOT EXISTS `advisor` (
  `s_ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `i_ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `i_ID` (`i_ID`),
  KEY `s_ID` (`s_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `advisor`
--

INSERT INTO `advisor` (`s_ID`, `i_ID`) VALUES
('00128', '45565'),
('12345', '10101'),
('23121', '76543'),
('44553', '22222'),
('45678', '22222'),
('76543', '45565'),
('76653', '98345'),
('98765', '98345'),
('98988', '76766');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classroom`
--

DROP TABLE IF EXISTS `classroom`;
CREATE TABLE IF NOT EXISTS `classroom` (
  `building` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_number` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`building`,`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `classroom`
--

INSERT INTO `classroom` (`building`, `room_number`, `capacity`) VALUES
('Packard', '101', '500'),
('Painter', '514', '10'),
('Taylor', '3128', '70'),
('Watson', '100', '30'),
('Watson', '120', '50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `course`
--

INSERT INTO `course` (`course_id`, `title`, `dept_name`, `credits`) VALUES
('BIO-101', 'Intro. to Biology', 'Biology', '4'),
('BIO-301', 'Genetics', 'Biology', '4'),
('BIO-399', 'Computational Biology', 'Biology', '3'),
('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4'),
('CS-190', 'Game Design', 'Comp. Sci.', '4'),
('CS-315', 'Robotics', 'Comp. Sci.', '3'),
('CS-319', 'Image Processing', 'Comp. Sci.', '3'),
('CS-347', 'Database System Concepts', 'Comp. Sci.', '3'),
('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3'),
('FIN-201', 'Investment Banking', 'Finance', '3'),
('HIS-351', 'World History', 'History', '3'),
('MU-199', 'Music Video Production', 'Music', '3'),
('PHY-101', 'Physical Principles', 'Physics', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`dept_name`),
  KEY `building` (`building`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `department`
--

INSERT INTO `department` (`dept_name`, `building`, `budget`) VALUES
('Biology', 'Watson', '90000.00'),
('Comp. Sci.', 'Taylor', '100000.00'),
('Elec. Eng.', 'Taylor', '85000.00'),
('Finance', 'Painter', '120000.00'),
('History', 'Painter', '50000.00'),
('Music', 'Packard', '80000.00'),
('Physics', 'Watson', '70000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fields`
--

DROP TABLE IF EXISTS `fields`;
CREATE TABLE IF NOT EXISTS `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `field` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_json` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

DROP TABLE IF EXISTS `instructor`;
CREATE TABLE IF NOT EXISTS `instructor` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`ID`, `name`, `dept_name`, `salary`) VALUES
('10101', 'Srinivasan', 'Comp. Sci.', '65000.00'),
('12121', 'Wu', 'Finance', '90000.00'),
('15151', 'Mozart', 'Music', '40000.00'),
('22222', 'Einstein', 'Physics', '95000.00'),
('32343', 'El Said', 'History', '60000.00'),
('33456', 'Gold', 'Physics', '87000.00'),
('45565', 'Katz', 'Comp. Sci.', '75000.00'),
('58583', 'Califieri', 'History', '62000.00'),
('76543', 'Singh', 'Finance', '80000.00'),
('76766', 'Crick', 'Biology', '72000.00'),
('83821', 'Brandt', 'Comp. Sci.', '92000.00'),
('98345', 'Kim', 'Elec. Eng.', '80000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mongodb_objects`
--

DROP TABLE IF EXISTS `mongodb_objects`;
CREATE TABLE IF NOT EXISTS `mongodb_objects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_mongodb` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mongodb_objects`
--

INSERT INTO `mongodb_objects` (`id`, `object_mongodb`) VALUES
(1, '{\"building\": \"Packard\", \"capacity\": 500, \"room_number\": \"101\"}'),
(2, '{\"building\": \"Painter\", \"capacity\": 10, \"room_number\": \"514\"}'),
(3, '{\"building\": \"Taylor\", \"capacity\": 70, \"room_number\": \"3128\"}'),
(4, '{\"building\": \"Watson\", \"capacity\": 30, \"room_number\": \"100\"}'),
(5, '{\"building\": \"Watson\", \"capacity\": 50, \"room_number\": \"120\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mytables`
--

DROP TABLE IF EXISTS `mytables`;
CREATE TABLE IF NOT EXISTS `mytables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `myvalues` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prereq`
--

DROP TABLE IF EXISTS `prereq`;
CREATE TABLE IF NOT EXISTS `prereq` (
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prereq_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`course_id`,`prereq_id`),
  KEY `prereq_id` (`prereq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `prereq`
--

INSERT INTO `prereq` (`course_id`, `prereq_id`) VALUES
('BIO-301', 'BIO-101'),
('BIO-399', 'BIO-101'),
('CS-190', 'CS-101'),
('CS-315', 'CS-101'),
('CS-319', 'CS-101'),
('CS-347', 'CS-101'),
('EE-181', 'PHY-101');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `relations`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `relations`;
CREATE TABLE IF NOT EXISTS `relations` (
`FOR_COL_NAME` varchar(64)
,`FOR_NAME` varchar(129)
,`ID` varchar(129)
,`N_COLS` bigint
,`POS` int unsigned
,`REF_COL_NAME` varchar(64)
,`REF_NAME` varchar(129)
,`TYPE` bigint unsigned
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE IF NOT EXISTS `section` (
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `building` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_number` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_slot_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`,`building`,`room_number`,`time_slot_id`),
  KEY `building` (`building`,`room_number`),
  KEY `time_slot_id` (`time_slot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `section`
--

INSERT INTO `section` (`course_id`, `sec_id`, `semester`, `year`, `building`, `room_number`, `time_slot_id`) VALUES
('BIO-101', '1', 'Summer', '2017', 'Packard', '101', 'A'),
('BIO-301', '1', 'Summer', '2018', 'Painter', '514', 'A'),
('CS-190', '1', 'Spring', '2017', 'Taylor', '3128', 'A'),
('CS-347', '1', 'Fall', '2017', 'Taylor', '3128', 'A'),
('PHY-101', '1', 'Fall', '2017', 'Watson', '100', 'A'),
('BIO-101', '1', 'Summer', '2017', 'Painter', '514', 'B'),
('CS-319', '1', 'Spring', '2018', 'Watson', '100', 'B'),
('FIN-201', '1', 'Spring', '2018', 'Packard', '101', 'B'),
('CS-319', '2', 'Spring', '2018', 'Taylor', '3128', 'C'),
('EE-181', '1', 'Spring', '2017', 'Taylor', '3128', 'C'),
('HIS-351', '1', 'Spring', '2018', 'Painter', '514', 'C'),
('CS-315', '1', 'Spring', '2018', 'Watson', '120', 'D'),
('MU-199', '1', 'Spring', '2018', 'Packard', '101', 'D'),
('CS-190', '2', 'Spring', '2017', 'Taylor', '3128', 'E'),
('CS-101', '1', 'Spring', '2018', 'Packard', '101', 'F'),
('CS-101', '1', 'Fall', '2017', 'Packard', '101', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `student`
--

INSERT INTO `student` (`ID`, `name`, `dept_name`, `tot_cred`) VALUES
('00128', 'Zhang', 'Comp. Sci.', '102'),
('12345', 'Shankar', 'Comp. Sci.', '32'),
('19991', 'Brandt', 'History', '80'),
('23121', 'Chavez', 'Finance', '110'),
('44553', 'Peltier', 'Physics', '56'),
('45678', 'Levy', 'Physics', '46'),
('54321', 'Williams', 'Comp. Sci.', '54'),
('55739', 'Sanchez', 'Music', '38'),
('70557', 'Snow', 'Physics', '56'),
('76543', 'Brown', 'Comp. Sci.', '58'),
('76653', 'Aoi', 'Elec. Eng.', '60'),
('98765', 'Bourikas', 'Elec. Eng.', '98'),
('98988', 'Tanaka', 'Biology', '120');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tables_in`
--

DROP TABLE IF EXISTS `tables_in`;
CREATE TABLE IF NOT EXISTS `tables_in` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fields_` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tables_out`
--

DROP TABLE IF EXISTS `tables_out`;
CREATE TABLE IF NOT EXISTS `tables_out` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tables_` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tables_out`
--

INSERT INTO `tables_out` (`id`, `tables_`) VALUES
(1, '{\"advisor\": {\"fields\": [{\"field\": \"i_ID\", \"values\": [\"10101\", \"22222\", \"22222\", \"45565\", \"45565\", \"76543\", \"76766\", \"98345\", \"98345\"]}, {\"field\": \"s_ID\", \"values\": [\"00128\", \"12345\", \"23121\", \"44553\", \"45678\", \"76543\", \"76653\", \"98765\", \"98988\"]}], \"table_name\": \"advisor\"}}'),
(2, '{\"classroom\": {\"fields\": [{\"field\": \"building\", \"values\": [\"Packard\", \"Painter\", \"Taylor\", \"Watson\", \"Watson\"]}, {\"field\": \"capacity\", \"values\": [500, 10, 70, 30, 50]}, {\"field\": \"room_number\", \"values\": [\"101\", \"514\", \"3128\", \"100\", \"120\"]}], \"table_name\": \"classroom\"}}'),
(3, '{\"course\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-301\", \"BIO-399\", \"CS-101\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"credits\", \"values\": [4, 4, 3, 4, 4, 3, 3, 3, 3, 3, 3, 3, 4]}, {\"field\": \"dept_name\", \"values\": [\"Biology\", \"Biology\", \"Biology\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"History\", \"Music\", \"Physics\"]}, {\"field\": \"title\", \"values\": [\"Intro. to Biology\", \"Genetics\", \"Computational Biology\", \"Intro. to Computer Science\", \"Game Design\", \"Robotics\", \"Image Processing\", \"Database System Concepts\", \"Intro. to Digital Systems\", \"Investment Banking\", \"World History\", \"Music Video Production\", \"Physical Principles\"]}], \"table_name\": \"course\"}}'),
(4, '{\"department\": {\"fields\": [{\"field\": \"budget\", \"values\": [90000.0, 100000.0, 85000.0, 120000.0, 50000.0, 80000.0, 70000.0]}, {\"field\": \"building\", \"values\": [\"Watson\", \"Taylor\", \"Taylor\", \"Painter\", \"Painter\", \"Packard\", \"Watson\"]}, {\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"History\", \"Music\", \"Physics\"]}], \"table_name\": \"department\"}}'),
(5, '{\"instructor\": {\"fields\": [{\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"Finance\", \"History\", \"History\", \"Music\", \"Physics\", \"Physics\"]}, {\"field\": \"ID\", \"values\": [\"10101\", \"12121\", \"15151\", \"22222\", \"32343\", \"33456\", \"45565\", \"58583\", \"76543\", \"76766\", \"83821\", \"98345\"]}, {\"field\": \"name\", \"values\": [\"Srinivasan\", \"Wu\", \"Mozart\", \"Einstein\", \"El Said\", \"Gold\", \"Katz\", \"Califieri\", \"Singh\", \"Crick\", \"Brandt\", \"Kim\"]}, {\"field\": \"salary\", \"values\": [65000.0, 90000.0, 40000.0, 95000.0, 60000.0, 87000.0, 75000.0, 62000.0, 80000.0, 72000.0, 92000.0, 80000.0]}], \"table_name\": \"instructor\"}}'),
(6, '{\"mytables\": {\"fields\": [{\"field\": \"id\", \"values\": null}, {\"field\": \"myvalues\", \"values\": null}], \"table_name\": \"mytables\"}}'),
(7, '{\"prereq\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-301\", \"BIO-399\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-347\", \"EE-181\"]}, {\"field\": \"prereq_id\", \"values\": [\"BIO-101\", \"BIO-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"PHY-101\"]}], \"table_name\": \"prereq\"}}'),
(8, '{\"section\": {\"fields\": [{\"field\": \"building\", \"values\": [null, \"Packard\", \"Packard\", \"Packard\", \"Packard\", \"Painter\", \"Painter\", \"Painter\", \"Taylor\", \"Taylor\", \"Taylor\", \"Taylor\", \"Taylor\", \"Watson\", \"Watson\", \"Watson\"]}, {\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-101\", \"BIO-301\", \"CS-101\", \"CS-101\", \"CS-190\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"room_number\", \"values\": [null, \"101\", \"101\", \"101\", \"101\", \"514\", \"514\", \"514\", \"3128\", \"3128\", \"3128\", \"3128\", \"3128\", \"100\", \"100\", \"120\"]}, {\"field\": \"sec_id\", \"values\": [\"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"2\", \"1\", \"1\", \"2\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\"]}, {\"field\": \"semester\", \"values\": [\"Summer\", \"Summer\", \"Summer\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\"]}, {\"field\": \"time_slot_id\", \"values\": [\"B\", \"A\", \"H\", \"F\", \"E\", \"A\", \"D\", \"B\", \"C\", \"A\", \"C\", \"B\", \"C\", \"D\", \"A\", null]}, {\"field\": \"year\", \"values\": [2017, 2019, 2018, 2017, 2018, 2017, 2017, 2018, 2018, 2018, 2017, 2017, 2018, 2018, 2018, 2017]}], \"table_name\": \"section\"}}'),
(9, '{\"student\": {\"fields\": [{\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp_Sdfghji.\", \"Comp. Sbi.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec_ Eng.\", \"Elec. Eng.\", \"History\", \"Music\", \"Physics\", \"Physics\", \"Physics\", \"Yinance\"]}, {\"field\": \"ID\", \"values\": [\"00128\", \"12345\", \"19991\", \"23121\", \"44553\", \"45678\", \"54321\", \"55739\", \"70557\", \"76543\", \"76653\", \"98765\", \"98988\"]}, {\"field\": \"name\", \"values\": [\"Zhang\", \"Shankar\", \"Brandt\", \"Chavez\", \"Peltier\", \"Levy\", \"Williams\", \"Sanchez\", \"Snow\", \"Brown\", \"Aoi\", \"Bourikas\", \"Tanaka\"]}, {\"field\": \"tot_cred\", \"values\": [102, 32, 80, 110, 56, 46, 54, 38, 56, 58, 60, 98, 120]}], \"table_name\": \"student\"}}'),
(10, '{\"tables_in\": {\"fields\": [{\"field\": \"fields_\", \"values\": null}, {\"field\": \"id\", \"values\": [1]}], \"table_name\": \"tables_in\"}}'),
(11, '{\"tables_out\": {\"fields\": [{\"field\": \"id\", \"values\": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}, {\"field\": \"tables_\", \"values\": [{\"advisor\": {\"fields\": [{\"field\": \"i_ID\", \"values\": [\"10101\", \"22222\", \"22222\", \"45565\", \"45565\", \"76543\", \"76766\", \"98345\", \"98345\"]}, {\"field\": \"s_ID\", \"values\": [\"00128\", \"12345\", \"23121\", \"44553\", \"45678\", \"76543\", \"76653\", \"98765\", \"98988\"]}], \"table_name\": \"advisor\"}}, {\"classroom\": {\"fields\": [{\"field\": \"building\", \"values\": [\"Packard\", \"Painter\", \"Taylor\", \"Watson\", \"Watson\"]}, {\"field\": \"capacity\", \"values\": [500, 10, 70, 30, 50]}, {\"field\": \"room_number\", \"values\": [\"101\", \"514\", \"3128\", \"100\", \"120\"]}], \"table_name\": \"classroom\"}}, {\"course\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-301\", \"BIO-399\", \"CS-101\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"credits\", \"values\": [4, 4, 3, 4, 4, 3, 3, 3, 3, 3, 3, 3, 4]}, {\"field\": \"dept_name\", \"values\": [\"Biology\", \"Biology\", \"Biology\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"History\", \"Music\", \"Physics\"]}, {\"field\": \"title\", \"values\": [\"Intro. to Biology\", \"Genetics\", \"Computational Biology\", \"Intro. to Computer Science\", \"Game Design\", \"Robotics\", \"Image Processing\", \"Database System Concepts\", \"Intro. to Digital Systems\", \"Investment Banking\", \"World History\", \"Music Video Production\", \"Physical Principles\"]}], \"table_name\": \"course\"}}, {\"department\": {\"fields\": [{\"field\": \"budget\", \"values\": [90000.0, 100000.0, 85000.0, 120000.0, 50000.0, 80000.0, 70000.0]}, {\"field\": \"building\", \"values\": [\"Watson\", \"Taylor\", \"Taylor\", \"Painter\", \"Painter\", \"Packard\", \"Watson\"]}, {\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"History\", \"Music\", \"Physics\"]}], \"table_name\": \"department\"}}, {\"instructor\": {\"fields\": [{\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"Finance\", \"History\", \"History\", \"Music\", \"Physics\", \"Physics\"]}, {\"field\": \"ID\", \"values\": [\"10101\", \"12121\", \"15151\", \"22222\", \"32343\", \"33456\", \"45565\", \"58583\", \"76543\", \"76766\", \"83821\", \"98345\"]}, {\"field\": \"name\", \"values\": [\"Srinivasan\", \"Wu\", \"Mozart\", \"Einstein\", \"El Said\", \"Gold\", \"Katz\", \"Califieri\", \"Singh\", \"Crick\", \"Brandt\", \"Kim\"]}, {\"field\": \"salary\", \"values\": [65000.0, 90000.0, 40000.0, 95000.0, 60000.0, 87000.0, 75000.0, 62000.0, 80000.0, 72000.0, 92000.0, 80000.0]}], \"table_name\": \"instructor\"}}, {\"mytables\": {\"fields\": [{\"field\": \"id\", \"values\": null}, {\"field\": \"myvalues\", \"values\": null}], \"table_name\": \"mytables\"}}, {\"prereq\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-301\", \"BIO-399\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-347\", \"EE-181\"]}, {\"field\": \"prereq_id\", \"values\": [\"BIO-101\", \"BIO-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"PHY-101\"]}], \"table_name\": \"prereq\"}}, {\"section\": {\"fields\": [{\"field\": \"building\", \"values\": [null, \"Packard\", \"Packard\", \"Packard\", \"Packard\", \"Painter\", \"Painter\", \"Painter\", \"Taylor\", \"Taylor\", \"Taylor\", \"Taylor\", \"Taylor\", \"Watson\", \"Watson\", \"Watson\"]}, {\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-101\", \"BIO-301\", \"CS-101\", \"CS-101\", \"CS-190\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"room_number\", \"values\": [null, \"101\", \"101\", \"101\", \"101\", \"514\", \"514\", \"514\", \"3128\", \"3128\", \"3128\", \"3128\", \"3128\", \"100\", \"100\", \"120\"]}, {\"field\": \"sec_id\", \"values\": [\"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"2\", \"1\", \"1\", \"2\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\"]}, {\"field\": \"semester\", \"values\": [\"Summer\", \"Summer\", \"Summer\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\"]}, {\"field\": \"time_slot_id\", \"values\": [\"B\", \"A\", \"H\", \"F\", \"E\", \"A\", \"D\", \"B\", \"C\", \"A\", \"C\", \"B\", \"C\", \"D\", \"A\", null]}, {\"field\": \"year\", \"values\": [2017, 2019, 2018, 2017, 2018, 2017, 2017, 2018, 2018, 2018, 2017, 2017, 2018, 2018, 2018, 2017]}], \"table_name\": \"section\"}}, {\"student\": {\"fields\": [{\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp_Sdfghji.\", \"Comp. Sbi.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec_ Eng.\", \"Elec. Eng.\", \"History\", \"Music\", \"Physics\", \"Physics\", \"Physics\", \"Yinance\"]}, {\"field\": \"ID\", \"values\": [\"00128\", \"12345\", \"19991\", \"23121\", \"44553\", \"45678\", \"54321\", \"55739\", \"70557\", \"76543\", \"76653\", \"98765\", \"98988\"]}, {\"field\": \"name\", \"values\": [\"Zhang\", \"Shankar\", \"Brandt\", \"Chavez\", \"Peltier\", \"Levy\", \"Williams\", \"Sanchez\", \"Snow\", \"Brown\", \"Aoi\", \"Bourikas\", \"Tanaka\"]}, {\"field\": \"tot_cred\", \"values\": [102, 32, 80, 110, 56, 46, 54, 38, 56, 58, 60, 98, 120]}], \"table_name\": \"student\"}}, {\"tables_in\": {\"fields\": [{\"field\": \"fields_\", \"values\": null}, {\"field\": \"id\", \"values\": [1]}], \"table_name\": \"tables_in\"}}]}], \"table_name\": \"tables_out\"}}'),
(12, '{\"takes\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-301\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-190\", \"CS-190\", \"CS-315\", \"CS-315\", \"CS-319\", \"CS-319\", \"CS-347\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"grade\", \"values\": [\"A\", \"A-\", \"C\", \"A\", \"A\", \"A\", \"B\", \"C+\", \"B-\", \"F\", \"B+\", \"B\", \"A-\", \"B+\", \"A-\", \"A\", \"A\", \"C\", \"C-\", \"B\", \"A\", null]}, {\"field\": \"ID\", \"values\": [\"00128\", \"00128\", \"12345\", \"12345\", \"12345\", \"12345\", \"19991\", \"23121\", \"44553\", \"45678\", \"45678\", \"45678\", \"54321\", \"54321\", \"55739\", \"76543\", \"76543\", \"76653\", \"98765\", \"98765\", \"98988\", \"98988\"]}, {\"field\": \"sec_id\", \"values\": [\"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"2\", \"2\", \"1\", \"1\", \"1\", \"2\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\"]}, {\"field\": \"semester\", \"values\": [\"Summer\", \"Summer\", \"Fall\", \"Fall\", \"Fall\", \"Fall\", \"Fall\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\"]}, {\"field\": \"year\", \"values\": [2017, 2018, 2017, 2017, 2017, 2017, 2017, 2017, 2018, 2017, 2017, 2018, 2018, 2018, 2018, 2017, 2017, 2017, 2018, 2018, 2018, 2017]}], \"table_name\": \"takes\"}}'),
(13, '{\"teaches\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-301\", \"CS_101\", \"CS-101\", \"CS-190\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"ID\", \"values\": [\"76766\", \"76766\", \"10101\", \"45565\", \"83821\", \"83821\", \"10101\", \"45565\", \"83821\", \"10101\", \"98345\", \"12121\", \"32343\", \"15151\", \"22222\"]}, {\"field\": \"sec_id\", \"values\": [\"1\", \"1\", \"1\", \"1\", \"1\", \"2\", \"1\", \"1\", \"2\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\"]}, {\"field\": \"semester\", \"values\": [\"Summer\", \"Summer\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\"]}, {\"field\": \"year\", \"values\": [2017, 2018, 2017, 2018, 2017, 2017, 2018, 2018, 2018, 2017, 2017, 2018, 2018, 2018, 2017]}], \"table_name\": \"teaches\"}}'),
(14, '{\"time_slot\": {\"fields\": [{\"field\": \"day\", \"values\": [\"F\", \"M\", \"W\", \"F\", \"M\", \"W\", \"F\", \"M\", \"W\", \"F\", \"M\", \"W\", \"R\", \"T\", \"R\", \"T\", \"F\", \"M\", \"W\", \"W\"]}, {\"field\": \"end_hr\", \"values\": [8, 8, 8, 9, 9, 9, 11, 11, 11, 13, 13, 13, 11, 11, 15, 15, 16, 16, 16, 12]}, {\"field\": \"end_min\", \"values\": [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 45, 45, 45, 45, 50, 50, 50, 30]}, {\"field\": \"start_hr\", \"values\": [8, 8, 8, 9, 9, 9, 11, 11, 11, 13, 13, 13, 10, 10, 14, 14, 16, 16, 16, 10]}, {\"field\": \"start_min\", \"values\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 30, 30, 30, 0, 0, 0, 0]}, {\"field\": \"time_slot_id\", \"values\": [\"A\", \"A\", \"A\", \"B\", \"B\", \"B\", \"C\", \"C\", \"C\", \"D\", \"D\", \"D\", \"E\", \"E\", \"F\", \"F\", \"G\", \"G\", \"G\", \"H\"]}], \"table_name\": \"time_slot\"}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `takes`
--

DROP TABLE IF EXISTS `takes`;
CREATE TABLE IF NOT EXISTS `takes` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `grade` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `takes`
--

INSERT INTO `takes` (`ID`, `course_id`, `sec_id`, `semester`, `year`, `grade`) VALUES
('00128', 'CS-101', '1', 'Fall', '2017', 'A'),
('00128', 'CS-347', '1', 'Fall', '2017', 'A-'),
('12345', 'CS-101', '1', 'Fall', '2017', 'C'),
('12345', 'CS-190', '2', 'Spring', '2017', 'A'),
('12345', 'CS-315', '1', 'Spring', '2018', 'A'),
('12345', 'CS-347', '1', 'Fall', '2017', 'A'),
('19991', 'HIS-351', '1', 'Spring', '2018', 'B'),
('23121', 'FIN-201', '1', 'Spring', '2018', 'C+'),
('44553', 'PHY-101', '1', 'Fall', '2017', 'B-'),
('45678', 'CS-101', '1', 'Fall', '2017', 'F'),
('45678', 'CS-101', '1', 'Spring', '2018', 'B+'),
('45678', 'CS-319', '1', 'Spring', '2018', 'B'),
('54321', 'CS-101', '1', 'Fall', '2017', 'A-'),
('54321', 'CS-190', '2', 'Spring', '2017', 'B+'),
('55739', 'MU-199', '1', 'Spring', '2018', 'A-'),
('76543', 'CS-101', '1', 'Fall', '2017', 'A'),
('76543', 'CS-319', '2', 'Spring', '2018', 'A'),
('76653', 'EE-181', '1', 'Spring', '2017', 'C'),
('98765', 'CS-101', '1', 'Fall', '2017', 'C-'),
('98765', 'CS-315', '1', 'Spring', '2018', 'B'),
('98988', 'BIO-101', '1', 'Summer', '2017', 'A'),
('98988', 'BIO-301', '1', 'Summer', '2018', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teaches`
--

DROP TABLE IF EXISTS `teaches`;
CREATE TABLE IF NOT EXISTS `teaches` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `teaches`
--

INSERT INTO `teaches` (`ID`, `course_id`, `sec_id`, `semester`, `year`) VALUES
('76766', 'BIO-101', '1', 'Summer', '2017'),
('76766', 'BIO-301', '1', 'Summer', '2018'),
('10101', 'CS-101', '1', 'Fall', '2017'),
('45565', 'CS-101', '1', 'Spring', '2018'),
('83821', 'CS-190', '1', 'Spring', '2017'),
('83821', 'CS-190', '2', 'Spring', '2017'),
('10101', 'CS-315', '1', 'Spring', '2018'),
('45565', 'CS-319', '1', 'Spring', '2018'),
('83821', 'CS-319', '2', 'Spring', '2018'),
('10101', 'CS-347', '1', 'Fall', '2017'),
('98345', 'EE-181', '1', 'Spring', '2017'),
('12121', 'FIN-201', '1', 'Spring', '2018'),
('32343', 'HIS-351', '1', 'Spring', '2018'),
('15151', 'MU-199', '1', 'Spring', '2018'),
('22222', 'PHY-101', '1', 'Fall', '2017');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
CREATE TABLE IF NOT EXISTS `time_slot` (
  `time_slot_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_hr` decimal(2,0) NOT NULL,
  `start_min` decimal(2,0) NOT NULL,
  `end_hr` decimal(2,0) DEFAULT NULL,
  `end_min` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`time_slot_id`,`day`,`start_hr`,`start_min`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `time_slot`
--

INSERT INTO `time_slot` (`time_slot_id`, `day`, `start_hr`, `start_min`, `end_hr`, `end_min`) VALUES
('A', 'F', '8', '0', '8', '50'),
('A', 'M', '8', '0', '8', '50'),
('A', 'W', '8', '0', '8', '50'),
('B', 'F', '9', '0', '9', '50'),
('B', 'M', '9', '0', '9', '50'),
('B', 'W', '9', '0', '9', '50'),
('C', 'F', '11', '0', '11', '50'),
('C', 'M', '11', '0', '11', '50'),
('C', 'W', '11', '0', '11', '50'),
('D', 'F', '13', '0', '13', '50'),
('D', 'M', '13', '0', '13', '50'),
('D', 'W', '13', '0', '13', '50'),
('E', 'R', '10', '30', '11', '45'),
('E', 'T', '10', '30', '11', '45'),
('F', 'R', '14', '30', '15', '45'),
('F', 'T', '14', '30', '15', '45'),
('G', 'F', '16', '0', '16', '50'),
('G', 'M', '16', '0', '16', '50'),
('G', 'W', '16', '0', '16', '50'),
('H', 'W', '10', '0', '12', '30');

-- --------------------------------------------------------

--
-- Estructura para la vista `relations`
--
DROP TABLE IF EXISTS `relations`;

DROP VIEW IF EXISTS `relations`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `relations`  AS SELECT DISTINCT `information_schema`.`ifb`.`ID` AS `ID`, `information_schema`.`ifb`.`FOR_NAME` AS `FOR_NAME`, `information_schema`.`ifb`.`REF_NAME` AS `REF_NAME`, `information_schema`.`ifb`.`N_COLS` AS `N_COLS`, `information_schema`.`ifb`.`TYPE` AS `TYPE`, `information_schema`.`ifc`.`FOR_COL_NAME` AS `FOR_COL_NAME`, `information_schema`.`ifc`.`REF_COL_NAME` AS `REF_COL_NAME`, `information_schema`.`ifc`.`POS` AS `POS` FROM (`information_schema`.`INNODB_FOREIGN` `ifb` join `information_schema`.`INNODB_FOREIGN_COLS` `ifc`) WHERE ((`information_schema`.`ifb`.`ID` like '%uni_partial_json%') AND (`information_schema`.`ifb`.`ID` = `information_schema`.`ifc`.`ID`))  ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `advisor`
--
ALTER TABLE `advisor`
  ADD CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`s_ID`) REFERENCES `student` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `advisor_ibfk_3` FOREIGN KEY (`i_ID`) REFERENCES `instructor` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `classroom`
--
ALTER TABLE `classroom`
  ADD CONSTRAINT `classroom_ibfk_1` FOREIGN KEY (`building`) REFERENCES `department` (`building`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `classroom_ibfk_2` FOREIGN KEY (`building`) REFERENCES `department` (`building`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `prereq`
--
ALTER TABLE `prereq`
  ADD CONSTRAINT `prereq_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `prereq_ibfk_2` FOREIGN KEY (`prereq_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `section_ibfk_2` FOREIGN KEY (`building`,`room_number`) REFERENCES `classroom` (`building`, `room_number`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `section_ibfk_3` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`time_slot_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `takes`
--
ALTER TABLE `takes`
  ADD CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`course_id`,`sec_id`,`semester`,`year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `teaches_ibfk_3` FOREIGN KEY (`course_id`,`sec_id`,`semester`,`year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
