/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 5.6.51 : Database - farmadb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`farmadb` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;

USE `farmadb`;

/*Table structure for table `CATEGORIA` */

DROP TABLE IF EXISTS `CATEGORIA`;

CREATE TABLE `CATEGORIA` (
  `Cat_id` int(11) NOT NULL,
  `Nom_cat` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `Fam_id` int(11) NOT NULL,
  PRIMARY KEY (`Cat_id`),
  KEY `Fam_id` (`Fam_id`),
  CONSTRAINT `CATEGORIA_ibfk_1` FOREIGN KEY (`Fam_id`) REFERENCES `FAMILIA` (`Fam_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `CATEGORIA` */

insert  into `CATEGORIA`(`Cat_id`,`Nom_cat`,`Fam_id`) values 
(1,'Tableta',1),
(2,'Polvo para Solución Inyectable',2),
(3,'Solución para Perfusión',2),
(4,'Concentrado para Solución para Perfusión',2),
(5,'Suspensión Inyectable',2),
(6,'Tableta Recubierta',1),
(7,'Suspensión Oral',3),
(8,'Comprimido',1);

/*Table structure for table `CLIENTE` */

DROP TABLE IF EXISTS `CLIENTE`;

CREATE TABLE `CLIENTE` (
  `Cli_id` int(11) NOT NULL,
  `Nom_cli` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Cli_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `CLIENTE` */

insert  into `CLIENTE`(`Cli_id`,`Nom_cli`) values 
(1,'UPeU'),
(2,'San Martín');

/*Table structure for table `FAMILIA` */

DROP TABLE IF EXISTS `FAMILIA`;

CREATE TABLE `FAMILIA` (
  `Fam_id` int(11) NOT NULL,
  `Nom_fam` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Fam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `FAMILIA` */

insert  into `FAMILIA`(`Fam_id`,`Nom_fam`) values 
(1,'TABLETA'),
(2,'INYECTABLE'),
(3,'SUSPENSION');

/*Table structure for table `PEDIDO` */

DROP TABLE IF EXISTS `PEDIDO`;

CREATE TABLE `PEDIDO` (
  `Ped_id` int(11) NOT NULL,
  `Fecha_crea` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Fecha_confirm` timestamp NULL DEFAULT NULL,
  `Fecha_envio` timestamp NULL DEFAULT NULL,
  `Fecha_entrega` timestamp NULL DEFAULT NULL,
  `Fecha_pago` timestamp NULL DEFAULT NULL,
  `Estado` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Cli_id` int(11) NOT NULL,
  `Direccion` varchar(92) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Vend_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Ped_id`),
  KEY `Cli_id` (`Cli_id`),
  KEY `Vend_id` (`Vend_id`),
  CONSTRAINT `PEDIDO_ibfk_1` FOREIGN KEY (`Cli_id`) REFERENCES `CLIENTE` (`Cli_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PEDIDO_ibfk_2` FOREIGN KEY (`Vend_id`) REFERENCES `VENDEDOR` (`Vend_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `PEDIDO` */

insert  into `PEDIDO`(`Ped_id`,`Fecha_crea`,`Fecha_confirm`,`Fecha_envio`,`Fecha_entrega`,`Fecha_pago`,`Estado`,`Cli_id`,`Direccion`,`Vend_id`) values 
(1,'2020-03-08 08:09:00','2020-03-08 09:09:00','2020-03-08 10:09:00','2020-03-09 08:09:00',NULL,'Entregado',1,'Juliaca P#25',1),
(2,'2020-03-08 08:29:00','2020-03-08 10:19:00','2020-03-08 12:19:00','2020-03-09 07:09:00','2020-03-11 18:09:00','Pagado',2,'Juliaca P#26',2);

/*Table structure for table `PEDIDO_DET` */

DROP TABLE IF EXISTS `PEDIDO_DET`;

CREATE TABLE `PEDIDO_DET` (
  `Ped_id` int(11) NOT NULL,
  `Prod_id` int(11) NOT NULL,
  `Cantidad` decimal(9,2) NOT NULL,
  `Prec_compra_un` decimal(9,2) DEFAULT NULL,
  `Prec_venta_un` decimal(9,2) NOT NULL,
  `Total_desc_un` decimal(9,2) DEFAULT NULL,
  `Igv_un` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`Ped_id`,`Prod_id`),
  KEY `Prod_id` (`Prod_id`),
  CONSTRAINT `PEDIDO_DET_ibfk_1` FOREIGN KEY (`Ped_id`) REFERENCES `PEDIDO` (`Ped_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PEDIDO_DET_ibfk_2` FOREIGN KEY (`Prod_id`) REFERENCES `PRODUCTO` (`Prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `PEDIDO_DET` */

insert  into `PEDIDO_DET`(`Ped_id`,`Prod_id`,`Cantidad`,`Prec_compra_un`,`Prec_venta_un`,`Total_desc_un`,`Igv_un`) values 
(1,1,80.00,8.00,15.00,1.00,2.52),
(1,2,60.00,7.00,15.00,0.50,2.61),
(1,3,80.00,9.00,16.00,0.00,2.88),
(2,2,60.00,7.00,15.00,1.00,2.52),
(2,3,50.00,9.00,16.00,0.00,2.88),
(2,4,80.00,6.00,13.00,0.00,2.34);

/*Table structure for table `PRODUCTO` */

DROP TABLE IF EXISTS `PRODUCTO`;

CREATE TABLE `PRODUCTO` (
  `Prod_id` int(11) NOT NULL,
  `Cod_prod` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `Nom_prod` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `Concent` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Presentac` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Fracciones` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Prec_compra` decimal(9,2) DEFAULT NULL,
  `Prec_venta` decimal(9,2) DEFAULT NULL,
  `Cat_id` int(11) NOT NULL,
  PRIMARY KEY (`Prod_id`),
  KEY `Cat_id` (`Cat_id`),
  CONSTRAINT `PRODUCTO_ibfk_1` FOREIGN KEY (`Cat_id`) REFERENCES `CATEGORIA` (`Cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `PRODUCTO` */

insert  into `PRODUCTO`(`Prod_id`,`Cod_prod`,`Nom_prod`,`Concent`,`Presentac`,`Fracciones`,`Prec_compra`,`Prec_venta`,`Cat_id`) values 
(1,'3','A FOLIC','0.5 mg','Caja Envase Blister Tabletas','30',8.00,15.00,1),
(2,'5','AB AMBROMOX','600 mg','Caja Vial','1',7.00,15.00,2),
(3,'6','AB AMBROMOX','1 200 mg','Vial + Accesorios','1',9.00,16.00,2),
(4,'95','ACICLOVIR','200 mg','Caja Envase Blister Tabletas','100',6.00,13.00,1),
(5,'96','ACICLOVIR','400 mg','Caja Envase Blister Tabletas','100',8.00,14.00,1),
(6,'102','ACICLOVIR','200 mg','Caja Envase Blister Tabletas','100',11.00,18.00,1),
(7,'108','ACICLOVIR','800 mg','Caja Envase Blister Tabletas','10',14.00,23.00,1),
(8,'138','ACIDO FOLICO','0.5 mg','Caja Envase Blister Tabletas','30',1.00,6.00,1),
(9,'151','ACLASTA','5 mg/100 mL','Frasco X 100 mL','1',19.00,31.00,3),
(10,'165','ACTEMRA','80 mg/4 mL','Caja Vial X 4 mL','1',41.00,59.00,4),
(11,'166','ACTEMRA','200 mg/10 mL','Caja Vial x 10 mL','1',19.00,27.00,4),
(12,'176','ACTILYSE','50 mg','Vial','1',29.00,41.00,2),
(13,'180','ADACEL','','Caja Frasco X 0.5 mL','1',16.00,25.00,5),
(14,'190','ADAX','400 mg','Caja Envase Blister Tabletas','60',19.00,27.00,6),
(15,'191','ADAX','600 mg','Caja Envase Blister Tabletas','60',24.00,38.00,6),
(16,'193','ADAX FLU','100 mg + 15 mg/5 mL','Frasco X 60 mL','1',8.00,15.00,7),
(17,'194','ADAX FLU FORTE','400 mg + 60 mg','Caja Envase Blister Tabletas','60',11.00,19.00,6),
(18,'195','ADAX FLU FORTE','200 mg + 30 mg/5 mL','Frasco X 60 mL','1',15.00,24.00,7),
(19,'204','ADENEX','5 mg','Caja Envase Blíster Comprimidos','15',6.00,11.00,8),
(20,'205','ADENEX','5 mg','Caja Envase Blíster Comprimidos','30',10.00,17.00,8),
(21,'214','ADONA (AC 17)','30 mg','Caja Envase Blister Tabletas','10',17.00,26.00,1),
(22,'228','AERO OM SABOR ANIS','100 mg/mL','Frasco X 15 mL','1',13.00,21.00,7);

/*Table structure for table `VENDEDOR` */

DROP TABLE IF EXISTS `VENDEDOR`;

CREATE TABLE `VENDEDOR` (
  `Vend_id` int(11) NOT NULL,
  `Nom_vend` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Vend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `VENDEDOR` */

insert  into `VENDEDOR`(`Vend_id`,`Nom_vend`) values 
(1,'Angel Sullon'),
(2,'Carlos');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
