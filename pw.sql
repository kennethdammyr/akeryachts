-- phpMyAdmin SQL Dump
-- version 4.0.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 30, 2014 at 12:21 PM
-- Server version: 5.5.33
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `pw`
--

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`) VALUES
(2, 'admin'),
(3, 'user'),
(4, 'role'),
(5, 'permission'),
(1, 'home'),
(88, 'sitemap'),
(83, 'basic-page'),
(80, 'search'),
(99, 'meglere'),
(98, 'megler'),
(100, 'tjenester'),
(102, 'Sitater'),
(104, 'kontakt');

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups_fields`
--

CREATE TABLE `fieldgroups_fields` (
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fields_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`fieldgroups_id`,`fields_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldgroups_fields`
--

INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES
(2, 2, 1, NULL),
(2, 1, 0, NULL),
(3, 3, 0, NULL),
(3, 4, 2, NULL),
(4, 5, 0, NULL),
(5, 1, 0, NULL),
(3, 92, 1, NULL),
(1, 76, 3, NULL),
(1, 1, 0, NULL),
(80, 1, 0, NULL),
(83, 1, 0, NULL),
(83, 44, 5, NULL),
(83, 76, 3, NULL),
(83, 82, 4, NULL),
(1, 78, 1, NULL),
(83, 78, 1, NULL),
(83, 79, 2, NULL),
(88, 79, 1, NULL),
(1, 79, 2, NULL),
(88, 1, 0, NULL),
(98, 99, 5, NULL),
(99, 1, 0, NULL),
(102, 103, 1, NULL),
(100, 1, 0, NULL),
(100, 101, 1, NULL),
(100, 102, 2, NULL),
(102, 1, 0, '{"collapsed":4,"required":""}'),
(98, 92, 3, NULL),
(98, 97, 4, NULL),
(98, 100, 1, NULL),
(98, 98, 2, NULL),
(98, 1, 0, NULL),
(98, 105, 6, NULL),
(1, 82, 4, NULL),
(1, 44, 5, NULL),
(104, 107, 2, NULL),
(104, 106, 1, NULL),
(104, 1, 0, NULL),
(104, 92, 3, NULL),
(104, 97, 4, NULL),
(102, 104, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) CHARACTER SET ascii NOT NULL,
  `name` varchar(255) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=108 ;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES
(1, 'FieldtypePageTitle', 'title', 13, 'Title', '{"required":1,"textformatters":["TextformatterEntities"],"size":0,"maxlength":255}'),
(2, 'FieldtypeModule', 'process', 25, 'Process', '{"description":"The process that is executed on this page. Since this is mostly used by ProcessWire internally, it is recommended that you don''t change the value of this unless adding your own pages in the admin.","collapsed":1,"required":1,"moduleTypes":["Process"],"permanent":1}'),
(3, 'FieldtypePassword', 'pass', 24, 'Set Password', '{"collapsed":1,"size":50,"maxlength":128}'),
(5, 'FieldtypePage', 'permissions', 24, 'Permissions', '{"derefAsPage":0,"parent_id":31,"labelFieldName":"title","inputfield":"InputfieldCheckboxes"}'),
(4, 'FieldtypePage', 'roles', 24, 'Roles', '{"derefAsPage":0,"parent_id":30,"labelFieldName":"name","inputfield":"InputfieldCheckboxes","description":"User will inherit the permissions assigned to each role. You may assign multiple roles to a user. When accessing a page, the user will only inherit permissions from the roles that are also assigned to the page''s template."}'),
(92, 'FieldtypeEmail', 'email', 9, 'E-Mail Address', '{"size":70,"maxlength":255}'),
(82, 'FieldtypeTextarea', 'sidebar', 0, 'Sidebar', '{"inputfieldClass":"InputfieldTinyMCE","rows":5,"theme_advanced_buttons1":"formatselect,styleselect|,bold,italic,|,bullist,numlist,|,link,unlink,|,image,|,code,|,fullscreen","theme_advanced_blockformats":"p,h2,h3,h4,blockquote,pre,code","plugins":"inlinepopups,safari,table,media,paste,fullscreen,preelementfix","valid_elements":"@[id|class],a[href|target|name],strong\\/b,em\\/i,br,img[src|id|class|width|height|alt],ul,ol,li,p[class],h2,h3,h4,blockquote,-p,-table[border=0|cellspacing|cellpadding|width|frame|rules|height|align|summary|bgcolor|background|bordercolor],-tr[rowspan|width|height|align|valign|bgcolor|background|bordercolor],tbody,thead,tfoot,#td[colspan|rowspan|width|height|align|valign|bgcolor|background|bordercolor|scope],#th[colspan|rowspan|width|height|align|valign|scope],pre,code"}'),
(44, 'FieldtypeImage', 'image', 0, 'Bilde', '{"extensions":"gif jpg jpeg png","entityEncode":1,"adminThumbs":1,"inputfieldClass":"InputfieldImage","maxFiles":1,"descriptionRows":1,"fileSchema":2,"defaultGrid":0}'),
(79, 'FieldtypeTextarea', 'summary', 1, 'Summary', '{"textformatters":["TextformatterEntities"],"inputfieldClass":"InputfieldTextarea","collapsed":2,"rows":3}'),
(76, 'FieldtypeTextarea', 'body', 0, 'Body', '{"inputfieldClass":"InputfieldTinyMCE","collapsed":0,"rows":10,"theme_advanced_buttons1":"formatselect,|,bold,italic,|,bullist,numlist,|,link,unlink,|,image,|,code,|,fullscreen","theme_advanced_blockformats":"p,h2,h3,h4,blockquote,pre","plugins":"inlinepopups,safari,media,paste,fullscreen","valid_elements":"@[id|class],a[href|target|name],strong\\/b,em\\/i,br,img[src|id|class|width|height|alt],ul,ol,li,p[class],h2,h3,h4,blockquote,-p,-table[border=0|cellspacing|cellpadding|width|frame|rules|height|align|summary|bgcolor|background|bordercolor],-tr[rowspan|width|height|align|valign|bgcolor|background|bordercolor],tbody,thead,tfoot,#td[colspan|rowspan|width|height|align|valign|bgcolor|background|bordercolor|scope],#th[colspan|rowspan|width|height|align|valign|scope],code,pre"}'),
(78, 'FieldtypeText', 'headline', 0, 'Headline', '{"description":"Use this instead of the Title if a longer headline is needed than what you want to appear in navigation.","textformatters":["TextformatterEntities"],"collapsed":2,"size":0,"maxlength":1024}'),
(97, 'FieldtypeInteger', 'tlf', 0, 'Telefon', ''),
(98, 'FieldtypeText', 'stilling', 0, 'Stilling', ''),
(99, 'FieldtypeTextarea', 'CV', 0, 'CV', ''),
(100, 'FieldtypeText', 'navn', 0, 'Navn', '{"size":0,"maxlength":2048}'),
(101, 'FieldtypeImage', 'ikon', 0, 'Ikon', '{"extensions":"gif jpg jpeg png","maxFiles":1,"inputfieldClass":"InputfieldImage","descriptionRows":1,"adminThumbs":1,"defaultGrid":0,"maxHeight":93,"fileSchema":2,"entityEncode":1}'),
(102, 'FieldtypeTextarea', 'beskrivelse', 0, 'Beskrivelse', '{"inputfieldClass":"InputfieldCKEditor","contentType":1,"required":1,"placeholder":"Skriv kort om tjenesten","rows":3}'),
(103, 'FieldtypeTextarea', 'sitat', 0, 'Sitat', ''),
(104, 'FieldtypeText', 'forfatter', 0, 'Forfatter', ''),
(105, 'FieldtypeImage', 'profilbilde', 0, 'Bilde', '{"extensions":"gif jpg jpeg png","maxFiles":1,"entityEncode":1,"inputfieldClass":"InputfieldImage","required":1,"descriptionRows":1,"adminThumbs":1,"defaultGrid":0,"maxWidth":393,"maxHeight":393,"icon":"fa-camera","fileSchema":2}'),
(106, 'FieldtypeTextarea', 'besoksadresse', 0, 'Besøksadresse', '{"inputfieldClass":"InputfieldCKEditor","contentType":1,"rows":5}'),
(107, 'FieldtypeTextarea', 'postadresse', 0, 'Postadresse', '{"inputfieldClass":"InputfieldCKEditor","contentType":1,"rows":5}');

-- --------------------------------------------------------

--
-- Table structure for table `field_beskrivelse`
--

CREATE TABLE `field_beskrivelse` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_beskrivelse`
--

INSERT INTO `field_beskrivelse` (`pages_id`, `data`) VALUES
(1016, 'Vi tar veldig fine bilder som selger bra!'),
(1025, 'Det er viktig med ryddige juridske rammer for et båtsalg. Vi har kompetansen og erfaringen til å gjennomføre ditt båtsalg riktig.'),
(1026, 'Våre meglere jobber med båtsalg hver dag. Dette gir dem en erfaring med båtsalg som få kan matche. Vi vet hva som skal til for å selge <em>din</em> båt!'),
(1027, 'Vi sørger for at din båt blir sett verden over, for det er ikke alltid at den rette kjøperen finnes i Norge. Ved hjelp av et internasjonalt nettverk av båtmeglere har vi solgt mange båter utenlands.'),
(1028, 'Våre oppgaver kan strekke seg lenger enn til salg av båt. Trenger båten å pusses opp før salg? Transport, eierskifte-forsikring? Vi kan ta hånd om hele prosessen, slik at du får mer overskudd.'),
(1029, 'Det er vårt ytterste ønske at du skal få så mye som mulig igjen for båten din. Derfor gjør vi det vi kan i vår makt for å øke salgsverdien.');

-- --------------------------------------------------------

--
-- Table structure for table `field_besoksadresse`
--

CREATE TABLE `field_besoksadresse` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_besoksadresse`
--

INSERT INTO `field_besoksadresse` (`pages_id`, `data`) VALUES
(1031, '<p>Sandviksveien 120</p>\n\n<p>1363 Høvik</p>');

-- --------------------------------------------------------

--
-- Table structure for table `field_body`
--

CREATE TABLE `field_body` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_body`
--

INSERT INTO `field_body` (`pages_id`, `data`) VALUES
(27, '<h3>The page you were looking for is not found.</h3>\r\n<p>Please use our search engine or navigation above to find the page.</p>'),
(1, '<h2>What is ProcessWire?</h2><p>ProcessWire gives you full control over your fields, templates and markup. It provides a powerful template system that works the way you do. Not to mention, ProcessWire''s API makes working with your content easy and enjoyable. <a href="http://processwire.com">Learn more</a></p><h2>Basic Site Profile</h2><p>This is a basic starter site for you to use in developing your own site. There are a few pages here to serve as examples, but this site profile does not make any attempt to demonstrate all that ProcessWire can do. To learn more or ask questions, visit the <a href="http://www.processwire.com/talk/" target="_blank">ProcessWire forums</a>. If you are building a new site, this basic profile is a good place to start. You may use these existing templates and design as they are, or you may replace them entirely. <a href="./templates/">Read more</a></p><h2>Browse the Site</h2>');

-- --------------------------------------------------------

--
-- Table structure for table `field_cv`
--

CREATE TABLE `field_cv` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_cv`
--

INSERT INTO `field_cv` (`pages_id`, `data`) VALUES
(1007, 'Han er flink'),
(1011, 'Gjør mye rart.'),
(1014, 'Ung.');

-- --------------------------------------------------------

--
-- Table structure for table `field_email`
--

CREATE TABLE `field_email` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_email`
--

INSERT INTO `field_email` (`pages_id`, `data`) VALUES
(41, 'kennethdammyr@gmail.com'),
(1007, 'jens-arne@akeryachts.no'),
(1008, 'kennethdammyr@gmail.com'),
(1011, 'artur@akeryachts.no'),
(1014, 'christian@akeryachts.no'),
(1031, 'post@akeryachts.no');

-- --------------------------------------------------------

--
-- Table structure for table `field_forfatter`
--

CREATE TABLE `field_forfatter` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_forfatter`
--

INSERT INTO `field_forfatter` (`pages_id`, `data`) VALUES
(1017, 'Kennet Dammyr'),
(1018, 'Kenneth Dammyr'),
(1019, 'Ola Nordmann'),
(1020, 'Kari Nordmann'),
(1021, 'Camilla Dullum'),
(1022, 'Fornøyd kunde'),
(1023, 'Nervøs person'),
(1024, 'Advokat'),
(1032, 'Båteier'),
(1033, 'Stolt båteier'),
(1030, 'Kunde'),
(1035, 'mr.Krølle'),
(1036, 'Mann 44');

-- --------------------------------------------------------

--
-- Table structure for table `field_headline`
--

CREATE TABLE `field_headline` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_headline`
--

INSERT INTO `field_headline` (`pages_id`, `data`) VALUES
(1, 'Basic Example Site');

-- --------------------------------------------------------

--
-- Table structure for table `field_ikon`
--

CREATE TABLE `field_ikon` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_ikon`
--

INSERT INTO `field_ikon` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`) VALUES
(1016, 'camera.png', 0, '', '2014-04-29 17:45:28', '2014-04-29 17:45:28'),
(1025, 'gavel-1.png', 0, '', '2014-04-29 17:46:17', '2014-04-29 17:46:17'),
(1026, 'certificate.png', 0, '', '2014-04-29 17:45:17', '2014-04-29 17:45:17'),
(1027, 'globe.png', 0, '', '2014-04-29 18:12:46', '2014-04-29 18:12:46'),
(1028, 'wrench.png', 0, '', '2014-04-29 19:09:38', '2014-04-29 19:09:38'),
(1029, 'signal.png', 0, '', '2014-04-29 19:12:33', '2014-04-29 19:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `field_image`
--

CREATE TABLE `field_image` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_image`
--

INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`) VALUES
(1, 'westin_interior2.jpg', 7, 'Westin Peachtree Atlanta hotel lobby area.', '2014-04-29 12:15:23', '2014-04-29 12:15:23'),
(1, 'marquis_interior7b.jpg', 5, 'Elevator at the Atlanta Marriott Marquis hotel.', '2014-04-29 12:15:23', '2014-04-29 12:15:23'),
(1, 'marquis_interior13b_med.jpg', 6, 'Atrium at the Atlanta Marriott Marquis hotel.', '2014-04-29 12:15:23', '2014-04-29 12:15:23'),
(1, 'marquis_interior3.jpg', 4, 'Elevator core at the Atlanta Marriott Marquis hotel.', '2014-04-29 12:15:23', '2014-04-29 12:15:23'),
(1, 'hyatt_interior11.jpg', 3, 'Looking up from the lobby area at the Atlanta Hyatt hotel.', '2014-04-29 12:15:23', '2014-04-29 12:15:23'),
(1, 'hyatt2.jpg', 2, 'Detail from Atlanta Hyatt Hotel.', '2014-04-29 12:15:23', '2014-04-29 12:15:23'),
(1, 'hyatt_interior9.jpg', 1, 'Detail from Atlanta Hyatt Hotel.', '2014-04-29 12:15:23', '2014-04-29 12:15:23'),
(1, 'westin_interior1.jpg', 0, 'Westin Peachtree Atlanta hotel lobby area.', '2014-04-29 12:15:23', '2014-04-29 12:15:23');

-- --------------------------------------------------------

--
-- Table structure for table `field_navn`
--

CREATE TABLE `field_navn` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_navn`
--

INSERT INTO `field_navn` (`pages_id`, `data`) VALUES
(1007, 'Jens-Arne Dammyr'),
(1011, 'Artur Skofteby'),
(1014, 'Christian Ramm');

-- --------------------------------------------------------

--
-- Table structure for table `field_pass`
--

CREATE TABLE `field_pass` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii;

--
-- Dumping data for table `field_pass`
--

INSERT INTO `field_pass` (`pages_id`, `data`, `salt`) VALUES
(41, 'zJQGM8z0QUZ9usz9uZEyb93b6IUGp4K', '$2y$11$D4qdmzf1kr6oKI.WdXuypu'),
(40, '', ''),
(1008, 'AADUyR3HVn2WsPhsKB.NabW1LpRK8bO', '$2y$11$OVxPOrnYitQQXfgZbir/wu');

-- --------------------------------------------------------

--
-- Table structure for table `field_permissions`
--

CREATE TABLE `field_permissions` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_permissions`
--

INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES
(38, 32, 1),
(1009, 32, 1),
(38, 34, 2),
(1009, 34, 2),
(38, 35, 3),
(1009, 35, 3),
(37, 36, 0),
(38, 36, 0),
(1009, 36, 0),
(38, 50, 4),
(38, 51, 5),
(38, 52, 7),
(38, 53, 8),
(38, 54, 6);

-- --------------------------------------------------------

--
-- Table structure for table `field_postadresse`
--

CREATE TABLE `field_postadresse` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_postadresse`
--

INSERT INTO `field_postadresse` (`pages_id`, `data`) VALUES
(1031, 'Skogfaret 20B\r\n0382 Oslo');

-- --------------------------------------------------------

--
-- Table structure for table `field_process`
--

CREATE TABLE `field_process` (
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `data` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_process`
--

INSERT INTO `field_process` (`pages_id`, `data`) VALUES
(6, 17),
(3, 12),
(8, 12),
(9, 14),
(10, 7),
(11, 47),
(16, 48),
(300, 104),
(21, 50),
(29, 66),
(23, 10),
(304, 138),
(31, 136),
(22, 76),
(30, 68),
(303, 129),
(2, 87),
(302, 121),
(301, 109),
(28, 76),
(1034, 153);

-- --------------------------------------------------------

--
-- Table structure for table `field_profilbilde`
--

CREATE TABLE `field_profilbilde` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_profilbilde`
--

INSERT INTO `field_profilbilde` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`) VALUES
(1007, 'jens-arne_dammyr.jpg', 0, '', '2014-04-29 15:05:19', '2014-04-29 15:05:19'),
(1011, 'vidar_rakfjord.jpg', 0, '', '2014-04-29 15:06:15', '2014-04-29 15:06:15'),
(1014, 'christian_ramm.jpg', 0, '', '2014-04-29 15:06:59', '2014-04-29 15:06:59');

-- --------------------------------------------------------

--
-- Table structure for table `field_roles`
--

CREATE TABLE `field_roles` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_roles`
--

INSERT INTO `field_roles` (`pages_id`, `data`, `sort`) VALUES
(40, 37, 0),
(41, 37, 0),
(1008, 37, 1),
(41, 38, 1),
(1008, 1009, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_sidebar`
--

CREATE TABLE `field_sidebar` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_sidebar`
--

INSERT INTO `field_sidebar` (`pages_id`, `data`) VALUES
(1, '<h3>About ProcessWire</h3><p>ProcessWire is an open source CMS and web application framework aimed at the needs of designers, developers and their clients.</p><p><a href="http://processwire.com/about/" target="_blank">About ProcessWire</a><br /><a href="http://processwire.com/api/">Developer API</a><br /><a href="http://processwire.com/contact/">Contact Us</a><br /><a href="http://twitter.com/rc_d">Follow Us on Twitter</a></p>');

-- --------------------------------------------------------

--
-- Table structure for table `field_sitat`
--

CREATE TABLE `field_sitat` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_sitat`
--

INSERT INTO `field_sitat` (`pages_id`, `data`) VALUES
(1017, 'Her samler vi sitater'),
(1018, 'Jeg er bedre enn verden!'),
(1019, 'Jeg er vedig fornøyd med hvordan dere håndterte salget av båten min!'),
(1020, 'Det var deilig å slippe alt arbeidet med båtsalg. Samtidig følte jeg meg trygg på den juridiske prosessen.'),
(1021, 'Jeg er veldig fornøyd med båten min. Takk for at dere gjorde det så enkelt!'),
(1022, 'Båtmegling av stor verdi: Båten steg i pris!'),
(1023, 'AkerYachts gjorde at jeg fikk sove om kvelden.'),
(1024, 'Det er viktig med profesjonell behandling av båtsalg. Like viktig som ved salg av bolig.'),
(1032, 'Gutta i AkerYachts fikk 50''000kr ekstra for båten min! Det var gode penger :)'),
(1033, 'Vi nyter hver helg i båten. Det var fantastisk å la AkerYachts ta hånd om letingen etter vår nye båt.'),
(1030, 'Det er er folk hos AkerYachts'),
(1035, 'det er så flott og kjenne vinden i håret, takk skal dere ha'),
(1036, 'Det er fint vær på havet');

-- --------------------------------------------------------

--
-- Table structure for table `field_stilling`
--

CREATE TABLE `field_stilling` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_stilling`
--

INSERT INTO `field_stilling` (`pages_id`, `data`) VALUES
(1007, 'Daglig leder'),
(1011, 'Assistent'),
(1014, 'Megler');

-- --------------------------------------------------------

--
-- Table structure for table `field_summary`
--

CREATE TABLE `field_summary` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_summary`
--

INSERT INTO `field_summary` (`pages_id`, `data`) VALUES
(1, 'ProcessWire is an open source CMS and web application framework aimed at the needs of designers, developers and their clients. ');

-- --------------------------------------------------------

--
-- Table structure for table `field_title`
--

CREATE TABLE `field_title` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_title`
--

INSERT INTO `field_title` (`pages_id`, `data`) VALUES
(14, 'Edit Template'),
(15, 'Add Template'),
(12, 'Templates'),
(11, 'Templates'),
(19, 'Field groups'),
(20, 'Edit Fieldgroup'),
(16, 'Fields'),
(17, 'Fields'),
(18, 'Edit Field'),
(22, 'Setup'),
(3, 'Pages'),
(6, 'Add Page'),
(8, 'Page List'),
(9, 'Save Sort'),
(10, 'Edit Page'),
(21, 'Modules'),
(29, 'Users'),
(30, 'Roles'),
(2, 'Admin'),
(7, 'Trash'),
(27, '404 Page Not Found'),
(302, 'Insert Link'),
(23, 'Login'),
(304, 'Profile'),
(301, 'Empty Trash'),
(300, 'Search'),
(303, 'Insert Image'),
(28, 'Access'),
(31, 'Permissions'),
(32, 'Edit pages'),
(34, 'Delete pages'),
(35, 'Move pages (change parent)'),
(36, 'View pages'),
(50, 'Sort child pages'),
(51, 'Change templates on pages'),
(52, 'Administer users (role must also have template edit access)'),
(53, 'User can update profile/password'),
(54, 'Lock or unlock a page'),
(1, 'AkerYachts.no'),
(1018, 'Best'),
(1017, 'Sitater'),
(1015, 'Tjenester'),
(1007, 'Jens-Arne Dammyr'),
(1011, 'Artur Skofteby'),
(1016, 'Profesjonelle bilder'),
(1013, 'Meglere'),
(1014, 'Christian Ramm'),
(1019, 'bra'),
(1020, '3'),
(1021, '4'),
(1022, '5'),
(1023, '6'),
(1024, '7'),
(1025, 'Juridisk kompetanse'),
(1026, 'Bred erfaring'),
(1027, 'Global markedsføring'),
(1028, 'Vi ordner alt'),
(1029, 'Økt salgspris'),
(1030, '8'),
(1031, 'kontakt'),
(1032, '9'),
(1033, '10'),
(1034, 'ModulesManager'),
(1035, 'det er så flott og kjenne vinden i håret, takk skal dere ha'),
(1036, '11');

-- --------------------------------------------------------

--
-- Table structure for table `field_tlf`
--

CREATE TABLE `field_tlf` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_tlf`
--

INSERT INTO `field_tlf` (`pages_id`, `data`) VALUES
(1007, 93012322),
(1011, 12345678),
(1014, 12345678),
(1031, 93012322);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=154 ;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `class`, `flags`, `data`) VALUES
(1, 'FieldtypeTextarea', 0, ''),
(2, 'FieldtypeNumber', 0, ''),
(3, 'FieldtypeText', 0, ''),
(4, 'FieldtypePage', 0, ''),
(30, 'InputfieldForm', 0, ''),
(6, 'FieldtypeFile', 0, ''),
(7, 'ProcessPageEdit', 1, ''),
(10, 'ProcessLogin', 0, ''),
(147, 'TextformatterPstripper', 1, ''),
(12, 'ProcessPageList', 0, '{"pageLabelField":"title","paginationLimit":25,"limit":50}'),
(121, 'ProcessPageEditLink', 1, ''),
(14, 'ProcessPageSort', 0, ''),
(15, 'InputfieldPageListSelect', 0, ''),
(117, 'JqueryUI', 1, ''),
(17, 'ProcessPageAdd', 0, ''),
(125, 'SessionLoginThrottle', 3, ''),
(122, 'InputfieldPassword', 0, ''),
(25, 'InputfieldAsmSelect', 0, ''),
(116, 'JqueryCore', 1, ''),
(27, 'FieldtypeModule', 0, ''),
(28, 'FieldtypeDatetime', 0, ''),
(29, 'FieldtypeEmail', 0, ''),
(108, 'InputfieldURL', 0, ''),
(32, 'InputfieldSubmit', 0, ''),
(33, 'InputfieldWrapper', 0, ''),
(34, 'InputfieldText', 0, ''),
(35, 'InputfieldTextarea', 0, ''),
(36, 'InputfieldSelect', 0, ''),
(37, 'InputfieldCheckbox', 0, ''),
(38, 'InputfieldCheckboxes', 0, ''),
(39, 'InputfieldRadios', 0, ''),
(40, 'InputfieldHidden', 0, ''),
(41, 'InputfieldName', 0, ''),
(43, 'InputfieldSelectMultiple', 0, ''),
(45, 'JqueryWireTabs', 0, ''),
(46, 'ProcessPage', 0, ''),
(47, 'ProcessTemplate', 0, ''),
(48, 'ProcessField', 0, ''),
(50, 'ProcessModule', 0, ''),
(114, 'PagePermissions', 3, ''),
(97, 'FieldtypeCheckbox', 1, ''),
(115, 'PageRender', 3, '{"clearCache":1}'),
(55, 'InputfieldFile', 0, ''),
(56, 'InputfieldImage', 0, ''),
(57, 'FieldtypeImage', 0, ''),
(60, 'InputfieldPage', 0, '{"inputfieldClasses":["InputfieldSelect","InputfieldSelectMultiple","InputfieldCheckboxes","InputfieldRadios","InputfieldAsmSelect","InputfieldPageListSelect","InputfieldPageListSelectMultiple"]}'),
(61, 'TextformatterEntities', 0, ''),
(145, 'TextformatterMarkdownExtra', 1, ''),
(146, 'TextformatterSmartypants', 1, ''),
(66, 'ProcessUser', 0, '{"showFields":["name","email","roles"]}'),
(67, 'MarkupAdminDataTable', 0, ''),
(68, 'ProcessRole', 0, '{"showFields":["name"]}'),
(76, 'ProcessList', 0, ''),
(78, 'InputfieldFieldset', 0, ''),
(79, 'InputfieldMarkup', 0, ''),
(80, 'InputfieldEmail', 0, ''),
(89, 'FieldtypeFloat', 1, ''),
(83, 'ProcessPageView', 0, ''),
(84, 'FieldtypeInteger', 0, ''),
(85, 'InputfieldInteger', 0, ''),
(86, 'InputfieldPageName', 0, ''),
(87, 'ProcessHome', 0, ''),
(90, 'InputfieldFloat', 0, ''),
(92, 'InputfieldTinyMCE', 0, ''),
(94, 'InputfieldDatetime', 0, ''),
(98, 'MarkupPagerNav', 0, ''),
(129, 'ProcessPageEditImageSelect', 1, ''),
(102, 'JqueryFancybox', 1, ''),
(103, 'JqueryTableSorter', 1, ''),
(104, 'ProcessPageSearch', 1, '{"searchFields":"title body","displayField":"title path"}'),
(105, 'FieldtypeFieldsetOpen', 1, ''),
(106, 'FieldtypeFieldsetClose', 1, ''),
(107, 'FieldtypeFieldsetTabOpen', 1, ''),
(109, 'ProcessPageTrash', 1, ''),
(111, 'FieldtypePageTitle', 1, ''),
(112, 'InputfieldPageTitle', 0, ''),
(113, 'MarkupPageArray', 3, ''),
(131, 'InputfieldButton', 0, ''),
(133, 'FieldtypePassword', 1, ''),
(134, 'ProcessPageType', 1, '{"showFields":[]}'),
(135, 'FieldtypeURL', 1, ''),
(136, 'ProcessPermission', 1, '{"showFields":["name","title"]}'),
(137, 'InputfieldPageListSelectMultiple', 0, ''),
(138, 'ProcessProfile', 1, '{"profileFields":["pass","email"]}'),
(139, 'SystemUpdater', 1, '{"systemVersion":4}'),
(148, 'AdminThemeDefault', 2, '{"colors":"classic"}'),
(149, 'JqueryMagnific', 1, ''),
(150, 'MarkupHTMLPurifier', 0, ''),
(151, 'InputfieldCKEditor', 0, ''),
(152, 'JqueryDataTables', 1, ''),
(153, 'ModulesManager', 1, '{"apikey":"pw223","remoteurl":"http:\\/\\/modules.processwire.com\\/export-json\\/","limit":350,"max_redirects":3}');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `templates_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) CHARACTER SET ascii NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_parent_id` (`name`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  KEY `templates_id` (`templates_id`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1037 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `sort`) VALUES
(1, 0, 1, 'home', 1033, '2014-04-29 17:25:05', 1008, '0000-00-00 00:00:00', 2, 0),
(2, 1, 2, 'processwire', 1035, '2014-04-29 10:12:44', 40, '0000-00-00 00:00:00', 2, 8),
(3, 2, 2, 'page', 21, '2011-03-29 19:37:06', 41, '0000-00-00 00:00:00', 2, 0),
(6, 3, 2, 'add', 21, '2011-03-29 19:37:06', 41, '0000-00-00 00:00:00', 2, 0),
(7, 1, 2, 'trash', 1039, '2011-08-14 20:04:52', 41, '2010-02-07 04:29:39', 2, 9),
(8, 3, 2, 'list', 21, '2011-03-29 19:37:06', 41, '0000-00-00 00:00:00', 2, 1),
(9, 3, 2, 'sort', 23, '2011-03-29 19:37:06', 41, '0000-00-00 00:00:00', 2, 2),
(10, 3, 2, 'edit', 21, '2011-03-29 19:37:06', 41, '0000-00-00 00:00:00', 2, 3),
(11, 22, 2, 'template', 21, '2011-03-29 19:37:06', 41, '2010-02-01 10:04:54', 2, 0),
(16, 22, 2, 'field', 21, '2011-03-29 19:37:06', 41, '2010-02-01 11:44:07', 2, 2),
(21, 2, 2, 'module', 21, '2011-03-29 19:37:06', 41, '2010-02-02 09:02:24', 2, 2),
(22, 2, 2, 'setup', 21, '2011-03-29 19:37:06', 41, '2010-02-09 11:16:59', 2, 1),
(23, 2, 2, 'login', 1035, '2011-05-03 21:38:10', 41, '2010-02-17 08:59:39', 2, 4),
(27, 1, 29, 'http404', 1035, '2011-08-14 20:04:52', 41, '2010-06-03 04:53:03', 3, 7),
(28, 2, 2, 'access', 13, '2011-05-03 21:38:10', 41, '2011-03-19 18:14:20', 2, 3),
(29, 28, 2, 'users', 29, '2011-04-04 22:39:08', 41, '2011-03-19 18:15:29', 2, 0),
(30, 28, 2, 'roles', 29, '2011-04-04 22:38:39', 41, '2011-03-19 18:15:45', 2, 1),
(31, 28, 2, 'permissions', 29, '2011-04-04 22:53:52', 41, '2011-03-19 18:16:00', 2, 2),
(32, 31, 5, 'page-edit', 25, '2011-09-06 13:34:24', 41, '2011-03-19 18:17:03', 2, 2),
(34, 31, 5, 'page-delete', 25, '2011-09-06 13:34:33', 41, '2011-03-19 18:17:23', 2, 3),
(35, 31, 5, 'page-move', 25, '2011-09-06 13:34:48', 41, '2011-03-19 18:17:41', 2, 4),
(36, 31, 5, 'page-view', 25, '2011-09-06 13:34:14', 41, '2011-03-19 18:17:57', 2, 0),
(37, 30, 4, 'guest', 25, '2011-04-04 23:37:19', 41, '2011-03-19 18:18:41', 2, 0),
(38, 30, 4, 'superuser', 25, '2011-08-17 12:34:39', 41, '2011-03-19 18:18:55', 2, 1),
(41, 29, 3, 'admin', 1, '2014-04-29 10:12:44', 40, '2011-03-19 18:41:26', 2, 0),
(40, 29, 3, 'guest', 25, '2011-08-17 12:26:09', 41, '2011-03-20 16:31:59', 2, 1),
(50, 31, 5, 'page-sort', 25, '2011-09-06 13:34:58', 41, '2011-03-26 21:04:50', 41, 5),
(51, 31, 5, 'page-template', 25, '2011-09-06 13:35:09', 41, '2011-03-26 21:25:31', 41, 6),
(52, 31, 5, 'user-admin', 25, '2011-09-06 13:35:42', 41, '2011-03-29 22:06:47', 41, 10),
(53, 31, 5, 'profile-edit', 1, '2011-08-16 20:32:48', 41, '2011-04-25 22:02:22', 41, 13),
(54, 31, 5, 'page-lock', 1, '2011-08-15 15:48:12', 41, '2011-08-15 15:45:48', 41, 8),
(300, 3, 2, 'search', 21, '2011-03-29 19:37:06', 41, '2010-08-04 03:23:59', 2, 5),
(301, 3, 2, 'trash', 23, '2011-03-29 19:37:06', 41, '2010-09-28 03:39:30', 2, 5),
(302, 3, 2, 'link', 17, '2011-03-29 19:37:06', 41, '2010-10-01 03:03:56', 2, 6),
(303, 3, 2, 'image', 17, '2011-03-29 19:37:06', 41, '2010-10-13 01:56:48', 2, 7),
(304, 2, 2, 'profile', 1025, '2011-05-03 21:38:10', 41, '2011-04-25 21:57:18', 41, 5),
(1020, 1017, 48, '3', 1, '2014-04-29 13:11:10', 41, '2014-04-29 13:10:28', 41, 2),
(1021, 1017, 48, '4', 1, '2014-04-29 13:47:54', 41, '2014-04-29 13:47:12', 41, 3),
(1022, 1017, 48, '5', 1, '2014-04-29 13:48:46', 41, '2014-04-29 13:48:23', 41, 4),
(1023, 1017, 48, '6', 1, '2014-04-29 13:53:19', 41, '2014-04-29 13:52:55', 41, 5),
(1016, 1015, 46, 'profesjonelle-bilder', 1, '2014-04-29 15:45:30', 41, '2014-04-29 11:20:23', 41, 0),
(1019, 1017, 48, 'bra', 1, '2014-04-29 13:09:55', 41, '2014-04-29 13:09:26', 41, 1),
(1007, 1013, 44, 'jens-arne-dammyr', 1, '2014-04-29 13:05:21', 41, '2014-04-29 10:21:06', 41, 1),
(1008, 29, 3, 'kennethdammyr', 1, '2014-04-29 10:37:28', 41, '2014-04-29 10:35:22', 41, 2),
(1009, 30, 4, 'bruker', 1, '2014-04-29 10:37:01', 41, '2014-04-29 10:35:48', 41, 2),
(1015, 1, 46, 'tjenester', 1, '2014-04-29 12:10:38', 41, '2014-04-29 11:15:52', 41, 4),
(1011, 1013, 44, 'artur-skofteby', 1, '2014-04-29 13:06:17', 41, '2014-04-29 10:42:13', 41, 0),
(1018, 1017, 48, 'best', 1, '2014-04-29 12:09:52', 41, '2014-04-29 12:09:42', 41, 0),
(1013, 1, 45, 'meglere', 1, '2014-04-29 10:53:10', 41, '2014-04-29 10:53:10', 41, 4),
(1014, 1013, 44, 'christian-ramm', 1, '2014-04-29 13:07:01', 41, '2014-04-29 10:53:59', 41, 2),
(1017, 1, 48, 'sitater', 1, '2014-04-29 12:09:29', 41, '2014-04-29 12:08:37', 41, 5),
(1024, 1017, 48, '7', 1, '2014-04-29 13:58:13', 41, '2014-04-29 13:57:52', 41, 6),
(1025, 1015, 46, 'juridisk-kompetanse', 1, '2014-04-29 15:46:19', 41, '2014-04-29 14:14:18', 41, 1),
(1026, 1015, 46, 'bred-erfaring', 1, '2014-04-29 15:45:19', 41, '2014-04-29 15:11:31', 41, 2),
(1027, 1015, 46, 'global-markedsf-ring', 1, '2014-04-29 16:13:35', 41, '2014-04-29 16:12:38', 41, 3),
(1028, 1015, 46, 'vi-ordner-alt', 1, '2014-04-29 17:10:49', 41, '2014-04-29 17:09:33', 41, 4),
(1029, 1015, 46, 'okt-salgspris', 1, '2014-04-29 17:13:23', 1008, '2014-04-29 17:12:28', 1008, 5),
(1030, 1017, 48, '8', 1, '2014-04-29 17:53:45', 41, '2014-04-29 17:21:19', 1008, 7),
(1031, 1, 50, 'kontakt', 1, '2014-04-29 17:39:52', 41, '2014-04-29 17:23:32', 1008, 6),
(1032, 1017, 48, '9', 1, '2014-04-29 17:26:45', 1008, '2014-04-29 17:25:53', 1008, 8),
(1033, 1017, 48, '10', 1, '2014-04-29 17:27:40', 1008, '2014-04-29 17:26:55', 1008, 9),
(1034, 22, 2, 'modulesmanager', 1, '2014-04-29 17:44:01', 41, '2014-04-29 17:44:01', 41, 2),
(1035, 1017, 48, 'det-er-sa-flott-og-kjenne-vinden-i-haret-takk-skal-dere-ha', 1, '2014-04-29 20:59:40', 1008, '2014-04-29 20:58:33', 1008, 10),
(1036, 1017, 48, '11', 1, '2014-04-29 21:00:57', 1008, '2014-04-29 21:00:44', 1008, 11);

-- --------------------------------------------------------

--
-- Table structure for table `pages_access`
--

CREATE TABLE `pages_access` (
  `pages_id` int(11) NOT NULL,
  `templates_id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pages_id`),
  KEY `templates_id` (`templates_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages_access`
--

INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES
(37, 2, '2014-04-29 10:38:39'),
(38, 2, '2014-04-29 10:38:39'),
(1009, 2, '2014-04-29 10:38:39'),
(32, 2, '2014-04-29 10:38:39'),
(34, 2, '2014-04-29 10:38:39'),
(35, 2, '2014-04-29 10:38:39'),
(36, 2, '2014-04-29 10:38:39'),
(50, 2, '2014-04-29 10:38:39'),
(51, 2, '2014-04-29 10:38:39'),
(52, 2, '2014-04-29 10:38:39'),
(53, 2, '2014-04-29 10:38:39'),
(54, 2, '2014-04-29 10:38:39'),
(1015, 1, '2014-04-29 11:15:52'),
(1023, 1, '2014-04-29 13:52:55'),
(1022, 1, '2014-04-29 13:48:23'),
(1021, 1, '2014-04-29 13:47:12'),
(1017, 1, '2014-04-29 12:08:37'),
(1019, 1, '2014-04-29 13:09:26'),
(1007, 1, '2014-04-29 10:52:09'),
(1011, 1, '2014-04-29 10:52:28'),
(1013, 1, '2014-04-29 10:53:10'),
(1014, 1, '2014-04-29 10:53:59'),
(1018, 1, '2014-04-29 12:09:42'),
(1020, 1, '2014-04-29 13:10:28'),
(1024, 1, '2014-04-29 13:57:52'),
(1025, 1, '2014-04-29 14:14:18'),
(1026, 1, '2014-04-29 15:11:31'),
(1027, 1, '2014-04-29 16:12:38'),
(1028, 1, '2014-04-29 17:09:33'),
(1029, 1, '2014-04-29 17:12:28'),
(1030, 1, '2014-04-29 17:21:19'),
(1031, 1, '2014-04-29 17:23:32'),
(1032, 1, '2014-04-29 17:25:53'),
(1033, 1, '2014-04-29 17:26:55'),
(1035, 1, '2014-04-29 20:58:33'),
(1036, 1, '2014-04-29 21:00:44');

-- --------------------------------------------------------

--
-- Table structure for table `pages_parents`
--

CREATE TABLE `pages_parents` (
  `pages_id` int(10) unsigned NOT NULL,
  `parents_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`parents_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages_parents`
--

INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES
(2, 1),
(3, 1),
(3, 2),
(7, 1),
(22, 1),
(22, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(29, 28),
(30, 1),
(30, 2),
(30, 28),
(31, 1),
(31, 2),
(31, 28),
(1013, 1),
(1015, 1),
(1017, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages_sortfields`
--

CREATE TABLE `pages_sortfields` (
  `pages_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sortfield` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `session_login_throttle`
--

CREATE TABLE `session_login_throttle` (
  `name` varchar(128) NOT NULL,
  `attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `last_attempt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session_login_throttle`
--

INSERT INTO `session_login_throttle` (`name`, `attempts`, `last_attempt`) VALUES
('kennethdammyr', 2, 1398805047);

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET ascii NOT NULL,
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cache_time` mediumint(9) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fieldgroups_id` (`fieldgroups_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES
(2, 'admin', 2, 8, 0, '{"useRoles":1,"parentTemplates":[2],"allowPageNum":1,"redirectLogin":23,"slashUrls":1,"noGlobal":1}'),
(3, 'user', 3, 8, 0, '{"useRoles":1,"noChildren":1,"parentTemplates":[2],"slashUrls":1,"pageClass":"User","noGlobal":1,"noMove":1,"noTrash":1,"noSettings":1,"noChangeTemplate":1,"nameContentTab":1}'),
(4, 'role', 4, 8, 0, '{"noChildren":1,"parentTemplates":[2],"slashUrls":1,"pageClass":"Role","noGlobal":1,"noMove":1,"noTrash":1,"noSettings":1,"noChangeTemplate":1,"nameContentTab":1}'),
(5, 'permission', 5, 8, 0, '{"noChildren":1,"parentTemplates":[2],"slashUrls":1,"guestSearchable":1,"pageClass":"Permission","noGlobal":1,"noMove":1,"noTrash":1,"noSettings":1,"noChangeTemplate":1,"nameContentTab":1}'),
(1, 'home', 1, 0, 0, '{"useRoles":1,"editRoles":[1009],"addRoles":[1009],"createRoles":[1009],"noParents":1,"slashUrls":1,"roles":[37,1009]}'),
(29, 'basic-page', 83, 0, 0, '{"slashUrls":1}'),
(26, 'search', 80, 0, 0, '{"noChildren":1,"noParents":1,"allowPageNum":1,"slashUrls":1}'),
(34, 'sitemap', 88, 0, 0, '{"noChildren":1,"noParents":1,"redirectLogin":23,"slashUrls":1}'),
(46, 'tjenester', 100, 0, 0, '{"slashUrls":1,"altFilename":"rest"}'),
(45, 'meglere', 99, 0, 0, '{"slashUrls":1}'),
(44, 'megler', 98, 0, 0, '{"slashUrls":1}'),
(48, 'Sitater', 102, 0, 0, '{"slashUrls":1,"altFilename":"rest"}'),
(50, 'kontakt', 104, 0, 0, '{"noChildren":1,"slashUrls":1,"altFilename":"rest"}');
