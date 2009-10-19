-- MySQL dump 10.13  Distrib 5.1.37, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: linuxfr
-- ------------------------------------------------------
-- Server version	5.1.37-1ubuntu5

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `login` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'passive',
  `crypted_password` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `password_salt` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `persistence_token` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `single_access_token` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `perishable_token` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stylesheet` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `object_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'published',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `score` int(11) DEFAULT '0',
  `answered_to_self` tinyint(1) DEFAULT '0',
  `materialized_path` varchar(1022) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diaries`
--

DROP TABLE IF EXISTS `diaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'published',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cached_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diaries`
--

LOCK TABLES `diaries` WRITE;
/*!40000 ALTER TABLE `diaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `diaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dictionaries`
--

DROP TABLE IF EXISTS `dictionaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dictionaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_dictionaries_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionaries`
--

LOCK TABLES `dictionaries` WRITE;
/*!40000 ALTER TABLE `dictionaries` DISABLE KEYS */;
INSERT INTO `dictionaries` VALUES (1,'logo','linuxfr2_gnu.png');
/*!40000 ALTER TABLE `dictionaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cached_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_sites`
--

DROP TABLE IF EXISTS `friend_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_sites`
--

LOCK TABLES `friend_sites` WRITE;
/*!40000 ALTER TABLE `friend_sites` DISABLE KEYS */;
INSERT INTO `friend_sites` VALUES (1,'April','http://www.april.org/',1),(2,'Agenda du libre','http://www.agendadulibre.org/',2),(3,'Framasoft','http://www.framasoft.net/',3),(4,'Léa-Linux','http://lea-linux.org/',4),(5,'Lolix','http://fr.lolix.org/',5),(6,'JeSuisLibre','http://www.jesuislibre.org/',6),(7,'Eyrolles','http://www.editions-eyrolles.com/Recherche/?q=linux',7),(8,'LinuxMag','http://www.gnulinuxmag.com/',8),(9,'Veni, Vedi, Libri','http://www.venividilibri.org/',9),(10,'InLibroVeritas','http://www.inlibroveritas.net/linuxfr.html',10),(11,'LinuxGraphic','http://www.linuxgraphic.org/',11),(12,'Éditions ENI','http://www.editions-eni.fr/Livres/Systeme/.2_3a6222cf-b921-41f5-886c-c989f77ba994_a8799413-9165-4927-bb7e-36491cc3dcf2_1_0_0_0_d9bd8b5e-f324-473f-b1fc-b41b421c950f.html',12);
/*!40000 ALTER TABLE `friend_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interviews`
--

DROP TABLE IF EXISTS `interviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cached_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `news_id` int(11) DEFAULT NULL,
  `assigned_to_user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interviews`
--

LOCK TABLES `interviews` WRITE;
/*!40000 ALTER TABLE `interviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `interviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nb_clicks` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cached_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `second_part` text COLLATE utf8_unicode_ci,
  `section_id` int(11) DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'anonymous',
  `author_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'anonymous@dlfp.org',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `interest` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `public` tinyint(1) DEFAULT '1',
  `comments_count` int(11) DEFAULT '0',
  `last_commented_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'aide','Aide','<h2 id=\"aide-gagnants\">Gagnants et prix</h2>\n\n<p>\n	Vous pouvez gagner des livres des éditions <a href=\"http://www.editions-eyrolles.com/Recherche/?q=linux\">Eyrolles</a>,\n	<a href=\"http://www.editions-eni.fr/Livres/Systeme/.2_3a6222cf-b921-41f5-886c-c989f77ba994_a8799413-9165-4927-bb7e-36491cc3dcf2_1_0_0_0_d9bd8b5e-f324-473f-b1fc-b41b421c950f.html\">ENI</a>\n	ou <a href=\"http://www.inlibroveritas.net/linuxfr.html\">InLibroVeritas</a>,\n	ou encore des abonnements <a href=\"http://www.gnulinuxmag.com/\">Linux Mag France</a> en contribuant au site :\n	<a href=\"/news/nouveau\">soumission de dépêche</a>, journaux, amélioration du code du site, logos, feuilles de style, etc.\n</p>\n\n\n<h2 id=\"aide-authentification\">Visiteur (non) authentifié, ou pourquoi ouvrir un compte&nbsp;?</h2>\n\n<p>\n	Pour passer du statut de visiteur non authentifié à celui de visiteur authentifié,\n	il suffit de se <a href=\"/inscription\">créer un compte</a> sur le site et de se connecter avec.\n</p>\n<p>Un visiteur non authentifié peut :</p>\n<ul>\n	<li>lire le site (dépêches, journaux, forums, sondages, tâches du système de suivi, les commentaires associés, flux RSS) ;</li>\n	<li>proposer des dépêches et des bogues/suggestions dans le système de suivi.</li>\n</ul>\n<p>Un visiteur authentifié peut :</p>\n<ul>\n	<li>écrire des commentaires sur les différentes ressources du site (dépêches, journaux, forums, sondages, tâches du système de suivi, tribunes) ;</li>\n	<li>activer la barre de navigation du site pour se déplacer plus rapidement dans les nouveaux commentaires ou pour filtrer les commentaires mal notés ;</li>\n	<li>changer l\'apparence du site (choix de la CSS) ;</li>\n	<li>fournir son adresse de courriel pour être contacté ;</li>\n	<li>noter les commentaires des autres visiteurs ;</li>\n	<li>voir les commentaires nouveaux depuis sa dernière visite ;</li>\n	<li>retrouver ses dernières contributions dans sa page personnelle ;</li>\n	<li>écrire dans les forums ou publier des journaux ;</li>\n	<li>voter pour le bogue/la suggestion la plus prioritaire dans le système de suivi ;</li>\n	<li>être remarqué pour la qualité de ses contributions et devenir relecteur ou modérateur.</li>\n</ul>\n\n\n<h2 id=\"aide-toolbar\">Barre d\'outils</h2>\n\n<p>La barre d\'outils (<i>toolbar</i>) du site n\'est que pour les visiteurs authentifiés.</p>\n<p>Elle permet&nbsp;:</p>\n<ul>\n	<li>d\'adapter le seuil de visualisation des commentaires (à -42 vous aurez tout, même les commentaires les plus mal notés)</li>\n	<li>d\'enrouler / dérouler un commentaire avec une élégante petite case [-] ou [+]. C\'est notamment utile pour les commentaires masqués à cause du seuil de visualisation, pour éviter d\'avoir à ouvrir un nouvel onglet/une nouvelle page pour tout de même lire le commentaire</li>\n	<li>de bénéficier d\'une navigation rapide à la souris, en cliquant sur &lt; # &gt;, de nouveau commentaire en nouveau commentaire, pour ne pas user la molette de votre souris</li>\n	<li>de bénéficier d\'une navigation rapide au clavier, avec les touches &lt; et &gt;, de nouveau commentaire en nouveau commentaire, pour ne pas lâcher votre clavier des mains pour utiliser une souris</li>\n</ul>\n\n\n<h2 id=\"aide-boiteperso\">Boîte d\'identification personnelle</h2>\n\n<p>Une boîte d\'identification personnelle apparaît sur chaque page sous le logo. Elle contient différentes informations :</p>\n<ul>\n	<li>Votre login qui pointe vers l\'adresse de votre page personnelle LinuxFr.org&nbsp;;</li>\n	<li>Une ligne qui vous donne le nombre de fois où vous pouvez encore donner votre avis sur un commentaire aujourd\'hui ainsi que le total quotidien. Si vous n\'avez pas cette ligne c\'est que vous n\'avez pas la possibilité de le faire&nbsp;;</li>\n	<li>Différents liens pour la gestion de votre compte&nbsp;;</li>\n</ul>\n<p><i>Note</i> : Le nombre d\'avis auquel vous avez droit peut évoluer.</p>\n\n\n<h2 id=\"aide-note\">Notes sur les contenus</h2>\n\n<p>\n	Les contenus du site (dépêches, journaux, forums, sondages, système de suivi, propositions d\'entretien, etc.)\n	peuvent être notés pertinent (+1) ou inutile (-1).\n</p>\n<p>\n	Il n\'est pas possible de noter ses propres contenus, de noter un même contenu plusieurs fois\n	ou de noter les contenus anciens. Il faut être authentifié pour pouvoir noter un\n	contenu. L\'affichage de la nouvelle note peut être légèrement différée pour des raisons techniques\n	(systèmes de cache en place sur le site).\n</p>\n<p>\n	La <b>note</b> globale d\'un contenu est la somme des notes pertinent (+1) et inutile (-1)\n	mises par les visiteurs. Elle peut être positive, négative ou nulle.\n</p>\n<p>\n	L\'<b>intérêt</b> d\'un contenu est un indicateur calculé à partir de la date de création\n	et de la note globale du contenu. Il sert à trier les contenus récents et bien notés (donc soit\n	les plus récents, soit les suffisamment bien notés et pas trop anciens).\n</p>\n<p>intérêt = date de création + note * coefficient de contenu * coefficient de fréquence</p>\n<ul>\n	<li>date de création en secondes depuis Epoch</li>\n	<li>coefficient de contenu =\n	<ul>\n		<li>dépêches&nbsp;: 3</li>\n		<li>forums&nbsp;: 1</li>\n		<li>journaux&nbsp;: 2</li>\n		<li>sondages&nbsp;: 7</li>\n		<li>système de suivi&nbsp;: 2</li>\n		<li>propositions d\'entretiens&nbsp;: 7</li>\n	</ul></li>\n	<li>coefficient de fréquence&nbsp;: 864 (~ nombre de secondes par jour / nombre de votes par jour)</li>\n</ul>\n\n\n<h2 id=\"aide-fermercompte\">Fermer son compte</h2>\n\n<p>\n	La «&nbsp;fermeture du compte&nbsp;» consiste en une invalidation du compte, qui devient inutilisable.\n	Pour cela, suivez les instructions sur la page de <a href=\"/desinscription\">fermeture de compte</a>.\n	Les contenus et commentaires associés au compte restent inchangés.\n	Si vous ne souhaitez pas que les éventuels nom et prénom renseignés dans les <a href=\"/compte/modifier\">préférences</a> ne continuent d\'apparaître en ligne\n	(et soient donc indexés par les moteurs de recherche),\n	pensez à les supprimer avant de fermer le compte (le changement sera effectif à la prochaine suppression du cache temporaire LinuxFr.org).\n</p>\n<p>\n	Si vous souhaitez ne plus faire apparaître votre pseudo/login pour les mêmes raisons,\n	<a href=\"mailto:administrateurs@linuxfr.org\">envoyez une demande aux administrateurs</a> de fermeture d\'un compte avec anonymisation\n	(tous les contenus et commentaires associés seront affectés à Anonyme).\n	Cette dernière opération est définitive.\n</p>\n<p>Il n\'est pas possible d\'utiliser à nouveau le pseudo/login ou l\'adresse de courriel associés à un compte fermé&nbsp;:</p>\n<ul>\n	<li>supprimer l\'adresse de courriel d\'un compte fermé nécessite de faire une demande aux administrateurs</li>\n	<li>libérer un pseudo/login nécessite une purge du compte et donc une demande aux administrateurs</li>\n</ul>\n<p>\n	La «&nbsp;purge du compte&nbsp;» consiste à totalement supprimer le compte et à anonymiser ou supprimer tous les contenus associés.\n	Seuls les administrateurs peuvent réaliser cette opération, définitive par nature.\n</p>\n','2009-10-20 01:06:31','2009-10-20 01:06:31'),(2,'informations','Informations','<h2>L\'association LinuxFr</h2>\n<p>\n	LinuxFr est une association régie par la loi de 1901, créée fin octobre 1998.\n	Elle a pour objectif de promouvoir les Logiciels Libres, en particulier Linux.\n</p>\n<p>\n	<a href=\"http://www.april.org/\"><img alt=\"Promouvoir et soutenir le logiciel libre\" src=\"http://www.april.org/association/documents/bannieres/membre-de-april.png\" /></a>\n</p>\n<ul>\n	<li>Président : Nicolas Vérité</li>\n	<li>Trésorier : Florent Zara</li>\n	<li>Secrétaire : Amaury Amblard-Ladurantie</li>\n</ul>\n\n<h2>Le site web LinuxFr.org</h2>\n<p>\n	Le site LinuxFr.org est géré par l\'association LinuxFr.\n</p>\n<p>\n	L\'association se réserve le droit de refuser l\'accès au site.\n</p>\n<p>\n	Si un message vous semble contenir des propos diffamatoires, racistes, etc,\n	veuillez nous en <a href=\"mailto:moderateurs_&#64;_linuxfr.org\">avertir</a> dès que\n	possible.\n</p>\n<p>\n	Nous nous réservons le droit d\'effacer toute intervention sur ce site, ainsi\n	que de supprimer tout compte dont l\'utilisation nous semblerait détournée.\n</p>\n<p>\n	En bref, on se réserve le droit de faire ce qu\'on veut.\n</p>\n\n<h2>Le code source de LinuxFr.org</h2>\n<p>\n	Le code source du site web LinuxFr.org est placé sous licence <a href=\"http://www.gnu.org/licenses/agpl.html\">GNU Affero General Public License</a>.\n	Vous pouvez le télécharger sur <a href=\"/code_source_du_site\">cette page</a>.\n</p>\n<p>\n	Si vous souhaitez remonter un bug ou proposer une évolution, vous pouvez le faire dans\n	<a href=\"/suivi/nouveau\">le suivi.</a>\n</p>\n<a href=\"http://www.nojhan.net/geekscottes/index.php?strip=85\"><img alt=\"Linux c\'est fair\" src=\"/images/dessins/geekscottes_084.png\" title=\"Linux c\'est fair - © Johann \'nojhan\' Dréo : 2007-02-06 - Licence CC By-Sa 2.5\" /></a>\n','2009-10-20 01:06:31','2009-10-20 01:06:31'),(3,'code_source_du_site','Code source du site','TODO\n\n<a href=\"/changelog\">Changelog</a>\n','2009-10-20 01:06:31','2009-10-20 01:06:31'),(4,'statistiques','Statistiques','<ul>\n	<li><a href=\"/statistiques/web\">Statistiques web</a></li>\n	<li><a href=\"/statistiques/users\">Statistiques sur les utilisateurs</a></li>\n	<li><a href=\"/statistiques/contents\">Statistiques sur les contenus</a></li>\n	<li><a href=\"/statistiques/tracker\">Statistiques sur le suivi</a></li>\n</ul>\n','2009-10-20 01:06:31','2009-10-20 01:06:31'),(5,'plan','Plan','<p>\n	Si vous êtes perdu, sachez que vous êtes ici sur le site LinuxFr.org,\n	et qu\'il y aura bientôt un plan du site sur cette page.\n	En attendant, vous pouvez toujours naviguer au hasard.\n	Vous avez une probabilité non négligeable de tomber sur un contenu intéressant.\n</p>\n','2009-10-20 01:06:31','2009-10-20 01:06:31'),(6,'faire_un_don','Faire un don','<p>\n	LinuxFr.org c\'était avant tout un site monté par des potes, pour des potes (bon ça\n	fait un moment de ça quand même :). Aujourd\'hui le nombre de visites\n	quotidiennes font que le cercle des proches s\'est un peu élargi. LinuxFr.org a\n	toujours été financé par des particuliers, proches de LinuxFr.org et soutenant son\n	concept et son autonomie. De la machine à l\'hébergement en passant par le\n	travail d\'administration ou de développement, LinuxFr.org a toujours été géré par\n	un groupe restreint de personnes bénévoles motivées.\n</p>\n\n<p>\n	Grâce à de nombreux contributeurs les frais financiers restent\n	relativement faibles. Cependant comme le site ne génère quasiment\n	aucun revenu, les frais engendrés sont quasi-exclusivement financés\n	par les donateurs.\n</p>\n\n<p>\n	Aujourd\'hui, LinuxFr.org ne pourrait pas supporter l\'achat de matériel\n	supplémentaire important, pour quelques raisons que ce soit.\n</p>\n\n<p>\n	Nous avons donc toujours besoin de <b>donations</b>, quel que soit le montant.\n	Le meilleur moyen d\'aider est encore d\'envoyer un chèque à l\'ordre de\n	l\'association LinuxFr à l\'adresse suivante:\n</p>\n\n<pre>\nAssociation LinuxFr\n28 place Jeanne d\'Arc\n75013 Paris\n</pre>\n\n<p>\n	Si vous préférez effectuer un virement bancaire, vous pouvez\n	<a href=\"mailto:webmaster_&#64;_linuxfr.org\">nous contacter</a>, nous vous ferons\n	parvenir les informations nécessaires (RIB).\n</p>\n\n<p>\n	Chaque don est mentionné sur cette page lorsque le donateur ne\n	souhaite pas rester anonyme. Les dons envoyés ne vous permettent pas\n	d\'avoir une réduction d\'impôts, il faudrait que l\'on soit déclaré\n	d\'intérêt public pour ça (mais <a href=\"http://fsffrance.org/donations/howto.fr.html\">ce serait possible</a>,\n	si quelqu\'un souhaite s\'en occuper, qu\'il nous contacte). Nous pouvons\n	vous faire parvenir un reçu si vous le désirez.\n</p>\n','2009-10-20 01:06:31','2009-10-20 01:06:31'),(7,'regles_de_moderation','Regles de moderation','<h2>Ligne éditoriale</h2>\n\n<p>Les thèmes principaux de LinuxFr.org sont Linux et les logiciels libres.\n	D\'autres thèmes peuvent être abordés, mais ils seront généralement alors\n	relégués en seconde page. Les thèmes hors-sujet sont à renvoyer vers les\n	journaux, voire aux calendes grecques.</p>\n\n<p>Évidemment, seulement les dépêches intéressantes doivent être approuvées.\n	Les dépêches les plus intéressantes vont en première page. Les autres en\n	seconde page.</p>\n\n<p>Cependant un effort particulier doit être fait pour :</p>\n\n<ul>\n	<li><p>Éviter les doublons</p>\n\n		<p>En effet, qu\'y a t-il de plus désagréable de voir une dépêche passer\n			plusieurs fois dans le même mois ? En général une dépêche sur un magazine\n			sorti depuis plusieurs jours a de fortes chances d\'être déjà passée. \n			Pour éviter ce problème, il est demandé aux modérateurs de visiter le site\n			_régulièrement_. En cas de départ en vacances ou d\'absence prolongé, merci\n			de visiter les archives à votre retour, et d\'attendre plusieurs jours\n			avant de recommencer à modérer les dépêches en attente.</p></li>\n\n	<li><p>Éviter les fautes d\'orthographe</p>\n\n		<p>Il est très désagréable de lire un texte bourré de fautes de grammaire,\n			d\'orthographe, de ponctuation, d\'anglicismes, etc. Cependant nous faisons\n			tous des fautes, et ce n\'est pas grave, un modérateur les corrigera s\'il en\n			reste. Cependant modérer n\'est pas un travail de 10 secondes, à faire avant\n			de partir déjeuner. En résumé : il faut prendre du temps pour modérer ! Rien\n			ne sert de modérer « en vitesse », c\'est plus négatif qu\'autre chose, et il\n			vaut mieux ne rien faire que faire des bêtises...</p>\n		<p>Donc faire attention aux fautes, et ne pas hésiter à corriger celles que\n			l\'on voit dans des dépêches déjà validées.</p></li>\n\n	<li><p>Rejeter les dépêches non rédigées</p>\n\n		<p>Une dépêche doit être rédigée, un minimum étoffée, fournir un ou plusieurs\n			liens, introduire le contexte, résumer la situation, etc. Celles trop\n			courtes ou trop mal rédigées seront rejetées.</p></li>\n\n	<li><p>Rejeter les dépêches copier/coller</p>\n\n		<p>Une dépêche ne doit pas être une copie d\'un texte recopié sur un autre\n			site, une dépêche d\'agence de presse ou un article de magasine. Les\n			citations sont acceptées, pas le plagiat.</p></li>\n\n	<li><p>Éviter de modérer ses propres dépêches</p>\n\n		<p>Les internautes ont l\'air de ne pas apprécier qu\'un modérateur propose\n			une dépêche, pour la valider tout de suite après. Attendez plutôt qu\'un\n			autre passe par là (sauf exception où le temps presse), et qui pourra de\n			plus corriger vos fautes d\'orthographe. :)</p></li>\n\n	<li><p>Éviter de faire de la publicité gratuite</p>\n\n		<p>LinuxFr.org ne doit pas servir à des gens (particuliers ou société) comme\n			plateforme de publicité. Aussi les communiqués de presse copiés/collés\n			rapidement dans le formulaire ne doivent pas être approuvés. Cependant des\n			exceptions peuvent être faites, au libre jugement du modérateur. Dans le\n			cas où une annonce d\'un logiciel propriétaire est faite, il est de bon ton\n			de rappeler qu\'il existe un équivalent libre si c\'est le cas, et de mettre\n			un lien vers celui-ci.</p>\n\n		<p>Les dépêches concernant la création de nouveaux sites, de demande\n			d\'aide pour un site nouvellement créé, etc ne DOIVENT PAS passer. En\n			effet, si nous le faisions LinuxFr.org serait pollué en permanence. Pour\n			qu\'une telle dépêche soit validée il faut soit que le site existe depuis\n			longtemps, c\'est à dire qu\'il ait un contenu éditorial déjà important, ou\n			il faut qu\'il innove réellement (un site sur un sujet spécial jamais abordé\n			sur le net). LinuxFr.org ne doit pas servir aux webmestres en mal de hits\n			pour avoir une audience plus importante, tout le monde peut installer un\n			CMS sur un sujet précis sinon...</p></li>\n\n	<li><p>Éviter les sentiments</p>\n\n		<p>Une dépêche qui indique un sentiment personnel ne doit pas passer, ou\n			alors elle doit faire l\'objet d\'un texte relativement long, et passer dans\n			la section Humeur. Et même dans ce cas, il convient de faire attention à\n			faire apparaître clairement la personne qui s\'exprime («&nbsp;nous&nbsp;»,\n			«&nbsp;je&nbsp;», etc.).</p></li>\n\n	<li><p>Vérifier les liens</p>\n\n		<p>Il faut vérifier les liens qui sont proposés, voir s\'ils existent, et\n			s\'ils parlent bien du sujet de la dépêche. Un site web perso dans la\n			liste des liens n\'a rien à y faire. Attention aussi à la langue associée à\n			chaque lien.</p></li>\n\n	<li><p>Éviter les attaques</p>\n\n		<p>Afin d\'éviter tout problème juridique, il faut éviter les dépêches qui\n			pourraient être perçues comme diffamantes ou insultantes. Elles n\'ont pas\n			leur place ici. Il faut aussi éviter les appels au boycott (on se\n			réservera quelques exceptions ;) ou les incitations à la délinquance.</p></li>\n\n	<li><p>Éviter les acronymes</p>\n\n		<p>Les acronymes sont souvent utilisés par les habitués de LinuxFr.org.\n			Cependant une population non-négligeable ne les connaît pas. Il est\n			apprécié de les détailler dans une petite note du modérateur.</p></li>\n\n	<li><p>Éviter les liens de liens de ...</p>\n\n		<p>Il arrive souvent qu\'une dépêche soit proposée sur un sujet, et que le\n			lien proposé pointe vers un site de dépêche similaire à LinuxFr.org. Il faut\n			dans ce cas mettre le lien vers l\'information originelle, et\n			éventuellement laisser celui vers le site de dépêche s\'il est intéressant\n			et qu\'il apporte réellement quelque chose. Sinon un simple \"vu sur ...\"\n			sera suffisant.</p></li>\n\n	<li><p>Ne pas tout passer en page principale</p>\n\n		<p>Le nombre de dépêches sur LinuxFr.org devient de plus en plus important.\n			Les gens qui ne visitent pas le site tous les jours (même plus) ne peuvent\n			pas tout voir. Afin d\'aider les visiteurs, ne pas toujours passer les\n			dépêches en page principale peut être appréciable. Par exemple les\n			nouvelles de la section Cinéma n\'ont pas à y être.</p></li> \n\n	<li><p>Éviter les annonces de FooBar 0.0.34.15pre-RC3</p>\n\n		<p>Les dépêches concernant des versions mineures de logiciels doivent être.\n			rejetées. LinuxFr.org n\'a pas vocation à être Freshmeat ou le répertoire.\n			FSF/UNESCO.</p></li>\n\n	<li><p>Faire attention aux nouvelles « Anonyme »</p>\n\n		<p>Certaines nouvelles sont proposées en tant qu\'anonyme. Il faut y faire\n			_très attention_. En effet elles ont souvent tendance à être de moins\n			bonne qualité, être fausses, ou simplement mal rédigées. Aussi si\n			l\'hésitation vous vient, et que la nouvelle est Anonyme, vous l\'effacez !\n			:)</p></li>\n\n	<li><p>Discussions sur la liste de modération</p>\n\n		<p>Lorsque l\'équipe de modération est contactée via sa liste de discussion,\n			par l\'auteur d\'une dépêche insatisfait de la modération ou par toute\n			personne souhaitant poser une question ou obtenir une information, les\n			modérateurs et les relecteurs qui répondent sont priés de mettre la liste\n			en copie, pour que toute l\'équipe puisse suivre la discussion, et de modérer\n			leurs propos car il engage l\'équipe par leurs courriels.</p></li>\n\n	<li><p>Être courtois et ouvert</p> \n\n		<p>De même lors de l\'ajout d\'un commentaire personnalisé lors de la\n			modération, il convient de rester poli et courtois envers le proposant.\n			Il est facile d\'être trop cassant involontairement dans un tel commentaire.</p></li>\n\n\n	<li><p>Indiquer les modifications faites</p>\n\n		<p>Les ajouts au contenu proposé doivent être indiqués par une NdM. Si les\n			retraits modifient profondément le texte, ils doivent être signalés aussi.\n			La terminologie de l\'auteur doit être respectée, sauf si elle est\n			manifestement fausse (donc on garde Linux s\'il dit Linux, GNU/Linux s\'il\n			dit GNU/Linux, open source s\'il dit open source, etc. Par contre les\n			« gestionnaires de fenêtres KDE et GNOME » sera converti en « les\n			gestionnaires de bureau KDE et GNOME », etc.).</p></li>\n</ul>\n\n<h2>Liens utiles</h2>\n\n<p>Voici quelques liens utiles qui peuvent servir aux modérateurs et aux\n	relecteurs.</p>\n\n<p>Dictionnaires français</p>\n\n<ul>\n	<li><a href=\"http://fr.wiktionary.org/\">http://fr.wiktionary.org/</a></li>\n	<li><a href=\"http://www.granddictionnaire.com\">http://www.granddictionnaire.com</a></li>\n	<li><a href=\"http://elsap1.unicaen.fr/cherches.html\">http://elsap1.unicaen.fr/cherches.html</a></li>\n	<li><a href=\"http://atilf.atilf.fr/academie9.htm\">http://atilf.atilf.fr/academie9.htm</a></li>\n	<li><a href=\"http://atilf.atilf.fr/tlf.htm\">http://atilf.atilf.fr/tlf.htm</a></li>\n	<li><a href=\"http://www.lexilogos.com/francais_langue_dictionnaires.htm\">http://www.lexilogos.com/francais_langue_dictionnaires.htm</a></li>\n	<li><a href=\"http://stardict.sourceforge.net/\">StarDict (logiciel)</a></li>\n</ul>\n\n<p>Dictionnaires anglais</p>\n<ul>\n	<li><a href=\"http://en.wiktionary.org/\">http://en.wiktionary.org/</a></li>\n	<li><a href=\"http://www.dictionary.com/\">http://www.dictionary.com/</a></li>\n	<li><a href=\"http://www.m-w.com/\">http://www.m-w.com/</a></li>\n	<li><a href=\"http://stardict.sourceforge.net/\">StarDict (logiciel)</a></li>\n</ul>\n\n<p>Conjugaison</p>\n<ul>\n	<li><a href=\"http://sensmotdire.gnunux.info/\">http://sensmotdire.gnunux.info/</a></li>\n\n	<li><a href=\"http://www.leconjugueur.com/\">http://www.leconjugueur.com/</a></li>\n	<li><a href=\"http://www.logos.it/\">http://www.logos.it/</a></li>\n</ul>\n\n<p>Jargon</p>\n<ul>\n	<li><a href=\"http://www.linux-france.org/prj/jargonf/\">http://www.linux-france.org/prj/jargonf/</a></li>\n	<li><a href=\"http://www.debian.org/international/french/lexique\">http://www.debian.org/international/french/lexique</a></li>\n	<li><a href=\"http://glossaire.traduc.org/\">http://glossaire.traduc.org/</a></li>\n</ul>\n\n<p>Synonymes</p>\n<ul>\n	<li><a href=\"http://elsap1.unicaen.fr/dicosyn.html\">http://elsap1.unicaen.fr/dicosyn.html</a></li>\n</ul>\n\n<h2>Messages automatiques de modération des dépêches</h2>\n{{responses_list}}\n','2009-10-20 01:06:31','2009-10-20 01:06:31'),(8,'team','Team','<h2>Les modérateurs</h2>\n<p>\n	Le site LinuxFr.org tourne entre autres grâce aux modérateurs qui passent (tout ?) leur temps à regarder les contenus soumis par les utilisateurs (vous), éditer les bonnes dépêches, valider les meilleures, et parfois faire passer des doublons.\n</p>\n<p>\n	En cas de problème sur un contenu, sur votre compte LinuxFr.org, vous pouvez les contactez collectivement par courriel &lt;moderateurs_@_linuxfr.org&gt;.\n	Ils tenteront de vous répondre dès que possible (parfois quelques jours).\n</p>\n<p>\n	Les modérateurs actuels sont : {{moderator_list}}.\n</p>\n\n<h2>Les relecteurs</h2>\n<p>\n	Les relecteurs donnent leur avis sur les dépêches en cours d\'attente. Ils peuvent de plus éditer ces dépêches tant qu\'elles ne sont pas publiées, par exemple pour corriger des fautes ou rajouter des informations. Ils sont choisis de manière subjective par les administrateurs.\n\n</p>\n<p>\n	Les modérateurs prennent en compte l\'avis des relecteurs pour l\'acceptation ou le refus des dépêches proposées.\n</p>\n<p>\n	Les relecteurs actuels sont : {{reviewer_list}}.\n</p>\n\n<h2>Les administrateurs</h2>\n<p>\n	Les serveurs de LinuxFr.org sont administrés par une équipe très compétente (sisi, je vous assure).\n	Vous pouvez les contacter par courriel &lt;team_@_linuxfr.org&gt;.\n</p>\n<p>\n	Les administrateurs actuels sont : {{admin_list}}.\n</p>\n\n<h2>Les heureux donateurs</h2>\n<p>\n	Certains personnes semblent vouloir nous envoyer de l\'argent, et nous les en remercions.\n</p>\n\n<h2>Les graphistes</h2>\n<p>\n	Diverses personnes nous ont fourni des logos et bannières, ponctuant les changements de version du site.\n</p>\n\n<h2>Les lecteurs</h2>\n<p>\n	Les lecteurs de LinuxFr.org jouent eux aussi un rôle important en proposant des contenus de qualité (dépêches, journaux, etc.) tout au long de l\'année.\n</p>\n','2009-10-20 01:06:31','2009-10-20 01:06:31'),(9,'contact','Contact','TODO\n','2009-10-20 01:06:31','2009-10-20 01:06:31');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_answers`
--

DROP TABLE IF EXISTS `poll_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `votes` int(11) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_answers`
--

LOCK TABLES `poll_answers` WRITE;
/*!40000 ALTER TABLE `poll_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_ips`
--

DROP TABLE IF EXISTS `poll_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_ips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_poll_ips_on_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_ips`
--

LOCK TABLES `poll_ips` WRITE;
/*!40000 ALTER TABLE `poll_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls`
--

DROP TABLE IF EXISTS `polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cached_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls`
--

LOCK TABLES `polls` WRITE;
/*!40000 ALTER TABLE `polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'published',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cached_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `forum_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readings`
--

DROP TABLE IF EXISTS `readings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `readings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_readings_on_node_id_and_user_id` (`node_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readings`
--

LOCK TABLES `readings` WRITE;
/*!40000 ALTER TABLE `readings` DISABLE KEYS */;
/*!40000 ALTER TABLE `readings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relevances`
--

DROP TABLE IF EXISTS `relevances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relevances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `vote` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relevances`
--

LOCK TABLES `relevances` WRITE;
/*!40000 ALTER TABLE `relevances` DISABLE KEYS */;
/*!40000 ALTER TABLE `relevances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
INSERT INTO `responses` VALUES (1,'Copie de dépêche externe','La dépêche que vous avez proposée n\'est qu\'une copie d\'un article\nprovenant d\'un autre site (en partie ou en entier).\nNous refusons ce genre d\'article, même si la source est citée.'),(2,'Dépêche trop courte','La dépêche que vous avez proposée a été considérée trop courte pour être\nvalidée sur LinuxFr.org. En effet, nous n\'acceptons que des dépêches de\nplusieurs lignes, comme celles qui passent sur le site habituellement.'),(3,'Dépêche déjà publiée','Le sujet de la dépêche que vous avez proposée a déjà fait l\'objet d\'une\ndépêche publiée sur LinuxFr.org. Pour cette raison, votre dépêche a été\nrefusée.'),(4,'Dépêche déjà proposée','Une ou plusieurs autres dépêches sur le même sujet a (ont) déjà été\nproposée(s) par un (ou plusieurs) autre(s) internaute(s). Dès qu\'un\nmodérateur pourra s\'en occuper, il utilisera celle qui lui semble la\nmieux rédigée.'),(5,'Dépêche hors sujet','La dépêche que vous avez envoyée est hors-sujet par rapport au site. Si\nLinuxFr.org valide parfois les dépêches hors-sujet, celle-ci n\'a pas\nretenu l\'attention des modérateurs.'),(6,'Redirection forum','Une entrée dans un forum serait plus adaptée pour poser cette question.\nNous tenons à vous remercier de l\'avoir proposée, et nous\nvous encourageons à la poser dans un des forums du site.\n\nhttp://linuxfr.org/posts/nouveau'),(7,'Redirection journal','Votre journal est peut-être plus adapté pour passer cette information.\n\nhttp://linuxfr.org//journaux/nouveau'),(8,'Problèmes de rédaction','Cette dépêche pose des problèmes de rédaction, et il nous est difficile\nde la valider telle quelle. Pourriez-vous re-rédiger cette dépêche s\'il\nvous plaît ?'),(9,'Site (presque) vide','LinuxFr.org préfère valider des dépêches de ce type quand le site est\ndéjà bien avancé. Si d\'ici quelques temps, c\'est le cas, n\'hésitez pas\nà re-proposer une dépêche.'),(10,'Version mineure du logiciel','Votre dépêche traite d\'une version mineure d\'un logiciel, et n\'apporte\nrien de fort d\'un point de vue information. Pour cette raison elle a été\nrefusée.');
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20090105233501'),('20090105234709'),('20090106000348'),('20090108232844'),('20090108235238'),('20090110185148'),('20090113223625'),('20090119235401'),('20090120005239'),('20090130001540'),('20090205000452'),('20090209225424'),('20090209232103'),('20090216004002'),('20090222161451'),('20090224230430'),('20090301003322'),('20090301003336'),('20090308230814'),('20090308232205'),('20090310234743'),('20090324234852'),('20090505233940'),('20090522224128'),('20090606160832'),('20090613235019'),('20090621214959'),('20090802201439'),('20090805232718');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'published',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cached_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sluggable_id` int(11) DEFAULT NULL,
  `sequence` int(11) NOT NULL DEFAULT '1',
  `sluggable_type` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_slugs_on_name_and_sluggable_type_and_scope_and_sequence` (`name`,`sluggable_type`,`scope`,`sequence`),
  KEY `index_slugs_on_sluggable_id` (`sluggable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taggings_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackers`
--

DROP TABLE IF EXISTS `trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cached_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `category_id` int(11) DEFAULT NULL,
  `assigned_to_user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackers`
--

LOCK TABLES `trackers` WRITE;
/*!40000 ALTER TABLE `trackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homesite` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jabber_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'moule',
  `cached_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  `vote` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_pages`
--

DROP TABLE IF EXISTS `wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'public',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cached_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_pages`
--

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-10-20  1:08:23
