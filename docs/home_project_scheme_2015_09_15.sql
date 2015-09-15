--
-- Table structure for table `oc_project`
--

CREATE TABLE IF NOT EXISTS `oc_project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `project_amount` decimal(15,4) NOT NULL,
  `project_status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

CREATE TABLE IF NOT EXISTS `oc_project_workload` (
  `project_workload_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `project_workload` decimal(15,4) NOT NULL,
  `project_remark` text NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`project_workload_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_project_description`
--

CREATE TABLE IF NOT EXISTS `oc_project_description` (
  `project_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `project_type` varchar(255) NOT NULL,
  `project_source` varchar(255) NOT NULL,
  `project_remark` text NOT NULL,
  PRIMARY KEY (`project_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_project_to_customer`
--

CREATE TABLE IF NOT EXISTS `oc_project_to_customer` (
  `project_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
