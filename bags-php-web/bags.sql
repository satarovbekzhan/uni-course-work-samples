-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 27 2019 г., 08:02
-- Версия сервера: 5.6.43
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bags`
--

-- --------------------------------------------------------

--
-- Структура таблицы `additional`
--

CREATE TABLE `additional` (
  `id` int(11) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bag`
--

CREATE TABLE `bag` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bag`
--

INSERT INTO `bag` (`id`, `title`, `description`, `image`, `date`, `quantity`) VALUES
(1, 'LEATHER BACKPACK WITH FLAP', 'Orange backpack. Split suede flap. Lined pockets on the side and flap with metal zip. Gold hardware. Adjustable shoulder straps. Pocket in lining. Gathered magnet closure.', 'https://static.zara.net/photos///2019/I/1/1/p/8411/004/070/2/w/652/8411004070_2_1_1.jpg?ts=1563536180289', '2019-12-01 00:00:00', 1),
(2, 'TOWELLING FABRIC BACKPACK', 'Dark blue backpack. Towelling-effect body in contrast materials. Chain detail on the flap. Adjustable shoulder straps with chain detail. Lined interior. Gathered drawstring closure.', 'https://static.zara.net/photos///2019/I/1/1/p/6112/004/045/2/w/652/6112004045_2_5_1.jpg?ts=1558696642023', '2019-12-02 00:00:00', 1),
(3, 'ROCK CROSSBODY BAG', 'Black crossbody bag. Studded detail on the handles and on the exterior. Side zips. Silver metal hardware. Top carry handle and adjustable shoulder strap. Lined interior with pocket. Magnetic clasp closure.', 'https://static.zara.net/photos///2019/V/1/1/p/5664/304/040/2/w/652/5664304040_2_1_1.jpg?ts=1551377986024', '2019-12-03 00:00:00', 1),
(4, 'PERSONALISABLE LEATHER TOTE BAG', 'Leather tote bag available in different colours: taupe and black. Soft leather with a tumbled finish. Shoulder strap. Lined interior with pocket. Magnetic clasp closure.\r\n\r\nTurn your favourite bag into a unique piece. Personalise it with your initials.', 'https://static.zara.net/photos///2020/V/1/1/p/6095/004/040/2/w/652/6095004040_2_1_1.jpg?ts=1574079867700', '2019-12-04 00:00:00', 1),
(5, 'PERSONALISABLE LEATHER CROSSBODY BAG', 'Black leather crossbody bag. Soft ruched leather with a tumbled finish. Tube shoulder strap with knotted details and gold metal piece. Lined interior with pocket. Zip, front flap and magnetic clasp closure.\r\n\r\nTurn your favourite bag into a unique piece. Personalise it with your initials.', 'https://static.zara.net/photos///2020/V/1/1/p/5614/510/040/2/w/652/5614510040_2_1_1.jpg?ts=1574078380337', '2019-12-05 00:00:00', 1),
(6, 'PEARL BEAD MINI BUCKET BAG', 'Ecru mini bucket bag. Pear beads and round metal beads all over the body. Handles. Chain shoulder strap. Inner bag in shimmer fabric with gathered drawstring closure.', 'https://static.zara.net/photos///2019/I/1/1/p/7350/004/002/4/w/652/7350004002_2_1_1.jpg?ts=1569844837538', '2019-12-06 00:00:00', 1),
(7, 'PEARL BEAD MINI BUCKET BAG', 'Ecru mini bucket bag. Pear beads and round metal beads all over the body. Handles. Chain shoulder strap. Inner bag in shimmer fabric with gathered drawstring closure.', 'https://static.zara.net/photos///2019/I/1/1/p/7350/004/002/2/w/652/7350004002_2_1_1.jpg?ts=1569844740235', '2019-12-07 00:00:00', 1),
(8, 'MINI CITY BAG WITH KNOTS', 'Mini city bag available in different colours: blue, beige, black and red. Decorative knots on the exterior. Matching topstitching. Aged gold hardware. Handles. Adjustable and removable shoulder strap. Metal zip closure.', 'https://static.zara.net/photos///2019/I/1/1/p/8613/004/040/2/w/652/8613004040_2_3_1.jpg?ts=1566315349177', '2019-12-08 00:00:00', 1),
(10, 'CROSSBODY BAG WITH CHAIN STRAP', 'Crossbody bag available in different colours: beige and black. Silver metal hardware. Woven chain detail on the contour. Chain shoulder strap. Lined interior with two compartments, one with zip closure and the other with six card slots. Metal clasp closure.', 'https://static.zara.net/photos///2019/I/1/1/p/7502/004/040/2/w/652/7502004040_2_3_1.jpg?ts=1567520823254', '2019-12-09 00:00:00', 1),
(11, 'MINIMALIST LEATHER CROSSBODY BAG', 'Black leather crossbody bag. Leather exterior with flap. Wide adjustable shoulder strap. Lined interior with three compartments and different types of fastenings, one of which features two inside pockets. Magnetic clasp closure.', 'https://static.zara.net/photos///2019/I/1/1/p/8432/004/040/2/w/652/8432004040_2_1_1.jpg?ts=1569239632683', '2019-12-10 00:00:00', 1),
(12, 'BAGUETTE BAG WITH BUCKLE', 'Black baguette bag. Strap with metal buckle on the flap. Short shoulder strap. Long shoulder strap that is adjustable and detachable. Lined interior with pocket. Magnetic clasp closure.', 'https://static.zara.net/photos///2019/I/1/1/p/8438/004/040/2/w/652/8438004040_2_1_1.jpg?ts=1566570327822', '2019-12-11 00:00:00', 1),
(13, 'STUDDED BLACK CROSSBODY BAG', 'Black crossbody bag that converts into a purse. Several interior compartments. Detachable chain link shoulder strap. Silver metal hardware. Zip closure.', 'https://static.zara.net/photos///2019/I/1/1/p/8085/204/040/2/w/652/8085204040_2_2_1.jpg?ts=1568046657516', '2019-12-12 00:00:00', 1),
(14, 'MINIMAL TOTE BAG', 'Tote bag available in tan and black. Tumbled finish. Front pocket with magnetic clasp. Shoulder straps. Magnetic clasp closure.', 'https://static.zara.net/photos///2019/I/1/1/p/6022/004/105/2/w/652/6022004105_1_1_1.jpg?ts=1564732563529', '2019-12-13 00:00:00', 1),
(15, 'MINI CROSSBODY BAG WITH CHAIN', 'Mini crossbody bag available in black and silver. Chain detail on the flap. Chain shoulder strap in contrast materials. Lined interior. Magnetic clasp closure.', 'https://static.zara.net/photos///2019/I/1/1/p/6608/510/092/2/w/652/6608510092_1_1_1.jpg?ts=1571750124354', '2019-12-14 00:00:00', 1),
(16, 'ANIMAL PRINT TEXTURE MINI CROSSBODY BAG WITH METAL CLIP', 'Green mini crossbody bag. Animal print texture on the body and flap. Metal gold-coloured clip on the bottom. Gold-coloured chain shoulder strap. Magnetic closure.', 'https://static.zara.net/photos///2019/I/1/1/p/5611/510/030/2/w/652/5611510030_2_1_1.jpg?ts=1571745299270', '2019-12-15 00:00:00', 1),
(17, 'METAL MESH BAGUETTE BAG', 'Gold baguette bag. Mesh exterior with interwoven chain links. Shoulder strap.', 'https://static.zara.net/photos///2020/V/1/1/p/6648/510/091/2/w/652/6648510091_2_1_1.jpg?ts=1574858935242', '2019-12-16 00:00:00', 1),
(18, 'SHINY MINI CROSSBODY BAG', 'Silver mini crossbody bag. Shiny details on the exterior and front flap. Tubular handle. Chain shoulder strap with a comfort strip and shiny details. Lined interior. Magnetic clasp closure.', 'https://static.zara.net/photos///2019/I/1/1/p/7603/510/092/2/w/652/7603510092_2_1_1.jpg?ts=1571750154534', '2019-12-17 00:00:00', 1),
(19, 'ROCKER SOFT CROSSBODY WALLET BAG', 'Black crossbody bag. Soft finish on the body with topstitching in geometric shapes and studs. Shoulder strap in contrast materials with chain. Lined interior. Fastens with a front flap and magnetic clasp with an aged silver metal trim detail.', 'https://static.zara.net/photos///2019/I/1/1/p/6312/004/040/2/w/652/6312004040_2_1_1.jpg?ts=1563890458308', '2019-12-18 00:00:00', 1),
(20, 'LEATHER TOTE BAG WITH ZIP DETAIL', 'Copper-coloured leather tote bag. Leather body with a tumbled finish. Front pocket with magnetic clasp closure. Top handles. Shoulder strap. Lined interior with two pockets. Flap and zip closure with maxi zip pull.', 'https://static.zara.net/photos///2020/V/1/1/p/8122/004/027/3/w/652/8122004027_1_1_1.jpg?ts=1576596746175', '2019-12-19 00:00:00', 1),
(21, 'MINIMAL MINI CROSSBODY BAG', 'Black mini crossbody bag. Front flap with gold metal detail on the front. Removable wide shoulder strap in contrast colour. Interior with three compartments. Magnetic clasp closure.', 'https://static.zara.net/photos///2019/I/1/1/p/5608/510/040/2/w/652/5608510040_2_1_1.jpg?ts=1572541136040', '2019-12-20 00:00:00', 1),
(22, 'TOTE BAG WITH EYELETS', 'Black tote bag. All-over metal eyelets. Shoulder straps. Nylon bag organiser with zip closure. Magnetic clasp closure.', 'https://static.zara.net/photos///2019/I/1/1/p/7302/004/040/2/w/652/7302004040_2_2_1.jpg?ts=1568026284021', '2019-12-21 00:00:00', 1),
(23, 'BACKPACK WITH STUDS', 'Black backpack. Foldover flap and side zip pockets with studs. Adjustable shoulder straps with chain detail. Gathered drawstring fastening.', 'https://static.zara.net/photos///2019/I/1/1/p/8410/004/040/2/w/652/8410004040_2_3_1.jpg?ts=1568815800484', '2019-12-22 00:00:00', 1),
(24, 'EMBOSSED ANIMAL PRINT CROSSBODY MINAUDIÈRE', 'Black crossbody minaudière with an embossed animal print on the exterior and handle. Gold chain shoulder strap. Lined interior. Magnetic clasp closure.', 'https://static.zara.net/photos///2019/I/1/1/p/5301/510/040/2/w/652/5301510040_2_1_1.jpg?ts=1572531598273', '2019-12-23 00:00:00', 1),
(25, 'ANIMAL PRINT METALLIC CROSSBODY BAG', 'Silver crossbody bag. Metallic exterior with animal print. Adjustable sporty shoulder strap in technical fabric. Two compartments with lined interior and zip closure.', 'https://static.zara.net/photos///2019/I/1/1/p/7664/004/092/2/w/652/7664004092_2_3_1.jpg?ts=1566813135512', '2019-12-24 00:00:00', 1),
(26, 'TRANSPARENT RIGID RIGID MINAUDIÈRE WITH STUDS', 'Transparent mini minaudière. Rigid design with studs detail on the sides. Handle and chain shoulder strap. Magnet closure.', 'https://static.zara.net/photos///2019/I/1/1/p/7612/004/087/2/w/652/7612004087_2_2_1.jpg?ts=1564481197740', '2019-12-25 00:00:00', 1),
(27, 'SHIMMERY MINI CITY BAG', 'Silver-coloured mini city bag. Body with glitter finish. Removable chain shoulder strap. Interior with two compartments. Magnetic clasp closure.', 'https://static.zara.net/photos///2019/I/1/1/p/7673/004/092/2/w/652/7673004092_2_4_1.jpg?ts=1569843634513', '2019-12-26 00:00:00', 1),
(28, 'METALLIC CLUTCH', 'Clutch available in different colours: green and orange. Gathered design with a metallic finish. Detachable shoulder strap. Lined interior with pocket. Magnetic frame fastening.', 'https://static.zara.net/photos///2020/V/1/1/p/6700/510/030/2/w/652/6700510030_2_1_1.jpg?ts=1576149603201', '2019-12-27 00:00:00', 1),
(29, 'LEATHER CROSSBODY BAG WITH COWBOY BUCKLE', 'Black leather crossbody bag. Leather exterior. Front flap with studs, knotted strap, buckle and cowboy-style metal details. Front pocket with studs and fringing. Adjustable and detachable shoulder strap. Lined interior with three compartments. Magnetic closure.', 'https://static.zara.net/photos///2019/I/1/1/p/5303/510/040/2/w/652/5303510040_2_1_1.jpg?ts=1572862629669', '2019-12-28 00:00:00', 1),
(30, 'PERSONALISABLE LEATHER TOTE BAG', 'Leather tote bag available in different colours: taupe and black. Soft leather with a tumbled finish. Shoulder strap. Lined interior with pocket. Magnetic clasp closure.\r\n\r\nTurn your favourite bag into a unique piece. Personalise it with your initials.', 'https://static.zara.net/photos///2020/V/1/1/p/6011/510/131/2/w/652/6011510131_2_1_1.jpg?ts=1574080605206', '2019-12-29 00:00:00', 1),
(31, 'PERSONALISABLE LEATHER CLUTCH BAG', 'Leather clutch bag available in different colours: black and grey. Soft leather with a tumbled finish. Lined interior with pocket. Zip closure with wrist strap.\r\n\r\nTurn your favourite bag into a unique piece. Personalise it with your initials.', 'https://static.zara.net/photos///2020/V/1/1/p/5612/510/004/2/w/652/5612510004_2_1_1.jpg?ts=1574078696441', '2019-12-30 00:00:00', 1),
(32, 'PLEATED TOTE BAG', 'Tote bag available in black and in burgundy. Pleats on the sides. Top handles. Shoulder straps. Three inside compartments, one of which is covered and has zip closure.', 'https://static.zara.net/photos///2019/I/1/1/p/6062/004/022/2/w/652/6062004022_2_2_1.jpg?ts=1570529573555', '2019-12-31 00:00:00', 1),
(33, 'BUCKET BAG', 'Bucket bag available in black, red and ecru. Tumbled finish on the exterior. Gold metalwork. Detachable handle with decorative studs. Adjustable and detachable shoulder strap. Gathered drawstring closure.bekzhan', 'https://static.zara.net/photos///2019/I/1/1/p/6404/004/040/2/w/652/6404004040_2_1_1.jpg?ts=1564589497208', '2020-01-01 00:00:00', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `bag` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`id`, `bag`, `image`) VALUES
(1, 1, 'https://static.zara.net/photos///2019/I/1/1/p/8411/004/070/2/w/652/8411004070_1_1_1.jpg?ts=1563536353726'),
(2, 1, 'https://static.zara.net/photos///2019/I/1/1/p/8411/004/070/2/w/652/8411004070_2_3_1.jpg?ts=1563536262492'),
(3, 1, 'https://static.zara.net/photos///2019/I/1/1/p/8411/004/070/2/w/652/8411004070_2_4_1.jpg?ts=1563536303873'),
(4, 1, 'https://static.zara.net/photos///2019/I/1/1/p/8411/004/070/2/w/652/8411004070_2_2_1.jpg?ts=1563536221572'),
(5, 2, 'https://static.zara.net/photos///2019/I/1/1/p/6112/004/045/2/w/652/6112004045_1_1_1.jpg?ts=1558696691137'),
(6, 2, 'https://static.zara.net/photos///2019/I/1/1/p/6112/004/045/2/w/652/6112004045_2_2_1.jpg?ts=1558696506810'),
(7, 2, 'https://static.zara.net/photos///2019/I/1/1/p/6112/004/045/2/w/652/6112004045_2_1_1.jpg?ts=1558696422268'),
(8, 2, 'https://static.zara.net/photos///2019/I/1/1/p/6112/004/045/2/w/652/6112004045_2_3_1.jpg?ts=1558696560332'),
(9, 2, 'https://static.zara.net/photos///2019/I/1/1/p/6112/004/045/2/w/652/6112004045_2_4_1.jpg?ts=1558696601648'),
(10, 3, 'https://static.zara.net/photos///2019/V/1/1/p/5664/304/040/2/w/652/5664304040_1_1_1.jpg?ts=1565184305497'),
(11, 3, 'https://static.zara.net/photos///2019/V/1/1/p/5664/304/040/2/w/652/5664304040_2_3_1.jpg?ts=1551378064897'),
(12, 3, 'https://static.zara.net/photos///2019/V/1/1/p/5664/304/040/2/w/652/5664304040_2_4_1.jpg?ts=1551378107160'),
(13, 3, 'https://static.zara.net/photos///2019/V/1/1/p/5664/304/040/2/w/652/5664304040_2_2_1.jpg?ts=1551378028917'),
(14, 4, 'https://static.zara.net/photos///2020/V/1/1/p/6095/004/040/2/w/652/6095004040_1_1_1.jpg?ts=1574079813838'),
(15, 4, 'https://static.zara.net/photos///2020/V/1/1/p/6095/004/040/2/w/652/6095004040_2_2_1.jpg?ts=1574079793900'),
(16, 4, 'https://static.zara.net/photos///2020/V/1/1/p/6095/004/040/2/w/652/6095004040_2_3_1.jpg?ts=1574080308067'),
(17, 4, 'https://static.zara.net/photos///2020/V/1/1/p/6095/004/040/2/w/652/6095004040_2_4_1.jpg?ts=1574079874324'),
(18, 4, 'https://static.zara.net/photos///2020/V/1/1/p/6095/004/040/2/w/652/6095004040_2_6_1.jpg?ts=1574080308475'),
(19, 4, 'https://static.zara.net/photos///2020/V/1/1/p/6011/510/040/2/w/652/6011510040_2_14_1.jpg?ts=1575396609360'),
(20, 4, 'https://static.zara.net/photos///2018/V/M/1/p/1111/000/000/2/w/652/1111000000_2_97_1.jpg?ts=1570204599702'),
(21, 5, 'https://static.zara.net/photos///2020/V/1/1/p/5614/510/040/2/w/652/5614510040_1_1_1.jpg?ts=1574078253113'),
(22, 5, 'https://static.zara.net/photos///2020/V/1/1/p/5614/510/040/2/w/652/5614510040_2_2_1.jpg?ts=1574078366978'),
(23, 5, 'https://static.zara.net/photos///2020/V/1/1/p/5614/510/040/2/w/652/5614510040_2_3_1.jpg?ts=1574078313216'),
(24, 5, 'https://static.zara.net/photos///2020/V/1/1/p/5614/510/040/2/w/652/5614510040_2_4_1.jpg?ts=1574078393625'),
(25, 5, 'https://static.zara.net/photos///2020/V/1/1/p/5614/510/040/2/w/652/5614510040_2_13_1.jpg?ts=1575396607978'),
(26, 5, 'https://static.zara.net/photos///2018/V/M/1/p/1111/000/000/2/w/652/1111000000_2_97_1.jpg?ts=1570204599702'),
(27, 6, 'https://static.zara.net/photos///2019/I/1/1/p/7350/004/002/4/w/652/7350004002_1_1_1.jpg?ts=1569844830877'),
(28, 6, 'https://static.zara.net/photos///2019/I/1/1/p/7350/004/002/4/w/652/7350004002_2_2_1.jpg?ts=1569844834474'),
(29, 6, 'https://static.zara.net/photos///2019/I/1/1/p/7350/004/002/4/w/652/7350004002_2_3_1.jpg?ts=1569844830863'),
(30, 6, 'https://static.zara.net/photos///2019/I/1/1/p/7350/004/002/4/w/652/7350004002_2_4_1.jpg?ts=1569844834332'),
(31, 6, 'https://static.zara.net/photos///2019/I/1/1/p/7350/004/002/4/w/652/7350004002_2_15_1.jpg?ts=1568204606402'),
(32, 7, 'https://static.zara.net/photos///2019/I/1/1/p/7350/004/002/2/w/652/7350004002_1_1_1.jpg?ts=1569844740264'),
(33, 7, 'https://static.zara.net/photos///2019/I/1/1/p/7350/004/002/2/w/652/7350004002_2_2_1.jpg?ts=1569844743478'),
(34, 7, 'https://static.zara.net/photos///2019/I/1/1/p/7350/004/002/2/w/652/7350004002_2_3_1.jpg?ts=1569844740165'),
(35, 7, 'https://static.zara.net/photos///2019/I/1/1/p/7350/004/002/2/w/652/7350004002_2_4_1.jpg?ts=1569848988797'),
(36, 8, 'https://static.zara.net/photos///2019/I/1/1/p/8613/004/040/2/w/652/8613004040_1_1_1.jpg?ts=1566315469299'),
(37, 8, 'https://static.zara.net/photos///2019/I/1/1/p/8613/004/040/2/w/652/8613004040_2_1_1.jpg?ts=1566315275239'),
(38, 8, 'https://static.zara.net/photos///2019/I/1/1/p/8613/004/040/2/w/652/8613004040_2_2_1.jpg?ts=1566315312094'),
(39, 8, 'https://static.zara.net/photos///2019/I/1/1/p/8613/004/040/2/w/652/8613004040_2_4_1.jpg?ts=1566315386031'),
(40, 10, 'https://static.zara.net/photos///2019/I/1/1/p/7504/004/040/2/w/652/7504004040_1_1_1.jpg?ts=1574149543902'),
(41, 10, 'https://static.zara.net/photos///2019/I/1/1/p/7502/004/040/2/w/652/7502004040_2_1_1.jpg?ts=1567520835384'),
(42, 10, 'https://static.zara.net/photos///2019/I/1/1/p/7502/004/040/2/w/652/7502004040_2_2_1.jpg?ts=1567520841599'),
(43, 10, 'https://static.zara.net/photos///2019/I/1/1/p/7502/004/040/2/w/652/7502004040_2_4_1.jpg?ts=1567520817047'),
(44, 11, 'https://static.zara.net/photos///2019/I/1/1/p/8432/004/040/2/w/652/8432004040_1_1_1.jpg?ts=1568121875756'),
(45, 11, 'https://static.zara.net/photos///2019/I/1/1/p/8432/004/040/2/w/652/8432004040_2_2_1.jpg?ts=1568121957272'),
(46, 11, 'https://static.zara.net/photos///2019/I/1/1/p/8432/004/040/2/w/652/8432004040_2_3_1.jpg?ts=1569239664481'),
(47, 11, 'https://static.zara.net/photos///2019/I/1/1/p/8432/004/040/2/w/652/8432004040_2_5_1.jpg?ts=1569239645239'),
(48, 12, 'https://static.zara.net/photos///2019/I/1/1/p/8438/004/040/2/w/652/8438004040_1_1_1.jpg?ts=1566570499888'),
(49, 12, 'https://static.zara.net/photos///2019/I/1/1/p/8438/004/040/2/w/652/8438004040_2_5_1.jpg?ts=1566831603459'),
(50, 12, 'https://static.zara.net/photos///2019/I/1/1/p/8438/004/040/2/w/652/8438004040_2_4_1.jpg?ts=1566570448493'),
(51, 12, 'https://static.zara.net/photos///2019/I/1/1/p/8438/004/040/2/w/652/8438004040_2_2_1.jpg?ts=1566570369442'),
(52, 12, 'https://static.zara.net/photos///2019/I/1/1/p/8438/004/040/2/w/652/8438004040_2_3_1.jpg?ts=1566570406164'),
(53, 13, 'https://static.zara.net/photos///2019/I/1/1/p/8085/204/040/2/w/652/8085204040_1_1_1.jpg?ts=1568046584017'),
(54, 13, 'https://static.zara.net/photos///2019/I/1/1/p/8085/204/040/2/w/652/8085204040_2_5_1.jpg?ts=1568046767780'),
(55, 13, 'https://static.zara.net/photos///2019/V/1/1/p/8085/204/040/2/w/652/8085204040_2_15_1.jpg?ts=1551357623680'),
(56, 13, 'https://static.zara.net/photos///2019/I/1/1/p/8085/204/040/2/w/652/8085204040_2_1_1.jpg?ts=1568046710002'),
(57, 13, 'https://static.zara.net/photos///2019/V/1/1/p/8085/204/040/2/w/652/8085204040_2_7_1.jpg?ts=1551361490558'),
(58, 14, 'https://static.zara.net/photos///2019/I/1/1/p/6022/004/105/2/w/652/6022004105_2_1_1.jpg?ts=1564653275081'),
(59, 14, 'https://static.zara.net/photos///2019/I/1/1/p/6022/004/105/2/w/652/6022004105_2_2_1.jpg?ts=1564653314326'),
(60, 14, 'https://static.zara.net/photos///2019/I/1/1/p/6022/004/105/2/w/652/6022004105_2_3_1.jpg?ts=1564653355016'),
(61, 14, 'https://static.zara.net/photos///2019/I/1/1/p/6022/004/105/2/w/652/6022004105_2_4_1.jpg?ts=1564653394724'),
(62, 15, 'https://static.zara.net/photos///2019/I/1/1/p/6608/510/092/2/w/652/6608510092_2_1_1.jpg?ts=1571750145236'),
(63, 15, 'https://static.zara.net/photos///2019/I/1/1/p/6608/510/092/2/w/652/6608510092_2_2_1.jpg?ts=1571750143597'),
(64, 15, 'https://static.zara.net/photos///2019/I/1/1/p/6608/510/092/2/w/652/6608510092_2_3_1.jpg?ts=1571750141593'),
(65, 15, 'https://static.zara.net/photos///2019/I/1/1/p/6608/510/092/2/w/652/6608510092_2_4_1.jpg?ts=1571750151454'),
(66, 15, 'https://static.zara.net/photos///2019/I/1/1/p/6608/510/092/2/w/652/6608510092_2_5_1.jpg?ts=1571750131182'),
(67, 16, 'https://static.zara.net/photos///2019/I/1/1/p/5611/510/030/2/w/652/5611510030_1_1_1.jpg?ts=1571745311737'),
(68, 16, 'https://static.zara.net/photos///2019/I/1/1/p/5611/510/030/2/w/652/5611510030_2_2_1.jpg?ts=1571745389633'),
(69, 16, 'https://static.zara.net/photos///2019/I/1/1/p/5611/510/030/2/w/652/5611510030_2_3_1.jpg?ts=1571745408948'),
(70, 16, 'https://static.zara.net/photos///2019/I/1/1/p/5611/510/030/2/w/652/5611510030_2_4_1.jpg?ts=1571745344461'),
(71, 17, 'https://static.zara.net/photos///2020/V/1/1/p/6648/510/091/2/w/652/6648510091_1_1_1.jpg?ts=1574858818569'),
(72, 17, 'https://static.zara.net/photos///2020/V/1/1/p/6648/510/091/2/w/652/6648510091_2_2_1.jpg?ts=1574858847969'),
(73, 17, 'https://static.zara.net/photos///2020/V/1/1/p/6648/510/091/2/w/652/6648510091_2_3_1.jpg?ts=1574858915202'),
(74, 17, 'https://static.zara.net/photos///2020/V/1/1/p/6648/510/091/2/w/652/6648510091_2_4_1.jpg?ts=1574858969596'),
(75, 18, 'https://static.zara.net/photos///2019/I/1/1/p/7603/510/092/2/w/652/7603510092_1_1_1.jpg?ts=1571750138785'),
(76, 18, 'https://static.zara.net/photos///2019/I/1/1/p/7603/510/092/2/w/652/7603510092_2_2_1.jpg?ts=1571750178249'),
(77, 18, 'https://static.zara.net/photos///2019/I/1/1/p/7603/510/092/2/w/652/7603510092_2_3_1.jpg?ts=1571750173868'),
(78, 18, 'https://static.zara.net/photos///2019/I/1/1/p/7603/510/092/2/w/652/7603510092_2_4_1.jpg?ts=1571750181504'),
(79, 18, 'https://static.zara.net/photos///2019/I/1/1/p/7603/510/092/2/w/652/7603510092_2_5_1.jpg?ts=1571750181264'),
(80, 19, 'https://static.zara.net/photos///2019/I/1/1/p/6312/004/040/2/w/652/6312004040_1_1_1.jpg?ts=1567766354368'),
(81, 19, 'https://static.zara.net/photos///2019/I/1/1/p/6312/004/040/2/w/652/6312004040_2_5_1.jpg?ts=1563890626837'),
(82, 19, 'https://static.zara.net/photos///2019/I/1/1/p/6312/004/040/2/w/652/6312004040_2_3_1.jpg?ts=1563890548677'),
(83, 19, 'https://static.zara.net/photos///2020/V/1/1/p/6312/004/040/2/w/652/6312004040_2_19_1.jpg?ts=1576580053031'),
(84, 20, 'https://static.zara.net/photos///2020/V/1/1/p/8122/004/027/3/w/652/8122004027_2_1_1.jpg?ts=1575036535044'),
(85, 20, 'https://static.zara.net/photos///2020/V/1/1/p/8122/004/027/3/w/652/8122004027_2_2_1.jpg?ts=1575036462557'),
(86, 20, 'https://static.zara.net/photos///2020/V/1/1/p/8122/004/027/3/w/652/8122004027_2_3_1.jpg?ts=1575036631212'),
(87, 20, 'https://static.zara.net/photos///2020/V/1/1/p/8122/004/027/3/w/652/8122004027_2_4_1.jpg?ts=1575036501589'),
(88, 20, 'https://static.zara.net/photos///2020/V/1/1/p/8122/004/027/3/w/652/8122004027_2_15_1.jpg?ts=1576078266577'),
(89, 21, 'https://static.zara.net/photos///2019/I/1/1/p/5608/510/040/2/w/652/5608510040_1_1_1.jpg?ts=1572541100418'),
(90, 21, 'https://static.zara.net/photos///2019/I/1/1/p/5608/510/040/2/w/652/5608510040_2_2_1.jpg?ts=1572541502693'),
(91, 21, 'https://static.zara.net/photos///2019/I/1/1/p/5608/510/040/2/w/652/5608510040_2_3_1.jpg?ts=1572541188968'),
(92, 21, 'https://static.zara.net/photos///2019/I/1/1/p/5608/510/040/2/w/652/5608510040_2_4_1.jpg?ts=1572541105319'),
(93, 21, 'https://static.zara.net/photos///2019/I/1/1/p/5608/510/040/2/w/652/5608510040_2_5_1.jpg?ts=1572541097247'),
(94, 22, 'https://static.zara.net/photos///2019/I/1/1/p/7302/004/040/2/w/652/7302004040_1_1_1.jpg?ts=1568817847776'),
(95, 22, 'https://static.zara.net/photos///2019/I/1/1/p/7302/004/040/2/w/652/7302004040_2_1_1.jpg?ts=1568026265560'),
(96, 22, 'https://static.zara.net/photos///2019/I/1/1/p/7302/004/040/2/w/652/7302004040_2_3_1.jpg?ts=1568817841521'),
(97, 22, 'https://static.zara.net/photos///2019/I/1/1/p/7302/004/040/2/w/652/7302004040_2_4_1.jpg?ts=1568026271674'),
(98, 23, 'https://static.zara.net/photos///2019/I/1/1/p/8410/004/040/2/w/652/8410004040_1_1_1.jpg?ts=1564671611917'),
(99, 23, 'https://static.zara.net/photos///2019/I/1/1/p/8410/004/040/2/w/652/8410004040_2_2_1.jpg?ts=1563894539224'),
(100, 23, 'https://static.zara.net/photos///2019/I/1/1/p/8410/004/040/2/w/652/8410004040_2_4_1.jpg?ts=1563894579744'),
(101, 23, 'https://static.zara.net/photos///2019/I/1/1/p/8410/004/040/2/w/652/8410004040_2_5_1.jpg?ts=1568816102792'),
(102, 24, 'https://static.zara.net/photos///2019/I/1/1/p/5301/510/040/2/w/652/5301510040_1_1_1.jpg?ts=1572531604899'),
(103, 24, 'https://static.zara.net/photos///2019/I/1/1/p/5301/510/040/2/w/652/5301510040_2_2_1.jpg?ts=1572531630365'),
(104, 24, 'https://static.zara.net/photos///2019/I/1/1/p/5301/510/040/2/w/652/5301510040_2_3_1.jpg?ts=1572531624331'),
(105, 24, 'https://static.zara.net/photos///2019/I/1/1/p/5301/510/040/2/w/652/5301510040_2_4_1.jpg?ts=1572531585197'),
(106, 24, 'https://static.zara.net/photos///2019/I/1/1/p/5301/510/040/2/w/652/5301510040_2_5_1.jpg?ts=1572531628070'),
(107, 25, 'https://static.zara.net/photos///2019/I/1/1/p/7664/004/092/2/w/652/7664004092_1_1_1.jpg?ts=1566813279386'),
(108, 25, 'https://static.zara.net/photos///2019/I/1/1/p/7664/004/092/2/w/652/7664004092_2_2_1.jpg?ts=1566813098890'),
(109, 25, 'https://static.zara.net/photos///2019/I/1/1/p/7664/004/092/2/w/652/7664004092_2_1_1.jpg?ts=1566813038389'),
(110, 25, 'https://static.zara.net/photos///2019/I/1/1/p/7664/004/092/2/w/652/7664004092_2_4_1.jpg?ts=1566813177666'),
(111, 26, 'https://static.zara.net/photos///2019/I/1/1/p/7612/004/087/2/w/652/7612004087_1_1_1.jpg?ts=1564481397883'),
(112, 26, 'https://static.zara.net/photos///2019/I/1/1/p/7612/004/087/2/w/652/7612004087_2_4_1.jpg?ts=1564481275656'),
(113, 26, 'https://static.zara.net/photos///2019/I/1/1/p/7612/004/087/2/w/652/7612004087_2_1_1.jpg?ts=1564481158728'),
(114, 26, 'https://static.zara.net/photos///2019/I/1/1/p/7612/004/087/2/w/652/7612004087_2_3_1.jpg?ts=1564481236362'),
(115, 26, 'https://static.zara.net/photos///2019/I/1/1/p/7612/004/087/2/w/652/7612004087_2_5_1.jpg?ts=1564481314493'),
(116, 27, 'https://static.zara.net/photos///2019/I/1/1/p/7673/004/092/2/w/652/7673004092_1_1_1.jpg?ts=1569843605026'),
(117, 27, 'https://static.zara.net/photos///2019/I/1/1/p/7673/004/092/2/w/652/7673004092_2_1_1.jpg?ts=1569843630105'),
(118, 27, 'https://static.zara.net/photos///2019/I/1/1/p/7673/004/092/2/w/652/7673004092_2_2_1.jpg?ts=1569843946816'),
(119, 27, 'https://static.zara.net/photos///2019/I/1/1/p/7673/004/092/2/w/652/7673004092_2_3_1.jpg?ts=1569843711322'),
(120, 28, 'https://static.zara.net/photos///2020/V/1/1/p/6700/510/030/2/w/652/6700510030_1_1_1.jpg?ts=1576149938583'),
(121, 28, 'https://static.zara.net/photos///2020/V/1/1/p/6700/510/030/2/w/652/6700510030_2_2_1.jpg?ts=1576149609197'),
(122, 28, 'https://static.zara.net/photos///2020/V/1/1/p/6700/510/030/2/w/652/6700510030_2_3_1.jpg?ts=1576149570313'),
(123, 28, 'https://static.zara.net/photos///2020/V/1/1/p/6700/510/030/2/w/652/6700510030_2_4_1.jpg?ts=1576149467580'),
(124, 28, 'https://static.zara.net/photos///2020/V/1/1/p/6700/510/030/2/w/652/6700510030_2_5_1.jpg?ts=1576149930184'),
(125, 28, 'https://static.zara.net/photos///2018/V/M/1/p/1111/000/000/2/w/652/1111000000_2_96_1.jpg?ts=1548282544545'),
(126, 29, 'https://static.zara.net/photos///2019/I/1/1/p/5303/510/040/2/w/652/5303510040_1_1_1.jpg?ts=1572862621193'),
(127, 29, 'https://static.zara.net/photos///2019/I/1/1/p/5303/510/040/2/w/652/5303510040_2_2_1.jpg?ts=1572862621108'),
(128, 29, 'https://static.zara.net/photos///2019/I/1/1/p/5303/510/040/2/w/652/5303510040_2_3_1.jpg?ts=1572862617257'),
(129, 29, 'https://static.zara.net/photos///2019/I/1/1/p/5303/510/040/2/w/652/5303510040_2_4_1.jpg?ts=1572862631748'),
(130, 29, 'https://static.zara.net/photos///2019/I/1/1/p/5303/510/040/2/w/652/5303510040_2_5_1.jpg?ts=1572862635910'),
(131, 30, 'https://static.zara.net/photos///2020/V/1/1/p/6011/510/131/2/w/652/6011510131_1_1_1.jpg?ts=1574080616240'),
(132, 30, 'https://static.zara.net/photos///2020/V/1/1/p/6011/510/131/2/w/652/6011510131_2_2_1.jpg?ts=1574080671923'),
(133, 30, 'https://static.zara.net/photos///2020/V/1/1/p/6011/510/131/2/w/652/6011510131_2_3_1.jpg?ts=1574080887001'),
(134, 30, 'https://static.zara.net/photos///2020/V/1/1/p/6011/510/131/2/w/652/6011510131_2_4_1.jpg?ts=1574080632076'),
(135, 30, 'https://static.zara.net/photos///2020/V/1/1/p/6011/510/131/2/w/652/6011510131_2_5_1.jpg?ts=1574080880279'),
(136, 30, 'https://static.zara.net/photos///2020/V/1/1/p/6011/510/131/2/w/652/6011510131_2_14_1.jpg?ts=1575396608457'),
(137, 30, 'https://static.zara.net/photos///2018/V/M/1/p/1111/000/000/2/w/652/1111000000_2_97_1.jpg?ts=1570204599702'),
(138, 31, 'https://static.zara.net/photos///2020/V/1/1/p/5612/510/004/2/w/652/5612510004_1_1_1.jpg?ts=1574078427201'),
(139, 31, 'https://static.zara.net/photos///2020/V/1/1/p/5612/510/004/2/w/652/5612510004_2_2_1.jpg?ts=1574078709457'),
(140, 31, 'https://static.zara.net/photos///2020/V/1/1/p/5612/510/004/2/w/652/5612510004_2_3_1.jpg?ts=1574078709715'),
(141, 31, 'https://static.zara.net/photos///2020/V/1/1/p/5612/510/004/2/w/652/5612510004_2_4_1.jpg?ts=1574078729625'),
(142, 31, 'https://static.zara.net/photos///2020/V/1/1/p/5612/510/004/2/w/652/5612510004_2_5_1.jpg?ts=1574078716949'),
(143, 31, 'https://static.zara.net/photos///2020/V/1/1/p/5612/510/004/2/w/652/5612510004_2_13_1.jpg?ts=1575396608192'),
(144, 31, 'https://static.zara.net/photos///2018/V/M/1/p/1111/000/000/2/w/652/1111000000_2_97_1.jpg?ts=1570204599702'),
(145, 32, 'https://static.zara.net/photos///2019/I/1/1/p/6062/004/022/2/w/652/6062004022_1_1_1.jpg?ts=1570529578967'),
(146, 32, 'https://static.zara.net/photos///2019/I/1/1/p/6062/004/022/2/w/652/6062004022_2_1_1.jpg?ts=1570529574442'),
(147, 32, 'https://static.zara.net/photos///2019/I/1/1/p/6062/004/022/2/w/652/6062004022_2_3_1.jpg?ts=1570529574487'),
(148, 32, 'https://static.zara.net/photos///2019/I/1/1/p/6062/004/022/2/w/652/6062004022_2_4_1.jpg?ts=1570529572636'),
(149, 33, 'https://static.zara.net/photos///2019/I/1/1/p/6404/004/040/2/w/652/6404004040_1_1_1.jpg?ts=1564589747467'),
(150, 33, 'https://static.zara.net/photos///2019/I/1/1/p/6404/004/040/2/w/652/6404004040_2_2_1.jpg?ts=1564589537471'),
(151, 33, 'https://static.zara.net/photos///2019/I/1/1/p/6404/004/040/2/w/652/6404004040_2_3_1.jpg?ts=1564589574306'),
(152, 33, 'https://static.zara.net/photos///2019/I/1/1/p/6404/004/040/2/w/652/6404004040_2_4_1.jpg?ts=1564589615409');

-- --------------------------------------------------------

--
-- Структура таблицы `reclame`
--

CREATE TABLE `reclame` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reclame`
--

