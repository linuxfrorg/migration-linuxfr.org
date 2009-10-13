-- MySQL dump 10.11
--
-- Host: localhost    Database: linuxfr
-- ------------------------------------------------------
-- Server version	5.0.32-Debian_7etch8-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avis`
--

DROP TABLE IF EXISTS `avis`;
CREATE TABLE `avis` (
  `avis` int(1) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ip` varchar(9) NOT NULL default '',
  `user_id` int(6) NOT NULL default '1',
  `res_type` int(2) NOT NULL default '1',
  `obj_id` int(6) NOT NULL default '0',
  KEY `obj_id` (`obj_id`,`res_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
CREATE TABLE `board` (
  `id` int(6) NOT NULL auto_increment,
  `message` blob NOT NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ip` varchar(9) NOT NULL default '',
  `info` varchar(60) NOT NULL default '0',
  `section` int(2) NOT NULL default '1',
  `user_id` int(6) NOT NULL default '1',
  KEY `id` (`id`,`timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=1785136 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `board_denied`
--

DROP TABLE IF EXISTS `board_denied`;
CREATE TABLE `board_denied` (
  `user_id` int(6) NOT NULL default '1',
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(150) default NULL,
  `body` blob NOT NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `news_id` int(6) NOT NULL default '0',
  `user_id` int(6) NOT NULL default '1',
  `com_parent` int(11) NOT NULL default '0',
  `ip` varchar(9) NOT NULL default '0',
  `score` int(3) NOT NULL default '-1',
  `sig_id` int(6) NOT NULL default '1',
  `score_nb` int(3) NOT NULL default '0',
  `res_type` int(5) NOT NULL default '1',
  `thread_id` int(11) NOT NULL default '0',
  `deleted` int(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`),
  KEY `news_id` (`news_id`),
  KEY `user_id` (`user_id`),
  KEY `com_parent` (`com_parent`),
  KEY `res_type` (`res_type`),
  KEY `timestamp` (`timestamp`),
  KEY `score` (`score`),
  KEY `score_nb` (`score_nb`),
  KEY `res_type_2` (`res_type`),
  KEY `thread_id` (`thread_id`),
  KEY `user_id_2` (`user_id`,`res_type`),
  KEY `user_id_3` (`user_id`,`timestamp`),
  KEY `user_id_4` (`user_id`,`res_type`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=859369 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `comments_scored_user`
--

DROP TABLE IF EXISTS `comments_scored_user`;
CREATE TABLE `comments_scored_user` (
  `comments_id` int(11) NOT NULL default '0',
  `user_id` int(6) NOT NULL default '0',
  `news_id` int(6) NOT NULL default '1',
  `res_type` int(5) NOT NULL default '1',
  `score` int(1) default NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`comments_id`,`user_id`),
  KEY `id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `commentsnew`
--

DROP TABLE IF EXISTS `commentsnew`;
CREATE TABLE `commentsnew` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(80) NOT NULL default '',
  `body` blob NOT NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `news_id` int(6) NOT NULL default '0',
  `user_id` int(6) NOT NULL default '1',
  `com_parent` int(11) NOT NULL default '0',
  `ip` varchar(9) NOT NULL default '0',
  `score` int(3) NOT NULL default '-1',
  `sig_id` int(6) NOT NULL default '1',
  `score_nb` int(3) NOT NULL default '0',
  `res_type` int(5) NOT NULL default '1',
  `thread_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`),
  KEY `news_id` (`news_id`),
  KEY `user_id` (`user_id`),
  KEY `com_parent` (`com_parent`),
  KEY `res_type` (`res_type`),
  KEY `timestamp` (`timestamp`),
  KEY `thread_id` (`thread_id`),
  KEY `user__id` (`user_id`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=463873 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `contents_scored`
--

DROP TABLE IF EXISTS `contents_scored`;
CREATE TABLE `contents_scored` (
  `res_id` int(6) NOT NULL default '1',
  `res_type` int(5) NOT NULL default '1',
  `user_id` int(6) NOT NULL default '1',
  `score` int(1) default NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`res_id`,`res_type`,`user_id`),
  KEY `id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `forums_data`
--

DROP TABLE IF EXISTS `forums_data`;
CREATE TABLE `forums_data` (
  `id` int(10) NOT NULL auto_increment,
  `group_id` int(4) NOT NULL default '0',
  `subject` varchar(255) NOT NULL default '',
  `body` blob,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `user_id` int(6) NOT NULL default '0',
  `ip` varchar(9) NOT NULL default '',
  `lastpost` timestamp NOT NULL default '0000-00-00 00:00:00',
  `nbcomment` int(4) NOT NULL default '0',
  `sumscore` int(5) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `group_id` (`group_id`),
  KEY `lastpost` (`lastpost`)
) ENGINE=MyISAM AUTO_INCREMENT=22875 DEFAULT CHARSET=utf8;

--
-- Table structure for table `forums_group`
--

DROP TABLE IF EXISTS `forums_group`;
CREATE TABLE `forums_group` (
  `id` int(4) NOT NULL auto_increment,
  `name` varchar(40) default NULL,
  `description` varchar(255) default NULL,
  `is_post` int(1) NOT NULL default '0',
  `parent_id` int(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `group_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Table structure for table `interest`
--

DROP TABLE IF EXISTS `interest`;
CREATE TABLE `interest` (
  `res_type` int(5) NOT NULL default '1',
  `res_id` int(6) NOT NULL default '0',
  `interest` int(8) NOT NULL default '0',
  `score` int(8) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`res_id`,`res_type`),
  KEY `interest` (`interest`),
  KEY `score` (`score`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `interviews`
--

DROP TABLE IF EXISTS `interviews`;
CREATE TABLE `interviews` (
  `id` int(6) NOT NULL auto_increment,
  `target` text NOT NULL,
  `description` text NOT NULL,
  `state` int(1) NOT NULL default '0',
  `user_id` int(6) NOT NULL default '1',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `history` text,
  `assignee` int(6) NOT NULL default '0',
  `news_id` int(6) NOT NULL default '0',
  `nbcomment` int(4) NOT NULL default '0',
  `lastpost` timestamp NOT NULL default '0000-00-00 00:00:00',
  `sumscore` int(5) NOT NULL default '0',
  KEY `id` (`id`,`timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `lang`
--

DROP TABLE IF EXISTS `lang`;
CREATE TABLE `lang` (
  `id` int(2) NOT NULL auto_increment,
  `lang` char(2) default NULL,
  `description` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
CREATE TABLE `locks` (
  `user_id` int(6) NOT NULL default '1',
  `res_type` int(2) NOT NULL default '1',
  `obj_id` int(6) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `obj_id` (`obj_id`,`res_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(7) NOT NULL auto_increment,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `user_id_source` int(6) NOT NULL default '0',
  `user_id_dest` int(6) NOT NULL default '0',
  `read_ok` enum('0','1') NOT NULL default '0',
  `subject` varchar(150) NOT NULL default '0',
  `body` blob NOT NULL,
  `user_id_real_source` int(6) NOT NULL default '0',
  `user_id_real_dest` int(6) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `searchid` (`user_id_dest`,`user_id_source`)
) ENGINE=MyISAM AUTO_INCREMENT=14727 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `moderator_last`
--

DROP TABLE IF EXISTS `moderator_last`;
CREATE TABLE `moderator_last` (
  `user_id` int(6) NOT NULL default '0',
  `action` varchar(255) default NULL,
  `lastseen` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(6) NOT NULL auto_increment,
  `topic_id` int(3) NOT NULL default '1',
  `section_id` int(3) NOT NULL default '1',
  `author_id` int(6) NOT NULL default '0',
  `lang_id` int(2) NOT NULL default '0',
  `state` int(1) NOT NULL default '0',
  `main_page` int(1) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `title` varchar(150) NOT NULL default '',
  `departement` tinytext,
  `ip` varchar(9) NOT NULL default '',
  `user_id` int(6) NOT NULL default '1',
  `phare` int(1) NOT NULL default '0',
  `body` blob,
  `content_type` varchar(16) NOT NULL default 'text/plain',
  `nbcomment` int(4) NOT NULL default '0',
  `lastpost` timestamp NOT NULL default '0000-00-00 00:00:00',
  `sumscore` int(5) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `phare` (`phare`),
  KEY `state` (`state`),
  KEY `section` (`section_id`),
  KEY `user_id` (`user_id`),
  KEY `timestamp` (`timestamp`),
  KEY `timestampbis` (`timestamp`,`state`),
  KEY `topics` (`topic_id`),
  KEY `main_page` (`main_page`),
  KEY `pourvoir` (`section_id`,`state`,`timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=23038 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `news_attachements`
--

DROP TABLE IF EXISTS `news_attachements`;
CREATE TABLE `news_attachements` (
  `id` int(6) NOT NULL auto_increment,
  `news_id` int(6) NOT NULL default '0',
  `content_type` varchar(128) default NULL,
  `size` int(8) default NULL,
  `name` varchar(128) NOT NULL default '',
  `attachement` mediumblob NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `news_id` (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7334 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `news_author`
--

DROP TABLE IF EXISTS `news_author`;
CREATE TABLE `news_author` (
  `id` int(6) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `contact` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12041 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `news_history`
--

DROP TABLE IF EXISTS `news_history`;
CREATE TABLE `news_history` (
  `news_id` int(6) NOT NULL default '0',
  `title` varchar(150) NOT NULL default '',
  `body` blob,
  `article` blob,
  `body_diff` mediumblob,
  `article_diff` mediumblob,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `user_id` int(6) NOT NULL default '1',
  `revision` int(2) NOT NULL default '0',
  `log` mediumblob NOT NULL,
  `other_diff` mediumblob,
  KEY `news_id` (`news_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `news_moderated`
--

DROP TABLE IF EXISTS `news_moderated`;
CREATE TABLE `news_moderated` (
  `news_id` int(6) NOT NULL default '0',
  `user_id` int(6) NOT NULL default '0',
  `state` int(1) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `id` (`news_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `news_urls`
--

DROP TABLE IF EXISTS `news_urls`;
CREATE TABLE `news_urls` (
  `id` int(6) NOT NULL auto_increment,
  `news_id` int(6) NOT NULL default '0',
  `lang_id` int(2) NOT NULL default '1',
  `name` tinytext,
  `hits` int(6) default '0',
  `url` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `news_id` (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53318 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `poll_answers`
--

DROP TABLE IF EXISTS `poll_answers`;
CREATE TABLE `poll_answers` (
  `question_id` int(4) NOT NULL default '0',
  `answer` varchar(255) default NULL,
  `answer_nb` int(1) NOT NULL default '1',
  `number` int(1) NOT NULL default '1',
  KEY `id` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `poll_ip`
--

DROP TABLE IF EXISTS `poll_ip`;
CREATE TABLE `poll_ip` (
  `ip` varchar(9) NOT NULL default '',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `poll_questions`
--

DROP TABLE IF EXISTS `poll_questions`;
CREATE TABLE `poll_questions` (
  `id` int(4) NOT NULL auto_increment,
  `question` varchar(255) default NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `state` int(1) NOT NULL default '0',
  `user_id` int(6) NOT NULL default '1',
  `lastpost` timestamp NOT NULL default '0000-00-00 00:00:00',
  `nbcomment` int(4) NOT NULL default '0',
  `sumscore` int(5) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

--
-- Table structure for table `prizes`
--

DROP TABLE IF EXISTS `prizes`;
CREATE TABLE `prizes` (
  `user_id` int(6) NOT NULL default '1',
  `person` varchar(60) NOT NULL default '',
  `prize` int(2) NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `id` int(3) NOT NULL auto_increment,
  `section` varchar(50) default NULL,
  `state` int(1) NOT NULL default '1',
  `description` blob NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(32) NOT NULL default '',
  `user_id` int(6) NOT NULL default '0',
  `ip` varchar(15) NOT NULL default '',
  `lastseen` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `expire` timestamp NOT NULL default '0000-00-00 00:00:00',
  `public` enum('0','1') NOT NULL default '1',
  `user_agent` varchar(60) NOT NULL default '',
  `css` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`id`),
  KEY `user_id2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `sig`
--

DROP TABLE IF EXISTS `sig`;
CREATE TABLE `sig` (
  `id` int(6) NOT NULL auto_increment,
  `sig` varchar(250) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Table structure for table `tagmap`
--

DROP TABLE IF EXISTS `tagmap`;
CREATE TABLE `tagmap` (
  `id` int(11) NOT NULL auto_increment,
  `res_type` int(5) NOT NULL default '1',
  `res_id` int(6) NOT NULL default '0',
  `tag_id` int(11) NOT NULL default '0',
  `score` int(3) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `res_type` (`res_type`),
  KEY `res_id` (`res_id`),
  KEY `tag` (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Table structure for table `tagvote`
--

DROP TABLE IF EXISTS `tagvote`;
CREATE TABLE `tagvote` (
  `tagmap_id` int(6) NOT NULL default '0',
  `user_id` int(6) NOT NULL default '0',
  `score` int(1) NOT NULL default '1',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`tagmap_id`,`user_id`),
  KEY `id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` int(3) NOT NULL auto_increment,
  `topic` varchar(50) default NULL,
  `longname` varchar(50) default NULL,
  `state` int(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `tracker`
--

DROP TABLE IF EXISTS `tracker`;
CREATE TABLE `tracker` (
  `id` int(6) NOT NULL auto_increment,
  `title` varchar(150) NOT NULL default '',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `assignee` int(6) NOT NULL default '0',
  `user_id` int(6) NOT NULL default '1',
  `body` blob,
  `state` int(1) NOT NULL default '0',
  `category` int(1) NOT NULL default '0',
  `closing` timestamp NOT NULL default '0000-00-00 00:00:00',
  `nbcomment` int(4) NOT NULL default '0',
  `lastpost` timestamp NOT NULL default '0000-00-00 00:00:00',
  `sumscore` int(5) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=675 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `tracker_category`
--

DROP TABLE IF EXISTS `tracker_category`;
CREATE TABLE `tracker_category` (
  `id` int(2) NOT NULL default '0',
  `name` varchar(40) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `tribune`
--

DROP TABLE IF EXISTS `tribune`;
CREATE TABLE `tribune` (
  `id` int(6) NOT NULL auto_increment,
  `message` blob NOT NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ip` varchar(9) NOT NULL default '',
  `info` varchar(60) NOT NULL default '0',
  `res_type` int(2) NOT NULL default '1',
  `obj_id` int(6) NOT NULL default '0',
  `user_id` int(6) NOT NULL default '1',
  KEY `id` (`id`,`timestamp`),
  KEY `obj_id` (`obj_id`,`res_type`)
) ENGINE=MyISAM AUTO_INCREMENT=23430 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `urls_avgtime`
--

DROP TABLE IF EXISTS `urls_avgtime`;
CREATE TABLE `urls_avgtime` (
  `url` varchar(255) NOT NULL default '',
  `avgtime` float NOT NULL default '0',
  `number` int(10) NOT NULL default '0',
  `avgsqltime` float NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `url` (`url`),
  KEY `avgtime` (`avgtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(6) NOT NULL auto_increment,
  `lname` varchar(40) default NULL,
  `fname` varchar(40) default NULL,
  `login` varchar(20) NOT NULL default '',
  `passwd` varchar(20) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `homesite` varchar(255) default NULL,
  `level` int(20) unsigned default '0',
  `param` int(10) unsigned default '0',
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `theme` int(2) default '0',
  `status` int(1) unsigned default '0',
  `score` int(1) default '1',
  `lastseen` timestamp NOT NULL default '0000-00-00 00:00:00',
  `ip` varchar(15) default NULL,
  `sig` varchar(250) NOT NULL default '',
  `jabber_id` varchar(128) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `id2` (`id`),
  KEY `login2` (`login`),
  KEY `lastseen2` (`lastseen`),
  KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=46611 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `users_boxes`
--

DROP TABLE IF EXISTS `users_boxes`;
CREATE TABLE `users_boxes` (
  `user_id` int(6) NOT NULL default '0',
  `user_boxes` blob,
  UNIQUE KEY `user_id` (`user_id`),
  KEY `id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `users_journal`
--

DROP TABLE IF EXISTS `users_journal`;
CREATE TABLE `users_journal` (
  `id` int(8) NOT NULL auto_increment,
  `user_id` int(6) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ip` varchar(9) NOT NULL default '',
  `subject` varchar(255) NOT NULL default '',
  `body` blob,
  `main_page` int(1) NOT NULL default '0',
  `nbcomment` int(4) NOT NULL default '0',
  `lastpost` timestamp NOT NULL default '0000-00-00 00:00:00',
  `sumscore` int(5) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `main_page` (`main_page`),
  KEY `timestamp` (`timestamp`),
  KEY `timemain` (`timestamp`,`main_page`),
  KEY `main_id` (`main_page`,`id`),
  KEY `main_id_user` (`main_page`,`id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25144 DEFAULT CHARSET=utf8;

--
-- Table structure for table `users_journal_recent`
--

DROP TABLE IF EXISTS `users_journal_recent`;
CREATE TABLE `users_journal_recent` (
  `id` int(6) NOT NULL default '0',
  `subject` varchar(255) NOT NULL default '',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `main_page` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `users_karma`
--

DROP TABLE IF EXISTS `users_karma`;
CREATE TABLE `users_karma` (
  `vote_nb` int(3) NOT NULL default '0',
  `vote_nb_orig` int(3) NOT NULL default '0',
  `experience` int(5) NOT NULL default '0',
  `user_id` int(6) NOT NULL default '0',
  `denied` int(1) NOT NULL default '0',
  `avgscore` float NOT NULL default '1',
  `nbcomment` int(4) NOT NULL default '0',
  `sumscore` int(5) NOT NULL default '0',
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `users_karma_archive`
--

DROP TABLE IF EXISTS `users_karma_archive`;
CREATE TABLE `users_karma_archive` (
  `experience` int(5) NOT NULL default '0',
  `user_id` int(6) NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `users_lastseen`
--

DROP TABLE IF EXISTS `users_lastseen`;
CREATE TABLE `users_lastseen` (
  `user_id` int(6) NOT NULL default '0',
  `obj_id` int(6) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `res_type` int(5) NOT NULL default '1',
  KEY `key_id` (`user_id`,`obj_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Table structure for table `users_personnalboxes`
--

DROP TABLE IF EXISTS `users_personnalboxes`;
CREATE TABLE `users_personnalboxes` (
  `user_id` int(6) NOT NULL default '0',
  `box` blob,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `users_rdf`
--

DROP TABLE IF EXISTS `users_rdf`;
CREATE TABLE `users_rdf` (
  `id` int(4) NOT NULL auto_increment,
  `rdf` varchar(255) NOT NULL default '',
  `public` int(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Table structure for table `users_tempo`
--

DROP TABLE IF EXISTS `users_tempo`;
CREATE TABLE `users_tempo` (
  `user_id` int(6) NOT NULL default '0',
  `email` varchar(128) NOT NULL default '',
  `tempo_id` varchar(128) NOT NULL default '',
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `session_id` varchar(32) NOT NULL default '',
  KEY `id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-11-11 18:22:59
