/*
Navicat MySQL Data Transfer

Source Server         : capstone
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : capstone

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-11-10 12:48:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product` int(10) unsigned NOT NULL DEFAULT 0,
  `quantity` smallint(5) unsigned NOT NULL DEFAULT 1,
  `user` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('34', '100', '1', '15');
INSERT INTO `cart` VALUES ('35', '100', '1', '15');
INSERT INTO `cart` VALUES ('36', '100', '1', '15');
INSERT INTO `cart` VALUES ('37', '100', '1', '15');
INSERT INTO `cart` VALUES ('40', '3', '1', '15');
INSERT INTO `cart` VALUES ('41', '3', '1', '15');
INSERT INTO `cart` VALUES ('42', '3', '1', '15');
INSERT INTO `cart` VALUES ('43', '3', '1', '15');
INSERT INTO `cart` VALUES ('44', '10', '1', '15');
INSERT INTO `cart` VALUES ('45', '10', '1', '15');
INSERT INTO `cart` VALUES ('46', '15', '1', '15');
INSERT INTO `cart` VALUES ('47', '15', '1', '15');
INSERT INTO `cart` VALUES ('48', '1', '1', '15');
INSERT INTO `cart` VALUES ('49', '1', '1', '15');
INSERT INTO `cart` VALUES ('55', '100', '1', '1');
INSERT INTO `cart` VALUES ('56', '100', '1', '1');
INSERT INTO `cart` VALUES ('57', '100', '1', '1');
INSERT INTO `cart` VALUES ('58', '86', '1', '1');
INSERT INTO `cart` VALUES ('66', '6', '1', '17');
INSERT INTO `cart` VALUES ('67', '2', '1', '17');

-- ----------------------------
-- Table structure for classification
-- ----------------------------
DROP TABLE IF EXISTS `classification`;
CREATE TABLE `classification` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of classification
-- ----------------------------
INSERT INTO `classification` VALUES ('21', 'CCTV');
INSERT INTO `classification` VALUES ('26', 'Fiber Optics');
INSERT INTO `classification` VALUES ('27', 'Solar Panel -edit');
INSERT INTO `classification` VALUES ('28', 'class 4 -edit');

-- ----------------------------
-- Table structure for docnumber
-- ----------------------------
DROP TABLE IF EXISTS `docnumber`;
CREATE TABLE `docnumber` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `num` int(50) unsigned DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docnumber
-- ----------------------------
INSERT INTO `docnumber` VALUES ('1', 'order', '1');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `customer` smallint(5) unsigned NOT NULL DEFAULT 0,
  `date` datetime NOT NULL,
  `ordertotal` decimal(10,2) unsigned DEFAULT 0.00,
  `docnumber` int(50) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `sukli` decimal(10,2) unsigned DEFAULT 0.00,
  `amounttendered` decimal(10,2) unsigned DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_docnumber_on_order` (`docnumber`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '0', '2020-09-26 11:38:05', '510.90', '79', '1', '0.00', '510.90');
INSERT INTO `order` VALUES ('2', '0', '2020-09-27 11:38:34', '68.00', '80', '1', '432.00', '500.00');
INSERT INTO `order` VALUES ('3', '0', '2020-10-05 11:38:13', '1668.00', '81', '1', '0.00', '1668.00');
INSERT INTO `order` VALUES ('4', '0', '2020-10-05 11:47:56', '90.00', '82', '1', '0.00', '90.00');
INSERT INTO `order` VALUES ('5', '0', '2020-10-05 11:54:37', '18.50', '83', '1', '0.00', '18.50');
INSERT INTO `order` VALUES ('6', '0', '2020-10-05 11:57:05', '1688.00', '84', '1', '0.00', '1688.00');
INSERT INTO `order` VALUES ('7', '0', '2020-10-05 11:58:13', '50.00', '85', '1', '0.00', '50.00');
INSERT INTO `order` VALUES ('8', '0', '2020-10-05 12:00:19', '20.00', '86', '1', '0.00', '20.00');
INSERT INTO `order` VALUES ('9', '0', '2020-10-05 12:03:23', '18.00', '87', '1', '0.00', '18.00');
INSERT INTO `order` VALUES ('10', '0', '2020-10-05 12:05:08', '56.50', '88', '1', '0.00', '56.50');
INSERT INTO `order` VALUES ('11', '0', '2020-10-05 12:06:03', '90.00', '89', '1', '0.00', '90.00');
INSERT INTO `order` VALUES ('12', '0', '2020-10-05 12:07:08', '2390.50', '90', '1', '0.00', '2390.50');
INSERT INTO `order` VALUES ('13', '0', '2020-10-05 12:07:46', '50.00', '91', '1', '450.00', '500.00');
INSERT INTO `order` VALUES ('14', '0', '2020-10-05 12:15:54', '18.50', '92', '1', '193.50', '212.00');
INSERT INTO `order` VALUES ('15', '0', '2020-10-05 12:20:56', '0.00', '93', '1', '500.00', '500.00');
INSERT INTO `order` VALUES ('16', '0', '2020-10-05 12:25:22', '18.50', '94', '1', '0.00', '18.50');
INSERT INTO `order` VALUES ('17', '0', '2020-10-05 12:28:10', '500.00', '95', '1', '0.00', '500.00');
INSERT INTO `order` VALUES ('18', '0', '2020-10-05 12:28:58', '500.00', '96', '1', '0.00', '500.00');
INSERT INTO `order` VALUES ('19', '0', '2020-10-05 12:37:03', '450.00', '97', '1', '50.00', '500.00');
INSERT INTO `order` VALUES ('20', '0', '2020-10-05 12:57:14', '576.00', '98', '1', '0.00', '576.00');
INSERT INTO `order` VALUES ('21', '0', '2020-10-05 12:59:22', '10.80', '99', '1', '0.00', '10.80');
INSERT INTO `order` VALUES ('22', '0', '2020-10-05 13:03:54', '1170.00', '100', '1', '0.00', '1170.00');
INSERT INTO `order` VALUES ('23', '0', '2020-10-05 13:04:27', '0.00', '101', '1', '82.00', '82.00');
INSERT INTO `order` VALUES ('24', '0', '2020-10-05 13:08:11', '18.50', '102', '1', '1.50', '20.00');
INSERT INTO `order` VALUES ('25', '0', '2020-10-05 13:10:02', '18.50', '103', '1', '81.50', '100.00');
INSERT INTO `order` VALUES ('31', '0', '2020-10-05 13:53:08', '136134.00', '109', '1', '0.00', '136134.00');
INSERT INTO `order` VALUES ('41', '0', '2020-10-16 11:15:49', '1.00', '119', '1', '0.00', '1.00');
INSERT INTO `order` VALUES ('42', '0', '2020-10-16 11:32:19', '5368.00', '120', '1', '0.00', '5368.00');
INSERT INTO `order` VALUES ('43', '0', '2020-10-16 11:33:35', '75190.00', '121', '1', '4810.00', '80000.00');
INSERT INTO `order` VALUES ('44', '0', '2020-10-16 12:04:51', '3440.00', '122', '1', '0.00', '3440.00');
INSERT INTO `order` VALUES ('45', '0', '2020-10-16 19:02:09', '1650.00', '123', '1', '0.00', '1650.00');
INSERT INTO `order` VALUES ('46', '0', '2020-10-16 19:41:47', '1038.00', '124', '1', '0.00', '1038.00');
INSERT INTO `order` VALUES ('47', '0', '2020-10-20 11:21:35', '1161.00', '125', '1', '0.00', '1161.00');
INSERT INTO `order` VALUES ('48', '0', '2020-10-20 11:21:40', '0.00', '126', '0', '0.00', '0.00');

-- ----------------------------
-- Table structure for orderdet
-- ----------------------------
DROP TABLE IF EXISTS `orderdet`;
CREATE TABLE `orderdet` (
  `id` int(70) unsigned NOT NULL AUTO_INCREMENT,
  `ordernumber` int(50) unsigned NOT NULL,
  `product` int(40) unsigned NOT NULL,
  `price` decimal(10,2) unsigned DEFAULT 0.00,
  `qty` smallint(5) unsigned DEFAULT NULL,
  `total` decimal(10,2) unsigned DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orderdet
-- ----------------------------
INSERT INTO `orderdet` VALUES ('3', '1', '210', '500.00', '1', '500.00');
INSERT INTO `orderdet` VALUES ('4', '1', '213', '10.90', '1', '10.90');
INSERT INTO `orderdet` VALUES ('11', '2', '139', '80.00', '100', '8000.00');
INSERT INTO `orderdet` VALUES ('12', '3', '17', '1150.00', '1', '1150.00');
INSERT INTO `orderdet` VALUES ('13', '3', '20', '500.00', '1', '500.00');
INSERT INTO `orderdet` VALUES ('14', '3', '23', '18.00', '1', '18.00');
INSERT INTO `orderdet` VALUES ('16', '4', '78', '20.00', '2', '40.00');
INSERT INTO `orderdet` VALUES ('17', '4', '79', '50.00', '1', '50.00');
INSERT INTO `orderdet` VALUES ('18', '5', '22', '18.50', '1', '18.50');
INSERT INTO `orderdet` VALUES ('19', '6', '19', '500.00', '1', '500.00');
INSERT INTO `orderdet` VALUES ('20', '6', '21', '38.00', '1', '38.00');
INSERT INTO `orderdet` VALUES ('21', '6', '16', '1150.00', '1', '1150.00');
INSERT INTO `orderdet` VALUES ('22', '7', '19', '50.00', '1', '50.00');
INSERT INTO `orderdet` VALUES ('23', '8', '78', '20.00', '1', '20.00');
INSERT INTO `orderdet` VALUES ('24', '9', '23', '18.00', '1', '18.00');
INSERT INTO `orderdet` VALUES ('25', '10', '21', '38.00', '1', '38.00');
INSERT INTO `orderdet` VALUES ('26', '10', '22', '18.50', '1', '18.50');
INSERT INTO `orderdet` VALUES ('27', '11', '86', '50.00', '1', '50.00');
INSERT INTO `orderdet` VALUES ('28', '11', '20', '20.00', '2', '40.00');
INSERT INTO `orderdet` VALUES ('29', '12', '17', '1150.00', '1', '1150.00');
INSERT INTO `orderdet` VALUES ('30', '12', '22', '18.50', '1', '18.50');
INSERT INTO `orderdet` VALUES ('31', '12', '16', '1150.00', '1', '1150.00');
INSERT INTO `orderdet` VALUES ('32', '12', '1281', '22.00', '1', '22.00');
INSERT INTO `orderdet` VALUES ('33', '12', '19', '50.00', '1', '50.00');
INSERT INTO `orderdet` VALUES ('34', '13', '20', '50.00', '1', '50.00');
INSERT INTO `orderdet` VALUES ('35', '14', '20', '0.00', '1', '0.00');
INSERT INTO `orderdet` VALUES ('36', '14', '22', '18.50', '1', '18.50');
INSERT INTO `orderdet` VALUES ('37', '16', '22', '18.50', '1', '18.50');
INSERT INTO `orderdet` VALUES ('38', '17', '20', '500.00', '1', '500.00');
INSERT INTO `orderdet` VALUES ('39', '18', '13', '500.00', '1', '500.00');
INSERT INTO `orderdet` VALUES ('40', '19', '79', '450.00', '1', '450.00');
INSERT INTO `orderdet` VALUES ('41', '20', '19', '500.00', '1', '500.00');
INSERT INTO `orderdet` VALUES ('42', '20', '21', '38.00', '2', '76.00');
INSERT INTO `orderdet` VALUES ('43', '21', '91', '10.80', '1', '10.80');
INSERT INTO `orderdet` VALUES ('44', '22', '14', '1170.00', '1', '1170.00');
INSERT INTO `orderdet` VALUES ('45', '24', '22', '18.50', '1', '18.50');
INSERT INTO `orderdet` VALUES ('46', '25', '22', '18.50', '1', '18.50');
INSERT INTO `orderdet` VALUES ('47', '26', '22', '18.50', '1', '18.50');
INSERT INTO `orderdet` VALUES ('48', '27', '19', '100.00', '4', '400.00');
INSERT INTO `orderdet` VALUES ('49', '27', '916', '84.00', '1', '84.00');
INSERT INTO `orderdet` VALUES ('50', '27', '22', '18.50', '1', '18.50');
INSERT INTO `orderdet` VALUES ('51', '27', '20', '600.00', '2', '1200.00');
INSERT INTO `orderdet` VALUES ('52', '27', '16', '1150.00', '1', '1150.00');
INSERT INTO `orderdet` VALUES ('53', '27', '76', '55.00', '1', '55.00');
INSERT INTO `orderdet` VALUES ('54', '27', '831', '36.00', '1', '36.00');
INSERT INTO `orderdet` VALUES ('55', '27', '147', '95.00', '1', '95.00');
INSERT INTO `orderdet` VALUES ('56', '27', '1281', '22.00', '1', '22.00');
INSERT INTO `orderdet` VALUES ('57', '28', '20', '0.00', '1', '0.00');
INSERT INTO `orderdet` VALUES ('58', '31', '20', '500.00', '250', '125000.00');
INSERT INTO `orderdet` VALUES ('59', '31', '17', '1150.00', '1', '1150.00');
INSERT INTO `orderdet` VALUES ('60', '31', '19', '500.00', '1', '500.00');
INSERT INTO `orderdet` VALUES ('61', '31', '23', '18.00', '1', '18.00');
INSERT INTO `orderdet` VALUES ('62', '31', '964', '810.00', '3', '2430.00');
INSERT INTO `orderdet` VALUES ('63', '31', '1381', '6.00', '3', '18.00');
INSERT INTO `orderdet` VALUES ('64', '31', '1401', '50.00', '1', '50.00');
INSERT INTO `orderdet` VALUES ('65', '31', '831', '500.00', '2', '1000.00');
INSERT INTO `orderdet` VALUES ('66', '31', '954', '600.00', '2', '1200.00');
INSERT INTO `orderdet` VALUES ('67', '31', '76', '55.00', '1', '55.00');
INSERT INTO `orderdet` VALUES ('68', '31', '1382', '300.00', '1', '300.00');
INSERT INTO `orderdet` VALUES ('69', '31', '26', '200.00', '1', '200.00');
INSERT INTO `orderdet` VALUES ('70', '31', '49', '27.00', '1', '27.00');
INSERT INTO `orderdet` VALUES ('71', '31', '10', '20.00', '1', '20.00');
INSERT INTO `orderdet` VALUES ('72', '31', '119', '500.00', '2', '1000.00');
INSERT INTO `orderdet` VALUES ('73', '31', '89', '500.00', '1', '500.00');
INSERT INTO `orderdet` VALUES ('74', '31', '70', '50.00', '2', '100.00');
INSERT INTO `orderdet` VALUES ('75', '31', '69', '25.00', '4', '100.00');
INSERT INTO `orderdet` VALUES ('76', '31', '47', '60.00', '2', '120.00');
INSERT INTO `orderdet` VALUES ('77', '31', '142', '107.00', '21', '2247.00');
INSERT INTO `orderdet` VALUES ('78', '31', '4', '99.00', '1', '99.00');
INSERT INTO `orderdet` VALUES ('79', '32', '19', '0.00', '1', '0.00');
INSERT INTO `orderdet` VALUES ('80', '37', '22', '18.50', '1', '18.50');
INSERT INTO `orderdet` VALUES ('81', '39', '135', '0.00', '1', '0.00');
INSERT INTO `orderdet` VALUES ('82', '39', '69', '0.00', '1', '0.00');
INSERT INTO `orderdet` VALUES ('86', '41', '19', '1.00', '1', '1.00');
INSERT INTO `orderdet` VALUES ('87', '42', '14', '1170.00', '3', '3510.00');
INSERT INTO `orderdet` VALUES ('88', '42', '1', '91.00', '6', '546.00');
INSERT INTO `orderdet` VALUES ('89', '42', '16', '1150.00', '1', '1150.00');
INSERT INTO `orderdet` VALUES ('90', '42', '36', '162.00', '1', '162.00');
INSERT INTO `orderdet` VALUES ('91', '43', '1', '91.00', '1', '91.00');
INSERT INTO `orderdet` VALUES ('92', '43', '4', '99.00', '1', '99.00');
INSERT INTO `orderdet` VALUES ('93', '43', '19', '500.00', '150', '75000.00');
INSERT INTO `orderdet` VALUES ('94', '44', '14', '1170.00', '2', '2340.00');
INSERT INTO `orderdet` VALUES ('95', '44', '19', '500.00', '1', '500.00');
INSERT INTO `orderdet` VALUES ('96', '44', '20', '600.00', '1', '600.00');
INSERT INTO `orderdet` VALUES ('97', '45', '16', '1150.00', '1', '1150.00');
INSERT INTO `orderdet` VALUES ('98', '45', '20', '500.00', '1', '500.00');
INSERT INTO `orderdet` VALUES ('99', '46', '19', '500.00', '2', '1000.00');
INSERT INTO `orderdet` VALUES ('100', '46', '21', '38.00', '1', '38.00');
INSERT INTO `orderdet` VALUES ('101', '47', '19', '500.00', '1', '500.00');
INSERT INTO `orderdet` VALUES ('102', '47', '20', '600.00', '1', '600.00');
INSERT INTO `orderdet` VALUES ('103', '47', '21', '38.00', '1', '38.00');
INSERT INTO `orderdet` VALUES ('104', '47', '23', '18.00', '1', '18.00');
INSERT INTO `orderdet` VALUES ('105', '47', '114', '5.00', '1', '5.00');
INSERT INTO `orderdet` VALUES ('106', '48', '57', '18.50', '1', '18.50');
INSERT INTO `orderdet` VALUES ('107', '48', '79', '0.00', '1', '0.00');
INSERT INTO `orderdet` VALUES ('108', '48', '37', '0.00', '1', '0.00');
INSERT INTO `orderdet` VALUES ('109', '48', '20', '0.00', '1', '0.00');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `classification` smallint(3) unsigned DEFAULT 0,
  `description` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) unsigned DEFAULT NULL,
  `sale` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `pix` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=652 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'phone', '21', 'a good phone', '100.00', '1', '41-414679_solar-panel-png-solar-power-system-logo2.png');
INSERT INTO `products` VALUES ('2', 'kotse', '26', 'walwag nga car', '1.50', '1', '188f54ec8a8df592ee9cd84494e9bb91_medium.jpg');
INSERT INTO `products` VALUES ('3', 'MOTOR', '21', 'GASGAS', '500.00', '1', 'unnamed.jpg');
INSERT INTO `products` VALUES ('6', 'redmi9', '26', 'a good phone', '6300.00', '1', 'unnamed.jpg');
INSERT INTO `products` VALUES ('7', 'huawei cam', '27', 'ukinana', '50000.00', '1', '65c560a6-f44b-470c-8000-4a601557edce1.jpg');
INSERT INTO `products` VALUES ('8', 'cap', '27', 'asfnjada adsdasdas dasksjdkassfikasjfohasfassfasf', '1000000.00', '0', 'ec1fdb83bb49650fd640ed850d14721d.jpg');
INSERT INTO `products` VALUES ('9', '1.5coke 1case', '26', 'safdasdasdasd', '660.00', '1', null);
INSERT INTO `products` VALUES ('10', '1.5royal 1case', '21', 'dasasacassdasdasd', '660.00', '1', null);
INSERT INTO `products` VALUES ('11', '1.5sprte 1case', '27', 'sdfsdfdsfdsfdsf', '660.00', '1', null);
INSERT INTO `products` VALUES ('12', '1bote oil', '26', 'xcgfsdfdsfdsfsdf', '20.00', '1', null);
INSERT INTO `products` VALUES ('13', '1tray egg', '26', 'sdadasd', '500.00', '1', null);
INSERT INTO `products` VALUES ('14', '24/7 40g', '27', '', '15.00', '1', null);
INSERT INTO `products` VALUES ('15', '4x4 gin 1case', '21', '', '1135.00', '1', null);
INSERT INTO `products` VALUES ('16', '555 fsrdns tausi', '26', '', '29.00', '1', null);
INSERT INTO `products` VALUES ('17', '555 srdns chili', '28', '', '29.00', '1', null);
INSERT INTO `products` VALUES ('18', '555 srdns 155g', '26', '', '19.00', '1', null);
INSERT INTO `products` VALUES ('19', '8oclock orange 25g', '28', '', '20.00', '1', null);
INSERT INTO `products` VALUES ('20', '8oclock pnapple 25g', '28', '', '20.00', '1', null);
INSERT INTO `products` VALUES ('21', 'aji 100g', '28', '', '240.00', '1', null);
INSERT INTO `products` VALUES ('22', 'aji 11g', '28', '', '52.00', '1', null);
INSERT INTO `products` VALUES ('23', 'aji 1kg', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('24', 'aji 24g', '0', null, '45.00', '1', null);
INSERT INTO `products` VALUES ('25', 'aji 250g', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('26', 'aji 500g', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('27', 'aji 50g', '0', null, '65.00', '1', null);
INSERT INTO `products` VALUES ('28', 'argntn cbeef 175g', '0', null, '38.00', '1', null);
INSERT INTO `products` VALUES ('29', 'argntn cbeef 150g', '0', null, '36.00', '1', null);
INSERT INTO `products` VALUES ('30', 'argntn cbeef 100g', '0', null, '23.00', '1', null);
INSERT INTO `products` VALUES ('31', 'argntn bfloaf 150g', '0', null, '21.00', '1', null);
INSERT INTO `products` VALUES ('32', 'argntn bfloaf 170g', '0', null, '22.00', '1', null);
INSERT INTO `products` VALUES ('33', 'argntn mloaf 170g', '0', null, '15.00', '1', null);
INSERT INTO `products` VALUES ('34', 'argntn mloaf 100g', '0', null, '15.00', '1', null);
INSERT INTO `products` VALUES ('35', 'argntn tocino 170g', '0', null, '22.00', '1', null);
INSERT INTO `products` VALUES ('36', 'argntn mloaf 150g', '0', null, '20.00', '1', null);
INSERT INTO `products` VALUES ('37', 'ariel dwny 66g', '0', null, '66.00', '1', null);
INSERT INTO `products` VALUES ('38', 'ariel 70g', '0', null, '66.00', '1', null);
INSERT INTO `products` VALUES ('39', 'alaska evap 370ml', '0', null, '28.00', '1', null);
INSERT INTO `products` VALUES ('40', 'alaska evap 140ml', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('41', 'alaska milk 165g', '0', null, '45.00', '1', null);
INSERT INTO `products` VALUES ('42', 'alaska milk 33g', '0', null, '8.00', '1', null);
INSERT INTO `products` VALUES ('43', 'alaska milk 300g', '0', null, '95.00', '1', null);
INSERT INTO `products` VALUES ('44', 'alfonso 1L', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('45', 'angel evap 140ml', '0', null, '28.00', '1', null);
INSERT INTO `products` VALUES ('46', 'angel evap 370ml', '0', null, '27.00', '1', null);
INSERT INTO `products` VALUES ('47', 'angel krmdnsd 410g', '0', null, '60.00', '1', null);
INSERT INTO `products` VALUES ('48', 'angel cndnsd 380g', '0', null, '42.00', '1', null);
INSERT INTO `products` VALUES ('49', 'angel creamer 80g', '0', null, '20.00', '1', null);
INSERT INTO `products` VALUES ('50', 'angel creamer 200g', '0', null, '36.00', '1', null);
INSERT INTO `products` VALUES ('51', 'bdgt bar', '0', null, '18.00', '1', null);
INSERT INTO `products` VALUES ('52', 'bearbrnd 114g', '0', null, '36.00', '1', null);
INSERT INTO `products` VALUES ('53', 'bearbrnd 170g', '0', null, '55.00', '1', null);
INSERT INTO `products` VALUES ('54', 'bearbrnd 150g', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('55', 'bearbrnd 320g', '0', null, '110.00', '1', null);
INSERT INTO `products` VALUES ('56', 'bearbrnd 33g', '0', null, '10.00', '1', null);
INSERT INTO `products` VALUES ('57', 'bearbrnd 99g', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('58', 'bearbrnd 700g', '0', null, '230.00', '1', null);
INSERT INTO `products` VALUES ('59', 'bearbrnd 1.2kg', '0', null, '380.00', '1', null);
INSERT INTO `products` VALUES ('60', 'bearbrnd 900g', '0', null, '280.00', '1', null);
INSERT INTO `products` VALUES ('61', 'bearbrnd adult+ 33g', '0', null, '16.00', '1', null);
INSERT INTO `products` VALUES ('62', 'bearbrnd adult+ 180g', '0', null, '90.00', '1', null);
INSERT INTO `products` VALUES ('63', 'bearbrnd adult+ 300g', '0', null, '135.00', '1', null);
INSERT INTO `products` VALUES ('64', 'bearbrnd adult+ 600', '0', null, '270.00', '1', null);
INSERT INTO `products` VALUES ('65', 'bearbrnd adult+ 1kg', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('66', 'bearbrnd choco 300g', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('67', 'bearbrnd choco 100g', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('68', 'bearbrnd choco 600g', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('69', 'bearbrnd strlize 200ml', '0', null, '25.00', '1', null);
INSERT INTO `products` VALUES ('70', 'beer na beer', '0', null, '630.00', '1', null);
INSERT INTO `products` VALUES ('71', 'brchtree 33g', '0', null, '8.00', '1', null);
INSERT INTO `products` VALUES ('72', 'brchtree 150g', '0', null, '45.00', '1', null);
INSERT INTO `products` VALUES ('73', 'brchtree 300g', '0', null, '90.00', '1', null);
INSERT INTO `products` VALUES ('74', 'breadstx 20g', '0', null, '52.00', '1', null);
INSERT INTO `products` VALUES ('75', 'bingo bfloaf 100g', '0', null, '14.00', '1', null);
INSERT INTO `products` VALUES ('76', 'bingo bfloaf 150g', '0', null, '20.00', '1', null);
INSERT INTO `products` VALUES ('77', 'bingo cbeef 100g', '0', null, '14.00', '1', null);
INSERT INTO `products` VALUES ('78', 'bingo cbeef 150g', '0', null, '20.00', '1', null);
INSERT INTO `products` VALUES ('79', 'bilog 1case', '0', null, '1152.00', '1', 'HIKvision-CCTV-Dubai-UAE-1024x246.jpg');
INSERT INTO `products` VALUES ('80', 'bilog', '0', null, '55.00', '1', null);
INSERT INTO `products` VALUES ('81', 'bigor 350ml', '0', null, '40.00', '1', null);
INSERT INTO `products` VALUES ('82', 'brwnsugar 1/4', '0', null, '12.00', '1', null);
INSERT INTO `products` VALUES ('83', 'brwnsugar 1kg', '0', null, '45.00', '1', null);
INSERT INTO `products` VALUES ('84', 'bsugar 1sack', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('85', 'butterkist 210g', '0', null, '35.00', '1', null);
INSERT INTO `products` VALUES ('86', 'cracker juan', '0', null, '6.00', '1', 'unnamed.jpg');
INSERT INTO `products` VALUES ('87', 'creamy choco sndwich', '0', null, '52.00', '1', null);
INSERT INTO `products` VALUES ('88', 'ctuna f-oil 180g', '0', null, '38.00', '1', null);
INSERT INTO `products` VALUES ('89', 'ctuna v-oil 180g', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('90', 'ctuna f-oil 155g', '0', null, '33.00', '1', null);
INSERT INTO `products` VALUES ('91', 'ctuna v-oil 155g', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('92', 'ctuna 155g', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('93', 'c2solo 1case', '0', null, '250.00', '1', null);
INSERT INTO `products` VALUES ('94', 'candle 10x10', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('95', 'candle 19x4', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('96', 'candle 2x6', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('97', 'candle 3x20', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('98', 'candle 5x20', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('99', 'candle 6x20', '0', null, '0.00', '1', null);
INSERT INTO `products` VALUES ('100', 'ccomama gata 400ml', '0', null, '65.00', '1', 'jplogo.png');

-- ----------------------------
-- Table structure for sample_data
-- ----------------------------
DROP TABLE IF EXISTS `sample_data`;
CREATE TABLE `sample_data` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sample_data
-- ----------------------------
INSERT INTO `sample_data` VALUES ('3', 'Tiny', 'Marry', '19', 'female');
INSERT INTO `sample_data` VALUES ('4', 'Dolores', 'Brooks', '29', 'female');
INSERT INTO `sample_data` VALUES ('5', 'Cindy', 'Dahl', '24', 'female');
INSERT INTO `sample_data` VALUES ('6', 'George', 'Fagan', '30', 'male');
INSERT INTO `sample_data` VALUES ('7', 'Chelsea', 'Mendoza', '18', 'female');
INSERT INTO `sample_data` VALUES ('8', 'Wayne', 'Hodges', '27', 'male');
INSERT INTO `sample_data` VALUES ('9', 'Keith', 'Watkin', '26', 'male');
INSERT INTO `sample_data` VALUES ('10', 'Eric', 'Smith', '31', 'male');
INSERT INTO `sample_data` VALUES ('11', 'Robert', 'Owens', '42', 'male');
INSERT INTO `sample_data` VALUES ('12', 'Candace', 'Hand', '27', 'female');
INSERT INTO `sample_data` VALUES ('13', 'Hortencia', 'Bell', '30', 'female');
INSERT INTO `sample_data` VALUES ('14', 'William', 'Sosa', '36', 'male');
INSERT INTO `sample_data` VALUES ('15', 'Patricia', 'Davis', '23', 'female');
INSERT INTO `sample_data` VALUES ('17', 'Nancy', 'Sedlacek', '21', 'female');
INSERT INTO `sample_data` VALUES ('18', 'puta', 'sya', '1', 'male');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` smallint(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` smallint(20) unsigned NOT NULL,
  `accesslevel` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'test', 'test', 'sad', 'sad', '', '0', '1');
INSERT INTO `users` VALUES ('2', 'tre', 'tre', 'ert', 'ret', '', '0', '1');
INSERT INTO `users` VALUES ('3', 'asdsad', 'ad', 'sadsad', 'dsad', '', '0', '1');
INSERT INTO `users` VALUES ('4', 'rwe', 'werwer', 'erwwe', 'rwer', '', '0', '1');
INSERT INTO `users` VALUES ('5', 'rwer', 'rwerwerew', 'rewrew', 'rewr', '', '0', '1');
INSERT INTO `users` VALUES ('6', 'wqeqw', 'weqwqewqewq', 'ewqewq', 'ewqew', '', '0', '1');
INSERT INTO `users` VALUES ('7', 'das', 'sadasdasdas', 'da', 'dsad', '', '0', '1');
INSERT INTO `users` VALUES ('8', 'eqw', 'asd', 'asdasss', 'dddddddd', '', '0', '1');
INSERT INTO `users` VALUES ('9', 'asdas', 'asd', 'w', 'ew', '', '0', '1');
INSERT INTO `users` VALUES ('10', 'admin', 'qwekqwek123', 'jo', 'jo', '', '0', '1');
INSERT INTO `users` VALUES ('11', 'V', 'V', 'V', 'V', '', '0', '1');
INSERT INTO `users` VALUES ('12', 'andrew', 'qwekqwek', 'eqwe', 'wqeqw', '', '0', '1');
INSERT INTO `users` VALUES ('13', 'windowsjp13', 'qwekqwek', 'john patrick', 'pasion', '', '0', '1');
INSERT INTO `users` VALUES ('14', 'test1', 'test', 'ewqw', 'qweq', '', '0', '1');
INSERT INTO `users` VALUES ('15', 'admin', 'admin', 'admin', 'admin', '', '0', '2');
INSERT INTO `users` VALUES ('17', 'ako', 'ako', 'ako', 'ako', '', '0', '1');

-- ----------------------------
-- Procedure structure for addToCart
-- ----------------------------
DROP PROCEDURE IF EXISTS `addToCart`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addToCart`(pproduct int,puser int)
BEGIN
	INSERT into cart
	(product,user) VALUES
	(pproduct,puser);

	SELECT ROW_COUNT() as res;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for checkoutOrder
-- ----------------------------
DROP PROCEDURE IF EXISTS `checkoutOrder`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkoutOrder`(pordertotal decimal(10,2), psukli decimal(10,2), pamounttendered decimal(10,2))
BEGIN
	DECLARE x, orderid int;

	set orderid=createOrder();

	update `order` set date=now(), ordertotal=pordertotal, sukli=psukli, amounttendered=pamounttendered, `status`=1 where id=orderid;
	SELECT ROW_COUNT() as res;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for checkPreviousOrder
-- ----------------------------
DROP PROCEDURE IF EXISTS `checkPreviousOrder`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkPreviousOrder`(puser int)
BEGIN
	DECLARE x int;
	DECLARE orderid int;

	SELECT id into orderid from `order` where user=puser ORDER BY id desc limit 0,1;
	SELECT status into x from `order` ORDER BY id desc limit 0,1;
	
	SELECT x as res, orderid;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for editProductOrder
-- ----------------------------
DROP PROCEDURE IF EXISTS `editProductOrder`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editProductOrder`(pid int,pprice decimal(20,2),pqty int,ptotal decimal(20,2))
BEGIN
	update orderdet SET
		qty=pqty,
		price=pprice,
		total=ptotal
	WHERE id=pid;

	SELECT ROW_COUNT() as res;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for voidOrder
-- ----------------------------
DROP PROCEDURE IF EXISTS `voidOrder`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `voidOrder`(pordernumber int)
BEGIN
	delete from orderdet
	WHERE ordernumber=pordernumber;

	SELECT ROW_COUNT() as res;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for createOrder
-- ----------------------------
DROP FUNCTION IF EXISTS `createOrder`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `createOrder`() RETURNS decimal(10,2)
BEGIN
	DECLARE x int;

	SELECT num into x from docnumber where id=1;

	INSERT INTO `order`
	(date,docnumber) VALUES
	(NOW(),x);
	
	update docnumber set num=num+1 where id=1;
			
	RETURN (SELECT LAST_INSERT_ID());
END
;;
DELIMITER ;
