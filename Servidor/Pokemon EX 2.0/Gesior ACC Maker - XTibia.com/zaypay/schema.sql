DROP TABLE IF EXISTS `zaypay_payment`;

CREATE TABLE `zaypay_payment` (

  `payID` bigint(30) NOT NULL,

  `account_id` int(20) NOT NULL,

  `status` varchar(255) NOT NULL,

  PRIMARY KEY  (`payID`)

) ENGINE=MyISAM DEFAULT CHARSET=latin1;