INSERT INTO `reclame` (`id`, `image`) VALUES
(1, 'https://cdn2.f-cdn.com/contestentries/359684/14449456/56d01323119d0_thumb900.jpg'),
(2, 'https://cdn3.f-cdn.com/contestentries/359684/11006663/56d6dba49908e_thumb900.jpg'),
(3, 'https://cdn3.f-cdn.com/contestentries/359684/3260196/56d817d624b86_thumb900.jpg'),
(4, 'https://i2.wp.com/fabulesslyfrugal.com/wp-content/uploads/2017/11/clothes-900x471.jpg?resize=900%2C471&ssl=1'),
(5, 'https://moslenta.ru/thumb/900x471/filters:quality(75)/imgs/2016/11/28/15/56917/33eb69baffecd82d33deab28b9332a49b91d6d50.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `record`
--

CREATE TABLE `record` (
  `id` int(11) NOT NULL,
  `bag` int(11) DEFAULT NULL,
  `feature` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `record`
--

INSERT INTO `record` (`id`, `bag`, `feature`, `value`) VALUES
(1, 1, 'Цена', '39.99 сом'),
(2, 1, 'Цвет', 'ORANGE - 8411/004'),
(3, 1, 'Высота', '28 cm'),
(4, 1, 'Ширина', '11.7 cm'),
(5, 1, 'Длина', '25.5 cm'),
(6, 1, 'Материал', 'polyurethane, cow leather, polyester, polyurethane'),
(7, 1, 'Марка', 'Zara'),
(8, 2, 'Цена', '29.99 сом'),
(9, 2, 'Цвет', 'DARK BLUE - 6112/004'),
(10, 2, 'Высота', '23.5 cm'),
(11, 2, 'Ширина', '14 cm'),
(12, 2, 'Длина', '23.5 cm'),
(13, 2, 'Материал', 'cotton, polyester, iron'),
(14, 2, 'Марка', 'Zara'),
(15, 3, 'Цена', '29.99 сом'),
(16, 3, 'Цвет', 'BLACK - 5664/304'),
(17, 3, 'Высота', '17 cm'),
(18, 3, 'Ширина', '9 cm'),
(19, 3, 'Длина', '19 cm'),
(20, 3, 'Материал', 'polyurethane, iron, polyester'),
(21, 3, 'Марка', 'Zara'),
(22, 4, 'Цена', '69.99 сом'),
(23, 4, 'Цвет', 'BLACK - 6011/510'),
(24, 4, 'Высота', '32.5 cm'),
(25, 4, 'Ширина', '9.5 cm'),
(26, 4, 'Длина', '47 cm'),
(27, 4, 'Материал', 'polyurethane, cow leather, polyester'),
(28, 4, 'Марка', 'Zara'),
(29, 5, 'Цена', '59.99 сом'),
(30, 5, 'Цвет', 'BLACK - 5614/510'),
(31, 5, 'Высота', '17 cm'),
(32, 5, 'Ширина', '6 cm'),
(33, 5, 'Длина', '22 cm'),
(34, 5, 'Материал', 'leather, polyester'),
(35, 5, 'Марка', 'Zara'),
(36, 6, 'Цена', '29.99 сом'),
(37, 6, 'Цвет', 'ECRU - 7350/004'),
(38, 6, 'Высота', '19 cm'),
(39, 6, 'Ширина', '8.8 cm'),
(40, 6, 'Длина', '14.8 cm'),
(41, 6, 'Материал', 'polymethyl methacrylate, iron, cotton, linen, polyester'),
(42, 6, 'Марка', 'Zara'),
(43, 7, 'Цена', '29.99 сом'),
(44, 7, 'Цвет', 'ECRU - 7350/004'),
(45, 7, 'Высота', '19 cm'),
(46, 7, 'Ширина', '8.8 cm'),
(47, 7, 'Длина', '14.8 cm'),
(48, 7, 'Материал', 'polymethyl methacrylate, iron, cotton, linen, polyester'),
(49, 7, 'Марка', 'Zara'),
(50, 8, 'Цена', '19.99 сом'),
(51, 8, 'Цвет', 'BLACK - 8613/004'),
(52, 8, 'Высота', '16.2 cm'),
(53, 8, 'Ширина', '8 cm'),
(54, 8, 'Длина', '18.5 cm'),
(55, 8, 'Материал', 'polyurethane'),
(56, 8, 'Марка', 'Zara'),
(57, 10, 'Цена', '25.99 сом'),
(58, 10, 'Цвет', 'BLACK - 7502/004'),
(59, 10, 'Высота', '13.5 cm'),
(60, 10, 'Ширина', '4.5 cm'),
(61, 10, 'Длина', '21 cm'),
(62, 10, 'Материал', 'polyurethane, iron, polyester'),
(63, 10, 'Марка', 'Zara'),
(64, 11, 'Цена', '69.99 сом'),
(65, 11, 'Цвет', 'BLACK - 8432/004'),
(66, 11, 'Высота', '18 cm'),
(67, 11, 'Ширина', '4.5 cm'),
(68, 11, 'Длина', '24.5 cm'),
(69, 11, 'Материал', 'sheep leather, cow leather, polyester'),
(70, 11, 'Марка', 'Zara'),
(71, 12, 'Цена', '29.99 сом'),
(72, 12, 'Цвет', 'BLACK - 8438/004'),
(73, 12, 'Высота', '15 cm'),
(74, 12, 'Ширина', '5 cm'),
(75, 12, 'Длина', '30 cm'),
(76, 12, 'Материал', 'polyurethane, polyester'),
(77, 12, 'Марка', 'Zara'),
(78, 13, 'Цена', '17.99 сом'),
(79, 13, 'Цвет', 'BLACK - 8085/204'),
(80, 13, 'Высота', '14 cm'),
(81, 13, 'Ширина', '3 cm'),
(82, 13, 'Длина', '23 cm'),
(83, 13, 'Материал', 'zamak, polyurethane, polyester'),
(84, 13, 'Марка', 'Zara'),
(85, 14, 'Цена', '19.99 сом'),
(86, 14, 'Цвет', 'LEATHER COLOUR - 6022/004'),
(87, 14, 'Высота', '33 cm'),
(88, 14, 'Ширина', '11.5 cm'),
(89, 14, 'Длина', '30.5 cm'),
(90, 14, 'Материал', 'polyurethane, polyester'),
(91, 14, 'Марка', 'Zara'),
(92, 15, 'Цена', '17.99 сом'),
(93, 15, 'Цвет', 'SILVER - 6608/511'),
(94, 15, 'Высота', '12 cm'),
(95, 15, 'Ширина', '4 cm'),
(96, 15, 'Длина', '16 cm'),
(97, 15, 'Материал', ' polyurethane, iron, polyester'),
(98, 15, 'Марка', 'Zara'),
(99, 16, 'Цена', '19.99 сом'),
(100, 16, 'Цвет', 'GREEN - 5611/510'),
(101, 16, 'Высота', '7.3 cm'),
(102, 16, 'Ширина', '3 cm'),
(103, 16, 'Длина', '10 cm'),
(104, 16, 'Материал', 'polyester, polyurethane, iron'),
(105, 16, 'Марка', 'Zara'),
(106, 17, 'Цена', '29.99 сом'),
(107, 17, 'Цвет', 'GOLD - 6648/510'),
(108, 17, 'Высота', '13 cm'),
(109, 17, 'Ширина', '1 cm'),
(110, 17, 'Длина', '25 cm'),
(111, 17, 'Материал', ' polyester, aluminium'),
(112, 17, 'Марка', 'Zara'),
(113, 18, 'Цена', '17.99 сом'),
(114, 18, 'Цвет', 'SILVER - 7603/510'),
(115, 18, 'Высота', '11 cm'),
(116, 18, 'Ширина', '5.5 cm'),
(117, 18, 'Длина', '12.5 cm'),
(118, 18, 'Материал', 'polyurethane, iron, polyester'),
(119, 18, 'Марка', 'Zara'),
(120, 19, 'Цена', '29.99 сом'),
(121, 19, 'Цвет', 'BLACK - 6312/004'),
(122, 19, 'Высота', '13 cm'),
(123, 19, 'Ширина', '3 cm'),
(124, 19, 'Длина', '21.5 cm'),
(125, 19, 'Материал', 'iron, polyurethane, polyester'),
(126, 19, 'Марка', 'Zara'),
(127, 20, 'Цена', '99.99 сом'),
(128, 20, 'Цвет', 'BURNT ORANGE - 8122/004'),
(129, 20, 'Высота', '24 cm'),
(130, 20, 'Ширина', '14 cm'),
(131, 20, 'Длина', '39.5 cm'),
(132, 20, 'Материал', 'cow leather, polyester'),
(133, 20, 'Марка', 'Zara'),
(134, 21, 'Цена', '29.99 сом'),
(135, 21, 'Цвет', 'BLACK - 5608/510'),
(136, 21, 'Высота', '12.5 cm'),
(137, 21, 'Ширина', '8 cm'),
(138, 21, 'Длина', '19 cm'),
(139, 21, 'Материал', 'polyurethane'),
(140, 21, 'Марка', 'Zara'),
(141, 22, 'Цена', '49.99 сом'),
(142, 22, 'Цвет', 'BLACK - 7302/004'),
(143, 22, 'Высота', '31.5 cm'),
(144, 22, 'Ширина', '12.5 cm'),
(145, 22, 'Длина', '39 cm'),
(146, 22, 'Материал', 'polyurethane, polyester'),
(147, 22, 'Марка', 'Zara'),
(148, 23, 'Цена', '39.99 сом'),
(149, 23, 'Цвет', 'BLACK - 8410/004'),
(150, 23, 'Высота', '27 cm'),
(151, 23, 'Ширина', '12.5 cm'),
(152, 23, 'Длина', '26 cm'),
(153, 23, 'Материал', 'polyurethane, iron, polyester'),
(154, 23, 'Марка', 'Zara'),
(155, 24, 'Цена', '39.99 сом'),
(156, 24, 'Цвет', 'BLACK - 5301/510'),
(157, 24, 'Высота', '14 cm'),
(158, 24, 'Ширина', '8 cm'),
(159, 24, 'Длина', '15.5 cm'),
(160, 24, 'Материал', 'polyurethane, iron, polyester'),
(161, 24, 'Марка', 'Zara'),
(162, 25, 'Цена', '19.99 сом'),
(163, 25, 'Цвет', 'SILVER - 7664/004'),
(164, 25, 'Высота', '10.5 cm'),
(165, 25, 'Ширина', '7 cm'),
(166, 25, 'Длина', '16.5 cm'),
(167, 25, 'Материал', 'polyester, polyethylene, iron'),
(168, 25, 'Марка', 'Zara'),
(169, 26, 'Цена', '29.99 сом'),
(170, 26, 'Цвет', 'TRANSPARENT - 7612/004'),
(171, 26, 'Высота', '8.5 cm'),
(172, 26, 'Ширина', '4 cm'),
(173, 26, 'Длина', '18 cm'),
(174, 26, 'Материал', 'polymethyl methacrylate, iron'),
(175, 26, 'Марка', 'Zara'),
(176, 27, 'Цена', '17.99 сом'),
(177, 27, 'Цвет', 'SILVER - 7673/004'),
(178, 27, 'Высота', '10 cm'),
(179, 27, 'Ширина', '7 cm'),
(180, 27, 'Длина', '18.5 cm'),
(181, 27, 'Материал', 'polyurethane thermoplastic, iron'),
(182, 27, 'Марка', 'Zara'),
(183, 28, 'Цена', '29.99 сом'),
(184, 28, 'Цвет', 'GREEN - 6700/510'),
(185, 28, 'Высота', '23.5 cm'),
(186, 28, 'Ширина', '4 cm'),
(187, 28, 'Длина', '36 cm'),
(188, 28, 'Материал', 'polyurethane, polyester'),
(189, 28, 'Марка', 'Zara'),
(190, 29, 'Цена', '59.99 сом'),
(191, 29, 'Цвет', 'BLACK - 5303/510'),
(192, 29, 'Высота', '15 cm'),
(193, 29, 'Ширина', '10 cm'),
(194, 29, 'Длина', '21.5 cm'),
(195, 29, 'Материал', 'cow leather, polyurethane, polyester'),
(196, 29, 'Марка', 'Zara'),
(197, 30, 'Цена', '69.99 сом'),
(198, 30, 'Цвет', 'TAUPE - 6011/510'),
(199, 30, 'Высота', '32.5 cm'),
(200, 30, 'Ширина', '9.5 cm'),
(201, 30, 'Длина', '47 cm'),
(202, 30, 'Материал', 'polyurethane, cow leather, polyester'),
(203, 30, 'Марка', 'Zara'),
(204, 31, 'Цена', '49.99 сом'),
(205, 31, 'Цвет', 'GREY - 5612/510'),
(206, 31, 'Высота', '21 cm'),
(207, 31, 'Ширина', '2 cm'),
(208, 31, 'Длина', '29.5 cm'),
(209, 31, 'Материал', 'cow leather, polyester'),
(210, 31, 'Марка', 'Zara'),
(211, 32, 'Цена', '29.99 сом'),
(212, 32, 'Цвет', 'BURGUNDY - 6062/004'),
(213, 32, 'Высота', '27 cm'),
(214, 32, 'Ширина', '18.5 cm'),
(215, 32, 'Длина', '45 cm'),
(216, 32, 'Материал', 'polyurethane'),
(217, 32, 'Марка', 'Zara'),
(218, 33, 'Цена', '19.99 сом'),
(219, 33, 'Цвет', 'BLACK - 6400/510'),
(220, 33, 'Высота', '27.5 cm'),
(221, 33, 'Ширина', '15 cm'),
(222, 33, 'Длина', '21.7 cm'),
(223, 33, 'Материал', 'polyurethane'),
(224, 33, 'Марка', 'Zara');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(1, 'bekzhan', '123', 'admin');

-- --------------------------------------------------------

--
-- Структура таблицы `visit`
--

CREATE TABLE `visit` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `count` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `additional`
--
ALTER TABLE `additional`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `bag`
--
ALTER TABLE `bag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `bag` (`bag`);

--
-- Индексы таблицы `reclame`
--
ALTER TABLE `reclame`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `bag` (`bag`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `additional`
--
ALTER TABLE `additional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bag`
--
ALTER TABLE `bag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT для таблицы `reclame`
--
ALTER TABLE `reclame`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `record`
--
ALTER TABLE `record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `visit`
--
ALTER TABLE `visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`bag`) REFERENCES `bag` (`id`);

--
-- Ограничения внешнего ключа таблицы `record`
--
ALTER TABLE `record`
  ADD CONSTRAINT `record_ibfk_1` FOREIGN KEY (`bag`) REFERENCES `bag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
