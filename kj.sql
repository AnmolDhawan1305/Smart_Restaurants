/*
SQLyog Enterprise - MySQL GUI v8.02 RC
MySQL - 5.5.24-log : Database - restro
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`restro` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `restro`;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `email` varchar(500) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `ph_no` decimal(20,0) DEFAULT NULL,
  `Reviews` decimal(10,1) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`email`,`name`,`ph_no`,`Reviews`,`Date`) values ('',NULL,NULL,NULL,NULL);

/*Table structure for table `menu1` */

DROP TABLE IF EXISTS `menu1`;

CREATE TABLE `menu1` (
  `item_id` decimal(10,0) NOT NULL,
  `item_name` varchar(500) DEFAULT NULL,
  `item_type` varchar(500) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `availabilty` tinyint(1) NOT NULL,
  `maxqty` decimal(10,0) DEFAULT '5',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu1` */

insert  into `menu1`(`item_id`,`item_name`,`item_type`,`price`,`availabilty`,`maxqty`) values ('1','italian omelette','all day breakfast','180',1,'2'),('2','mocha masala omelette','all day breakfast','160',1,'1'),('3','keema ghotala','all day breakfast','160',1,'5'),('4','sunny side up','all day breakfast','170',1,'6'),('5','anda bhurji pav','all day breakfast','225',1,'1'),('6','WWF salad','salads','135',1,'1'),('7','hummus bowl','salads','200',1,'5'),('8','greek salad','salads','200',1,'3'),('9','mocha salad bowl','salads','175',1,'4'),('10','seafood salad','salads','225',1,'5'),('11','nachos grande','appetizers','250',1,'5'),('12','jalapenos hush puppies','appetizers','225',1,'5'),('13','crispy chicken','appetizers','225',1,'5'),('14','thai chicken satay','appetizers','200',1,'5'),('15','achaari chicken tikka','appetizers','275',1,'5'),('16','stuffed mushroom','appetizers','235',1,'5'),('17','falafel burgers','burgers','225',1,'5'),('18','swiss cheese burger','burgers','225',1,'5'),('19','lamb cheese burger','burgers','250',1,'5'),('20','welsh rarebit','burgers','250',1,'5'),('21','club sandwich veg','burgers','225',1,'5'),('22','roma tomato','paninis','230',1,'5'),('23','cottage cheese','paninis','225',1,'5'),('24','kadhai chicken','paninis','250',1,'5'),('25','roast chicken','paninis','250',1,'5'),('26','garden fresh','paninis','275',1,'5'),('27','margherita','pizzas','295',1,'5'),('28','farm fresh pizza','pizzas','325',1,'5'),('29','hurricane','pizzas','350',1,'5'),('30','peri-peri chicken','pizzas','375',1,'5'),('31','pepperoni pizza','pizzas','375',1,'5'),('32','pink sauce penne','pastas','325',1,'5'),('33','baked mac and cheese','pastas','350',1,'5'),('34','wild mushroom spaghetti','pastas','325',1,'5'),('35','mocha spaghetti','pastas','350',1,'5'),('36','peppy paneer','pastas','375',1,'5'),('37','bangers and mash','mocha mains','325',1,'5'),('38','bubble and squeak','mocha mains','295',1,'5'),('39','grilled tenderlion','mocha mains','350',1,'5'),('40','chicken mushroom pie','mocha mains','325',1,'5'),('41','steak and ale pie','mocha mains','325',1,'5'),('42','green thai curry','mocha mains','375',1,'5'),('43','achaari biryani','mocha mains','250',1,'5'),('44','garlic noodles','mocha mains','575',1,'5'),('45','kumg pao chicken','mocha mains','295',1,'5'),('46','cottage cheese sizzler','sizzlers','295',1,'5'),('47','peri-peri chicken','sizzlers','350',1,'5'),('48','crab','sizzlers','450',1,'5'),('49','tiger prawns','sizzlers','400',1,'5'),('50','king fish','sizzlers','500',1,'5'),('51','tex mex chicken','sizzlers','360',1,'5'),('52','oriental chicken','sizzlers','295',1,'5'),('53','banoffee pie','shakes','190',1,'3'),('54','rocky road','shakes','190',1,'4'),('55','fresh fruit','shakes','190',1,'5'),('56','toblerone','shakes','200',1,'5'),('57','mocha shake','shakes','180',1,'5'),('58','black forest','shakes','210',1,'5'),('59','kit kat','shakes','195',1,'5'),('60','ferrero rocher','shakes','225',1,'5'),('61','lemon iced tea','coolers','110',1,'5'),('62','miami lemons','coolers','135',1,'5'),('63','berry blast','coolers','125',1,'5'),('64','bottled water','coolers','60',1,'5'),('65','red bull energy drink','coolers','175',1,'5'),('66','espresso','italian coffees','75',1,'5'),('67','cappuccino','italian coffees','95',1,'5'),('68','grande','italian coffees','120',1,'5'),('69','choco latte','italian coffees','135',1,'5'),('70','cafe latte','italian coffees','150',1,'5'),('71','jamaican blue mountain','speciality coffees','200',1,'5'),('72','kenya aa','speciality coffees','140',1,'5'),('73','monsoon malabar','speciality coffees','200',1,'5'),('74','brazil bourbon','speciality coffees','200',1,'5'),('75','indian peaberry','speciality coffees','200',1,'5');

/*Table structure for table `order_attendant` */

DROP TABLE IF EXISTS `order_attendant`;

CREATE TABLE `order_attendant` (
  `username` varchar(500) NOT NULL,
  `password` varchar(500) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `order_attendant` */

insert  into `order_attendant`(`username`,`password`,`name`) values ('oA1305','yes','Anmol');

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `order_id` decimal(11,0) NOT NULL,
  `item_id` decimal(11,0) NOT NULL,
  `qty` decimal(10,0) DEFAULT NULL,
  `delievered` tinyint(1) NOT NULL DEFAULT '0',
  `itr` decimal(10,0) NOT NULL DEFAULT '1',
  PRIMARY KEY (`order_id`,`item_id`,`itr`),
  KEY `FK_order_detai1` (`item_id`),
  CONSTRAINT `FK_order_detai1` FOREIGN KEY (`item_id`) REFERENCES `menu1` (`item_id`),
  CONSTRAINT `FK_order_detail` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `order_detail` */

insert  into `order_detail`(`order_id`,`item_id`,`qty`,`delievered`,`itr`) values ('1','2','3',1,'1'),('1','3','2',1,'1'),('1','4','1',1,'1'),('2','3','2',1,'1'),('2','4','2',1,'1'),('2','5','2',1,'1'),('3','1','2',1,'1'),('3','2','2',1,'1'),('3','3','1',1,'1'),('3','6','2',1,'2'),('3','53','2',1,'2'),('3','54','1',1,'2'),('4','1','1',0,'1'),('4','1','1',0,'2'),('4','2','1',0,'1'),('4','2','2',0,'2'),('5','1','1',0,'1'),('5','3','1',0,'1'),('5','4','3',0,'1'),('6','4','1',1,'1'),('6','5','2',1,'2'),('7','5','1',1,'1'),('7','8','2',1,'2'),('7','9','1',1,'2'),('8','1','2',1,'1'),('8','2','2',1,'1'),('8','5','1',1,'2'),('8','6','2',1,'2');

/*Table structure for table `order_table` */

DROP TABLE IF EXISTS `order_table`;

CREATE TABLE `order_table` (
  `order_id` decimal(11,0) NOT NULL,
  `table_no` decimal(11,0) DEFAULT NULL,
  `activity` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `order_table` */

insert  into `order_table`(`order_id`,`table_no`,`activity`) values ('1','10',1),('2','10',1),('3','8',1),('4',NULL,1),('5',NULL,1),('6','44',1),('7','10',1),('8','22',0);

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `order_id` decimal(11,0) NOT NULL,
  `bill_amount` decimal(20,2) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `ModeOfPayment` varchar(10) DEFAULT NULL,
  `PaymentReceived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `FK_payment` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`order_id`,`bill_amount`,`order_date`,`ModeOfPayment`,`PaymentReceived`) values ('8','1175.00','2018-11-13','Card',1);

/*Table structure for table `payment_collector` */

DROP TABLE IF EXISTS `payment_collector`;

CREATE TABLE `payment_collector` (
  `username` varchar(500) NOT NULL,
  `password` varchar(500) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payment_collector` */

insert  into `payment_collector`(`username`,`password`,`name`) values ('pC1305','ad','Anmol');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
