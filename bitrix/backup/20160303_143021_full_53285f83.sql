-- Started: 2016-03-03 14:30:21
SET NAMES 'cp1251';
-- -----------------------------------
-- Dumping table b_admin_notify
-- -----------------------------------
DROP TABLE IF EXISTS `b_admin_notify`;
CREATE TABLE `b_admin_notify` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `MESSAGE` text,
  `ENABLE_CLOSE` char(1) DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_admin_notify_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_admin_notify_lang`;
CREATE TABLE `b_admin_notify_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(18) NOT NULL,
  `LID` char(2) NOT NULL,
  `MESSAGE` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_agent
-- -----------------------------------
DROP TABLE IF EXISTS `b_agent`;
CREATE TABLE `b_agent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` text,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT '86400',
  `IS_PERIOD` char(1) DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  `RUNNING` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=cp1251;

INSERT INTO `b_agent` VALUES
(1, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2016-03-03 00:00:00', '2016-03-04 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
(2, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2016-03-03 00:00:00', '2016-03-04 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
(3, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2016-03-03 13:33:15', '2016-03-03 14:33:15', NULL, 3600, 'N', NULL, 'N'),
(4, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2016-03-03 00:00:00', '2016-03-04 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
(5, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', '2016-03-03 06:35:35', '2016-03-04 06:35:35', NULL, 86400, 'N', NULL, 'N'),
(6, 'catalog', 100, '\\Bitrix\\Catalog\\CatalogViewedProductTable::clearAgent();', 'Y', '2016-02-29 16:41:08', '2016-03-05 16:41:08', NULL, 432000, 'N', NULL, 'N'),
(7, 'currency', 100, '\\Bitrix\\Currency\\CurrencyManager::currencyBaseRateAgent();', 'Y', '2016-03-03 00:01:01', '2016-03-04 00:01:00', NULL, 86400, 'Y', NULL, 'N'),
(8, 'forum', 100, 'CForumStat::CleanUp();', 'Y', '2016-03-03 06:35:35', '2016-03-04 06:35:35', NULL, 86400, 'N', NULL, 'N'),
(9, 'forum', 100, 'CForumFiles::CleanUp();', 'Y', '2016-03-03 06:35:35', '2016-03-04 06:35:35', NULL, 86400, 'N', NULL, 'N'),
(13, 'sale', 100, 'CSaleRecurring::AgentCheckRecurring();', 'Y', '2016-03-03 14:09:01', '2016-03-03 16:09:01', NULL, 7200, 'N', NULL, 'N'),
(14, 'sale', 100, 'CSaleOrder::RemindPayment();', 'Y', '2016-03-03 06:35:35', '2016-03-04 06:35:35', NULL, 86400, 'N', NULL, 'N'),
(15, 'sale', 100, 'CSaleViewedProduct::ClearViewed();', 'Y', '2016-03-03 06:35:35', '2016-03-04 06:35:35', NULL, 86400, 'N', NULL, 'N'),
(19, 'search', 10, 'CSearchSuggest::CleanUpAgent();', 'Y', '2016-03-03 06:35:35', '2016-03-04 06:35:35', NULL, 86400, 'N', NULL, 'N'),
(20, 'search', 10, 'CSearchStatistic::CleanUpAgent();', 'Y', '2016-03-03 06:35:35', '2016-03-04 06:35:35', NULL, 86400, 'N', NULL, 'N'),
(22, 'security', 100, 'CSecuritySession::CleanUpAgent();', 'Y', '2016-03-03 14:04:59', '2016-03-03 14:34:59', NULL, 1800, 'N', NULL, 'N'),
(23, 'security', 100, 'CSecurityIPRule::CleanUpAgent();', 'Y', '2016-03-03 13:33:15', '2016-03-03 14:33:15', NULL, 3600, 'N', NULL, 'N'),
(25, 'seo', 100, 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2016-03-03 13:33:15', '2016-03-03 14:33:15', NULL, 3600, 'N', NULL, 'N'),
(26, 'seo', 100, 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2016-03-03 06:35:35', '2016-03-04 06:35:35', NULL, 86400, 'N', NULL, 'N'),
(29, 'storeassist', 100, 'CStoreAssist::AgentCountDayOrders();', 'Y', '2016-03-03 06:35:35', '2016-03-04 06:35:35', NULL, 86400, 'N', NULL, 'N'),
(31, 'subscribe', 100, 'CSubscription::CleanUp();', 'Y', '2016-03-03 03:00:28', '2016-03-04 03:00:00', NULL, 86400, 'Y', NULL, 'N'),
(34, 'pull', 100, 'CPullChannel::CheckExpireAgent();', 'Y', '2016-03-03 06:36:00', '2016-03-03 18:36:00', NULL, 43200, 'N', NULL, 'N'),
(35, 'pull', 100, 'CPullStack::CheckExpireAgent();', 'Y', '2016-03-03 06:35:35', '2016-03-04 06:35:35', NULL, 86400, 'N', NULL, 'N'),
(36, 'pull', 100, 'CPullWatch::CheckExpireAgent();', 'Y', '2016-03-03 14:26:18', '2016-03-03 14:46:18', NULL, 600, 'N', NULL, 'N'),
(65, 'sale', 100, 'CSaleOrder::ClearProductReservedQuantity();', 'Y', '2016-03-03 06:35:35', '2016-03-04 06:35:35', NULL, 86400, 'N', NULL, 'N'),
(69, 'seo', 100, 'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();', 'Y', '2016-03-03 13:33:15', '2016-03-03 14:33:15', NULL, 3600, 'N', NULL, 'N'),
(84, 'main', 100, '\\Bitrix\\Main\\Data\\CacheEngineFiles::delayedDelete();', 'Y', NULL, '2016-03-03 00:00:00', NULL, 1, 'Y', NULL, 'N');
-- -----------------------------------
-- Dumping table b_app_password
-- -----------------------------------
DROP TABLE IF EXISTS `b_app_password`;
CREATE TABLE `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `DIGEST_PASSWORD` varchar(255) NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) DEFAULT NULL,
  `COMMENT` varchar(255) DEFAULT NULL,
  `SYSCOMMENT` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_bitrixcloud_option
-- -----------------------------------
DROP TABLE IF EXISTS `b_bitrixcloud_option`;
CREATE TABLE `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) DEFAULT NULL,
  `PARAM_VALUE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251;

INSERT INTO `b_bitrixcloud_option` VALUES
(1, 'backup_quota', 0, '0', '0'),
(2, 'backup_total_size', 0, '0', '0'),
(3, 'backup_last_backup_time', 0, '0', '1428912459'),
(4, 'monitoring_expire_time', 0, '0', '1457029751');
-- -----------------------------------
-- Dumping table b_blog
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog`;
CREATE TABLE `b_blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `OWNER_ID` int(11) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `URL` varchar(255) NOT NULL,
  `REAL_URL` varchar(255) DEFAULT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ENABLE_COMMENTS` char(1) NOT NULL DEFAULT 'Y',
  `ENABLE_IMG_VERIF` char(1) NOT NULL DEFAULT 'N',
  `ENABLE_RSS` char(1) NOT NULL DEFAULT 'Y',
  `LAST_POST_ID` int(11) DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `AUTO_GROUPS` varchar(255) DEFAULT NULL,
  `EMAIL_NOTIFY` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) NOT NULL DEFAULT 'N',
  `SEARCH_INDEX` char(1) NOT NULL DEFAULT 'Y',
  `USE_SOCNET` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_BLOG_4` (`URL`),
  KEY `IX_BLOG_BLOG_1` (`GROUP_ID`,`ACTIVE`),
  KEY `IX_BLOG_BLOG_2` (`OWNER_ID`),
  KEY `IX_BLOG_BLOG_5` (`LAST_POST_DATE`),
  KEY `IX_BLOG_BLOG_6` (`SOCNET_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_category
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_category`;
CREATE TABLE `b_blog_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_CAT_1` (`BLOG_ID`,`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_comment
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_comment`;
CREATE TABLE `b_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) DEFAULT NULL,
  `AUTHOR_IP` varchar(20) DEFAULT NULL,
  `AUTHOR_IP1` varchar(20) DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `POST_TEXT` text NOT NULL,
  `PUBLISH_STATUS` char(1) NOT NULL DEFAULT 'P',
  `HAS_PROPS` varchar(1) DEFAULT NULL,
  `SHARE_DEST` varchar(255) DEFAULT NULL,
  `PATH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_COMM_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_COMM_2` (`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_3` (`DATE_CREATE`,`AUTHOR_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_group`;
CREATE TABLE `b_blog_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_GROUP_1` (`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_image
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_image`;
CREATE TABLE `b_blog_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL DEFAULT '0',
  `BLOG_ID` int(11) NOT NULL DEFAULT '0',
  `POST_ID` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TITLE` varchar(255) DEFAULT NULL,
  `IMAGE_SIZE` int(11) NOT NULL DEFAULT '0',
  `IS_COMMENT` varchar(1) NOT NULL DEFAULT 'N',
  `COMMENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_IMAGE_1` (`POST_ID`,`BLOG_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_post
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_post`;
CREATE TABLE `b_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `AUTHOR_ID` int(11) NOT NULL,
  `PREVIEW_TEXT` text,
  `PREVIEW_TEXT_TYPE` char(4) NOT NULL DEFAULT 'text',
  `DETAIL_TEXT` text NOT NULL,
  `DETAIL_TEXT_TYPE` char(4) NOT NULL DEFAULT 'text',
  `DATE_CREATE` datetime NOT NULL,
  `DATE_PUBLISH` datetime NOT NULL,
  `KEYWORDS` varchar(255) DEFAULT NULL,
  `PUBLISH_STATUS` char(1) NOT NULL DEFAULT 'P',
  `CATEGORY_ID` char(100) DEFAULT NULL,
  `ATRIBUTE` varchar(255) DEFAULT NULL,
  `ENABLE_TRACKBACK` char(1) NOT NULL DEFAULT 'Y',
  `ENABLE_COMMENTS` char(1) NOT NULL DEFAULT 'Y',
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `NUM_COMMENTS` int(11) NOT NULL DEFAULT '0',
  `NUM_TRACKBACKS` int(11) NOT NULL DEFAULT '0',
  `VIEWS` int(11) DEFAULT NULL,
  `FAVORITE_SORT` int(11) DEFAULT NULL,
  `PATH` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `MICRO` char(1) NOT NULL DEFAULT 'N',
  `HAS_IMAGES` varchar(1) DEFAULT NULL,
  `HAS_PROPS` varchar(1) DEFAULT NULL,
  `HAS_TAGS` varchar(1) DEFAULT NULL,
  `HAS_COMMENT_IMAGES` varchar(1) DEFAULT NULL,
  `HAS_SOCNET_ALL` varchar(1) DEFAULT NULL,
  `SEO_TITLE` varchar(255) DEFAULT NULL,
  `SEO_TAGS` varchar(255) DEFAULT NULL,
  `SEO_DESCRIPTION` text,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_POST_1` (`BLOG_ID`,`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_2` (`BLOG_ID`,`DATE_PUBLISH`,`PUBLISH_STATUS`),
  KEY `IX_BLOG_POST_3` (`BLOG_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_4` (`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_5` (`DATE_PUBLISH`,`AUTHOR_ID`),
  KEY `IX_BLOG_POST_CODE` (`BLOG_ID`,`CODE`),
  KEY `IX_BLOG_POST_6` (`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_post_category
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_post_category`;
CREATE TABLE `b_blog_post_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_POST_CATEGORY` (`POST_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_CATEGORY_CAT_ID` (`CATEGORY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_post_param
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_post_param`;
CREATE TABLE `b_blog_post_param` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_PP_1` (`POST_ID`,`USER_ID`),
  KEY `IX_BLOG_PP_2` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_site_path
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_site_path`;
CREATE TABLE `b_blog_site_path` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `PATH` varchar(255) NOT NULL,
  `TYPE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SITE_PATH_2` (`SITE_ID`,`TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_smile
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_smile`;
CREATE TABLE `b_blog_smile` (
  `ID` smallint(3) NOT NULL AUTO_INCREMENT,
  `SMILE_TYPE` char(1) NOT NULL DEFAULT 'S',
  `TYPING` varchar(100) DEFAULT NULL,
  `IMAGE` varchar(128) NOT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  `CLICKABLE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=cp1251;

INSERT INTO `b_blog_smile` VALUES
(1, 'S', ':D :-D', 'icon_biggrin.png', NULL, 'Y', 120, 16, 16),
(2, 'S', ':) :-)', 'icon_smile.png', NULL, 'Y', 100, 16, 16),
(3, 'S', ':( :-(', 'icon_sad.png', NULL, 'Y', 140, 16, 16),
(4, 'S', ':o :-o :shock:', 'icon_eek.png', NULL, 'Y', 180, 16, 16),
(5, 'S', '8) 8-)', 'icon_cool.png', NULL, 'Y', 130, 16, 16),
(6, 'S', ':{} :-{}', 'icon_kiss.png', NULL, 'Y', 200, 16, 16),
(7, 'S', ':oops:', 'icon_redface.png', NULL, 'Y', 190, 16, 16),
(8, 'S', ':cry: :~(', 'icon_cry.png', NULL, 'Y', 160, 16, 16),
(9, 'S', ':evil: >:-<', 'icon_evil.png', NULL, 'Y', 170, 16, 16),
(10, 'S', ';) ;-)', 'icon_wink.png', NULL, 'Y', 110, 16, 16),
(11, 'S', ':!:', 'icon_exclaim.png', NULL, 'Y', 220, 16, 16),
(12, 'S', ':?:', 'icon_question.png', NULL, 'Y', 210, 16, 16),
(13, 'S', ':idea:', 'icon_idea.png', NULL, 'Y', 230, 16, 16),
(14, 'S', ':| :-|', 'icon_neutral.png', NULL, 'Y', 150, 16, 16);
-- -----------------------------------
-- Dumping table b_blog_smile_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_smile_lang`;
CREATE TABLE `b_blog_smile_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SMILE_ID` int(11) NOT NULL DEFAULT '0',
  `LID` char(2) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SMILE_K` (`SMILE_ID`,`LID`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=cp1251;

INSERT INTO `b_blog_smile_lang` VALUES
(1, 1, 'ru', 'Широкая улыбка'),
(2, 1, 'en', 'Big grin'),
(3, 2, 'ru', 'С улыбкой'),
(4, 2, 'en', 'Smile'),
(5, 3, 'ru', 'Печально'),
(6, 3, 'en', 'Sad'),
(7, 4, 'ru', 'Удивленно'),
(8, 4, 'en', 'Surprised'),
(9, 5, 'ru', 'Здорово'),
(10, 5, 'en', 'Cool'),
(11, 6, 'ru', 'Поцелуй'),
(12, 6, 'en', 'Kiss'),
(13, 7, 'ru', 'Смущенный'),
(14, 7, 'en', 'Embarrassed'),
(15, 8, 'ru', 'Очень грустно'),
(16, 8, 'en', 'Crying'),
(17, 9, 'ru', 'Со злостью'),
(18, 9, 'en', 'Angry'),
(19, 10, 'ru', 'Шутливо'),
(20, 10, 'en', 'Wink'),
(21, 11, 'ru', 'Восклицание'),
(22, 11, 'en', 'Exclamation'),
(23, 12, 'ru', 'Вопрос'),
(24, 12, 'en', 'Question'),
(25, 13, 'ru', 'Идея'),
(26, 13, 'en', 'Idea'),
(27, 14, 'ru', 'Скептически'),
(28, 14, 'en', 'Skeptic');
-- -----------------------------------
-- Dumping table b_blog_socnet
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_socnet`;
CREATE TABLE `b_blog_socnet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SOCNET` (`BLOG_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_socnet_rights
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_socnet_rights`;
CREATE TABLE `b_blog_socnet_rights` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(45) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_SR_1` (`POST_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_trackback
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_trackback`;
CREATE TABLE `b_blog_trackback` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `PREVIEW_TEXT` text NOT NULL,
  `BLOG_NAME` varchar(255) DEFAULT NULL,
  `POST_DATE` datetime NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_TRBK_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_TRBK_2` (`POST_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_user`;
CREATE TABLE `b_blog_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` text,
  `AVATAR` int(11) DEFAULT NULL,
  `INTERESTS` varchar(255) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DATE_REG` datetime NOT NULL,
  `ALLOW_POST` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER_1` (`USER_ID`),
  KEY `IX_BLOG_USER_2` (`ALIAS`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

INSERT INTO `b_blog_user` VALUES
(1, 1, '', '', NULL, '', NULL, '2015-05-13 13:10:40', 'Y');
-- -----------------------------------
-- Dumping table b_blog_user2blog
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_user2blog`;
CREATE TABLE `b_blog_user2blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`BLOG_ID`,`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_user2user_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_user2user_group`;
CREATE TABLE `b_blog_user2user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`USER_ID`,`BLOG_ID`,`USER_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_blog_user_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_user_group`;
CREATE TABLE `b_blog_user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_USER_GROUP_1` (`BLOG_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=cp1251;

INSERT INTO `b_blog_user_group` VALUES
(1, NULL, 'all'),
(2, NULL, 'registered');
-- -----------------------------------
-- Dumping table b_blog_user_group_perms
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_user_group_perms`;
CREATE TABLE `b_blog_user_group_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  `PERMS_TYPE` char(1) NOT NULL DEFAULT 'P',
  `POST_ID` int(11) DEFAULT NULL,
  `PERMS` char(1) NOT NULL DEFAULT 'D',
  `AUTOSET` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_UG_PERMS_1` (`BLOG_ID`,`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_2` (`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_3` (`POST_ID`,`USER_GROUP_ID`,`PERMS_TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_cache_tag
-- -----------------------------------
DROP TABLE IF EXISTS `b_cache_tag`;
CREATE TABLE `b_cache_tag` (
  `SITE_ID` char(2) DEFAULT NULL,
  `CACHE_SALT` char(4) DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) DEFAULT NULL,
  `TAG` varchar(100) DEFAULT NULL,
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_cache_tag` VALUES
('*', '*', '/bitrix/cache/ee.~6685', '*'),
('*', '*', '/bitrix/cache/c3.~993504', '*'),
('*', '*', '/bitrix/cache/82.~931364', '*'),
('*', '*', '/bitrix/cache/css.~879531', '*'),
('*', '*', '/bitrix/cache/ce.~208742', '*'),
('*', '*', '/bitrix/cache/medialib.~691327', '*'),
('*', '*', '/bitrix/cache/js.~880792', '*'),
('*', '*', '/bitrix/cache/s1.~46738', '*'),
('*', '*', '/bitrix/cache/a0.~379725', '*'),
('*', '*', '/bitrix/cache/7b.~704673', '*'),
('*', '*', '/bitrix/cache/62.~746483', '*'),
('*', '*', '/bitrix/cache/0a.~204023', '*'),
('*', '*', '/bitrix/cache/4a.~742313', '*'),
('*', '*', '/bitrix/cache/05.~631515', '*'),
('*', '*', '/bitrix/cache/50.~440760', '*'),
('*', '*', '/bitrix/managed_cache/MYSQL/agents.~659049', '*'),
('*', '*', '/bitrix/cache/d6.~371617', '*'),
('*', '*', '/bitrix/stack_cache/MYSQL.~661791', '*'),
('*', '*', '/bitrix/cache/c4.~164219', '*'),
('*', '*', '/bitrix/cache/a6.~855214', '*'),
('*', '*', '/bitrix/managed_cache/MYSQL.~312196', '*');
-- -----------------------------------
-- Dumping table b_captcha
-- -----------------------------------
DROP TABLE IF EXISTS `b_captcha`;
CREATE TABLE `b_captcha` (
  `ID` varchar(32) NOT NULL,
  `CODE` varchar(20) NOT NULL,
  `IP` varchar(15) NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_contractor
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_contractor`;
CREATE TABLE `b_catalog_contractor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERSON_TYPE` char(1) NOT NULL,
  `PERSON_NAME` varchar(100) DEFAULT NULL,
  `PERSON_LASTNAME` varchar(100) DEFAULT NULL,
  `PERSON_MIDDLENAME` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PHONE` varchar(45) DEFAULT NULL,
  `POST_INDEX` varchar(45) DEFAULT NULL,
  `COUNTRY` varchar(45) DEFAULT NULL,
  `CITY` varchar(45) DEFAULT NULL,
  `COMPANY` varchar(145) DEFAULT NULL,
  `INN` varchar(145) DEFAULT NULL,
  `KPP` varchar(145) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_currency
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_currency`;
CREATE TABLE `b_catalog_currency` (
  `CURRENCY` char(3) NOT NULL,
  `AMOUNT_CNT` int(11) NOT NULL DEFAULT '1',
  `AMOUNT` decimal(18,4) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DATE_UPDATE` datetime NOT NULL,
  `NUMCODE` char(3) DEFAULT NULL,
  `BASE` char(1) NOT NULL DEFAULT 'N',
  `CREATED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CURRENT_BASE_RATE` decimal(26,12) DEFAULT NULL,
  PRIMARY KEY (`CURRENCY`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_catalog_currency` VALUES
('RUB', 1, 1.0000, 100, '2015-04-13 11:03:52', NULL, 'Y', NULL, '2015-04-13 11:03:52', NULL, 1.000000000000),
('USD', 1, 32.3000, 200, '2015-04-13 11:03:52', NULL, 'N', NULL, '2015-04-13 11:03:52', NULL, 32.300000000000),
('EUR', 1, 43.8000, 300, '2015-04-13 11:03:52', NULL, 'N', NULL, '2015-04-13 11:03:52', NULL, 43.800000000000),
('UAH', 10, 39.4100, 400, '2015-04-13 11:03:52', NULL, 'N', NULL, '2015-04-13 11:03:52', NULL, 3.941000000000),
('BYR', 10000, 36.7200, 500, '2015-04-13 11:03:52', NULL, 'N', NULL, '2015-04-13 11:03:52', NULL, 0.003672000000);
-- -----------------------------------
-- Dumping table b_catalog_currency_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_currency_lang`;
CREATE TABLE `b_catalog_currency_lang` (
  `CURRENCY` char(3) NOT NULL,
  `LID` char(2) NOT NULL,
  `FORMAT_STRING` varchar(50) NOT NULL,
  `FULL_NAME` varchar(50) DEFAULT NULL,
  `DEC_POINT` varchar(5) DEFAULT '.',
  `THOUSANDS_SEP` varchar(5) DEFAULT ' ',
  `DECIMALS` tinyint(4) NOT NULL DEFAULT '2',
  `THOUSANDS_VARIANT` char(1) DEFAULT NULL,
  `HIDE_ZERO` char(1) NOT NULL DEFAULT 'N',
  `CREATED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  PRIMARY KEY (`CURRENCY`,`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_catalog_currency_lang` VALUES
('RUB', 'ru', '# руб.', 'Рубль', '.', '', 2, 'S', 'Y', NULL, '2015-04-13 11:03:52', NULL, '2015-04-13 11:03:52'),
('USD', 'ru', '$#', 'Доллар США', '.', '', 2, 'C', 'Y', NULL, '2015-04-13 11:03:52', NULL, '2015-04-13 11:03:52'),
('EUR', 'ru', '&euro;#', 'Евро', '.', '', 2, 'C', 'Y', NULL, '2015-04-13 11:03:52', NULL, '2015-04-13 11:03:52'),
('UAH', 'ru', '# грн.', 'Гривна', '.', '', 2, 'S', 'Y', NULL, '2015-04-13 11:03:52', NULL, '2015-04-13 11:03:52'),
('BYR', 'ru', '# руб.', 'Белорусский рубль', '.', '', 2, 'S', 'Y', NULL, '2015-04-13 11:03:52', NULL, '2015-04-13 11:03:52'),
('RUB', 'en', '# rub.', 'Ruble', '.', '', 2, 'S', 'Y', NULL, '2015-04-13 11:03:52', NULL, '2015-04-13 11:03:52'),
('USD', 'en', '$#', 'US Dollar', '.', '', 2, 'C', 'Y', NULL, '2015-04-13 11:03:52', NULL, '2015-04-13 11:03:52'),
('EUR', 'en', '&euro;#', 'Euro', '.', '', 2, 'C', 'Y', NULL, '2015-04-13 11:03:52', NULL, '2015-04-13 11:03:52'),
('UAH', 'en', 'UAH #', 'UAH', '.', '', 2, 'S', 'Y', NULL, '2015-04-13 11:03:52', NULL, '2015-04-13 11:03:52'),
('BYR', 'en', '# BYR', 'Belarusian ruble', '.', '', 2, 'S', 'Y', NULL, '2015-04-13 11:03:52', NULL, '2015-04-13 11:03:52');
-- -----------------------------------
-- Dumping table b_catalog_currency_rate
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_currency_rate`;
CREATE TABLE `b_catalog_currency_rate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CURRENCY` char(3) NOT NULL,
  `DATE_RATE` date NOT NULL,
  `RATE_CNT` int(11) NOT NULL DEFAULT '1',
  `RATE` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `CREATED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_CURRENCY_RATE` (`CURRENCY`,`DATE_RATE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_disc_save_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_disc_save_group`;
CREATE TABLE `b_catalog_disc_save_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CAT_DSG_DISCOUNT` (`DISCOUNT_ID`),
  KEY `IX_CAT_DSG_GROUP` (`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_disc_save_range
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_disc_save_range`;
CREATE TABLE `b_catalog_disc_save_range` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `RANGE_FROM` double NOT NULL,
  `TYPE` char(1) NOT NULL DEFAULT 'P',
  `VALUE` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CAT_DSR_DISCOUNT` (`DISCOUNT_ID`),
  KEY `IX_CAT_DSR_DISCOUNT2` (`DISCOUNT_ID`,`RANGE_FROM`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_disc_save_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_disc_save_user`;
CREATE TABLE `b_catalog_disc_save_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `ACTIVE_FROM` datetime NOT NULL,
  `ACTIVE_TO` datetime NOT NULL,
  `RANGE_FROM` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CAT_DSU_DISCOUNT` (`DISCOUNT_ID`),
  KEY `IX_CAT_DSU_USER` (`DISCOUNT_ID`,`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_discount
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_discount`;
CREATE TABLE `b_catalog_discount` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) DEFAULT NULL,
  `SITE_ID` char(2) NOT NULL,
  `TYPE` int(11) NOT NULL DEFAULT '0',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `RENEWAL` char(1) NOT NULL DEFAULT 'N',
  `NAME` varchar(255) DEFAULT NULL,
  `MAX_USES` int(11) NOT NULL DEFAULT '0',
  `COUNT_USES` int(11) NOT NULL DEFAULT '0',
  `COUPON` varchar(20) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `MAX_DISCOUNT` decimal(18,4) DEFAULT NULL,
  `VALUE_TYPE` char(1) NOT NULL DEFAULT 'P',
  `VALUE` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `CURRENCY` char(3) NOT NULL,
  `MIN_ORDER_SUM` decimal(18,4) DEFAULT '0.0000',
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `COUNT_PERIOD` char(1) NOT NULL DEFAULT 'U',
  `COUNT_SIZE` int(11) NOT NULL DEFAULT '0',
  `COUNT_TYPE` char(1) NOT NULL DEFAULT 'Y',
  `COUNT_FROM` datetime DEFAULT NULL,
  `COUNT_TO` datetime DEFAULT NULL,
  `ACTION_SIZE` int(11) NOT NULL DEFAULT '0',
  `ACTION_TYPE` char(1) NOT NULL DEFAULT 'Y',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `PRIORITY` int(18) NOT NULL DEFAULT '1',
  `LAST_DISCOUNT` char(1) NOT NULL DEFAULT 'Y',
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `NOTES` varchar(255) DEFAULT NULL,
  `CONDITIONS` text,
  `UNPACK` text,
  PRIMARY KEY (`ID`),
  KEY `IX_C_D_COUPON` (`COUPON`),
  KEY `IX_C_D_ACT` (`ACTIVE`,`ACTIVE_FROM`,`ACTIVE_TO`),
  KEY `IX_C_D_ACT_B` (`SITE_ID`,`RENEWAL`,`ACTIVE`,`ACTIVE_FROM`,`ACTIVE_TO`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_discount2cat
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_discount2cat`;
CREATE TABLE `b_catalog_discount2cat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `CATALOG_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_C_D2C_CATDIS` (`CATALOG_GROUP_ID`,`DISCOUNT_ID`),
  UNIQUE KEY `IX_C_D2C_CATDIS_B` (`DISCOUNT_ID`,`CATALOG_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_discount2group
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_discount2group`;
CREATE TABLE `b_catalog_discount2group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_C_D2G_GRDIS` (`GROUP_ID`,`DISCOUNT_ID`),
  UNIQUE KEY `IX_C_D2G_GRDIS_B` (`DISCOUNT_ID`,`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_discount2iblock
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_discount2iblock`;
CREATE TABLE `b_catalog_discount2iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_C_D2I_IBDIS` (`IBLOCK_ID`,`DISCOUNT_ID`),
  UNIQUE KEY `IX_C_D2I_IBDIS_B` (`DISCOUNT_ID`,`IBLOCK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_discount2product
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_discount2product`;
CREATE TABLE `b_catalog_discount2product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_C_D2P_PRODIS` (`PRODUCT_ID`,`DISCOUNT_ID`),
  UNIQUE KEY `IX_C_D2P_PRODIS_B` (`DISCOUNT_ID`,`PRODUCT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_discount2section
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_discount2section`;
CREATE TABLE `b_catalog_discount2section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_C_D2S_SECDIS` (`SECTION_ID`,`DISCOUNT_ID`),
  UNIQUE KEY `IX_C_D2S_SECDIS_B` (`DISCOUNT_ID`,`SECTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_discount_cond
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_discount_cond`;
CREATE TABLE `b_catalog_discount_cond` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `ACTIVE` char(1) DEFAULT NULL,
  `USER_GROUP_ID` int(11) NOT NULL DEFAULT '-1',
  `PRICE_TYPE_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_discount_coupon
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_discount_coupon`;
CREATE TABLE `b_catalog_discount_coupon` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `COUPON` varchar(32) NOT NULL,
  `DATE_APPLY` datetime DEFAULT NULL,
  `ONE_TIME` char(1) NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_cat_dc_index1` (`DISCOUNT_ID`,`COUPON`),
  KEY `ix_cat_dc_index2` (`COUPON`,`ACTIVE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_discount_module
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_discount_module`;
CREATE TABLE `b_catalog_discount_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CAT_DSC_MOD` (`DISCOUNT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_docs_barcode
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_docs_barcode`;
CREATE TABLE `b_catalog_docs_barcode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOC_ELEMENT_ID` int(11) NOT NULL,
  `BARCODE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CATALOG_DOCS_BARCODE1` (`DOC_ELEMENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_docs_element
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_docs_element`;
CREATE TABLE `b_catalog_docs_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOC_ID` int(11) NOT NULL,
  `STORE_FROM` int(11) DEFAULT NULL,
  `STORE_TO` int(11) DEFAULT NULL,
  `ELEMENT_ID` int(11) DEFAULT NULL,
  `AMOUNT` double DEFAULT NULL,
  `PURCHASING_PRICE` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CATALOG_DOCS_ELEMENT1` (`DOC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_export
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_export`;
CREATE TABLE `b_catalog_export` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_NAME` varchar(100) NOT NULL,
  `NAME` varchar(250) NOT NULL,
  `DEFAULT_PROFILE` char(1) NOT NULL DEFAULT 'N',
  `IN_MENU` char(1) NOT NULL DEFAULT 'N',
  `IN_AGENT` char(1) NOT NULL DEFAULT 'N',
  `IN_CRON` char(1) NOT NULL DEFAULT 'N',
  `SETUP_VARS` text,
  `LAST_USE` datetime DEFAULT NULL,
  `IS_EXPORT` char(1) NOT NULL DEFAULT 'Y',
  `NEED_EDIT` char(1) NOT NULL DEFAULT 'N',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `BCAT_EX_FILE_NAME` (`FILE_NAME`),
  KEY `IX_CAT_IS_EXPORT` (`IS_EXPORT`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

INSERT INTO `b_catalog_export` VALUES
(1, 'yandex', 'IRR.ru (\"Из рук в руки\")', 'N', 'N', 'N', 'N', NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_catalog_extra
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_extra`;
CREATE TABLE `b_catalog_extra` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `PERCENTAGE` decimal(18,2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_group`;
CREATE TABLE `b_catalog_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `BASE` char(1) NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '100',
  `XML_ID` varchar(255) DEFAULT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_group2group
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_group2group`;
CREATE TABLE `b_catalog_group2group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATALOG_GROUP_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `BUY` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_CATG2G_UNI` (`CATALOG_GROUP_ID`,`GROUP_ID`,`BUY`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_group_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_group_lang`;
CREATE TABLE `b_catalog_group_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATALOG_GROUP_ID` int(11) NOT NULL,
  `LANG` char(2) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_CATALOG_GROUP_ID` (`CATALOG_GROUP_ID`,`LANG`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_iblock
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_iblock`;
CREATE TABLE `b_catalog_iblock` (
  `IBLOCK_ID` int(11) NOT NULL,
  `YANDEX_EXPORT` char(1) NOT NULL DEFAULT 'N',
  `SUBSCRIPTION` char(1) NOT NULL DEFAULT 'N',
  `VAT_ID` int(11) DEFAULT '0',
  `PRODUCT_IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `SKU_PROPERTY_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IBLOCK_ID`),
  KEY `IXS_CAT_IB_PRODUCT` (`PRODUCT_IBLOCK_ID`),
  KEY `IXS_CAT_IB_SKU_PROP` (`SKU_PROPERTY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_load
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_load`;
CREATE TABLE `b_catalog_load` (
  `NAME` varchar(250) NOT NULL,
  `VALUE` text NOT NULL,
  `TYPE` char(1) NOT NULL DEFAULT 'I',
  `LAST_USED` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`NAME`,`TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_measure
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_measure`;
CREATE TABLE `b_catalog_measure` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` int(11) NOT NULL,
  `MEASURE_TITLE` varchar(500) DEFAULT NULL,
  `SYMBOL_RUS` varchar(20) DEFAULT NULL,
  `SYMBOL_INTL` varchar(20) DEFAULT NULL,
  `SYMBOL_LETTER_INTL` varchar(20) DEFAULT NULL,
  `IS_DEFAULT` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_CATALOG_MEASURE1` (`CODE`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251;

INSERT INTO `b_catalog_measure` VALUES
(1, 6, NULL, NULL, 'm', 'MTR', 'N'),
(2, 112, NULL, NULL, 'l', 'LTR', 'N'),
(3, 163, NULL, NULL, 'g', 'GRM', 'N'),
(4, 166, NULL, NULL, 'kg', 'KGM', 'N'),
(5, 796, NULL, NULL, 'pc. 1', 'PCE. NMB', 'Y');
-- -----------------------------------
-- Dumping table b_catalog_measure_ratio
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_measure_ratio`;
CREATE TABLE `b_catalog_measure_ratio` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) NOT NULL,
  `RATIO` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_CATALOG_MEASURE_RATIO` (`PRODUCT_ID`,`RATIO`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_price
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_price`;
CREATE TABLE `b_catalog_price` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) NOT NULL,
  `EXTRA_ID` int(11) DEFAULT NULL,
  `CATALOG_GROUP_ID` int(11) NOT NULL,
  `PRICE` decimal(18,2) NOT NULL,
  `CURRENCY` char(3) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `QUANTITY_FROM` int(11) DEFAULT NULL,
  `QUANTITY_TO` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IXS_CAT_PRICE_PID` (`PRODUCT_ID`,`CATALOG_GROUP_ID`),
  KEY `IXS_CAT_PRICE_GID` (`CATALOG_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_product
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_product`;
CREATE TABLE `b_catalog_product` (
  `ID` int(11) NOT NULL,
  `QUANTITY` double NOT NULL,
  `QUANTITY_TRACE` char(1) NOT NULL DEFAULT 'N',
  `WEIGHT` double NOT NULL DEFAULT '0',
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PRICE_TYPE` char(1) NOT NULL DEFAULT 'S',
  `RECUR_SCHEME_LENGTH` int(11) DEFAULT NULL,
  `RECUR_SCHEME_TYPE` char(1) NOT NULL DEFAULT 'D',
  `TRIAL_PRICE_ID` int(11) DEFAULT NULL,
  `WITHOUT_ORDER` char(1) NOT NULL DEFAULT 'N',
  `SELECT_BEST_PRICE` char(1) NOT NULL DEFAULT 'Y',
  `VAT_ID` int(11) DEFAULT '0',
  `VAT_INCLUDED` char(1) DEFAULT 'Y',
  `CAN_BUY_ZERO` char(1) NOT NULL DEFAULT 'N',
  `NEGATIVE_AMOUNT_TRACE` char(1) NOT NULL DEFAULT 'D',
  `TMP_ID` varchar(40) DEFAULT NULL,
  `PURCHASING_PRICE` decimal(18,2) DEFAULT NULL,
  `PURCHASING_CURRENCY` char(3) DEFAULT NULL,
  `BARCODE_MULTI` char(1) NOT NULL DEFAULT 'N',
  `QUANTITY_RESERVED` double DEFAULT '0',
  `SUBSCRIBE` char(1) DEFAULT NULL,
  `WIDTH` double DEFAULT NULL,
  `LENGTH` double DEFAULT NULL,
  `HEIGHT` double DEFAULT NULL,
  `MEASURE` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_product2group
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_product2group`;
CREATE TABLE `b_catalog_product2group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ACCESS_LENGTH` int(11) NOT NULL,
  `ACCESS_LENGTH_TYPE` char(1) NOT NULL DEFAULT 'D',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_C_P2G_PROD_GROUP` (`PRODUCT_ID`,`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_product_sets
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_product_sets`;
CREATE TABLE `b_catalog_product_sets` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` int(11) NOT NULL,
  `SET_ID` int(11) NOT NULL,
  `ACTIVE` char(1) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  `QUANTITY` double DEFAULT NULL,
  `MEASURE` int(11) DEFAULT NULL,
  `DISCOUNT_PERCENT` double DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `CREATED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CAT_PR_SET_TYPE` (`TYPE`),
  KEY `IX_CAT_PR_SET_OWNER_ID` (`OWNER_ID`),
  KEY `IX_CAT_PR_SET_SET_ID` (`SET_ID`),
  KEY `IX_CAT_PR_SET_ITEM_ID` (`ITEM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_store
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_store`;
CREATE TABLE `b_catalog_store` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(75) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `ADDRESS` varchar(245) NOT NULL,
  `DESCRIPTION` text,
  `GPS_N` varchar(15) DEFAULT '0',
  `GPS_S` varchar(15) DEFAULT '0',
  `IMAGE_ID` varchar(45) DEFAULT NULL,
  `LOCATION_ID` int(11) DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DATE_CREATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `PHONE` varchar(45) DEFAULT NULL,
  `SCHEDULE` varchar(255) DEFAULT NULL,
  `XML_ID` varchar(45) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `EMAIL` varchar(255) DEFAULT NULL,
  `ISSUING_CENTER` char(1) NOT NULL DEFAULT 'Y',
  `SHIPPING_CENTER` char(1) NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_store_barcode
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_store_barcode`;
CREATE TABLE `b_catalog_store_barcode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) NOT NULL,
  `BARCODE` varchar(100) DEFAULT NULL,
  `STORE_ID` int(11) DEFAULT NULL,
  `ORDER_ID` int(11) DEFAULT NULL,
  `DATE_MODIFY` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_CATALOG_STORE_BARCODE1` (`BARCODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_store_docs
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_store_docs`;
CREATE TABLE `b_catalog_store_docs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOC_TYPE` char(1) NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `CONTRACTOR_ID` int(11) DEFAULT NULL,
  `DATE_MODIFY` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `CURRENCY` char(3) DEFAULT NULL,
  `STATUS` char(1) NOT NULL DEFAULT 'N',
  `DATE_STATUS` datetime DEFAULT NULL,
  `DATE_DOCUMENT` datetime DEFAULT NULL,
  `STATUS_BY` int(11) DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `COMMENTARY` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_store_product
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_store_product`;
CREATE TABLE `b_catalog_store_product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) NOT NULL,
  `AMOUNT` double NOT NULL DEFAULT '0',
  `STORE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_CATALOG_STORE_PRODUCT2` (`PRODUCT_ID`,`STORE_ID`),
  KEY `IX_CATALOG_STORE_PRODUCT1` (`STORE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_vat
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_vat`;
CREATE TABLE `b_catalog_vat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` varchar(50) NOT NULL DEFAULT '',
  `RATE` decimal(18,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ID`),
  KEY `IX_CAT_VAT_ACTIVE` (`ACTIVE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_catalog_viewed_product
-- -----------------------------------
DROP TABLE IF EXISTS `b_catalog_viewed_product`;
CREATE TABLE `b_catalog_viewed_product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FUSER_ID` int(11) NOT NULL,
  `DATE_VISIT` datetime NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) NOT NULL,
  `VIEW_COUNT` int(11) NOT NULL DEFAULT '1',
  `RECOMMENDATION` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CAT_V_PR_FUSER_ID` (`FUSER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_checklist
-- -----------------------------------
DROP TABLE IF EXISTS `b_checklist`;
CREATE TABLE `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) DEFAULT NULL,
  `TESTER` varchar(50) DEFAULT NULL,
  `COMPANY_NAME` varchar(255) DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext,
  `REPORT_COMMENT` text,
  `REPORT` char(1) DEFAULT 'Y',
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) DEFAULT 'N',
  `HIDDEN` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_clouds_file_bucket
-- -----------------------------------
DROP TABLE IF EXISTS `b_clouds_file_bucket`;
CREATE TABLE `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) DEFAULT 'Y',
  `SORT` int(11) DEFAULT '500',
  `READ_ONLY` char(1) DEFAULT 'N',
  `SERVICE_ID` varchar(50) DEFAULT NULL,
  `BUCKET` varchar(63) DEFAULT NULL,
  `LOCATION` varchar(50) DEFAULT NULL,
  `CNAME` varchar(100) DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT '0',
  `FILE_SIZE` float DEFAULT '0',
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) DEFAULT NULL,
  `SETTINGS` text,
  `FILE_RULES` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_clouds_file_resize
-- -----------------------------------
DROP TABLE IF EXISTS `b_clouds_file_resize`;
CREATE TABLE `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ERROR_CODE` char(1) NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text,
  `FROM_PATH` varchar(500) DEFAULT NULL,
  `TO_PATH` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_clouds_file_upload
-- -----------------------------------
DROP TABLE IF EXISTS `b_clouds_file_upload`;
CREATE TABLE `b_clouds_file_upload` (
  `ID` varchar(32) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FILE_PATH` varchar(500) NOT NULL,
  `TMP_FILE` varchar(500) DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_component_params
-- -----------------------------------
DROP TABLE IF EXISTS `b_component_params`;
CREATE TABLE `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `COMPONENT_NAME` varchar(255) NOT NULL,
  `TEMPLATE_NAME` varchar(255) DEFAULT NULL,
  `REAL_PATH` varchar(255) NOT NULL,
  `SEF_MODE` char(1) NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=cp1251;

INSERT INTO `b_component_params` VALUES
(2, 's1', 'bitrix:main.include', '.default', '/bitrix/templates/main/footer.php', 'N', NULL, 183, 398, 'a:4:{s:14:\"AREA_FILE_SHOW\";s:4:\"sect\";s:19:\"AREA_FILE_RECURSIVE\";s:1:\"Y\";s:16:\"AREA_FILE_SUFFIX\";s:9:\"copyright\";s:13:\"EDIT_TEMPLATE\";s:0:\"\";}'),
(5, 's1', 'bitrix:menu', '.default', '/bitrix/templates/main/header.php', 'N', NULL, 2558, 3261, 'a:10:{s:14:\"ROOT_MENU_TYPE\";s:3:\"top\";s:15:\"MENU_CACHE_TYPE\";s:1:\"A\";s:15:\"MENU_CACHE_TIME\";s:4:\"3600\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:19:\"MENU_CACHE_GET_VARS\";s:0:\"\";s:9:\"MAX_LEVEL\";s:1:\"1\";s:15:\"CHILD_MENU_TYPE\";s:7:\"submenu\";s:7:\"USE_EXT\";s:1:\"Y\";s:5:\"DELAY\";s:1:\"Y\";s:18:\"ALLOW_MULTI_SELECT\";s:1:\"Y\";}'),
(6, 's1', 'bitrix:main.include', '.default', '/bitrix/templates/main/header.php', 'N', NULL, 3787, 3998, 'a:4:{s:14:\"AREA_FILE_SHOW\";s:4:\"sect\";s:19:\"AREA_FILE_RECURSIVE\";s:1:\"Y\";s:16:\"AREA_FILE_SUFFIX\";s:5:\"phone\";s:13:\"EDIT_TEMPLATE\";s:0:\"\";}'),
(14, 's1', 'bitrix:news', '.default', '/news/index.php', 'Y', '/news/', 99, 2168, 'a:61:{s:11:\"IBLOCK_TYPE\";s:4:\"news\";s:9:\"IBLOCK_ID\";s:1:\"1\";s:10:\"NEWS_COUNT\";s:2:\"10\";s:10:\"USE_SEARCH\";s:1:\"N\";s:7:\"USE_RSS\";s:1:\"N\";s:10:\"USE_RATING\";s:1:\"N\";s:14:\"USE_CATEGORIES\";s:1:\"N\";s:10:\"USE_REVIEW\";s:1:\"N\";s:10:\"USE_FILTER\";s:1:\"N\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:8:\"SEF_MODE\";s:1:\"Y\";s:10:\"SEF_FOLDER\";s:6:\"/news/\";s:9:\"AJAX_MODE\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:14:\"SET_STATUS_404\";s:1:\"Y\";s:9:\"SET_TITLE\";s:1:\"Y\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:17:\"ADD_ELEMENT_CHAIN\";s:1:\"N\";s:15:\"USE_PERMISSIONS\";s:1:\"N\";s:12:\"DISPLAY_DATE\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"N\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:9:\"USE_SHARE\";s:1:\"N\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:3:\"200\";s:23:\"LIST_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:15:\"LIST_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:18:\"LIST_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:13:\"META_KEYWORDS\";s:1:\"-\";s:16:\"META_DESCRIPTION\";s:1:\"-\";s:13:\"BROWSER_TITLE\";s:1:\"-\";s:25:\"DETAIL_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:17:\"DETAIL_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:20:\"DETAIL_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:24:\"DETAIL_DISPLAY_TOP_PAGER\";s:1:\"N\";s:27:\"DETAIL_DISPLAY_BOTTOM_PAGER\";s:1:\"N\";s:18:\"DETAIL_PAGER_TITLE\";s:8:\"Страница\";s:21:\"DETAIL_PAGER_TEMPLATE\";s:0:\"\";s:21:\"DETAIL_PAGER_SHOW_ALL\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:11:\"PAGER_TITLE\";s:7:\"Новости\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:17:\"SEF_URL_TEMPLATES\";a:3:{s:4:\"news\";s:0:\"\";s:7:\"section\";s:0:\"\";s:6:\"detail\";s:13:\"#ELEMENT_ID#/\";}}'),
(18, 's1', 'bitrix:news.list', 'slider', '/index.php', 'N', NULL, 91, 1591, 'a:46:{s:11:\"IBLOCK_TYPE\";s:4:\"news\";s:9:\"IBLOCK_ID\";s:1:\"1\";s:10:\"NEWS_COUNT\";s:3:\"200\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:11:\"FILTER_NAME\";s:8:\"arFilter\";s:10:\"FIELD_CODE\";a:2:{i:0;s:14:\"DETAIL_PICTURE\";i:1;s:0:\"\";}s:13:\"PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:11:\"CHECK_DATES\";s:1:\"Y\";s:10:\"DETAIL_URL\";s:0:\"\";s:9:\"AJAX_MODE\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:9:\"SET_TITLE\";s:1:\"N\";s:17:\"SET_BROWSER_TITLE\";s:1:\"N\";s:17:\"SET_META_KEYWORDS\";s:1:\"N\";s:20:\"SET_META_DESCRIPTION\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:19:\"INCLUDE_SUBSECTIONS\";s:1:\"Y\";s:12:\"DISPLAY_DATE\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"N\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"N\";s:11:\"PAGER_TITLE\";s:7:\"Новости\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";}'),
(23, 's1', 'bitrix:news.list', 'brands', '/goods/index.php', 'N', NULL, 99, 3218, 'a:47:{s:11:\"IBLOCK_TYPE\";s:7:\"catalog\";s:9:\"IBLOCK_ID\";s:1:\"2\";s:10:\"NEWS_COUNT\";s:4:\"1000\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:11:\"FILTER_NAME\";s:0:\"\";s:10:\"FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:13:\"PROPERTY_CODE\";a:3:{i:0;s:7:\"PARTNER\";i:1;s:4:\"LINK\";i:2;s:0:\"\";}s:11:\"CHECK_DATES\";s:1:\"Y\";s:10:\"DETAIL_URL\";s:0:\"\";s:9:\"AJAX_MODE\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"Y\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:9:\"SET_TITLE\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:11:\"PAGER_TITLE\";s:0:\"\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:12:\"DISPLAY_DATE\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:17:\"SET_BROWSER_TITLE\";s:1:\"Y\";s:17:\"SET_META_KEYWORDS\";s:1:\"Y\";s:20:\"SET_META_DESCRIPTION\";s:1:\"Y\";s:19:\"INCLUDE_SUBSECTIONS\";s:1:\"Y\";}'),
(24, 's1', 'bitrix:main.include', '.default', '/goods/index.php', 'N', NULL, 3253, 3464, 'a:4:{s:14:\"AREA_FILE_SHOW\";s:4:\"sect\";s:19:\"AREA_FILE_RECURSIVE\";s:1:\"Y\";s:16:\"AREA_FILE_SUFFIX\";s:5:\"goods\";s:13:\"EDIT_TEMPLATE\";s:0:\"\";}'),
(33, 's1', 'bitrix:news.list', 'service', '/test.php', 'N', NULL, 100, 1611, 'a:47:{s:11:\"IBLOCK_TYPE\";s:7:\"catalog\";s:9:\"IBLOCK_ID\";s:1:\"3\";s:10:\"NEWS_COUNT\";s:4:\"1000\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:11:\"FILTER_NAME\";s:0:\"\";s:10:\"FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:13:\"PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:4:\"FILE\";}s:11:\"CHECK_DATES\";s:1:\"Y\";s:10:\"DETAIL_URL\";s:0:\"\";s:9:\"AJAX_MODE\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"Y\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:9:\"SET_TITLE\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"Y\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:11:\"PAGER_TITLE\";s:0:\"\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:12:\"DISPLAY_DATE\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"N\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:17:\"SET_BROWSER_TITLE\";s:1:\"Y\";s:17:\"SET_META_KEYWORDS\";s:1:\"Y\";s:20:\"SET_META_DESCRIPTION\";s:1:\"Y\";s:19:\"INCLUDE_SUBSECTIONS\";s:1:\"N\";}'),
(34, 's1', 'bitrix:main.include', '.default', '/test.php', 'N', NULL, 1646, 1859, 'a:4:{s:14:\"AREA_FILE_SHOW\";s:4:\"sect\";s:19:\"AREA_FILE_RECURSIVE\";s:1:\"Y\";s:16:\"AREA_FILE_SUFFIX\";s:7:\"service\";s:13:\"EDIT_TEMPLATE\";s:0:\"\";}'),
(40, 's1', 'demo:reload.captcha', '.default', '/status/index.php', 'N', NULL, 5827, 6099, 'a:4:{s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:10:\"USE_GLOBAL\";s:1:\"N\";s:9:\"FORM_NAME\";a:2:{i:0;s:6:\"status\";i:1;s:0:\"\";}s:12:\"IMAGE_DIALOG\";s:37:\"/bitrix/templates/main/img/reload.jpg\";}'),
(44, 's1', 'bitrix:menu', '.default', '/bitrix/tmp/templates/__bx_preview/header.php', 'N', NULL, 2886, 3589, 'a:10:{s:14:\"ROOT_MENU_TYPE\";s:3:\"top\";s:15:\"MENU_CACHE_TYPE\";s:1:\"A\";s:15:\"MENU_CACHE_TIME\";s:4:\"3600\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:19:\"MENU_CACHE_GET_VARS\";s:0:\"\";s:9:\"MAX_LEVEL\";s:1:\"1\";s:15:\"CHILD_MENU_TYPE\";s:7:\"submenu\";s:7:\"USE_EXT\";s:1:\"Y\";s:5:\"DELAY\";s:1:\"Y\";s:18:\"ALLOW_MULTI_SELECT\";s:1:\"Y\";}'),
(45, 's1', 'bitrix:main.include', '.default', '/bitrix/tmp/templates/__bx_preview/header.php', 'N', NULL, 3867, 4078, 'a:4:{s:14:\"AREA_FILE_SHOW\";s:4:\"sect\";s:19:\"AREA_FILE_RECURSIVE\";s:1:\"Y\";s:16:\"AREA_FILE_SUFFIX\";s:5:\"phone\";s:13:\"EDIT_TEMPLATE\";s:0:\"\";}'),
(46, 's1', 'bitrix:main.include', '.default', '/bitrix/tmp/templates/__bx_preview/footer.php', 'N', NULL, 176, 391, 'a:4:{s:14:\"AREA_FILE_SHOW\";s:4:\"sect\";s:19:\"AREA_FILE_RECURSIVE\";s:1:\"Y\";s:16:\"AREA_FILE_SUFFIX\";s:9:\"copyright\";s:13:\"EDIT_TEMPLATE\";s:0:\"\";}');
-- -----------------------------------
-- Dumping table b_counter_data
-- -----------------------------------
DROP TABLE IF EXISTS `b_counter_data`;
CREATE TABLE `b_counter_data` (
  `ID` varchar(16) NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `DATA` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_culture
-- -----------------------------------
DROP TABLE IF EXISTS `b_culture`;
CREATE TABLE `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `FORMAT_DATE` varchar(255) DEFAULT NULL,
  `FORMAT_DATETIME` varchar(255) DEFAULT NULL,
  `FORMAT_NAME` varchar(255) DEFAULT NULL,
  `WEEK_START` int(1) DEFAULT '1',
  `CHARSET` varchar(255) DEFAULT NULL,
  `DIRECTION` char(1) DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=cp1251;

INSERT INTO `b_culture` VALUES
(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'windows-1251', 'Y'),
(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'iso-8859-1', 'Y');
-- -----------------------------------
-- Dumping table b_event
-- -----------------------------------
DROP TABLE IF EXISTS `b_event`;
CREATE TABLE `b_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` varchar(255) NOT NULL,
  `C_FIELDS` longtext,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_event_attachment
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_attachment`;
CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Creating empty table b_event_log
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_event_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SEVERITY` varchar(50) NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `ITEM_ID` varchar(255) NOT NULL,
  `REMOTE_ADDR` varchar(40) DEFAULT NULL,
  `USER_AGENT` text,
  `REQUEST_URI` text,
  `SITE_ID` char(2) DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_event_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_message`;
CREATE TABLE `b_event_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EVENT_NAME` varchar(255) NOT NULL,
  `LID` char(2) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) DEFAULT NULL,
  `MESSAGE` longtext,
  `BODY_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `BCC` text,
  `REPLY_TO` varchar(255) DEFAULT NULL,
  `CC` varchar(255) DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) DEFAULT NULL,
  `PRIORITY` varchar(50) DEFAULT NULL,
  `FIELD1_NAME` varchar(50) DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) DEFAULT NULL,
  `FIELD2_NAME` varchar(50) DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) DEFAULT NULL,
  `MESSAGE_PHP` longtext,
  `SITE_TEMPLATE_ID` varchar(255) DEFAULT NULL,
  `ADDITIONAL_FIELD` text,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=cp1251;

INSERT INTO `b_event_message` VALUES
(1, '2015-04-13 11:03:43', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2015-04-13 11:03:43', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2015-04-13 11:03:43', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2015-04-13 11:03:43', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2015-04-13 11:03:43', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2015-04-13 11:03:43', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '2015-04-13 11:03:43', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2015-04-13 11:03:49', 'NEW_BLOG_MESSAGE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #BLOG_NAME# : #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение в блоге \"#BLOG_NAME#\"\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\nДата: #MESSAGE_DATE#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2015-04-13 11:03:49', 'NEW_BLOG_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2015-04-13 11:03:49', 'NEW_BLOG_COMMENT2COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2015-04-13 11:03:49', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2015-04-13 11:03:49', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2015-04-13 11:03:49', 'BLOG_YOUR_BLOG_TO_USER', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Ваш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВаш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2015-04-13 11:03:49', 'BLOG_YOU_TO_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Вы были добавлены в друзья блога \"#BLOG_NAME#\"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы были добавлены в друзья блога \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2015-04-13 11:03:49', 'BLOG_BLOG_TO_YOU', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] К вам в друзья был добавлен блог \"#BLOG_NAME#\"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nК вам в друзья был добавлен блог \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2015-04-13 11:03:49', 'BLOG_USER_TO_YOUR_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] В ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВ ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2015-04-13 11:03:55', 'NEW_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '2015-04-13 11:03:55', 'NEW_FORUM_PRIV', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME# #FROM_EMAIL#\nДата : #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '2015-04-13 11:03:55', 'NEW_FORUM_PRIVATE_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME#\nДата: #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСсылка на сообщение: #MESSAGE_LINK#Сообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '2015-04-13 11:03:55', 'EDIT_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nИзменение сообщения на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '2015-04-13 11:03:55', 'FORUM_NEW_MESSAGE_MAIL', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#TOPIC_TITLE#', '#MESSAGE_TEXT#\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум #FORUM_NAME#.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nНаписать новое сообщение: #FORUM_EMAIL#\n\nАвтор сообщения: #AUTHOR#\n\nСообщение сгенерировано автоматически на сайте #SITE_NAME#.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '2015-04-13 11:04:03', 'SALE_NEW_ORDER', 's1', 'Y', '#SALE_EMAIL#', '#EMAIL#', '#SITE_NAME#: Новый заказ N#ORDER_ID#', '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"ru\" lang=\"ru\">\n<head>\n	<meta http-equiv=\"Content-Type\" content=\"text/html;charset=windows-1251\"/>\n	<style>\n		body\n		{\n			font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\n			font-size: 14px;\n			color: #000;\n		}\n	</style>\n</head>\n<body>\n<table cellpadding=\"0\" cellspacing=\"0\" width=\"850\" style=\"background-color: #d1d1d1; border-radius: 2px; border:1px solid #d1d1d1; margin: 0 auto;\" border=\"1\" bordercolor=\"#d1d1d1\">\n	<tr>\n		<td height=\"83\" width=\"850\" bgcolor=\"#eaf3f5\" style=\"border: none; padding-top: 23px; padding-right: 17px; padding-bottom: 24px; padding-left: 17px;\">\n			<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\n				<tr>\n					<td bgcolor=\"#ffffff\" height=\"75\" style=\"font-weight: bold; text-align: center; font-size: 26px; color: #0b3961;\">Вами оформлен заказ в магазине #SITE_NAME#</td>\n				</tr>\n				<tr>\n					<td bgcolor=\"#bad3df\" height=\"11\"></td>\n				</tr>\n			</table>\n		</td>\n	</tr>\n	<tr>\n		<td width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 16px; padding-left: 44px;\">\n			<p style=\"margin-top:30px; margin-bottom: 28px; font-weight: bold; font-size: 19px;\">Уважаемый #ORDER_USER#,</p>\n			<p style=\"margin-top: 0; margin-bottom: 20px; line-height: 20px;\">Ваш заказ номер #ORDER_ID# от #ORDER_DATE# принят.<br />\n<br />\nСтоимость заказа: #PRICE#.<br />\n<br />\nСостав заказа:<br />\n#ORDER_LIST#<br />\n<br />\nВы можете следить за выполнением своего заказа (на какой стадии выполнения он находится), войдя в Ваш персональный раздел сайта #SITE_NAME#.<br />\n<br />\nОбратите внимание, что для входа в этот раздел Вам необходимо будет ввести логин и пароль пользователя сайта #SITE_NAME#.<br />\n<br />\nДля того, чтобы аннулировать заказ, воспользуйтесь функцией отмены заказа, которая доступна в Вашем персональном разделе сайта #SITE_NAME#.<br />\n<br />\nПожалуйста, при обращении к администрации сайта #SITE_NAME# ОБЯЗАТЕЛЬНО указывайте номер Вашего заказа - #ORDER_ID#.<br />\n<br />\nСпасибо за покупку!<br />\n</p>\n		</td>\n	</tr>\n	<tr>\n		<td height=\"40px\" width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 30px; padding-left: 44px;\">\n			<p style=\"border-top: 1px solid #d1d1d1; margin-bottom: 5px; margin-top: 0; padding-top: 20px; line-height:21px;\">С уважением,<br />администрация <a href=\"http://#SERVER_NAME#\" style=\"color:#2e6eb6;\">Интернет-магазина</a><br />\n				E-mail: <a href=\"mailto:#SALE_EMAIL#\" style=\"color:#2e6eb6;\">#SALE_EMAIL#</a>\n			</p>\n		</td>\n	</tr>\n</table>\n</body>\n</html>', 'html', '#BCC#', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '2015-04-13 11:04:03', 'SALE_ORDER_CANCEL', 's1', 'Y', '#SALE_EMAIL#', '#EMAIL#', '#SITE_NAME#: Отмена заказа N#ORDER_ID#', '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"ru\" lang=\"ru\">\n<head>\n	<meta http-equiv=\"Content-Type\" content=\"text/html;charset=windows-1251\"/>\n	<style>\n		body\n		{\n			font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\n			font-size: 14px;\n			color: #000;\n		}\n	</style>\n</head>\n<body>\n<table cellpadding=\"0\" cellspacing=\"0\" width=\"850\" style=\"background-color: #d1d1d1; border-radius: 2px; border:1px solid #d1d1d1; margin: 0 auto;\" border=\"1\" bordercolor=\"#d1d1d1\">\n	<tr>\n		<td height=\"83\" width=\"850\" bgcolor=\"#eaf3f5\" style=\"border: none; padding-top: 23px; padding-right: 17px; padding-bottom: 24px; padding-left: 17px;\">\n			<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\n				<tr>\n					<td bgcolor=\"#ffffff\" height=\"75\" style=\"font-weight: bold; text-align: center; font-size: 26px; color: #0b3961;\">#SITE_NAME#: Отмена заказа N#ORDER_ID#</td>\n				</tr>\n				<tr>\n					<td bgcolor=\"#bad3df\" height=\"11\"></td>\n				</tr>\n			</table>\n		</td>\n	</tr>\n	<tr>\n		<td width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 16px; padding-left: 44px;\">\n			<p style=\"margin-top:30px; margin-bottom: 28px; font-weight: bold; font-size: 19px;\">Заказ номер #ORDER_ID# от #ORDER_DATE# отменен.</p>\n			<p style=\"margin-top: 0; margin-bottom: 20px; line-height: 20px;\">#ORDER_CANCEL_DESCRIPTION#<br />\n<br />\nДля получения подробной информации по заказу пройдите на сайт http://#SERVER_NAME#/personal/order/#ORDER_ID#/<br />\n</p>\n		</td>\n	</tr>\n	<tr>\n		<td height=\"40px\" width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 30px; padding-left: 44px;\">\n			<p style=\"border-top: 1px solid #d1d1d1; margin-bottom: 5px; margin-top: 0; padding-top: 20px; line-height:21px;\">С уважением,<br />администрация <a href=\"http://#SERVER_NAME#\" style=\"color:#2e6eb6;\">Интернет-магазина</a><br />\n				E-mail: <a href=\"mailto:#SALE_EMAIL#\" style=\"color:#2e6eb6;\">#SALE_EMAIL#</a>\n			</p>\n		</td>\n	</tr>\n</table>\n</body>\n</html>', 'html', '#BCC#', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, '2015-04-13 11:04:03', 'SALE_ORDER_DELIVERY', 's1', 'Y', '#SALE_EMAIL#', '#EMAIL#', '#SITE_NAME#: Доставка заказа N#ORDER_ID# разрешена', '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"ru\" lang=\"ru\">\n<head>\n	<meta http-equiv=\"Content-Type\" content=\"text/html;charset=windows-1251\"/>\n	<style>\n		body\n		{\n			font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\n			font-size: 14px;\n			color: #000;\n		}\n	</style>\n</head>\n<body>\n<table cellpadding=\"0\" cellspacing=\"0\" width=\"850\" style=\"background-color: #d1d1d1; border-radius: 2px; border:1px solid #d1d1d1; margin: 0 auto;\" border=\"1\" bordercolor=\"#d1d1d1\">\n	<tr>\n		<td height=\"83\" width=\"850\" bgcolor=\"#eaf3f5\" style=\"border: none; padding-top: 23px; padding-right: 17px; padding-bottom: 24px; padding-left: 17px;\">\n			<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\n				<tr>\n					<td bgcolor=\"#ffffff\" height=\"75\" style=\"font-weight: bold; text-align: center; font-size: 26px; color: #0b3961;\">Доставка вашего заказа с сайта #SITE_NAME# разрешена</td>\n				</tr>\n				<tr>\n					<td bgcolor=\"#bad3df\" height=\"11\"></td>\n				</tr>\n			</table>\n		</td>\n	</tr>\n	<tr>\n		<td width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 16px; padding-left: 44px;\">\n			<p style=\"margin-top:30px; margin-bottom: 28px; font-weight: bold; font-size: 19px;\">Доставка заказа номер #ORDER_ID# от #ORDER_DATE# разрешена.</p>\n			<p style=\"margin-top: 0; margin-bottom: 20px; line-height: 20px;\">Для получения подробной информации по заказу пройдите на сайт http://#SERVER_NAME#/personal/order/#ORDER_ID#/<br />\n</p>\n		</td>\n	</tr>\n	<tr>\n		<td height=\"40px\" width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 30px; padding-left: 44px;\">\n			<p style=\"border-top: 1px solid #d1d1d1; margin-bottom: 5px; margin-top: 0; padding-top: 20px; line-height:21px;\">С уважением,<br />администрация <a href=\"http://#SERVER_NAME#\" style=\"color:#2e6eb6;\">Интернет-магазина</a><br />\n				E-mail: <a href=\"mailto:#SALE_EMAIL#\" style=\"color:#2e6eb6;\">#SALE_EMAIL#</a>\n			</p>\n		</td>\n	</tr>\n</table>\n</body>\n</html>', 'html', '#BCC#', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, '2015-04-13 11:04:03', 'SALE_ORDER_PAID', 's1', 'Y', '#SALE_EMAIL#', '#EMAIL#', '#SITE_NAME#: Заказ N#ORDER_ID# оплачен', '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"ru\" lang=\"ru\">\n<head>\n	<meta http-equiv=\"Content-Type\" content=\"text/html;charset=windows-1251\"/>\n	<style>\n		body\n		{\n			font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\n			font-size: 14px;\n			color: #000;\n		}\n	</style>\n</head>\n<body>\n<table cellpadding=\"0\" cellspacing=\"0\" width=\"850\" style=\"background-color: #d1d1d1; border-radius: 2px; border:1px solid #d1d1d1; margin: 0 auto;\" border=\"1\" bordercolor=\"#d1d1d1\">\n	<tr>\n		<td height=\"83\" width=\"850\" bgcolor=\"#eaf3f5\" style=\"border: none; padding-top: 23px; padding-right: 17px; padding-bottom: 24px; padding-left: 17px;\">\n			<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\n				<tr>\n					<td bgcolor=\"#ffffff\" height=\"75\" style=\"font-weight: bold; text-align: center; font-size: 26px; color: #0b3961;\">Вы оплатили заказ на сайте #SITE_NAME#</td>\n				</tr>\n				<tr>\n					<td bgcolor=\"#bad3df\" height=\"11\"></td>\n				</tr>\n			</table>\n		</td>\n	</tr>\n	<tr>\n		<td width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 16px; padding-left: 44px;\">\n			<p style=\"margin-top:30px; margin-bottom: 28px; font-weight: bold; font-size: 19px;\">Заказ номер #ORDER_ID# от #ORDER_DATE# оплачен.</p>\n			<p style=\"margin-top: 0; margin-bottom: 20px; line-height: 20px;\">Для получения подробной информации по заказу пройдите на сайт http://#SERVER_NAME#/personal/order/#ORDER_ID#/</p>\n		</td>\n	</tr>\n	<tr>\n		<td height=\"40px\" width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 30px; padding-left: 44px;\">\n			<p style=\"border-top: 1px solid #d1d1d1; margin-bottom: 5px; margin-top: 0; padding-top: 20px; line-height:21px;\">С уважением,<br />администрация <a href=\"http://#SERVER_NAME#\" style=\"color:#2e6eb6;\">Интернет-магазина</a><br />\n				E-mail: <a href=\"mailto:#SALE_EMAIL#\" style=\"color:#2e6eb6;\">#SALE_EMAIL#</a>\n			</p>\n		</td>\n	</tr>\n</table>\n</body>\n</html>', 'html', '#BCC#', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, '2015-04-13 11:04:03', 'SALE_ORDER_REMIND_PAYMENT', 's1', 'Y', '#SALE_EMAIL#', '#EMAIL#', '#SITE_NAME#: Напоминание об оплате заказа N#ORDER_ID# ', '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"ru\" lang=\"ru\">\n<head>\n	<meta http-equiv=\"Content-Type\" content=\"text/html;charset=windows-1251\"/>\n	<style>\n		body\n		{\n			font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\n			font-size: 14px;\n			color: #000;\n		}\n	</style>\n</head>\n<body>\n<table cellpadding=\"0\" cellspacing=\"0\" width=\"850\" style=\"background-color: #d1d1d1; border-radius: 2px; border:1px solid #d1d1d1; margin: 0 auto;\" border=\"1\" bordercolor=\"#d1d1d1\">\n	<tr>\n		<td height=\"83\" width=\"850\" bgcolor=\"#eaf3f5\" style=\"border: none; padding-top: 23px; padding-right: 17px; padding-bottom: 24px; padding-left: 17px;\">\n			<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\n				<tr>\n					<td bgcolor=\"#ffffff\" height=\"75\" style=\"font-weight: bold; text-align: center; font-size: 26px; color: #0b3961;\">Напоминаем вам об оплате заказа на сайте #SITE_NAME#</td>\n				</tr>\n				<tr>\n					<td bgcolor=\"#bad3df\" height=\"11\"></td>\n				</tr>\n			</table>\n		</td>\n	</tr>\n	<tr>\n		<td width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 16px; padding-left: 44px;\">\n			<p style=\"margin-top:30px; margin-bottom: 28px; font-weight: bold; font-size: 19px;\">Уважаемый #ORDER_USER#,</p>\n			<p style=\"margin-top: 0; margin-bottom: 20px; line-height: 20px;\">Вами был оформлен заказ N #ORDER_ID# от #ORDER_DATE# на сумму #PRICE#.<br />\n<br />\nК сожалению, на сегодняшний день средства по этому заказу не поступили к нам.<br />\n<br />\nВы можете следить за выполнением своего заказа (на какой стадии выполнения он находится), войдя в Ваш персональный раздел сайта #SITE_NAME#.<br />\n<br />\nОбратите внимание, что для входа в этот раздел Вам необходимо будет ввести логин и пароль пользователя сайта #SITE_NAME#.<br />\n<br />\nДля того, чтобы аннулировать заказ, воспользуйтесь функцией отмены заказа, которая доступна в Вашем персональном разделе сайта #SITE_NAME#.<br />\n<br />\nПожалуйста, при обращении к администрации сайта #SITE_NAME# ОБЯЗАТЕЛЬНО указывайте номер Вашего заказа - #ORDER_ID#.<br />\n<br />\nСпасибо за покупку!<br />\n</p>\n		</td>\n	</tr>\n	<tr>\n		<td height=\"40px\" width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 30px; padding-left: 44px;\">\n			<p style=\"border-top: 1px solid #d1d1d1; margin-bottom: 5px; margin-top: 0; padding-top: 20px; line-height:21px;\">С уважением,<br />администрация <a href=\"http://#SERVER_NAME#\" style=\"color:#2e6eb6;\">Интернет-магазина</a><br />\n				E-mail: <a href=\"mailto:#SALE_EMAIL#\" style=\"color:#2e6eb6;\">#SALE_EMAIL#</a>\n			</p>\n		</td>\n	</tr>\n</table>\n</body>\n</html>', 'html', '#BCC#', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, '2015-04-13 11:04:03', 'SALE_SUBSCRIBE_PRODUCT', 's1', 'Y', '#SALE_EMAIL#', '#EMAIL#', '#SITE_NAME#: Уведомление о поступлении товара', '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"ru\" lang=\"ru\">\n<head>\n	<meta http-equiv=\"Content-Type\" content=\"text/html;charset=windows-1251\"/>\n	<style>\n		body\n		{\n			font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\n			font-size: 14px;\n			color: #000;\n		}\n	</style>\n</head>\n<body>\n<table cellpadding=\"0\" cellspacing=\"0\" width=\"850\" style=\"background-color: #d1d1d1; border-radius: 2px; border:1px solid #d1d1d1; margin: 0 auto;\" border=\"1\" bordercolor=\"#d1d1d1\">\n	<tr>\n		<td height=\"83\" width=\"850\" bgcolor=\"#eaf3f5\" style=\"border: none; padding-top: 23px; padding-right: 17px; padding-bottom: 24px; padding-left: 17px;\">\n			<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\n				<tr>\n					<td bgcolor=\"#ffffff\" height=\"75\" style=\"font-weight: bold; text-align: center; font-size: 26px; color: #0b3961;\">Уведомление о поступлении товара в магазин #SITE_NAME#</td>\n				</tr>\n				<tr>\n					<td bgcolor=\"#bad3df\" height=\"11\"></td>\n				</tr>\n			</table>\n		</td>\n	</tr>\n	<tr>\n		<td width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 16px; padding-left: 44px;\">\n			<p style=\"margin-top:30px; margin-bottom: 28px; font-weight: bold; font-size: 19px;\">Уважаемый, #USER_NAME#!</p>\n			<p style=\"margin-top: 0; margin-bottom: 20px; line-height: 20px;\">Товар \"#NAME#\" (#PAGE_URL#) поступил на склад.<br />\n<br />\nВы можете Оформить заказ (http://#SERVER_NAME#/personal/cart/).<br />\n<br />\nНе забудьте авторизоваться!<br />\n<br />\nВы получили это сообщение по Вашей просьбе оповестить при появлении товара.<br />\nНе отвечайте на него - письмо сформировано автоматически.<br />\n<br />\nСпасибо за покупку!<br />\n</p>\n		</td>\n	</tr>\n	<tr>\n		<td height=\"40px\" width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 30px; padding-left: 44px;\">\n			<p style=\"border-top: 1px solid #d1d1d1; margin-bottom: 5px; margin-top: 0; padding-top: 20px; line-height:21px;\">С уважением,<br />администрация <a href=\"http://#SERVER_NAME#\" style=\"color:#2e6eb6;\">Интернет-магазина</a><br />\n				E-mail: <a href=\"mailto:#SALE_EMAIL#\" style=\"color:#2e6eb6;\">#SALE_EMAIL#</a>\n			</p>\n		</td>\n	</tr>\n</table>\n</body>\n</html>', 'html', '#BCC#', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, '2015-04-13 11:04:03', 'SALE_ORDER_TRACKING_NUMBER', 's1', 'Y', '#SALE_EMAIL#', '#EMAIL#', 'Номер идентификатора отправления вашего заказа на сайте #SITE_NAME#', '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"ru\" lang=\"ru\">\n<head>\n	<meta http-equiv=\"Content-Type\" content=\"text/html;charset=windows-1251\"/>\n	<style>\n		body\n		{\n			font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\n			font-size: 14px;\n			color: #000;\n		}\n	</style>\n</head>\n<body>\n<table cellpadding=\"0\" cellspacing=\"0\" width=\"850\" style=\"background-color: #d1d1d1; border-radius: 2px; border:1px solid #d1d1d1; margin: 0 auto;\" border=\"1\" bordercolor=\"#d1d1d1\">\n	<tr>\n		<td height=\"83\" width=\"850\" bgcolor=\"#eaf3f5\" style=\"border: none; padding-top: 23px; padding-right: 17px; padding-bottom: 24px; padding-left: 17px;\">\n			<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\n				<tr>\n					<td bgcolor=\"#ffffff\" height=\"75\" style=\"font-weight: bold; text-align: center; font-size: 26px; color: #0b3961;\">Номер идентификатора отправления вашего заказа на сайте #SITE_NAME#</td>\n				</tr>\n				<tr>\n					<td bgcolor=\"#bad3df\" height=\"11\"></td>\n				</tr>\n			</table>\n		</td>\n	</tr>\n	<tr>\n		<td width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 16px; padding-left: 44px;\">\n			<p style=\"margin-top:30px; margin-bottom: 28px; font-weight: bold; font-size: 19px;\">Уважаемый #ORDER_USER#,</p>\n			<p style=\"margin-top: 0; margin-bottom: 20px; line-height: 20px;\">Произошла почтовая отправка заказа N #ORDER_ID# от #ORDER_DATE#.<br />\n<br />\nНомер идентификатора отправления: #ORDER_TRACKING_NUMBER#.<br />\n<br />\nДля получения подробной информации по заказу пройдите на сайт http://#SERVER_NAME#/personal/order/detail/#ORDER_ID#/<br />\n<br />\nE-mail: #SALE_EMAIL#<br />\n</p>\n		</td>\n	</tr>\n	<tr>\n		<td height=\"40px\" width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 30px; padding-left: 44px;\">\n			<p style=\"border-top: 1px solid #d1d1d1; margin-bottom: 5px; margin-top: 0; padding-top: 20px; line-height:21px;\">С уважением,<br />администрация <a href=\"http://#SERVER_NAME#\" style=\"color:#2e6eb6;\">Интернет-магазина</a><br />\n				E-mail: <a href=\"mailto:#SALE_EMAIL#\" style=\"color:#2e6eb6;\">#SALE_EMAIL#</a>\n			</p>\n		</td>\n	</tr>\n</table>\n</body>\n</html>', 'html', '#BCC#', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, '2015-04-13 11:04:03', 'SALE_NEW_ORDER_RECURRING', 's1', 'Y', '#SALE_EMAIL#', '#EMAIL#', '#SITE_NAME#: Новый заказ N#ORDER_ID# на продление подписки', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nУважаемый #ORDER_USER#,\n\nВаш заказ номер #ORDER_ID# от #ORDER_DATE# на продление подписки принят.\n\nСтоимость заказа: #PRICE#.\n\nСостав заказа:\n#ORDER_LIST#\n\nВы можете следить за выполнением своего заказа (на какой\nстадии выполнения он находится), войдя в Ваш персональный\nраздел сайта #SITE_NAME#. Обратите внимание, что для входа\nв этот раздел Вам необходимо будет ввести логин и пароль\nпользователя сайта #SITE_NAME#.\n\nДля того, чтобы аннулировать заказ, воспользуйтесь функцией\nотмены заказа, которая доступна в Вашем персональном\nразделе сайта #SITE_NAME#.\n\nПожалуйста, при обращении к администрации сайта #SITE_NAME#\nОБЯЗАТЕЛЬНО указывайте номер Вашего заказа - #ORDER_ID#.\n\nСпасибо за покупку!\n', 'text', '#BCC#', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, '2015-04-13 11:04:03', 'SALE_RECURRING_CANCEL', 's1', 'Y', '#SALE_EMAIL#', '#EMAIL#', '#SITE_NAME#: Подписка отменена', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nПодписка отменена\n\n#CANCELED_REASON#\n#SITE_NAME#\n', 'text', '#BCC#', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, '2015-04-13 11:04:04', 'SALE_STATUS_CHANGED_F', 's1', 'Y', '#SALE_EMAIL#', '#EMAIL#', '#SERVER_NAME#: Изменение статуса заказа N#ORDER_ID#', '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"ru\" lang=\"ru\">\n<head>\n	<meta http-equiv=\"Content-Type\" content=\"text/html;charset=windows-1251\"/>\n	<style>\n		body\n		{\n			font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\n			font-size: 14px;\n			color: #000;\n		}\n	</style>\n</head>\n<body>\n<table cellpadding=\"0\" cellspacing=\"0\" width=\"850\" style=\"background-color: #d1d1d1; border-radius: 2px; border:1px solid #d1d1d1; margin: 0 auto;\" border=\"1\" bordercolor=\"#d1d1d1\">\n	<tr>\n		<td height=\"83\" width=\"850\" bgcolor=\"#eaf3f5\" style=\"border: none; padding-top: 23px; padding-right: 17px; padding-bottom: 24px; padding-left: 17px;\">\n			<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\n				<tr>\n					<td bgcolor=\"#ffffff\" height=\"75\" style=\"font-weight: bold; text-align: center; font-size: 26px; color: #0b3961;\">Изменение статуса заказа в магазине #SITE_NAME#</td>\n				</tr>\n				<tr>\n					<td bgcolor=\"#bad3df\" height=\"11\"></td>\n				</tr>\n			</table>\n		</td>\n	</tr>\n	<tr>\n		<td width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 16px; padding-left: 44px;\">\n			<p style=\"margin-top:30px; margin-bottom: 28px; font-weight: bold; font-size: 19px;\"></p>\n			<p style=\"margin-top: 0; margin-bottom: 20px; line-height: 20px;\">Информационное сообщение сайта #SITE_NAME#<br />\n------------------------------------------<br />\n<br />\nСтатус заказа номер #ORDER_ID# от #ORDER_DATE# изменен.<br />\n<br />\nНовый статус заказа:<br />\n#ORDER_STATUS#<br />\n#ORDER_DESCRIPTION#<br />\n#TEXT#<br />\n<br />\nДля получения подробной информации по заказу пройдите на сайт #SERVER_NAME#/personal/order/#ORDER_ID#/<br />\n<br />\nСпасибо за ваш выбор!<br />\n#SITE_NAME#<br />\n</p>\n		</td>\n	</tr>\n	<tr>\n		<td height=\"40px\" width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 30px; padding-left: 44px;\">\n			<p style=\"border-top: 1px solid #d1d1d1; margin-bottom: 5px; margin-top: 0; padding-top: 20px; line-height:21px;\">С уважением,<br />администрация <a href=\"http://#SERVER_NAME#\" style=\"color:#2e6eb6;\">Интернет-магазина</a><br />\n				E-mail: <a href=\"mailto:#SALE_EMAIL#\" style=\"color:#2e6eb6;\">#SALE_EMAIL#</a>\n			</p>\n		</td>\n	</tr>\n</table>\n</body>\n</html>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, '2015-04-13 11:04:04', 'SALE_STATUS_CHANGED_N', 's1', 'Y', '#SALE_EMAIL#', '#EMAIL#', '#SERVER_NAME#: Изменение статуса заказа N#ORDER_ID#', '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"ru\" lang=\"ru\">\n<head>\n	<meta http-equiv=\"Content-Type\" content=\"text/html;charset=windows-1251\"/>\n	<style>\n		body\n		{\n			font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\n			font-size: 14px;\n			color: #000;\n		}\n	</style>\n</head>\n<body>\n<table cellpadding=\"0\" cellspacing=\"0\" width=\"850\" style=\"background-color: #d1d1d1; border-radius: 2px; border:1px solid #d1d1d1; margin: 0 auto;\" border=\"1\" bordercolor=\"#d1d1d1\">\n	<tr>\n		<td height=\"83\" width=\"850\" bgcolor=\"#eaf3f5\" style=\"border: none; padding-top: 23px; padding-right: 17px; padding-bottom: 24px; padding-left: 17px;\">\n			<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\n				<tr>\n					<td bgcolor=\"#ffffff\" height=\"75\" style=\"font-weight: bold; text-align: center; font-size: 26px; color: #0b3961;\">Изменение статуса заказа в магазине #SITE_NAME#</td>\n				</tr>\n				<tr>\n					<td bgcolor=\"#bad3df\" height=\"11\"></td>\n				</tr>\n			</table>\n		</td>\n	</tr>\n	<tr>\n		<td width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 16px; padding-left: 44px;\">\n			<p style=\"margin-top:30px; margin-bottom: 28px; font-weight: bold; font-size: 19px;\"></p>\n			<p style=\"margin-top: 0; margin-bottom: 20px; line-height: 20px;\">Информационное сообщение сайта #SITE_NAME#<br />\n------------------------------------------<br />\n<br />\nСтатус заказа номер #ORDER_ID# от #ORDER_DATE# изменен.<br />\n<br />\nНовый статус заказа:<br />\n#ORDER_STATUS#<br />\n#ORDER_DESCRIPTION#<br />\n#TEXT#<br />\n<br />\nДля получения подробной информации по заказу пройдите на сайт #SERVER_NAME#/personal/order/#ORDER_ID#/<br />\n<br />\nСпасибо за ваш выбор!<br />\n#SITE_NAME#<br />\n</p>\n		</td>\n	</tr>\n	<tr>\n		<td height=\"40px\" width=\"850\" bgcolor=\"#f7f7f7\" valign=\"top\" style=\"border: none; padding-top: 0; padding-right: 44px; padding-bottom: 30px; padding-left: 44px;\">\n			<p style=\"border-top: 1px solid #d1d1d1; margin-bottom: 5px; margin-top: 0; padding-top: 20px; line-height:21px;\">С уважением,<br />администрация <a href=\"http://#SERVER_NAME#\" style=\"color:#2e6eb6;\">Интернет-магазина</a><br />\n				E-mail: <a href=\"mailto:#SALE_EMAIL#\" style=\"color:#2e6eb6;\">#SALE_EMAIL#</a>\n			</p>\n		</td>\n	</tr>\n</table>\n</body>\n</html>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, '2015-04-13 11:04:06', 'VIRUS_DETECTED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Обнаружен вирус', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, '2015-04-13 11:04:09', 'SUBSCRIBE_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение подписки', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера #SERVER_NAME#.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ #EMAIL#\nДата добавления/редактирования .... #DATE_SUBSCR#\n\nВаш код для подтверждения подписки: #CONFIRM_CODE#\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nОтписаться:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, '2015-04-13 11:04:09', 'VOTE_FOR', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [V] #VOTE_TITLE#', '#USER_NAME# принял участие в опросе \"#VOTE_TITLE#\":\n#VOTE_STATISTIC#\n\nhttp://#SERVER_NAME##URL#\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_event_message_attachment
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_message_attachment`;
CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_event_message_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_message_site`;
CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_event_message_site` VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1'),
(7, 's1'),
(8, 's1'),
(9, 's1'),
(10, 's1'),
(11, 's1'),
(12, 's1'),
(13, 's1'),
(14, 's1'),
(15, 's1'),
(16, 's1'),
(17, 's1'),
(18, 's1'),
(19, 's1'),
(20, 's1'),
(21, 's1'),
(22, 's1'),
(23, 's1'),
(24, 's1'),
(25, 's1'),
(26, 's1'),
(27, 's1'),
(28, 's1'),
(29, 's1'),
(30, 's1'),
(31, 's1'),
(32, 's1'),
(33, 's1'),
(34, 's1'),
(35, 's1');
-- -----------------------------------
-- Dumping table b_event_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_type`;
CREATE TABLE `b_event_type` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` char(2) NOT NULL,
  `EVENT_NAME` varchar(255) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` text,
  `SORT` int(18) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=cp1251;

INSERT INTO `b_event_type` VALUES
(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1),
(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2),
(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3),
(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4),
(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5),
(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6),
(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 7),
(8, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1),
(9, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2),
(10, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3),
(11, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4),
(12, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5),
(13, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6),
(14, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', 7),
(15, 'ru', 'NEW_BLOG_MESSAGE', 'Новое сообщение в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_DATE# - Дата сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 150),
(16, 'ru', 'NEW_BLOG_COMMENT', 'Новый комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 150),
(17, 'ru', 'NEW_BLOG_COMMENT2COMMENT', 'Новый комментарий на ваш комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 150),
(18, 'ru', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'Новый комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 150),
(19, 'ru', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'Новый комментарий на ваш комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 150),
(20, 'ru', 'BLOG_YOUR_BLOG_TO_USER', 'Ваш блог был добавлен в друзья', '\n#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 150),
(21, 'ru', 'BLOG_YOU_TO_BLOG', 'Вы были добавлены в друзья блога', '\n#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 150),
(22, 'ru', 'BLOG_BLOG_TO_YOU', 'К вам в друзья был добавлен блог', '\n#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 150),
(23, 'ru', 'BLOG_USER_TO_YOUR_BLOG', 'В ваш блог был добавлен друг', '\n#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 150),
(24, 'en', 'NEW_BLOG_MESSAGE', 'New blog message', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#MESSAGE_TEXT# - Message text\n#MESSAGE_DATE# - Message date\n#MESSAGE_PATH# - URL to message\n#AUTHOR# - Message author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 150),
(25, 'en', 'NEW_BLOG_COMMENT', 'New comment in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 150),
(26, 'en', 'NEW_BLOG_COMMENT2COMMENT', 'New comment for your in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 150),
(27, 'en', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'New comment in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 150),
(28, 'en', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'New comment for your in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 150),
(29, 'en', 'BLOG_YOUR_BLOG_TO_USER', 'Your blog has been added to friends', '#BLOG_ID# - Blog ID\\r\\n#BLOG_NAME# - Blog name\\r\\n#BLOG_URL# - Blog name, Latin letters only\\r\\n#BLOG_ADR# - Blog address\\r\\n#USER_ID# - User ID\\r\\n#USER# - User\\r\\n#USER_URL# - User URL\\r\\n#EMAIL_FROM# - Sender E-mail\\r\\n#EMAIL_TO# - Recipient E-mail', 150),
(30, 'en', 'BLOG_YOU_TO_BLOG', 'You have been added to blog friends', '#BLOG_ID# - Blog ID\\r\\n#BLOG_NAME# - Blog name\\r\\n#BLOG_URL# - Blog name, Latin letters only\\r\\n#BLOG_ADR# - Blog address\\r\\n#USER_ID# - User ID\\r\\n#USER# - User\\r\\n#USER_URL# - User URL\\r\\n#EMAIL_FROM# - Sender E-mail\\r\\n#EMAIL_TO# - Recipient E-mail', 150),
(31, 'en', 'BLOG_BLOG_TO_YOU', 'A blog has been added to your friends', '#BLOG_ID# - Blog ID\\r\\n#BLOG_NAME# - Blog name\\r\\n#BLOG_URL# - Blog name, Latin letters only\\r\\n#BLOG_ADR# - Blog address\\r\\n#USER_ID# - User ID\\r\\n#USER# - User\\r\\n#USER_URL# - User URL\\r\\n#EMAIL_FROM# - Sender E-mail\\r\\n#EMAIL_TO# - Recipient E-mail', 150),
(32, 'en', 'BLOG_USER_TO_YOUR_BLOG', 'A friend has been added to your blog', '#BLOG_ID# - Blog ID\\r\\n#BLOG_NAME# - Blog name\\r\\n#BLOG_URL# - Blog name, Latin letters only\\r\\n#BLOG_ADR# - Blog address\\r\\n#USER_ID# - User ID\\r\\n#USER# - User\\r\\n#USER_URL# - User URL\\r\\n#EMAIL_FROM# - Sender E-mail\\r\\n#EMAIL_TO# - Recipient E-mail', 150),
(33, 'ru', 'NEW_FORUM_MESSAGE', 'Новое сообщение на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 150),
(34, 'ru', 'NEW_FORUM_PRIV', 'Приватное письмо посетителю форума', '\n			#FROM_NAME# - Автор сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Тело сообщения\n			#MESSAGE_DATE# - Дата сообщения', 150),
(35, 'ru', 'NEW_FORUM_PRIVATE_MESSAGE', 'Приватное сообщение', '\n			#FROM_NAME# - Имя автора сообщения\n			#FROM_USER_ID# - ID автора сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_USER_ID# - ID получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#MESSAGE_LINK# - Ссылка на сообщение', 150),
(36, 'ru', 'EDIT_FORUM_MESSAGE', 'Изменение сообщения на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 150),
(37, 'en', 'NEW_FORUM_MESSAGE', 'New forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 150),
(38, 'en', 'NEW_FORUM_PRIV', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date', 150),
(39, 'en', 'NEW_FORUM_PRIVATE_MESSAGE', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_USER_ID# - ID of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_USER_ID# - ID of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date\n			#MESSAGE_LINK# - Link to message', 150),
(40, 'en', 'EDIT_FORUM_MESSAGE', 'Changing forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 150),
(41, 'ru', 'FORUM_NEW_MESSAGE_MAIL', 'Новое сообщение на форуме в режиме общения по E-Mail', '#FORUM_NAME# - Название форума\n#AUTHOR# - Автор сообщения\n#FROM_EMAIL# - E-Mail для поля From письма\n#RECIPIENT# - Получатель сообщения\n#TOPIC_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#PATH2FORUM# - Адрес сообщения\n#MESSAGE_DATE# - Дата сообщения\n#FORUM_EMAIL# - Е-Mail адрес для добавления сообщений на форум\n#FORUM_ID# - ID форума\n#TOPIC_ID# - ID темы \n#MESSAGE_ID# - ID сообщения\n#TAPPROVED# - Тема опубликована\n#MAPPROVED# - Сообщение опубликовано\n', 150),
(42, 'en', 'FORUM_NEW_MESSAGE_MAIL', 'New message at the forum (e-mail messaging mode)', '#FORUM_NAME# - Forum name\n#AUTHOR# - Message author\n#FROM_EMAIL# - E-Mail in the &amp;From&amp; field\n#RECIPIENT# - Message recipient\n#TOPIC_TITLE# - Message subject\n#MESSAGE_TEXT# - Message text\n#PATH2FORUM# - Message URL\n#MESSAGE_DATE# - Message date\n#FORUM_EMAIL# - E-Mail to add messages to the forum \n#FORUM_ID# - Forum ID\n#TOPIC_ID# - Topic ID \n#MESSAGE_ID# - Message ID\n#TAPPROVED# - Topic approved and published\n#MAPPROVED# - Message approved and published\n', 150),
(43, 'ru', 'SALE_NEW_ORDER', 'Новый заказ', '#ORDER_ID# - код заказа\n#ORDER_DATE# - дата заказа\n#ORDER_USER# - заказчик\n#PRICE# - сумма заказа\n#EMAIL# - E-Mail заказчика\n#BCC# - E-Mail скрытой копии\n#ORDER_LIST# - состав заказа\n#SALE_EMAIL# - E-Mail отдела продаж', 150),
(44, 'ru', 'SALE_NEW_ORDER_RECURRING', 'Новый заказ на продление подписки', '#ORDER_ID# - код заказа\n#ORDER_DATE# - дата заказа\n#ORDER_USER# - заказчик\n#PRICE# - сумма заказа\n#EMAIL# - E-Mail заказчика\n#BCC# - E-Mail скрытой копии\n#ORDER_LIST# - состав заказа\n#SALE_EMAIL# - E-Mail отдела продаж', 150),
(45, 'ru', 'SALE_ORDER_REMIND_PAYMENT', 'Напоминание об оплате заказа', '#ORDER_ID# - код заказа\n#ORDER_DATE# - дата заказа\n#ORDER_USER# - заказчик\n#PRICE# - сумма заказа\n#EMAIL# - E-Mail заказчика\n#BCC# - E-Mail скрытой копии\n#ORDER_LIST# - состав заказа\n#SALE_EMAIL# - E-Mail отдела продаж', 150),
(46, 'ru', 'SALE_ORDER_CANCEL', 'Отмена заказа', '#ORDER_ID# - код заказа\n#ORDER_DATE# - дата заказа\n#EMAIL# - E-Mail пользователя\n#ORDER_CANCEL_DESCRIPTION# - причина отмены\n#SALE_EMAIL# - E-Mail отдела продаж', 150),
(47, 'ru', 'SALE_ORDER_PAID', 'Заказ оплачен', '#ORDER_ID# - код заказа\n#ORDER_DATE# - дата заказа\n#EMAIL# - E-Mail пользователя\n#SALE_EMAIL# - E-Mail отдела продаж', 150),
(48, 'ru', 'SALE_ORDER_DELIVERY', 'Доставка заказа разрешена', '#ORDER_ID# - код заказа\n#ORDER_DATE# - дата заказа\n#EMAIL# - E-Mail пользователя\n#SALE_EMAIL# - E-Mail отдела продаж', 150),
(49, 'ru', 'SALE_RECURRING_CANCEL', 'Подписка отменена', '#ORDER_ID# - код заказа\n#ORDER_DATE# - дата заказа\n#EMAIL# - E-Mail пользователя\n#CANCELED_REASON# - причина отмены\n#SALE_EMAIL# - E-Mail отдела продаж', 150),
(50, 'ru', 'SALE_SUBSCRIBE_PRODUCT', 'Уведомление о поступлении товара', '#USER_NAME# - имя пользователя\n#EMAIL# - email пользователя\n#NAME# - название товара\n#PAGE_URL# - детальная страница товара', 150),
(51, 'ru', 'SALE_ORDER_TRACKING_NUMBER', 'Уведомление об изменении идентификатора почтового отправления', '#ORDER_ID# - код заказа\n#ORDER_DATE# - дата заказа\n#ORDER_USER# - заказчик\n#ORDER_TRACKING_NUMBER# - идентификатор почтового отправления\n#EMAIL# - E-Mail заказчика\n#BCC# - E-Mail скрытой копии\n#SALE_EMAIL# - E-Mail отдела продаж', 150),
(52, 'ru', 'SALE_STATUS_CHANGED_F', 'Изменение статуса заказа на  \"Выполнен\"', '#ORDER_ID# - код заказа\n#ORDER_DATE# - дата заказа\n#ORDER_STATUS# - статус заказа\n#EMAIL# - E-Mail пользователя\n#ORDER_DESCRIPTION# - описание статуса заказа\n#TEXT# - текст\n#SALE_EMAIL# - E-Mail отдела продаж\n', 150),
(53, 'ru', 'SALE_STATUS_CHANGED_N', 'Изменение статуса заказа на  \"Принят\"', '#ORDER_ID# - код заказа\n#ORDER_DATE# - дата заказа\n#ORDER_STATUS# - статус заказа\n#EMAIL# - E-Mail пользователя\n#ORDER_DESCRIPTION# - описание статуса заказа\n#TEXT# - текст\n#SALE_EMAIL# - E-Mail отдела продаж\n', 150),
(54, 'en', 'SALE_NEW_ORDER', 'New order', '#ORDER_ID# - Order ID\n#ORDER_DATE# - Order date\n#ORDER_USER# - User\n#EMAIL# - User E-Mail\n#BCC# - BCC E-Mail\n#ORDER_LIST# - Order list\n#SALE_EMAIL# - Sales department e-mail', 150),
(55, 'en', 'SALE_NEW_ORDER_RECURRING', 'New Order for Subscription Renewal', '#ORDER_ID# - order ID\\r\\n#ORDER_DATE# - order date\\r\\n#ORDER_USER# - customer\\r\\n#PRICE# - order amount\\r\\n#EMAIL# - customer\'s e-mail address\\r\\n#BCC# - blind copy e-mail address\\r\\n#ORDER_LIST# - order items\\r\\n#SALE_EMAIL# - sales dept. e-mail address', 150),
(56, 'en', 'SALE_ORDER_REMIND_PAYMENT', 'Order Payment Reminder', '#ORDER_ID# - order ID\n#ORDER_DATE# - order date\n#ORDER_USER# - customer\n#PRICE# - order amount\n#EMAIL# - customer\'s e-mail address\n#BCC# - blind copy e-mail address\n#ORDER_LIST# - order items\n#SALE_EMAIL# - sales dept. e-mail address', 150),
(57, 'en', 'SALE_ORDER_CANCEL', 'Cancel order', '#ORDER_ID# - Order ID\n#ORDER_DATE# - Order date\n#EMAIL# - User E-Mail\n#ORDER_CANCEL_DESCRIPTION# - Order cancel description\n#SALE_EMAIL# - Sales department e-mail', 150),
(58, 'en', 'SALE_ORDER_PAID', 'Paid order', '#ORDER_ID# - Order ID\n#ORDER_DATE# - Order date\n#EMAIL# - User E-Mail\n#SALE_EMAIL# - Sales department e-mail', 150),
(59, 'en', 'SALE_ORDER_DELIVERY', 'Order delivery allowed', '#ORDER_ID# - Order ID\n#ORDER_DATE# - Order date\n#EMAIL# - User E-Mail', 150),
(60, 'en', 'SALE_RECURRING_CANCEL', 'Recurring payment canceled', '#ORDER_ID# - Order ID\n#ORDER_DATE# - Order date\n#EMAIL# - User E-Mail\n#CANCELED_REASON# - Reason\n#SALE_EMAIL# - Sales department e-mail', 150),
(61, 'en', 'SALE_SUBSCRIBE_PRODUCT', 'Back in stock notification', '#USER_NAME# - user name\n#EMAIL# - user e-mail \n#NAME# - product name\n#PAGE_URL# - product details page', 150),
(62, 'en', 'SALE_ORDER_TRACKING_NUMBER', 'Notification of change in tracking number ', '#ORDER_ID# - order ID number\n#ORDER_DATE# - order date\n#ORDER_USER# - customer\n#ORDER_TRACKING_NUMBER# - tracking number for order\n#EMAIL# - E-Mail of customer\n#BCC# - E-Mail for blind copy\n#SALE_EMAIL# - E-Mail of sales department or associate', 150),
(63, 'en', 'SALE_STATUS_CHANGED_F', 'Changing order status to \"Completed\"', '#ORDER_ID# - order ID\n#ORDER_DATE# - order date\n#ORDER_STATUS# - order status\n#EMAIL# - customer e-mail\n#ORDER_DESCRIPTION# - order status description\n#TEXT# - text\n#SALE_EMAIL# - Sales department e-mail\n', 150),
(64, 'en', 'SALE_STATUS_CHANGED_N', 'Changing order status to \"Accepted\"', '#ORDER_ID# - order ID\n#ORDER_DATE# - order date\n#ORDER_STATUS# - order status\n#EMAIL# - customer e-mail\n#ORDER_DESCRIPTION# - order status description\n#TEXT# - text\n#SALE_EMAIL# - Sales department e-mail\n', 150),
(65, 'ru', 'VIRUS_DETECTED', 'Обнаружен вирус', '#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)', 150),
(66, 'en', 'VIRUS_DETECTED', 'Virus detected', '#EMAIL# - Site administrator\'s e-mail address (from the Kernel module settings)', 150),
(67, 'ru', 'SUBSCRIBE_CONFIRM', 'Подтверждение подписки', '#ID# - идентификатор подписки\n#EMAIL# - адрес подписки\n#CONFIRM_CODE# - код подтверждения\n#SUBSCR_SECTION# - раздел, где находится страница редактирования подписки (задается в настройках)\n#USER_NAME# - имя подписчика (может отсутствовать)\n#DATE_SUBSCR# - дата добавления/изменения адреса\n', 150),
(68, 'en', 'SUBSCRIBE_CONFIRM', 'Confirmation of subscription', '#ID# - subscription ID\n#EMAIL# - subscription email\n#CONFIRM_CODE# - confirmation code\n#SUBSCR_SECTION# - section with subscription edit page (specifies in the settings)\n#USER_NAME# - subscriber\'s name (optional)\n#DATE_SUBSCR# - date of adding/change of address\n', 150),
(69, 'ru', 'VOTE_FOR', 'Новый голос', '#ID# - ID результата голосования\n#TIME# - время голосования\n#VOTE_TITLE# - наименование опроса\n#VOTE_DESCRIPTION# - описание опроса\n#VOTE_ID# - ID опроса\n#CHANNEL# - наименование группы опроса\n#CHANNEL_ID# - ID группы опроса\n#VOTER_ID# - ID проголосовавшего посетителя\n#USER_NAME# - ФИО пользователя\n#LOGIN# - логин\n#USER_ID# - ID пользователя\n#STAT_GUEST_ID# - ID посетителя модуля статистики\n#SESSION_ID# - ID сессии модуля статистики\n#IP# - IP адрес\n#VOTE_STATISTIC# - Сводная статистика опроса типа ( - Вопрос - Ответ )\n#URL# - Путь к опросу\n', 150),
(70, 'en', 'VOTE_FOR', 'New vote', '#ID# - Vote result ID\n#TIME# - Time of vote\n#VOTE_TITLE# - Poll name\n#VOTE_DESCRIPTION# - Poll description\n#VOTE_ID# - Poll ID\n#CHANNEL# - Poll group name\n#CHANNEL_ID# - Poll group ID\n#VOTER_ID# - Voter\'s user ID\n#USER_NAME# - User full name\n#LOGIN# - login\n#USER_ID# - User ID\n#STAT_GUEST_ID# - Visitor ID in web analytics module\n#SESSION_ID# - Session ID in web analytics module\n#IP# - IP address\n#VOTE_STATISTIC# - Summary statistics of this poll type ( - Question - Answer)\n#URL# - Poll URL', 150);
-- -----------------------------------
-- Dumping table b_favorite
-- -----------------------------------
DROP TABLE IF EXISTS `b_favorite`;
CREATE TABLE `b_favorite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `URL` text,
  `COMMENTS` text,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(18) DEFAULT NULL,
  `COMMON` char(1) NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_file
-- -----------------------------------
DROP TABLE IF EXISTS `b_file`;
CREATE TABLE `b_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) DEFAULT NULL,
  `FILE_NAME` varchar(255) NOT NULL,
  `ORIGINAL_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `HANDLER_ID` varchar(50) DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=cp1251;

INSERT INTO `b_file` VALUES
(1, '2015-04-14 21:40:51', 'iblock', 430, 750, 329829, 'image/jpeg', 'iblock/e0f', 'e0f186d2ca0e325d56816fc5233f6ce7.jpg', 'Teaser-1.jpg', '', NULL, '5500901868d696d8b3c0d6488b6bb125'),
(2, '2015-04-14 21:42:00', 'iblock', 430, 750, 329610, 'image/jpeg', 'iblock/0c9', '0c9502538d4befda86fd7783afaedbde.jpg', 'Teaser-2.jpg', '', NULL, 'ec4cb14446256c65c36cd896630e7748'),
(3, '2015-04-14 21:43:01', 'iblock', 430, 750, 332286, 'image/jpeg', 'iblock/8cb', '8cb6bb0322bbff61db94eaf81ebd04cf.jpg', 'Teaser-3.jpg', '', NULL, 'a0294499002d3fee5718e9cc8c3abf0f'),
(4, '2015-04-21 07:10:42', 'iblock', 29, 126, 3696, 'image/png', 'iblock/0ba', '0ba4479f89ed2af233e5cfa4a2bd7b9b.png', 'Logo-1.png', '', NULL, '0dab47808a58cd234c63875b1dcb0ccc'),
(5, '2015-04-21 07:46:17', 'iblock', 24, 156, 3786, 'image/png', 'iblock/394', '39498f176d62f991484c61de326d1a9c.png', 'Logo-7.png', '', NULL, 'e17e7faa52e195d21a788d473063ac66'),
(6, '2015-04-21 07:46:54', 'iblock', 30, 139, 3411, 'image/png', 'iblock/51c', '51c5d4bc60773f77b97b31ebd4469cf6.png', 'Logo-6.png', '', NULL, '84b81fc91bdf7057df82178d7629b841'),
(7, '2015-04-21 07:47:20', 'iblock', 31, 118, 4458, 'image/png', 'iblock/d42', 'd426c91e67aa28d6e18e7b70a9d40f16.png', 'Logo-5.png', '', NULL, '11873da5cb064a4d34bc821dd8dc9beb'),
(8, '2015-04-23 07:54:34', 'iblock', 430, 750, 329829, 'image/jpeg', 'iblock/6ad', '6add6ffdf1c5d8a432de96e9d049a1ba.jpg', 'Teaser-1.jpg', 'Сертификат1', NULL, 'edd519e0a91351f6774f5e8c25c5656a'),
(9, '2015-04-23 07:55:56', 'iblock', 430, 750, 329829, 'image/jpeg', 'iblock/731', '7313316bdec2d5b274067bdf9c9b53fb.jpg', 'Teaser-1.jpg', 'сертификат', NULL, '6c8871b8db64f12b5b4c0b054f3f9b7a'),
(10, '2015-04-23 07:55:56', 'iblock', 430, 750, 332286, 'image/jpeg', 'iblock/6d8', '6d8dcd88e54afc9ae78d461442aa1cbd.jpg', 'Teaser-3.jpg', 'еще один', NULL, '0779b4fbe4bdd7da0791f34135f17ce1'),
(11, '2015-04-23 07:55:56', 'iblock', 430, 750, 329610, 'image/jpeg', 'iblock/95a', '95a000b6b89319849257713f5904a315.jpg', 'Teaser-2.jpg', 'и еще', NULL, '4252291212eae58c36b2b2e4cd6325be');
-- -----------------------------------
-- Dumping table b_file_search
-- -----------------------------------
DROP TABLE IF EXISTS `b_file_search`;
CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `F_PATH` varchar(255) DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_filters
-- -----------------------------------
DROP TABLE IF EXISTS `b_filters`;
CREATE TABLE `b_filters` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) DEFAULT NULL,
  `FILTER_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FIELDS` text NOT NULL,
  `COMMON` char(1) DEFAULT NULL,
  `PRESET` char(1) DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `PRESET_ID` varchar(255) DEFAULT NULL,
  `SORT` int(18) DEFAULT NULL,
  `SORT_FIELD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_finder_dest
-- -----------------------------------
DROP TABLE IF EXISTS `b_finder_dest`;
CREATE TABLE `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) DEFAULT NULL,
  `CONTEXT` varchar(50) NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form
-- -----------------------------------
DROP TABLE IF EXISTS `b_form`;
CREATE TABLE `b_form` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SID` varchar(50) NOT NULL,
  `BUTTON` varchar(255) DEFAULT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `USE_CAPTCHA` char(1) DEFAULT 'N',
  `DESCRIPTION` text,
  `DESCRIPTION_TYPE` varchar(4) NOT NULL DEFAULT 'html',
  `FORM_TEMPLATE` text,
  `USE_DEFAULT_TEMPLATE` char(1) DEFAULT 'Y',
  `SHOW_TEMPLATE` varchar(255) DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(50) DEFAULT NULL,
  `SHOW_RESULT_TEMPLATE` varchar(255) DEFAULT NULL,
  `PRINT_RESULT_TEMPLATE` varchar(255) DEFAULT NULL,
  `EDIT_RESULT_TEMPLATE` varchar(255) DEFAULT NULL,
  `FILTER_RESULT_TEMPLATE` text,
  `TABLE_RESULT_TEMPLATE` text,
  `USE_RESTRICTIONS` char(1) DEFAULT 'N',
  `RESTRICT_USER` int(5) DEFAULT '0',
  `RESTRICT_TIME` int(10) DEFAULT '0',
  `RESTRICT_STATUS` varchar(255) DEFAULT NULL,
  `STAT_EVENT1` varchar(255) DEFAULT NULL,
  `STAT_EVENT2` varchar(255) DEFAULT NULL,
  `STAT_EVENT3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_2_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_2_group`;
CREATE TABLE `b_form_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_2_mail_template
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_2_mail_template`;
CREATE TABLE `b_form_2_mail_template` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FORM_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_2_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_2_site`;
CREATE TABLE `b_form_2_site` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`FORM_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_answer
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_answer`;
CREATE TABLE `b_form_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MESSAGE` text,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `VALUE` varchar(255) DEFAULT NULL,
  `FIELD_TYPE` varchar(255) NOT NULL DEFAULT 'text',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` text,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_crm
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_crm`;
CREATE TABLE `b_form_crm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL DEFAULT '',
  `ACTIVE` char(1) DEFAULT 'Y',
  `URL` varchar(255) NOT NULL DEFAULT '',
  `AUTH_HASH` varchar(32) DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_crm_field
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_crm_field`;
CREATE TABLE `b_form_crm_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LINK_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) DEFAULT '0',
  `FIELD_ALT` varchar(100) DEFAULT '',
  `CRM_FIELD` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `ix_b_form_crm_field_1` (`LINK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_crm_link
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_crm_link`;
CREATE TABLE `b_form_crm_link` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `CRM_ID` int(18) NOT NULL DEFAULT '0',
  `LINK_TYPE` char(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_form_crm_link_1` (`FORM_ID`,`CRM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_field
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_field`;
CREATE TABLE `b_form_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `TITLE` text,
  `TITLE_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `SID` varchar(50) DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ADDITIONAL` char(1) NOT NULL DEFAULT 'N',
  `REQUIRED` char(1) NOT NULL DEFAULT 'N',
  `IN_FILTER` char(1) NOT NULL DEFAULT 'N',
  `IN_RESULTS_TABLE` char(1) NOT NULL DEFAULT 'N',
  `IN_EXCEL_TABLE` char(1) NOT NULL DEFAULT 'Y',
  `FIELD_TYPE` varchar(50) DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `COMMENTS` text,
  `FILTER_TITLE` text,
  `RESULTS_TABLE_TITLE` text,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_field_filter
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_field_filter`;
CREATE TABLE `b_form_field_filter` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `PARAMETER_NAME` varchar(50) NOT NULL,
  `FILTER_TYPE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_field_validator
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_field_validator`;
CREATE TABLE `b_form_field_validator` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) DEFAULT 'y',
  `C_SORT` int(18) DEFAULT '100',
  `VALIDATOR_SID` varchar(255) NOT NULL DEFAULT '',
  `PARAMS` text,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_menu
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_menu`;
CREATE TABLE `b_form_menu` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `LID` char(2) NOT NULL,
  `MENU` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_result
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_result`;
CREATE TABLE `b_form_result` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `USER_ID` int(18) DEFAULT NULL,
  `USER_AUTH` char(1) NOT NULL DEFAULT 'N',
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `SENT_TO_CRM` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_STATUS_ID` (`STATUS_ID`),
  KEY `IX_SENT_TO_CRM` (`SENT_TO_CRM`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_result_answer
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_result_answer`;
CREATE TABLE `b_form_result_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `RESULT_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) DEFAULT NULL,
  `ANSWER_TEXT` text,
  `ANSWER_TEXT_SEARCH` longtext,
  `ANSWER_VALUE` varchar(255) DEFAULT NULL,
  `ANSWER_VALUE_SEARCH` longtext,
  `USER_TEXT` longtext,
  `USER_TEXT_SEARCH` longtext,
  `USER_DATE` datetime DEFAULT NULL,
  `USER_FILE_ID` int(18) DEFAULT NULL,
  `USER_FILE_NAME` varchar(255) DEFAULT NULL,
  `USER_FILE_IS_IMAGE` char(1) DEFAULT NULL,
  `USER_FILE_HASH` varchar(255) DEFAULT NULL,
  `USER_FILE_SUFFIX` varchar(255) DEFAULT NULL,
  `USER_FILE_SIZE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RESULT_ID` (`RESULT_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`),
  KEY `IX_ANSWER_ID` (`ANSWER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_status
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_status`;
CREATE TABLE `b_form_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` text,
  `DEFAULT_VALUE` char(1) NOT NULL DEFAULT 'N',
  `CSS` varchar(255) DEFAULT 'statusgreen',
  `HANDLER_OUT` varchar(255) DEFAULT NULL,
  `HANDLER_IN` varchar(255) DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_status_2_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_status_2_group`;
CREATE TABLE `b_form_status_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_STATUS_GROUP` (`STATUS_ID`,`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_form_status_2_mail_template
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_status_2_mail_template`;
CREATE TABLE `b_form_status_2_mail_template` (
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`STATUS_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum`;
CREATE TABLE `b_forum` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text,
  `SORT` int(10) NOT NULL DEFAULT '150',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) NOT NULL DEFAULT 'N',
  `ALLOW_ANCHOR` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_BIU` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_IMG` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_VIDEO` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_LIST` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_QUOTE` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_CODE` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_FONT` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_SMILES` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD` char(1) NOT NULL DEFAULT 'N',
  `ALLOW_TABLE` char(1) NOT NULL DEFAULT 'N',
  `ALLOW_ALIGN` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD_EXT` varchar(255) DEFAULT NULL,
  `ALLOW_MOVE_TOPIC` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_TOPIC_TITLED` char(1) NOT NULL DEFAULT 'N',
  `ALLOW_NL2BR` char(1) NOT NULL DEFAULT 'N',
  `ALLOW_SIGNATURE` char(1) NOT NULL DEFAULT 'Y',
  `PATH2FORUM_MESSAGE` varchar(255) DEFAULT NULL,
  `ASK_GUEST_EMAIL` char(1) NOT NULL DEFAULT 'N',
  `USE_CAPTCHA` char(1) NOT NULL DEFAULT 'N',
  `INDEXATION` char(1) NOT NULL DEFAULT 'Y',
  `DEDUPLICATION` char(1) NOT NULL DEFAULT 'Y',
  `MODERATION` char(1) NOT NULL DEFAULT 'N',
  `ORDER_BY` char(1) NOT NULL DEFAULT 'P',
  `ORDER_DIRECTION` varchar(4) NOT NULL DEFAULT 'DESC',
  `LID` char(2) NOT NULL DEFAULT 'ru',
  `TOPICS` int(11) NOT NULL DEFAULT '0',
  `POSTS` int(11) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(11) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(11) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `EVENT1` varchar(255) DEFAULT 'forum',
  `EVENT2` varchar(255) DEFAULT 'message',
  `EVENT3` varchar(255) DEFAULT NULL,
  `HTML` varchar(255) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_SORT` (`SORT`),
  KEY `IX_FORUM_ACTIVE` (`ACTIVE`),
  KEY `IX_FORUM_GROUP_ID` (`FORUM_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum2site
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum2site`;
CREATE TABLE `b_forum2site` (
  `FORUM_ID` int(11) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `PATH2FORUM_MESSAGE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`FORUM_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_dictionary
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_dictionary`;
CREATE TABLE `b_forum_dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) DEFAULT NULL,
  `TYPE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251;

INSERT INTO `b_forum_dictionary` VALUES
(1, '[ru] Словарь слов', 'W'),
(2, '[ru] Словарь транслита', 'T'),
(3, '[en] Bad words', 'W'),
(4, '[en] Transliteration', 'T');
-- -----------------------------------
-- Dumping table b_forum_email
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_email`;
CREATE TABLE `b_forum_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_FORUM_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `FORUM_ID` int(11) NOT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `MAIL_FILTER_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `USE_EMAIL` char(1) DEFAULT NULL,
  `EMAIL_GROUP` varchar(255) DEFAULT NULL,
  `SUBJECT_SUF` varchar(50) DEFAULT NULL,
  `USE_SUBJECT` char(1) DEFAULT NULL,
  `URL_TEMPLATES_MESSAGE` varchar(255) DEFAULT NULL,
  `NOT_MEMBER_POST` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_EMAIL_FORUM_SOC` (`FORUM_ID`,`SOCNET_GROUP_ID`),
  KEY `IX_B_FORUM_EMAIL_FILTER_ID` (`MAIL_FILTER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_file
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_file`;
CREATE TABLE `b_forum_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(18) DEFAULT NULL,
  `TOPIC_ID` int(20) DEFAULT NULL,
  `MESSAGE_ID` int(20) DEFAULT NULL,
  `FILE_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `HITS` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_FILE_FILE` (`FILE_ID`),
  KEY `IX_FORUM_FILE_FORUM` (`FORUM_ID`),
  KEY `IX_FORUM_FILE_TOPIC` (`TOPIC_ID`),
  KEY `IX_FORUM_FILE_MESSAGE` (`MESSAGE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_filter
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_filter`;
CREATE TABLE `b_forum_filter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT NULL,
  `WORDS` varchar(255) DEFAULT NULL,
  `PATTERN` text,
  `REPLACEMENT` varchar(255) DEFAULT NULL,
  `DESCRIPTION` text,
  `USE_IT` varchar(50) DEFAULT NULL,
  `PATTERN_CREATE` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_FILTER_2` (`USE_IT`),
  KEY `IX_B_FORUM_FILTER_3` (`PATTERN_CREATE`)
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=cp1251;

INSERT INTO `b_forum_filter` VALUES
(1, 1, '*пизд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(2, 1, '*пизж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(3, 1, '*сра%', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([СсCc]+)([РрPpRr]+)([АаAa]+)([[Цц]+([Аа]+|[Оо]+)]+|[[Тт]+([Ьь]+|)[Сс]+[Яя]+]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(4, 1, 'анобляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([АаAa]+)([НнNn]+)([ОоOo]+)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(5, 1, 'взъеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвVv]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(6, 1, 'бля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(7, 1, 'долбоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([ОоOo]+)([ЛлLl]+)([БбBb]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(8, 1, 'дуроеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([УуUu]+)([РрPpRr]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(9, 1, 'еби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(10, 1, 'ебисти*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)([ТтTt]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(11, 1, 'ебическ*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([Чч]+)([ЁёЕеEe]+)([СсCc]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(12, 1, 'еблив*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ИиIi]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(13, 1, 'ебло*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ОоOo]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(14, 1, 'еблыс*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Ыы]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(15, 1, 'ебля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(16, 1, 'ебс', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([СсCc]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(17, 1, 'ебукент*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([КкKk]+)([ЁёЕеEe]+)([НнNn]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(18, 1, 'ебурген*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([РрPpRr]+)([Гг]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(19, 1, 'коноебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([КкKk]+)([ОоOo]+)([НнNn]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(20, 1, 'мозгоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([ОоOo]+)([ЗзZz3]+)([Гг]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(21, 1, 'мудоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(22, 1, 'однохуйствен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ДдDd]+)([НнNn]+)([ОоOo]+)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)([СсCc]+)([ТтTt]+)([ВвVv]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(23, 1, 'охуе*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(24, 1, 'охуи*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(25, 1, 'охуя*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(26, 1, 'разъеба*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(27, 1, 'распиздон*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)([ОоOo]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(28, 1, 'расхуюж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ХхXx]+)([УуUu]+)([Юю]+|[[Йй]+[Оо]+]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(29, 1, 'худоебин*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(30, 1, 'хуе', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(31, 1, 'хуебрат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([БбBb]+)([РрPpRr]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(32, 1, 'хуеглот*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([Гг]+)([ЛлLl]+)([ОоOo]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(33, 1, 'хуеплёт*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ПпPp]+)([ЛлLl]+)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(34, 1, 'хует*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(35, 1, 'хуила', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ИиIi]+)([ЛлLl]+)([АаAa]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(36, 1, 'хул?', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЛлLl]+).?)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(37, 1, 'хуя', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(38, 1, '^бляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(39, 1, '^пидор*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ПпPp]+)([ИиIi]+)([ДдDd]+)([ОоOo]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(40, 1, '^хуев*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(41, 1, '^хуем*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(42, 1, '^хуй*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(43, 1, '^хуяк*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(44, 1, '^хуям*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(45, 1, '^хуяр*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(46, 1, '^хуяч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(47, 1, '^ъебал*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ЛлLl]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(48, 1, '^ъебан*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(49, 1, '^ъебар*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(50, 1, '^ъебат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(51, 1, '^ъебен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(52, 1, '^ъеби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(53, 1, '^ъебис*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(54, 1, '^ъебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(55, 1, '^ъёбля*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([ЛлLl]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(56, 1, '^ъёбну*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([НнNn]+)([УуUu]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(57, 1, '^ъебу', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(58, 1, '^ъебуч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(59, 1, '^ъебыв*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([Ыы]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(60, 1, '/(?<=[s.,;:!?-#*|[]()])(?![Вв][ЕеЁё][Бб])(([ВвЗзСс]+|[Ввы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)|)([ЬьЪъ]+|)([ЁёЕеEe]+|[Йй]+[Оо]+|[Yy]+[Oo]+)([BbБб]+))(?=[s.,;:!?-#*|[]()])/is', '', '', '', 'Y', 'PTTRN'),
(61, 3, 'angry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+n+g+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(62, 3, 'ass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(63, 3, 'asshole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(64, 3, 'banger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+n+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(65, 3, 'bastard', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+s+t+a+r+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(66, 3, 'batter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+t+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(67, 3, 'bicho', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+c+h+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(68, 3, 'bisexual', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+s+e+x+u+a+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(69, 3, 'bitch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(70, 3, 'blumpkin', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+l+u+m+p+k+i+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(71, 3, 'booger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+o+o+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(72, 3, 'bugger*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+g+g+e+r+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(73, 3, 'bukakke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+k+a+k+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(74, 3, 'bull', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(75, 3, 'bulldyke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+d+y+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(76, 3, 'bullshit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(77, 3, 'bunny', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(78, 3, 'bunnyfuck', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+f+u+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(79, 3, 'chocha', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+c+h+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(80, 3, 'chode', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+d+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(81, 3, 'clap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+l+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(82, 3, 'coconuts', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+c+o+n+u+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(83, 3, 'cohones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+h+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(84, 3, 'cojones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+j+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(85, 3, 'coon', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(86, 3, 'cootch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(87, 3, 'cooter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(88, 3, 'cornhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+r+n+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(89, 3, 'cracka', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+c+k+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(90, 3, 'crap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(91, 3, 'cum', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+m+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(92, 3, 'cunnilingus', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+n+i+l+i+n+g+u+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(93, 3, 'cunt*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+t+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(94, 3, 'damn*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+m+n+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(95, 3, 'dark*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+r+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(96, 3, 'dick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(97, 3, 'dickhead', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+h+e+a+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(98, 3, 'diddle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+d+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(99, 3, 'dildo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+d+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(100, 3, 'dilhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(101, 3, 'dingleberry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+n+g+l+e+b+e+r+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(102, 3, 'doodle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+o+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(103, 3, 'dork', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+r+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(104, 3, 'dumpster', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+u+m+p+s+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(105, 3, 'faggot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+g+g+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(106, 3, 'fart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(107, 3, 'frig', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+r+i+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(108, 3, 'fuck*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(109, 3, 'fucker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(110, 3, 'giz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+i+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(111, 3, 'goatse', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+a+t+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(112, 3, 'gook', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+o+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(113, 3, 'gringo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+r+i+n+g+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(114, 3, 'hobo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+b+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(115, 3, 'honky', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+n+k+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(116, 3, 'jackass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(117, 3, 'jackoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(118, 3, 'jerkoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+e+r+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(119, 3, 'jiggaboo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+g+g+a+b+o+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(120, 3, 'jizz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+z+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(121, 3, 'kike', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(k+i+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(122, 3, 'mayo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+a+y+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(123, 3, 'moose', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+o+o+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(124, 3, 'nigg*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(n+i+g+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(125, 3, 'paki', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+a+k+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(126, 3, 'pecker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+e+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(127, 3, 'piss', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+i+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(128, 3, 'poonanni', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+a+n+n+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(129, 3, 'poontang', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+t+a+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(130, 3, 'prick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+r+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(131, 3, 'punch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+u+n+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(132, 3, 'queef', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(q+u+e+e+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(133, 3, 'rogue', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(r+o+g+u+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(134, 3, 'sanchez', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+a+n+c+h+e+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(135, 3, 'schlong', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+c+h+l+o+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(136, 3, 'shit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(137, 3, 'skank', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+k+a+n+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(138, 3, 'spaz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+a+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(139, 3, 'spic', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+i+c+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(140, 3, 'teabag*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+e+a+b+a+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(141, 3, 'tits', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+i+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(142, 3, 'twat', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+a+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(143, 3, 'twot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(144, 3, 'vart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(v+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(145, 3, 'wanker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+n+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(146, 3, 'waste', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+s+t+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(147, 3, 'wetback', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+e+t+b+a+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(148, 3, 'whore', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+h+o+r+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(149, 3, 'wigger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+i+g+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(150, 3, 'wog', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL'),
(151, 3, 'wop', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/is', '', '', 'Y', 'TRNSL');
-- -----------------------------------
-- Dumping table b_forum_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_group`;
CREATE TABLE `b_forum_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '150',
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_group_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_group_lang`;
CREATE TABLE `b_forum_group_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_GROUP` (`FORUM_GROUP_ID`,`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_letter
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_letter`;
CREATE TABLE `b_forum_letter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT '0',
  `LETTER` varchar(50) DEFAULT NULL,
  `REPLACEMENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=cp1251;

INSERT INTO `b_forum_letter` VALUES
(1, 2, 'а', 'АаAa'),
(2, 2, 'б', 'БбBb'),
(3, 2, 'в', 'ВвVv'),
(4, 2, 'г', 'Гг'),
(5, 2, 'д', 'ДдDd'),
(6, 2, 'е', 'ЁёЕеEe'),
(7, 2, 'ё', 'ЁёЕеEe, [Йй]+[Оо]+'),
(8, 2, 'ж', 'ЖжGg'),
(9, 2, 'з', 'ЗзZz3'),
(10, 2, 'и', 'ИиIi'),
(11, 2, 'й', 'ЙйИиYy'),
(12, 2, 'к', 'КкKk'),
(13, 2, 'л', 'ЛлLl'),
(14, 2, 'м', 'МмMm'),
(15, 2, 'н', 'НнNn'),
(16, 2, 'о', 'ОоOo'),
(17, 2, 'п', 'ПпPp'),
(18, 2, 'р', 'РрPpRr'),
(19, 2, 'с', 'СсCc'),
(20, 2, 'т', 'ТтTt'),
(21, 2, 'у', 'УуUu'),
(22, 2, 'ф', 'ФфFf'),
(23, 2, 'х', 'ХхXx'),
(24, 2, 'ц', 'ЦцCc'),
(25, 2, 'ч', 'Чч'),
(26, 2, 'ш', 'Шш'),
(27, 2, 'щ', 'Щщ'),
(28, 2, 'ь', 'ЪъЬь\"\','),
(29, 2, 'ы', 'Ыы'),
(30, 2, 'ъ', 'ЪъЬь\"\','),
(31, 2, 'э', 'Ээ'),
(32, 2, 'ю', 'Юю, [Йй]+[Оо]+'),
(33, 2, 'я', 'Яя'),
(34, 2, '%', '[Цц]+([Аа]+|[Оо]+), [Тт]+([Ьь]+|)[Сс]+[Яя]+'),
(35, 2, '^', ',ВвЗзСс,ВвЫы,ДдОо,ЗзАа,ИиЗзСс,НнАа,НнЕе,ОоТт,([Пп]*[Ее]+[Рр]+[Ее]+)'),
(36, 2, 'тся', '%'),
(37, 2, 'ться', '%');
-- -----------------------------------
-- Dumping table b_forum_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_message`;
CREATE TABLE `b_forum_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) NOT NULL,
  `USE_SMILES` char(1) NOT NULL DEFAULT 'Y',
  `NEW_TOPIC` char(1) NOT NULL DEFAULT 'N',
  `APPROVED` char(1) NOT NULL DEFAULT 'Y',
  `SOURCE_ID` varchar(255) NOT NULL DEFAULT 'WEB',
  `POST_DATE` datetime NOT NULL,
  `POST_MESSAGE` text,
  `POST_MESSAGE_HTML` text,
  `POST_MESSAGE_FILTER` text,
  `POST_MESSAGE_CHECK` char(32) DEFAULT NULL,
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `PARAM1` varchar(2) DEFAULT NULL,
  `PARAM2` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(10) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) DEFAULT NULL,
  `AUTHOR_IP` varchar(255) DEFAULT NULL,
  `AUTHOR_REAL_IP` varchar(128) DEFAULT NULL,
  `GUEST_ID` int(10) DEFAULT NULL,
  `EDITOR_ID` int(10) DEFAULT NULL,
  `EDITOR_NAME` varchar(255) DEFAULT NULL,
  `EDITOR_EMAIL` varchar(255) DEFAULT NULL,
  `EDIT_REASON` text,
  `EDIT_DATE` datetime DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `HTML` text,
  `MAIL_HEADER` text,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_MESSAGE_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_TOPIC` (`TOPIC_ID`,`APPROVED`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR` (`AUTHOR_ID`,`APPROVED`,`FORUM_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_MESSAGE_PARAM2` (`PARAM2`),
  KEY `IX_FORUM_MESSAGE_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_MESSAGE_DATE_AUTHOR_ID` (`POST_DATE`,`AUTHOR_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_TOPIC_ID` (`AUTHOR_ID`,`TOPIC_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_FORUM_ID` (`AUTHOR_ID`,`FORUM_ID`,`ID`,`APPROVED`,`TOPIC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_perms
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_perms`;
CREATE TABLE `b_forum_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_PERMS_FORUM` (`FORUM_ID`,`GROUP_ID`),
  KEY `IX_FORUM_PERMS_GROUP` (`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_pm_folder
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_pm_folder`;
CREATE TABLE `b_forum_pm_folder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_FOLDER_USER_IST` (`USER_ID`,`ID`,`SORT`,`TITLE`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251;

INSERT INTO `b_forum_pm_folder` VALUES
(1, 'SYSTEM_FOLDER_1', 0, 0),
(2, 'SYSTEM_FOLDER_2', 0, 0),
(3, 'SYSTEM_FOLDER_3', 0, 0),
(4, 'SYSTEM_FOLDER_4', 0, 0);
-- -----------------------------------
-- Dumping table b_forum_points
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_points`;
CREATE TABLE `b_forum_points` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_POINTS` int(11) NOT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P_MP` (`MIN_POINTS`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_points2post
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_points2post`;
CREATE TABLE `b_forum_points2post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_NUM_POSTS` int(11) NOT NULL,
  `POINTS_PER_POST` decimal(18,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P2P_MNP` (`MIN_NUM_POSTS`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_points_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_points_lang`;
CREATE TABLE `b_forum_points_lang` (
  `POINTS_ID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`POINTS_ID`,`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_private_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_private_message`;
CREATE TABLE `b_forum_private_message` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` int(11) DEFAULT '0',
  `RECIPIENT_ID` int(11) DEFAULT '0',
  `POST_DATE` datetime NOT NULL,
  `POST_SUBJ` varchar(50) NOT NULL,
  `POST_MESSAGE` text NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FOLDER_ID` int(11) NOT NULL,
  `IS_READ` varchar(50) NOT NULL,
  `REQUEST_IS_READ` char(1) NOT NULL,
  `USE_SMILES` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_USER` (`USER_ID`),
  KEY `IX_B_FORUM_PM_AFR` (`AUTHOR_ID`,`FOLDER_ID`,`IS_READ`),
  KEY `IX_B_FORUM_PM_UFP` (`USER_ID`,`FOLDER_ID`,`POST_DATE`),
  KEY `IX_B_FORUM_PM_POST_DATE` (`POST_DATE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_rank
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_rank`;
CREATE TABLE `b_forum_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) DEFAULT NULL,
  `MIN_NUM_POSTS` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_rank_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_rank_lang`;
CREATE TABLE `b_forum_rank_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RANK_ID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_RANK` (`RANK_ID`,`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_smile
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_smile`;
CREATE TABLE `b_forum_smile` (
  `ID` smallint(3) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) NOT NULL DEFAULT 'S',
  `TYPING` varchar(100) DEFAULT NULL,
  `IMAGE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CLICKABLE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=cp1251;

INSERT INTO `b_forum_smile` VALUES
(68, 'S', ':D :-D', 'icon_biggrin.png', 'ICON_BIGGRIN', 'N', 30, 16, 16),
(69, 'S', ':) :-)', 'icon_smile.png', 'ICON_SMILE', 'N', 10, 16, 16),
(70, 'S', ':( :-(', 'icon_sad.png', 'ICON_SAD', 'N', 50, 16, 16),
(71, 'S', ':o :-o :shock:', 'icon_eek.png', 'ICON_EEK', 'N', 90, 16, 16),
(72, 'S', '8) 8-)', 'icon_cool.png', 'ICON_COOL', 'N', 40, 16, 16),
(73, 'S', ':{} :-{}', 'icon_kiss.png', 'ICON_KISS', 'N', 110, 16, 16),
(74, 'S', ':oops:', 'icon_redface.png', 'ICON_REDFACE', 'Y', 100, 16, 16),
(75, 'S', ':cry: :~(', 'icon_cry.png', 'ICON_CRY', 'Y', 70, 16, 16),
(76, 'S', ':evil: >:-<', 'icon_evil.png', 'ICON_EVIL', 'N', 80, 16, 16),
(77, 'S', ';) ;-)', 'icon_wink.png', 'ICON_WINK', 'N', 20, 16, 16),
(78, 'S', ':!:', 'icon_exclaim.png', 'ICON_EXCLAIM', 'Y', 130, 16, 16),
(79, 'S', ':?:', 'icon_question.png', 'ICON_QUESTION', 'Y', 120, 16, 16),
(80, 'S', ':idea:', 'icon_idea.png', 'ICON_IDEA', 'Y', 140, 16, 16),
(81, 'S', ':| :-|', 'icon_neutral.png', 'ICON_NEUTRAL', 'N', 60, 16, 16),
(82, 'S', ':\\  :-\\  :/ :-/', 'icon_confuse.png', 'ICON_CONFUSE', 'N', 60, 16, 16),
(83, 'I', '', 'icon1.gif', 'ICON_NOTE', 'Y', 150, 15, 15),
(84, 'I', '', 'icon2.gif', 'ICON_DIRRECTION', 'Y', 150, 15, 15),
(85, 'I', '', 'icon3.gif', 'ICON_IDEA', 'Y', 150, 15, 15),
(86, 'I', '', 'icon4.gif', 'ICON_ATTANSION', 'Y', 150, 15, 15),
(87, 'I', '', 'icon5.gif', 'ICON_QUESTION', 'Y', 150, 15, 15),
(88, 'I', '', 'icon6.gif', 'ICON_BAD', 'Y', 150, 15, 15),
(89, 'I', '', 'icon7.gif', 'ICON_GOOD', 'Y', 150, 15, 15);
-- -----------------------------------
-- Dumping table b_forum_smile_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_smile_lang`;
CREATE TABLE `b_forum_smile_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SMILE_ID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SMILE_K` (`SMILE_ID`,`LID`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=cp1251;

INSERT INTO `b_forum_smile_lang` VALUES
(1, 68, 'ru', 'Широкая улыбка'),
(2, 69, 'ru', 'С улыбкой'),
(3, 70, 'ru', 'Печально'),
(4, 71, 'ru', 'Удивленно'),
(5, 72, 'ru', 'Здорово'),
(6, 73, 'ru', 'Поцелуй'),
(7, 74, 'ru', 'Смущенно'),
(8, 75, 'ru', 'Очень грустно'),
(9, 76, 'ru', 'Со злостью'),
(10, 77, 'ru', 'Шутливо'),
(11, 78, 'ru', 'Восклицание'),
(12, 79, 'ru', 'Вопрос'),
(13, 80, 'ru', 'Идея'),
(14, 81, 'ru', 'Нет слов'),
(15, 82, 'ru', 'Озадаченно'),
(16, 83, 'ru', 'Заметка'),
(17, 84, 'ru', 'Направление'),
(18, 85, 'ru', 'Идея'),
(19, 86, 'ru', 'Внимание'),
(20, 87, 'ru', 'Вопрос'),
(21, 88, 'ru', 'Плохо'),
(22, 89, 'ru', 'Хорошо'),
(23, 68, 'en', 'Big grin'),
(24, 69, 'en', 'Smile'),
(25, 70, 'en', 'Sad'),
(26, 71, 'en', 'Surprised'),
(27, 72, 'en', 'Cool'),
(28, 73, 'en', 'Kiss'),
(29, 74, 'en', 'Embaressed'),
(30, 75, 'en', 'Crying'),
(31, 79, 'en', 'Question'),
(32, 78, 'en', 'Exclamation'),
(33, 77, 'en', 'Wink'),
(34, 76, 'en', 'Angry'),
(35, 80, 'en', 'Idea'),
(36, 81, 'en', 'Speechless'),
(37, 82, 'en', 'Skeptical'),
(38, 83, 'en', 'Note'),
(39, 84, 'en', 'Direction'),
(40, 85, 'en', 'Idea'),
(41, 86, 'en', 'Attention'),
(42, 87, 'en', 'Question'),
(43, 88, 'en', 'Thumbs Down'),
(44, 89, 'en', 'Thumbs Up');
-- -----------------------------------
-- Dumping table b_forum_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_stat`;
CREATE TABLE `b_forum_stat` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) DEFAULT NULL,
  `IP_ADDRESS` varchar(128) DEFAULT NULL,
  `PHPSESSID` varchar(255) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `FORUM_ID` smallint(5) NOT NULL DEFAULT '0',
  `TOPIC_ID` int(10) DEFAULT NULL,
  `SHOW_NAME` varchar(101) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_STAT_SITE_ID` (`SITE_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_TOPIC_ID` (`TOPIC_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_FORUM_ID` (`FORUM_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_PHPSESSID` (`PHPSESSID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_subscribe
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_subscribe`;
CREATE TABLE `b_forum_subscribe` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `LAST_SEND` int(10) DEFAULT NULL,
  `NEW_TOPIC_ONLY` char(50) NOT NULL DEFAULT 'N',
  `SITE_ID` char(2) NOT NULL DEFAULT 'ru',
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SUBSCRIBE_USER` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`,`SOCNET_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_topic
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_topic`;
CREATE TABLE `b_forum_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(255) NOT NULL,
  `TITLE_SEO` varchar(255) DEFAULT NULL,
  `TAGS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `ICON_ID` tinyint(2) DEFAULT NULL,
  `STATE` char(1) NOT NULL DEFAULT 'Y',
  `APPROVED` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `VIEWS` int(10) NOT NULL DEFAULT '0',
  `USER_START_ID` int(10) DEFAULT NULL,
  `USER_START_NAME` varchar(255) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `POSTS` int(10) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(10) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) NOT NULL,
  `LAST_POST_DATE` datetime NOT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(10) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `HTML` text,
  `SOCNET_GROUP_ID` int(10) DEFAULT NULL,
  `OWNER_ID` int(10) DEFAULT NULL,
  `ICON` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_TOPIC_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_TOPIC_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_TOPIC_ABS_L_POST_DATE` (`ABS_LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_LAST_POST_DATE` (`LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_USER_START_ID` (`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_DATE_USER_START_ID` (`START_DATE`,`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO` (`FORUM_ID`,`TITLE_SEO`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO2` (`TITLE_SEO`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_user`;
CREATE TABLE `b_forum_user` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `ALIAS` varchar(64) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(128) DEFAULT NULL,
  `AVATAR` int(10) DEFAULT NULL,
  `NUM_POSTS` int(10) DEFAULT '0',
  `INTERESTS` text,
  `LAST_POST` int(10) DEFAULT NULL,
  `ALLOW_POST` char(1) NOT NULL DEFAULT 'Y',
  `LAST_VISIT` datetime NOT NULL,
  `DATE_REG` date NOT NULL,
  `REAL_IP_ADDRESS` varchar(128) DEFAULT NULL,
  `SIGNATURE` varchar(255) DEFAULT NULL,
  `SHOW_NAME` char(1) NOT NULL DEFAULT 'Y',
  `RANK_ID` int(11) DEFAULT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `HIDE_FROM_ONLINE` char(1) NOT NULL DEFAULT 'N',
  `SUBSC_GROUP_MESSAGE` char(1) NOT NULL DEFAULT 'N',
  `SUBSC_GET_MY_MESSAGE` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_FORUM_USER_USER6` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

INSERT INTO `b_forum_user` VALUES
(1, 1, NULL, '', NULL, NULL, 0, '', NULL, 'Y', '2015-05-13 13:10:40', '2015-05-13', NULL, '', 'Y', NULL, 0, 'N', 'N', 'N');
-- -----------------------------------
-- Dumping table b_forum_user_forum
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_user_forum`;
CREATE TABLE `b_forum_user_forum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MAIN_LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID1` (`USER_ID`,`FORUM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_user_points
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_user_points`;
CREATE TABLE `b_forum_user_points` (
  `FROM_USER_ID` int(11) NOT NULL,
  `TO_USER_ID` int(11) NOT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `DATE_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`FROM_USER_ID`,`TO_USER_ID`),
  KEY `IX_B_FORUM_USER_POINTS_TO_USER` (`TO_USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_forum_user_topic
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_user_topic`;
CREATE TABLE `b_forum_user_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TOPIC_ID` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`TOPIC_ID`,`USER_ID`),
  KEY `ID` (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID2` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_group`;
CREATE TABLE `b_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) NOT NULL DEFAULT 'N',
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SECURITY_POLICY` text,
  `STRING_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251;

INSERT INTO `b_group` VALUES
(1, '2015-04-13 11:03:42', 'Y', 1, 'N', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
(2, '2015-04-13 11:03:42', 'Y', 2, 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
(3, '2015-04-13 11:03:42', 'Y', 3, 'N', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
(4, '2015-04-13 11:03:42', 'Y', 4, 'N', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY');
-- -----------------------------------
-- Dumping table b_group_collection_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_group_collection_task`;
CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_group_subordinate
-- -----------------------------------
DROP TABLE IF EXISTS `b_group_subordinate`;
CREATE TABLE `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_group_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_group_task`;
CREATE TABLE `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_hlblock_entity
-- -----------------------------------
DROP TABLE IF EXISTS `b_hlblock_entity`;
CREATE TABLE `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_hot_keys
-- -----------------------------------
DROP TABLE IF EXISTS `b_hot_keys`;
CREATE TABLE `b_hot_keys` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) NOT NULL,
  `CODE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_code` (`CODE_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=cp1251;

INSERT INTO `b_hot_keys` VALUES
(1, 'Ctrl+Alt+85', 139, 0),
(2, 'Ctrl+Alt+80', 17, 0),
(3, 'Ctrl+Alt+70', 120, 0),
(4, 'Ctrl+Alt+68', 117, 0),
(5, 'Ctrl+Alt+81', 3, 0),
(6, 'Ctrl+Alt+75', 106, 0),
(7, 'Ctrl+Alt+79', 133, 0),
(8, 'Ctrl+Alt+70', 121, 0),
(9, 'Ctrl+Alt+69', 118, 0),
(10, 'Ctrl+Shift+83', 87, 0),
(11, 'Ctrl+Shift+88', 88, 0),
(12, 'Ctrl+Shift+76', 89, 0),
(13, 'Ctrl+Alt+85', 139, 1),
(14, 'Ctrl+Alt+80', 17, 1),
(15, 'Ctrl+Alt+70', 120, 1),
(16, 'Ctrl+Alt+68', 117, 1),
(17, 'Ctrl+Alt+81', 3, 1),
(18, 'Ctrl+Alt+75', 106, 1),
(19, 'Ctrl+Alt+79', 133, 1),
(20, 'Ctrl+Alt+70', 121, 1),
(21, 'Ctrl+Alt+69', 118, 1),
(22, 'Ctrl+Shift+83', 87, 1),
(23, 'Ctrl+Shift+88', 88, 1),
(24, 'Ctrl+Shift+76', 89, 1);
-- -----------------------------------
-- Dumping table b_hot_keys_code
-- -----------------------------------
DROP TABLE IF EXISTS `b_hot_keys_code`;
CREATE TABLE `b_hot_keys_code` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TITLE_OBJ` varchar(50) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `IS_CUSTOM` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=cp1251;

INSERT INTO `b_hot_keys_code` VALUES
(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
(91, 'top_panel_menu', 'var d=BX(\"bx-panel-menu\"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);
-- -----------------------------------
-- Dumping table b_iblock
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock`;
CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) NOT NULL,
  `LID` char(2) NOT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text,
  `DESCRIPTION_TYPE` char(4) NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) DEFAULT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  `INDEX_ELEMENT` char(1) NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) DEFAULT NULL,
  `LIST_MODE` char(1) DEFAULT NULL,
  `RIGHTS_MODE` char(1) DEFAULT NULL,
  `SECTION_PROPERTY` char(1) DEFAULT NULL,
  `PROPERTY_INDEX` char(1) DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) DEFAULT NULL,
  `SECTION_NAME` varchar(100) DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251;

INSERT INTO `b_iblock` VALUES
(1, '2015-04-14 21:25:41', 'news', 's1', '', 'Новости', 'Y', 500, '#SITE_DIR#/news/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/news/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/news/list.php?SECTION_ID=#SECTION_ID#', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', NULL, NULL, 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент', NULL),
(2, '2015-04-21 07:09:11', 'catalog', 's1', '', 'Товары', 'Y', 500, '#SITE_DIR#/catalog/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/catalog/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/catalog/list.php?SECTION_ID=#SECTION_ID#', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', 'C', 'S', NULL, NULL, 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент', NULL),
(3, '2015-04-23 07:29:29', 'catalog', 's1', '', 'Услуги', 'Y', 500, '#SITE_DIR#/catalog/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/catalog/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/catalog/list.php?SECTION_ID=#SECTION_ID#', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', NULL, NULL, 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент', NULL);
-- -----------------------------------
-- Dumping table b_iblock_cache
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_cache`;
CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) NOT NULL,
  `CACHE` longtext NOT NULL,
  `CACHE_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_element
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element`;
CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text,
  `PREVIEW_TEXT_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext,
  `DETAIL_TEXT_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text,
  `IN_SECTIONS` char(1) NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `TAGS` varchar(255) DEFAULT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=cp1251;

INSERT INTO `b_iblock_element` VALUES
(1, '2015-04-14 23:01:31', 1, '2015-04-14 21:40:51', 1, 1, NULL, 'Y', '2015-04-01 00:00:00', NULL, 500, 'TASKalfa1800', NULL, 'анонс новости', 'text', 1, 'Детальный текст при необходимости.', 'text', 'TASKALFA1800\r\nАНОНС НОВОСТИ\r\nДЕТАЛЬНЫЙ ТЕКСТ ПРИ НЕОБХОДИМОСТИ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '1', '', '', '0', NULL, 3, '2015-04-16 07:49:53'),
(2, '2015-04-14 23:01:12', 1, '2015-04-14 21:42:00', 1, 1, NULL, 'Y', '2015-04-10 21:43:00', NULL, 500, 'TASKalfaa1800', NULL, 'абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра ', 'text', 2, '', 'text', 'TASKALFAA1800\r\nАБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА \r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '2', '', '', '0', NULL, 8, '2015-04-14 21:45:11'),
(3, '2015-04-14 21:43:01', 1, '2015-04-14 21:43:01', 1, 1, NULL, 'Y', NULL, NULL, 500, 'ТАСКальфа', NULL, '', 'text', 3, 'много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста ', 'text', 'ТАСКАЛЬФА\r\n\r\nМНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА ', 1, NULL, NULL, NULL, NULL, NULL, 'N', '3', '', '', '0', NULL, 5, '2015-04-14 22:45:25'),
(4, '2015-04-21 07:10:42', 1, '2015-04-21 07:10:42', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Canon', 4, '', 'text', NULL, '', 'text', 'CANON\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '4', '', '', '0', NULL, NULL, NULL),
(5, '2015-04-21 07:46:17', 1, '2015-04-21 07:46:17', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Gigabyte', 5, '', 'text', NULL, '', 'text', 'GIGABYTE\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '5', '', '', '0', NULL, NULL, NULL),
(6, '2015-04-21 07:46:54', 1, '2015-04-21 07:46:54', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Asus', 6, '', 'text', NULL, '', 'text', 'ASUS\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '6', '', '', '0', NULL, NULL, NULL),
(7, '2015-04-21 07:47:20', 1, '2015-04-21 07:47:20', 1, 2, NULL, 'Y', NULL, NULL, 500, 'NEC', 7, '', 'text', NULL, '', 'text', 'NEC\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '7', '', '', '0', NULL, NULL, NULL),
(8, '2015-04-23 07:56:18', 1, '2015-04-23 07:50:27', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Диагностика', NULL, 'Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание ', 'text', NULL, '', 'text', 'ДИАГНОСТИКА\r\nОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ \r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '8', '', '', '0', NULL, NULL, NULL),
(9, '2015-04-23 07:55:56', 1, '2015-04-23 07:55:56', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Ремонт', NULL, '', 'text', NULL, '', 'text', 'РЕМОНТ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '9', '', '', '0', NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_iblock_element_iprop
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_iprop`;
CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_element_lock
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_lock`;
CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_element_property
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_property`;
CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text NOT NULL,
  `VALUE_TYPE` char(4) NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=cp1251;

INSERT INTO `b_iblock_element_property` VALUES
(1, 1, 2, '1', 'text', 1, NULL, NULL),
(2, 1, 1, '1', 'text', 1, NULL, NULL),
(3, 2, 4, 'www.canon.ua', 'text', NULL, 0.0000, ''),
(4, 3, 4, 'Официальный партнёр', 'text', NULL, 0.0000, ''),
(5, 2, 5, 'www.gigabyte.com', 'text', NULL, 0.0000, ''),
(6, 3, 5, 'Информационный партнер', 'text', NULL, 0.0000, ''),
(7, 2, 6, 'www.gigabyte.com', 'text', NULL, 0.0000, ''),
(8, 3, 6, 'Информационный партнер', 'text', NULL, 0.0000, ''),
(9, 2, 7, 'www.canon.ua', 'text', NULL, 0.0000, ''),
(10, 3, 7, 'Официальный партнёр', 'text', NULL, 0.0000, ''),
(11, 4, 8, '8', 'text', NULL, 8.0000, 'Сертификат1'),
(12, 4, 9, '9', 'text', NULL, 9.0000, 'сертификат'),
(13, 4, 9, '10', 'text', NULL, 10.0000, 'еще один'),
(14, 4, 9, '11', 'text', NULL, 11.0000, 'и еще');
-- -----------------------------------
-- Dumping table b_iblock_element_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_right`;
CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_fields
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_fields`;
CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) NOT NULL,
  `IS_REQUIRED` char(1) DEFAULT NULL,
  `DEFAULT_VALUE` longtext,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_iblock_fields` VALUES
(1, 'IBLOCK_SECTION', 'N', ''),
(1, 'ACTIVE', 'Y', 'Y'),
(1, 'ACTIVE_FROM', 'N', ''),
(1, 'ACTIVE_TO', 'N', ''),
(1, 'SORT', 'N', '0'),
(1, 'NAME', 'Y', ''),
(1, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(1, 'PREVIEW_TEXT', 'N', ''),
(1, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(1, 'DETAIL_TEXT', 'N', ''),
(1, 'XML_ID', 'N', ''),
(1, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'TAGS', 'N', ''),
(1, 'SECTION_NAME', 'Y', ''),
(1, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(1, 'SECTION_DESCRIPTION', 'N', ''),
(1, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'SECTION_XML_ID', 'N', ''),
(1, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'LOG_SECTION_ADD', 'N', NULL),
(1, 'LOG_SECTION_EDIT', 'N', NULL),
(1, 'LOG_SECTION_DELETE', 'N', NULL),
(1, 'LOG_ELEMENT_ADD', 'N', NULL),
(1, 'LOG_ELEMENT_EDIT', 'N', NULL),
(1, 'LOG_ELEMENT_DELETE', 'N', NULL),
(1, 'XML_IMPORT_START_TIME', 'N', NULL),
(2, 'IBLOCK_SECTION', 'N', ''),
(2, 'ACTIVE', 'Y', 'Y'),
(2, 'ACTIVE_FROM', 'N', ''),
(2, 'ACTIVE_TO', 'N', ''),
(2, 'SORT', 'N', '0'),
(2, 'NAME', 'Y', ''),
(2, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(2, 'PREVIEW_TEXT', 'N', ''),
(2, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(2, 'DETAIL_TEXT', 'N', ''),
(2, 'XML_ID', 'N', ''),
(2, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(2, 'TAGS', 'N', ''),
(2, 'SECTION_NAME', 'Y', ''),
(2, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(2, 'SECTION_DESCRIPTION', 'N', ''),
(2, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'SECTION_XML_ID', 'N', ''),
(2, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(2, 'LOG_SECTION_ADD', 'N', NULL),
(2, 'LOG_SECTION_EDIT', 'N', NULL),
(2, 'LOG_SECTION_DELETE', 'N', NULL),
(2, 'LOG_ELEMENT_ADD', 'N', NULL),
(2, 'LOG_ELEMENT_EDIT', 'N', NULL),
(2, 'LOG_ELEMENT_DELETE', 'N', NULL),
(2, 'XML_IMPORT_START_TIME', 'N', NULL),
(3, 'IBLOCK_SECTION', 'N', ''),
(3, 'ACTIVE', 'Y', 'Y'),
(3, 'ACTIVE_FROM', 'N', ''),
(3, 'ACTIVE_TO', 'N', ''),
(3, 'SORT', 'N', '0'),
(3, 'NAME', 'Y', ''),
(3, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(3, 'PREVIEW_TEXT', 'N', ''),
(3, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(3, 'DETAIL_TEXT', 'N', ''),
(3, 'XML_ID', 'N', ''),
(3, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(3, 'TAGS', 'N', ''),
(3, 'SECTION_NAME', 'Y', ''),
(3, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(3, 'SECTION_DESCRIPTION', 'N', ''),
(3, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'SECTION_XML_ID', 'N', ''),
(3, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(3, 'LOG_SECTION_ADD', 'N', NULL),
(3, 'LOG_SECTION_EDIT', 'N', NULL),
(3, 'LOG_SECTION_DELETE', 'N', NULL),
(3, 'LOG_ELEMENT_ADD', 'N', NULL),
(3, 'LOG_ELEMENT_EDIT', 'N', NULL),
(3, 'LOG_ELEMENT_DELETE', 'N', NULL),
(3, 'XML_IMPORT_START_TIME', 'N', NULL);
-- -----------------------------------
-- Dumping table b_iblock_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_group`;
CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_iblock_group` VALUES
(1, 2, 'R'),
(1, 1, 'X'),
(2, 2, 'R'),
(2, 1, 'X'),
(3, 2, 'R'),
(3, 1, 'X');
-- -----------------------------------
-- Dumping table b_iblock_iblock_iprop
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_iblock_iprop`;
CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_iproperty
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_iproperty`;
CREATE TABLE `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_messages
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_messages`;
CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) NOT NULL,
  `MESSAGE_TEXT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_iblock_messages` VALUES
(1, 'ELEMENT_NAME', 'Элемент'),
(1, 'ELEMENTS_NAME', 'Элементы'),
(1, 'ELEMENT_ADD', 'Добавить элемент'),
(1, 'ELEMENT_EDIT', 'Изменить элемент'),
(1, 'ELEMENT_DELETE', 'Удалить элемент'),
(1, 'SECTION_NAME', 'Раздел'),
(1, 'SECTIONS_NAME', 'Разделы'),
(1, 'SECTION_ADD', 'Добавить раздел'),
(1, 'SECTION_EDIT', 'Изменить раздел'),
(1, 'SECTION_DELETE', 'Удалить раздел'),
(2, 'SECTION_ADD', 'Добавить раздел'),
(2, 'SECTIONS_NAME', 'Разделы'),
(2, 'SECTION_NAME', 'Раздел'),
(2, 'ELEMENT_DELETE', 'Удалить элемент'),
(2, 'ELEMENT_EDIT', 'Изменить элемент'),
(2, 'ELEMENT_ADD', 'Добавить элемент'),
(2, 'ELEMENTS_NAME', 'Элементы'),
(2, 'ELEMENT_NAME', 'Элемент'),
(2, 'SECTION_EDIT', 'Изменить раздел'),
(2, 'SECTION_DELETE', 'Удалить раздел'),
(3, 'SECTION_DELETE', 'Удалить раздел'),
(3, 'SECTION_EDIT', 'Изменить раздел'),
(3, 'SECTION_ADD', 'Добавить раздел'),
(3, 'SECTIONS_NAME', 'Разделы'),
(3, 'SECTION_NAME', 'Раздел'),
(3, 'ELEMENT_DELETE', 'Удалить элемент'),
(3, 'ELEMENT_EDIT', 'Изменить элемент'),
(3, 'ELEMENT_ADD', 'Добавить элемент'),
(3, 'ELEMENTS_NAME', 'Элементы'),
(3, 'ELEMENT_NAME', 'Элемент');
-- -----------------------------------
-- Dumping table b_iblock_offers_tmp
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_offers_tmp`;
CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_property
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_property`;
CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) DEFAULT NULL,
  `DEFAULT_VALUE` text,
  `PROPERTY_TYPE` char(1) NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) DEFAULT NULL,
  `FILE_TYPE` varchar(200) DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) DEFAULT NULL,
  `SEARCHABLE` char(1) NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) DEFAULT NULL,
  `USER_TYPE_SETTINGS` text,
  `HINT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251;

INSERT INTO `b_iblock_property` VALUES
(1, '2015-04-14 21:25:42', 1, 'На главную', 'Y', 500, 'TO_MAIN', '', 'L', 1, 30, 'C', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(2, '2015-04-20 22:14:34', 2, 'Ссылка', 'Y', 500, 'LINK', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(3, '2015-04-20 22:14:34', 2, 'Партнер', 'Y', 500, 'PARTNER', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(4, '2015-04-23 07:54:46', 3, 'Файл сертификата', 'Y', 500, 'FILE', '', 'F', 1, 30, 'L', 'Y', NULL, '', 5, NULL, 0, 'Y', 'N', 'N', 'N', 1, NULL, NULL, '');
-- -----------------------------------
-- Dumping table b_iblock_property_enum
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_property_enum`;
CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) NOT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

INSERT INTO `b_iblock_property_enum` VALUES
(1, 1, 'Y', 'N', 500, 'Y', NULL);
-- -----------------------------------
-- Dumping table b_iblock_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_right`;
CREATE TABLE `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) NOT NULL,
  `ENTITY_TYPE` varchar(32) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) NOT NULL,
  `OP_EREAD` char(1) NOT NULL,
  `XML_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_rss
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_rss`;
CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) NOT NULL,
  `NODE_VALUE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_section
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section`;
CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text,
  `DESCRIPTION_TYPE` char(4) NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text,
  `CODE` varchar(255) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_section_element
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_element`;
CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_section_iprop
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_iprop`;
CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_section_property
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_property`;
CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) DEFAULT NULL,
  `DISPLAY_TYPE` char(1) DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) DEFAULT NULL,
  `FILTER_HINT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_section_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_right`;
CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_sequence
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_sequence`;
CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_iblock_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_site`;
CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_iblock_site` VALUES
(1, 's1'),
(2, 's1'),
(3, 's1');
-- -----------------------------------
-- Dumping table b_iblock_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_type`;
CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) NOT NULL,
  `SECTIONS` char(1) NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) DEFAULT NULL,
  `IN_RSS` char(1) NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_iblock_type` VALUES
('news', 'Y', '', '', 'N', 500),
('catalog', 'Y', '', '', 'N', 500);
-- -----------------------------------
-- Dumping table b_iblock_type_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_type_lang`;
CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SECTION_NAME` varchar(100) DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_iblock_type_lang` VALUES
('news', 'ru', 'Новости', '', ''),
('news', 'en', 'News', '', ''),
('catalog', 'ru', 'Каталог', '', ''),
('catalog', 'en', 'Товары', '', '');
-- -----------------------------------
-- Dumping table b_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_lang`;
CREATE TABLE `b_lang` (
  `LID` char(2) NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) NOT NULL,
  `DIR` varchar(50) NOT NULL,
  `FORMAT_DATE` varchar(50) DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) DEFAULT NULL,
  `FORMAT_NAME` varchar(255) DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `DOC_ROOT` varchar(255) DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) DEFAULT NULL,
  `SITE_NAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_lang` VALUES
('s1', 1, 'Y', 'Y', 'Сайт по умолчанию', '/', NULL, NULL, NULL, NULL, NULL, 'ru', '', 'N', '', '', '', 1),
('nd', 100, 'N', 'Y', 'nd', '/site_nd/', NULL, NULL, NULL, NULL, NULL, 'ru', '', 'N', 'harmony.bosjack.in.ua', 'nd', 'pirogan@harmony.perm.ru', 1);
-- -----------------------------------
-- Dumping table b_lang_domain
-- -----------------------------------
DROP TABLE IF EXISTS `b_lang_domain`;
CREATE TABLE `b_lang_domain` (
  `LID` char(2) NOT NULL,
  `DOMAIN` varchar(255) NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_language
-- -----------------------------------
DROP TABLE IF EXISTS `b_language`;
CREATE TABLE `b_language` (
  `LID` char(2) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) NOT NULL,
  `FORMAT_DATE` varchar(50) DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) DEFAULT NULL,
  `FORMAT_NAME` varchar(255) DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) DEFAULT NULL,
  `DIRECTION` char(1) DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_language` VALUES
('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2);
-- -----------------------------------
-- Dumping table b_list_rubric
-- -----------------------------------
DROP TABLE IF EXISTS `b_list_rubric`;
CREATE TABLE `b_list_rubric` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) NOT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` text,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `AUTO` char(1) NOT NULL DEFAULT 'N',
  `DAYS_OF_MONTH` varchar(100) DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(15) DEFAULT NULL,
  `TIMES_OF_DAY` varchar(255) DEFAULT NULL,
  `TEMPLATE` varchar(100) DEFAULT NULL,
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `VISIBLE` char(1) NOT NULL DEFAULT 'Y',
  `FROM_FIELD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_medialib_collection
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_collection`;
CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `KEYWORDS` varchar(255) DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_medialib_collection_item
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_collection_item`;
CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_medialib_item
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_item`;
CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `ITEM_TYPE` char(30) NOT NULL,
  `DESCRIPTION` text,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) DEFAULT NULL,
  `SEARCHABLE_CONTENT` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_medialib_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_type`;
CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) NOT NULL,
  `EXT` varchar(255) NOT NULL,
  `SYSTEM` char(1) NOT NULL DEFAULT 'N',
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251;

INSERT INTO `b_medialib_type` VALUES
(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');
-- -----------------------------------
-- Dumping table b_mobileapp_app
-- -----------------------------------
DROP TABLE IF EXISTS `b_mobileapp_app`;
CREATE TABLE `b_mobileapp_app` (
  `CODE` varchar(50) NOT NULL,
  `SHORT_NAME` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `FILES` text NOT NULL,
  `FOLDER` varchar(50) NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `LAUNCH_ICONS` text NOT NULL,
  `LAUNCH_SCREENS` text NOT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_mobileapp_config
-- -----------------------------------
DROP TABLE IF EXISTS `b_mobileapp_config`;
CREATE TABLE `b_mobileapp_config` (
  `APP_CODE` varchar(150) NOT NULL,
  `PLATFORM` varchar(150) NOT NULL,
  `PARAMS` text NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`APP_CODE`,`PLATFORM`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_module
-- -----------------------------------
DROP TABLE IF EXISTS `b_module`;
CREATE TABLE `b_module` (
  `ID` varchar(50) NOT NULL,
  `DATE_ACTIVE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_module` VALUES
('main', '2015-04-13 11:03:42'),
('bitrix.eshop', '2015-04-13 11:03:47'),
('bitrix.sitecorporate', '2015-04-13 11:03:47'),
('bitrixcloud', '2015-04-13 11:03:48'),
('blog', '2015-04-13 11:03:48'),
('catalog', '2015-04-13 11:03:50'),
('clouds', '2015-04-13 11:03:51'),
('compression', '2015-04-13 11:03:51'),
('currency', '2015-04-13 11:03:52'),
('fileman', '2015-04-13 11:03:53'),
('form', '2015-04-13 11:03:54'),
('forum', '2015-04-13 11:03:54'),
('highloadblock', '2015-04-13 11:03:55'),
('iblock', '2015-04-13 11:03:56'),
('mobileapp', '2015-04-13 11:03:59'),
('perfmon', '2015-04-13 11:04:01'),
('photogallery', '2015-04-13 11:04:01'),
('pull', '2015-04-13 11:04:01'),
('sale', '2015-04-13 11:04:03'),
('scale', '2015-04-13 11:04:04'),
('search', '2015-04-13 11:04:05'),
('security', '2015-04-13 11:04:06'),
('seo', '2015-04-13 11:04:07'),
('socialservices', '2015-04-13 11:04:08'),
('storeassist', '2015-04-13 11:04:08'),
('subscribe', '2015-04-13 11:04:09'),
('vote', '2015-04-13 11:04:09');
-- -----------------------------------
-- Dumping table b_module_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_module_group`;
CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_module_to_module
-- -----------------------------------
DROP TABLE IF EXISTS `b_module_to_module`;
CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) NOT NULL,
  `MESSAGE_ID` varchar(255) NOT NULL,
  `TO_MODULE_ID` varchar(50) NOT NULL,
  `TO_PATH` varchar(255) DEFAULT NULL,
  `TO_CLASS` varchar(255) DEFAULT NULL,
  `TO_METHOD` varchar(255) DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) DEFAULT NULL,
  `VERSION` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_module_to_module_sc` (`FROM_MODULE_ID`,`MESSAGE_ID`,`TO_MODULE_ID`,`TO_CLASS`,`TO_METHOD`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=MyISAM AUTO_INCREMENT=330 DEFAULT CHARSET=cp1251;

INSERT INTO `b_module_to_module` VALUES
(1, '2015-04-13 11:03:42', 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1),
(2, '2015-04-13 11:03:42', 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1),
(3, '2015-04-13 11:03:42', 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1),
(4, '2015-04-13 11:03:42', 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1),
(5, '2015-04-13 11:03:42', 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1),
(6, '2015-04-13 11:03:42', 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1),
(7, '2015-04-13 11:03:42', 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1),
(8, '2015-04-13 11:03:42', 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1),
(9, '2015-04-13 11:03:42', 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1),
(10, '2015-04-13 11:03:42', 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1),
(11, '2015-04-13 11:03:42', 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1),
(12, '2015-04-13 11:03:42', 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1),
(13, '2015-04-13 11:03:42', 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1),
(14, '2015-04-13 11:03:42', 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1),
(15, '2015-04-13 11:03:42', 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1),
(16, '2015-04-13 11:03:42', 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1),
(17, '2015-04-13 11:03:42', 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1),
(18, '2015-04-13 11:03:42', 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1),
(19, '2015-04-13 11:03:42', 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1),
(20, '2015-04-13 11:03:42', 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1),
(21, '2015-04-13 11:03:42', 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1),
(22, '2015-04-13 11:03:42', 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1),
(23, '2015-04-13 11:03:42', 100, 'main', 'OnUserDelete', 'main', '', 'CAccess', 'OnUserDelete', '', 1),
(24, '2015-04-13 11:03:42', 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1),
(25, '2015-04-13 11:03:42', 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1),
(26, '2015-04-13 11:03:42', 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1),
(27, '2015-04-13 11:03:42', 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1),
(28, '2015-04-13 11:03:42', 100, 'main', 'OnUserLogin', 'main', '', 'CGroupAuthProvider', 'OnUserLogin', '', 1),
(29, '2015-04-13 11:03:42', 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1),
(30, '2015-04-13 11:03:42', 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1),
(31, '2015-04-13 11:03:42', 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1),
(32, '2015-04-13 11:03:42', 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1),
(33, '2015-04-13 11:03:42', 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1),
(34, '2015-04-13 11:03:42', 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1),
(35, '2015-04-13 11:03:42', 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1),
(36, '2015-04-13 11:03:42', 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1),
(37, '2015-04-13 11:03:42', 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1),
(38, '2015-04-13 11:03:42', 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1),
(39, '2015-04-13 11:03:42', 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1),
(40, '2015-04-13 11:03:42', 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1),
(41, '2015-04-13 11:03:42', 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1),
(42, '2015-04-13 11:03:42', 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1),
(43, '2015-04-13 11:03:42', 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1),
(44, '2015-04-13 11:03:42', 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1),
(45, '2015-04-13 11:03:47', 100, 'main', 'OnBeforeProlog', 'bitrix.eshop', '', 'CEShop', 'ShowPanel', '', 1),
(46, '2015-04-13 11:03:47', 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1),
(47, '2015-04-13 11:03:48', 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudCDN', 'OnAdminInformerInsertItems', '', 1),
(48, '2015-04-13 11:03:48', 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', 1),
(49, '2015-04-13 11:03:48', 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', 1),
(50, '2015-04-13 11:03:48', 100, 'search', 'OnReindex', 'blog', '', 'CBlogSearch', 'OnSearchReindex', '', 1),
(51, '2015-04-13 11:03:48', 100, 'main', 'OnUserDelete', 'blog', '', 'CBlogUser', 'Delete', '', 1),
(52, '2015-04-13 11:03:48', 100, 'main', 'OnSiteDelete', 'blog', '', 'CBlogSitePath', 'DeleteBySiteID', '', 1),
(53, '2015-04-13 11:03:48', 100, 'socialnetwork', 'OnSocNetGroupDelete', 'blog', '', 'CBlogSoNetPost', 'OnGroupDelete', '', 1),
(54, '2015-04-13 11:03:48', 100, 'socialnetwork', 'OnSocNetFeaturesAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1),
(55, '2015-04-13 11:03:48', 100, 'socialnetwork', 'OnSocNetFeaturesUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1),
(56, '2015-04-13 11:03:48', 100, 'socialnetwork', 'OnSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1),
(57, '2015-04-13 11:03:48', 100, 'socialnetwork', 'OnSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1),
(58, '2015-04-13 11:03:48', 200, 'main', 'OnAfterAddRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterAddRating', '', 1),
(59, '2015-04-13 11:03:48', 200, 'main', 'OnAfterUpdateRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterUpdateRating', '', 1),
(60, '2015-04-13 11:03:48', 200, 'main', 'OnSetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnSetRatingConfigs', '', 1),
(61, '2015-04-13 11:03:49', 200, 'main', 'OnGetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingConfigs', '', 1),
(62, '2015-04-13 11:03:49', 200, 'main', 'OnGetRatingsObjects', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingObject', '', 1),
(63, '2015-04-13 11:03:49', 200, 'main', 'OnGetRatingContentOwner', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingContentOwner', '', 1),
(64, '2015-04-13 11:03:49', 100, 'im', 'OnGetNotifySchema', 'blog', '', 'CBlogNotifySchema', 'OnGetNotifySchema', '', 1),
(65, '2015-04-13 11:03:50', 100, 'iblock', 'OnIBlockDelete', 'catalog', '', 'CCatalog', 'OnIBlockDelete', '', 1),
(66, '2015-04-13 11:03:50', 100, 'iblock', 'OnIBlockElementDelete', 'catalog', '', 'CCatalogProduct', 'OnIBlockElementDelete', '', 1),
(67, '2015-04-13 11:03:50', 100, 'iblock', 'OnIBlockElementDelete', 'catalog', '', 'CPrice', 'OnIBlockElementDelete', '', 1),
(68, '2015-04-13 11:03:50', 100, 'iblock', 'OnIBlockElementDelete', 'catalog', '', 'CCatalogStoreProduct', 'OnIBlockElementDelete', '', 1),
(69, '2015-04-13 11:03:50', 100, 'iblock', 'OnIBlockElementDelete', 'catalog', '', 'CCatalogDocs', 'OnIBlockElementDelete', '', 1),
(70, '2015-04-13 11:03:50', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'catalog', '', 'CCatalogDocs', 'OnBeforeIBlockElementDelete', '', 1),
(71, '2015-04-13 11:03:50', 100, 'currency', 'OnCurrencyDelete', 'catalog', '', 'CPrice', 'OnCurrencyDelete', '', 1),
(72, '2015-04-13 11:03:50', 100, 'main', 'OnGroupDelete', 'catalog', '', 'CCatalogProductGroups', 'OnGroupDelete', '', 1),
(73, '2015-04-13 11:03:50', 100, 'iblock', 'OnAfterIBlockElementUpdate', 'catalog', '', 'CCatalogProduct', 'OnAfterIBlockElementUpdate', '', 1),
(74, '2015-04-13 11:03:50', 100, 'currency', 'OnModuleUnInstall', 'catalog', '', '', 'CurrencyModuleUnInstallCatalog', '', 1),
(75, '2015-04-13 11:03:50', 300, 'iblock', 'OnBeforeIBlockDelete', 'catalog', '', 'CCatalog', 'OnBeforeCatalogDelete', '', 1),
(76, '2015-04-13 11:03:50', 10000, 'iblock', 'OnBeforeIBlockElementDelete', 'catalog', '', 'CCatalog', 'OnBeforeIBlockElementDelete', '', 1),
(77, '2015-04-13 11:03:50', 100, 'main', 'OnEventLogGetAuditTypes', 'catalog', '', 'CCatalogEvent', 'GetAuditTypes', '', 1),
(80, '2015-04-13 11:03:50', 100, 'main', 'OnBuildGlobalMenu', 'catalog', '', 'CCatalogAdmin', 'OnBuildGlobalMenu', '', 1),
(81, '2015-04-13 11:03:50', 100, 'main', 'OnAdminListDisplay', 'catalog', '', 'CCatalogAdmin', 'OnAdminListDisplay', '', 1),
(82, '2015-04-13 11:03:50', 100, 'main', 'OnBuildGlobalMenu', 'catalog', '', 'CCatalogAdmin', 'OnBuildSaleMenu', '', 1),
(83, '2015-04-13 11:03:50', 100, 'catalog', 'OnCondCatControlBuildList', 'catalog', '', 'CCatalogCondCtrlGroup', 'GetControlDescr', '', 1),
(84, '2015-04-13 11:03:50', 200, 'catalog', 'OnCondCatControlBuildList', 'catalog', '', 'CCatalogCondCtrlIBlockFields', 'GetControlDescr', '', 1),
(85, '2015-04-13 11:03:50', 300, 'catalog', 'OnCondCatControlBuildList', 'catalog', '', 'CCatalogCondCtrlIBlockProps', 'GetControlDescr', '', 1),
(86, '2015-04-13 11:03:50', 100, 'catalog', 'OnDocumentBarcodeDelete', 'catalog', '', 'CCatalogStoreDocsElement', 'OnDocumentBarcodeDelete', '', 1),
(87, '2015-04-13 11:03:50', 100, 'catalog', 'OnBeforeDocumentDelete', 'catalog', '', 'CCatalogStoreDocsBarcode', 'OnBeforeDocumentDelete', '', 1),
(88, '2015-04-13 11:03:50', 100, 'catalog', 'OnCatalogStoreDelete', 'catalog', '', 'CCatalogDocs', 'OnCatalogStoreDelete', '', 1),
(89, '2015-04-13 11:03:50', 100, 'iblock', 'OnBeforeIBlockPropertyDelete', 'catalog', '', 'CCatalog', 'OnBeforeIBlockPropertyDelete', '', 1),
(90, '2015-04-13 11:03:50', 1100, 'sale', 'OnCondSaleControlBuildList', 'catalog', '', 'CCatalogCondCtrlBasketProductFields', 'GetControlDescr', '', 1),
(91, '2015-04-13 11:03:50', 1200, 'sale', 'OnCondSaleControlBuildList', 'catalog', '', 'CCatalogCondCtrlBasketProductProps', 'GetControlDescr', '', 1),
(92, '2015-04-13 11:03:50', 1200, 'sale', 'OnCondSaleActionsControlBuildList', 'catalog', '', 'CCatalogActionCtrlBasketProductFields', 'GetControlDescr', '', 1),
(93, '2015-04-13 11:03:50', 1300, 'sale', 'OnCondSaleActionsControlBuildList', 'catalog', '', 'CCatalogActionCtrlBasketProductProps', 'GetControlDescr', '', 1),
(94, '2015-04-13 11:03:50', 100, 'sale', 'OnExtendBasketItems', 'catalog', '', 'CCatalogDiscount', 'ExtendBasketItems', '', 1),
(95, '2015-04-13 11:03:50', 100, 'iblock', 'OnModuleUnInstall', 'catalog', '', 'CCatalog', 'OnIBlockModuleUnInstall', '', 1),
(96, '2015-04-13 11:03:51', 100, 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', 1),
(97, '2015-04-13 11:03:51', 100, 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', 1),
(98, '2015-04-13 11:03:51', 100, 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', 1),
(99, '2015-04-13 11:03:51', 100, 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', 1),
(100, '2015-04-13 11:03:51', 100, 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', 1),
(101, '2015-04-13 11:03:51', 100, 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', 1),
(102, '2015-04-13 11:03:51', 100, 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', 1),
(103, '2015-04-13 11:03:51', 100, 'main', 'OnFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', 1),
(104, '2015-04-13 11:03:51', 100, 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', 1),
(105, '2015-04-13 11:03:51', 100, 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', 1),
(106, '2015-04-13 11:03:51', 100, 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', 1),
(107, '2015-04-13 11:03:51', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObject', '', 1),
(108, '2015-04-13 11:03:51', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObject', '', 1),
(109, '2015-04-13 11:03:51', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObject', '', 1),
(110, '2015-04-13 11:03:51', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObject', '', 1),
(111, '2015-04-13 11:03:51', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObject', '', 1),
(112, '2015-04-13 11:03:51', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObject', '', 1),
(113, '2015-04-13 11:03:51', 1, 'main', 'OnPageStart', 'compression', '', 'CCompress', 'OnPageStart', '', 1),
(114, '2015-04-13 11:03:51', 10000, 'main', 'OnAfterEpilog', 'compression', '', 'CCompress', 'OnAfterEpilog', '', 1),
(115, '2015-04-13 11:03:53', 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1),
(116, '2015-04-13 11:03:53', 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1),
(117, '2015-04-13 11:03:53', 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1),
(118, '2015-04-13 11:03:53', 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1),
(119, '2015-04-13 11:03:53', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1),
(120, '2015-04-13 11:03:53', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1),
(121, '2015-04-13 11:03:53', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1),
(122, '2015-04-13 11:03:53', 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1),
(123, '2015-04-13 11:03:53', 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1),
(124, '2015-04-13 11:03:53', 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1),
(125, '2015-04-13 11:03:54', 100, 'main', 'OnGroupDelete', 'forum', '', 'CForumNew', 'OnGroupDelete', '', 1),
(126, '2015-04-13 11:03:54', 100, 'main', 'OnBeforeLangDelete', 'forum', '', 'CForumNew', 'OnBeforeLangDelete', '', 1),
(127, '2015-04-13 11:03:54', 100, 'main', 'OnFileDelete', 'forum', '', 'CForumFiles', 'OnFileDelete', '', 1),
(128, '2015-04-13 11:03:54', 100, 'search', 'OnReindex', 'forum', '', 'CForumNew', 'OnReindex', '', 1),
(129, '2015-04-13 11:03:54', 100, 'main', 'OnUserDelete', 'forum', '', 'CForumUser', 'OnUserDelete', '', 1),
(130, '2015-04-13 11:03:54', 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/forum/tools/prop_topicid.php', 'CIBlockPropertyTopicID', 'GetUserTypeDescription', '', 1),
(131, '2015-04-13 11:03:54', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'forum', '', 'CForumTopic', 'OnBeforeIBlockElementDelete', '', 1),
(132, '2015-04-13 11:03:54', 100, 'main', 'OnEventLogGetAuditTypes', 'forum', '', 'CForumEventLog', 'GetAuditTypes', '', 1),
(133, '2015-04-13 11:03:54', 100, 'main', 'OnEventLogGetAuditHandlers', 'forum', '', 'CEventForum', 'MakeForumObject', '', 1),
(134, '2015-04-13 11:03:54', 100, 'socialnetwork', 'OnSocNetGroupDelete', 'forum', '', 'CForumUser', 'OnSocNetGroupDelete', '', 1),
(135, '2015-04-13 11:03:54', 100, 'socialnetwork', 'OnSocNetLogFormatEvent', 'forum', '', 'CForumMessage', 'OnSocNetLogFormatEvent', '', 1),
(136, '2015-04-13 11:03:54', 100, 'mail', 'OnGetFilterList', 'forum', '', 'CForumEMail', 'OnGetSocNetFilterList', '', 1),
(137, '2015-04-13 11:03:54', 100, 'main', 'OnAfterAddRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterAddRating', '', 1),
(138, '2015-04-13 11:03:54', 100, 'main', 'OnAfterUpdateRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterUpdateRating', '', 1),
(139, '2015-04-13 11:03:54', 100, 'main', 'OnSetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnSetRatingConfigs', '', 1),
(140, '2015-04-13 11:03:54', 100, 'main', 'OnGetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingConfigs', '', 1),
(141, '2015-04-13 11:03:54', 100, 'main', 'OnGetRatingsObjects', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingObject', '', 1),
(142, '2015-04-13 11:03:54', 100, 'main', 'OnGetRatingContentOwner', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingContentOwner', '', 1),
(143, '2015-04-13 11:03:54', 100, 'im', 'OnGetNotifySchema', 'forum', '', 'CForumNotifySchema', 'OnGetNotifySchema', '', 1),
(144, '2015-04-13 11:03:54', 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/forum/install/index.php', 'forum', 'InstallUserFields', '', 1),
(145, '2015-04-13 11:03:55', 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1),
(146, '2015-04-13 11:03:55', 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1),
(147, '2015-04-13 11:03:55', 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1),
(148, '2015-04-13 11:03:55', 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1),
(149, '2015-04-13 11:03:55', 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1),
(150, '2015-04-13 11:03:56', 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1),
(151, '2015-04-13 11:03:56', 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1),
(152, '2015-04-13 11:03:56', 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1),
(153, '2015-04-13 11:03:56', 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1),
(154, '2015-04-13 11:03:56', 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1),
(155, '2015-04-13 11:03:56', 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1),
(156, '2015-04-13 11:03:56', 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1),
(157, '2015-04-13 11:03:56', 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1),
(158, '2015-04-13 11:03:56', 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1),
(159, '2015-04-13 11:03:56', 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1),
(160, '2015-04-13 11:03:56', 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1),
(161, '2015-04-13 11:03:56', 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1),
(162, '2015-04-13 11:03:56', 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1),
(163, '2015-04-13 11:03:56', 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1),
(164, '2015-04-13 11:03:56', 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_DateTime_GetUserTypeDescription', '', 1),
(165, '2015-04-13 11:03:56', 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_XmlID_GetUserTypeDescription', '', 1),
(166, '2015-04-13 11:03:56', 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_FileMan_GetUserTypeDescription', '', 1),
(167, '2015-04-13 11:03:56', 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_HTML_GetUserTypeDescription', '', 1),
(168, '2015-04-13 11:03:56', 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_ElementList_GetUserTypeDescription', '', 1),
(169, '2015-04-13 11:03:56', 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_Sequence_GetUserTypeDescription', '', 1),
(170, '2015-04-13 11:03:56', 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_ElementAutoComplete_GetUserTypeDescription', '', 1),
(171, '2015-04-13 11:03:56', 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_SKU_GetUserTypeDescription', '', 1),
(172, '2015-04-13 11:03:56', 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_SectionAutoComplete_GetUserTypeDescription', '', 1),
(173, '2015-04-13 11:03:59', 100, 'pull', 'OnGetDependentModule', 'mobileapp', '', 'CMobileAppPullSchema', 'OnGetDependentModule', '', 1),
(174, '2015-04-13 11:04:01', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'photogallery', '', 'CPhotogalleryElement', 'OnBeforeIBlockElementDelete', '', 1),
(175, '2015-04-13 11:04:01', 100, 'iblock', 'OnAfterIBlockElementAdd', 'photogallery', '', 'CPhotogalleryElement', 'OnAfterIBlockElementAdd', '', 1),
(176, '2015-04-13 11:04:01', 100, 'search', 'BeforeIndex', 'photogallery', '', 'CRatingsComponentsPhotogallery', 'BeforeIndex', '', 1),
(177, '2015-04-13 11:04:01', 100, 'im', 'OnGetNotifySchema', 'photogallery', '', 'CPhotogalleryNotifySchema', 'OnGetNotifySchema', '', 1),
(178, '2015-04-13 11:04:01', 3, 'main', 'OnProlog', 'main', '/modules/pull/ajax_hit.php', '', '', '', 1),
(179, '2015-04-13 11:04:01', 100, 'main', 'OnEpilog', 'pull', '', 'CPullWatch', 'DeferredSql', '', 1),
(180, '2015-04-13 11:04:01', 100, 'main', 'OnEpilog', 'pull', '', 'CPullOptions', 'OnEpilog', '', 1),
(181, '2015-04-13 11:04:01', 100, 'perfmon', 'OnGetTableSchema', 'pull', '', 'CPullTableSchema', 'OnGetTableSchema', '', 1),
(182, '2015-04-13 11:04:01', 100, 'main', 'OnAfterRegisterModule', 'pull', '', 'CPullOptions', 'ClearCheckCache', '', 1),
(183, '2015-04-13 11:04:01', 100, 'main', 'OnAfterUnRegisterModule', 'pull', '', 'CPullOptions', 'ClearCheckCache', '', 1),
(184, '2015-04-13 11:04:03', 100, 'main', 'OnUserLogin', 'sale', '', 'CSaleUser', 'OnUserLogin', '', 1),
(185, '2015-04-13 11:04:03', 100, 'main', 'OnUserLogout', 'sale', '', 'CSaleUser', 'OnUserLogout', '', 1),
(186, '2015-04-13 11:04:03', 100, 'main', 'OnBeforeLangDelete', 'sale', '', 'CSalePersonType', 'OnBeforeLangDelete', '', 1),
(187, '2015-04-13 11:04:03', 100, 'main', 'OnLanguageDelete', 'sale', '', 'CSaleLocation', 'OnLangDelete', '', 1),
(188, '2015-04-13 11:04:03', 100, 'main', 'OnLanguageDelete', 'sale', '', 'CSaleLocationGroup', 'OnLangDelete', '', 1),
(189, '2015-04-13 11:04:03', 100, 'main', 'OnUserDelete', 'sale', '', 'CSaleOrderUserProps', 'OnUserDelete', '', 1),
(190, '2015-04-13 11:04:03', 100, 'main', 'OnUserDelete', 'sale', '', 'CSaleUserAccount', 'OnUserDelete', '', 1),
(191, '2015-04-13 11:04:03', 100, 'main', 'OnUserDelete', 'sale', '', 'CSaleAuxiliary', 'OnUserDelete', '', 1),
(192, '2015-04-13 11:04:03', 100, 'main', 'OnUserDelete', 'sale', '', 'CSaleUser', 'OnUserDelete', '', 1),
(193, '2015-04-13 11:04:03', 100, 'main', 'OnUserDelete', 'sale', '', 'CSaleRecurring', 'OnUserDelete', '', 1),
(194, '2015-04-13 11:04:03', 100, 'main', 'OnUserDelete', 'sale', '', 'CSaleUserCards', 'OnUserDelete', '', 1),
(195, '2015-04-13 11:04:03', 100, 'main', 'OnBeforeUserDelete', 'sale', '', 'CSaleOrder', 'OnBeforeUserDelete', '', 1),
(196, '2015-04-13 11:04:03', 100, 'main', 'OnBeforeUserDelete', 'sale', '', 'CSaleAffiliate', 'OnBeforeUserDelete', '', 1),
(197, '2015-04-13 11:04:03', 100, 'main', 'OnBeforeUserDelete', 'sale', '', 'CSaleUserAccount', 'OnBeforeUserDelete', '', 1),
(198, '2015-04-13 11:04:03', 100, 'main', 'OnBeforeProlog', 'main', '/modules/sale/affiliate.php', '', '', '', 1),
(199, '2015-04-13 11:04:03', 100, 'main', 'OnEventLogGetAuditTypes', 'sale', '', 'CSaleYMHandler', 'OnEventLogGetAuditTypes', '', 1),
(200, '2015-04-13 11:04:03', 100, 'currency', 'OnBeforeCurrencyDelete', 'sale', '', 'CSaleOrder', 'OnBeforeCurrencyDelete', '', 1),
(201, '2015-04-13 11:04:03', 100, 'currency', 'OnBeforeCurrencyDelete', 'sale', '', 'CSaleLang', 'OnBeforeCurrencyDelete', '', 1),
(202, '2015-04-13 11:04:03', 100, 'currency', 'OnModuleUnInstall', 'sale', '', '', 'CurrencyModuleUnInstallSale', '', 1),
(203, '2015-04-13 11:04:03', 100, 'catalog', 'OnSaleOrderSumm', 'sale', '', 'CSaleOrder', '__SaleOrderCount', '', 1),
(204, '2015-04-13 11:04:03', 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'sale', '', 'CSaleMobileOrderUtils', 'buildSaleAdminMobileMenu', '', 1),
(205, '2015-04-13 11:04:03', 100, 'sender', 'OnConnectorList', 'sale', '', '\\Bitrix\\Sale\\SenderEventHandler', 'onConnectorListBuyer', '', 1),
(206, '2015-04-13 11:04:03', 100, 'sale', 'OnCondSaleControlBuildList', 'sale', '', 'CSaleCondCtrlGroup', 'GetControlDescr', '', 1),
(207, '2015-04-13 11:04:03', 200, 'sale', 'OnCondSaleControlBuildList', 'sale', '', 'CSaleCondCtrlBasketGroup', 'GetControlDescr', '', 1),
(208, '2015-04-13 11:04:03', 300, 'sale', 'OnCondSaleControlBuildList', 'sale', '', 'CSaleCondCtrlBasketFields', 'GetControlDescr', '', 1),
(209, '2015-04-13 11:04:03', 1000, 'sale', 'OnCondSaleControlBuildList', 'sale', '', 'CSaleCondCtrlOrderFields', 'GetControlDescr', '', 1),
(210, '2015-04-13 11:04:03', 10000, 'sale', 'OnCondSaleControlBuildList', 'sale', '', 'CSaleCondCtrlCommon', 'GetControlDescr', '', 1),
(211, '2015-04-13 11:04:03', 100, 'sale', 'OnCondSaleActionsControlBuildList', 'sale', '', 'CSaleActionCtrlGroup', 'GetControlDescr', '', 1),
(212, '2015-04-13 11:04:03', 200, 'sale', 'OnCondSaleActionsControlBuildList', 'sale', '', 'CSaleActionCtrlDelivery', 'GetControlDescr', '', 1),
(213, '2015-04-13 11:04:03', 300, 'sale', 'OnCondSaleActionsControlBuildList', 'sale', '', 'CSaleActionCtrlBasketGroup', 'GetControlDescr', '', 1),
(214, '2015-04-13 11:04:03', 1000, 'sale', 'OnCondSaleActionsControlBuildList', 'sale', '', 'CSaleActionCtrlSubGroup', 'GetControlDescr', '', 1),
(215, '2015-04-13 11:04:03', 1100, 'sale', 'OnCondSaleActionsControlBuildList', 'sale', '', 'CSaleActionCondCtrlBasketFields', 'GetControlDescr', '', 1),
(216, '2015-04-13 11:04:03', 100, 'sale', 'OnOrderDelete', 'sale', '', 'CSaleMobileOrderPull', 'onOrderDelete', '', 1),
(217, '2015-04-13 11:04:03', 100, 'sale', 'OnOrderAdd', 'sale', '', 'CSaleMobileOrderPull', 'onOrderAdd', '', 1),
(218, '2015-04-13 11:04:03', 100, 'sale', 'OnOrderUpdate', 'sale', '', 'CSaleMobileOrderPull', 'onOrderUpdate', '', 1),
(219, '2015-04-13 11:04:03', 100, 'sale', 'OnBasketOrder', 'sale', '', '\\Bitrix\\Sale\\Product2ProductTable', 'onSaleOrderAdd', '', 1),
(220, '2015-04-13 11:04:03', 100, 'sale', 'OnSaleStatusOrder', 'sale', '', '\\Bitrix\\Sale\\Product2ProductTable', 'onSaleStatusOrderHandler', '', 1),
(221, '2015-04-13 11:04:03', 100, 'sale', 'OnSaleDeliveryOrder', 'sale', '', '\\Bitrix\\Sale\\Product2ProductTable', 'onSaleDeliveryOrderHandler', '', 1),
(222, '2015-04-13 11:04:03', 100, 'sale', 'OnSaleDeductOrder', 'sale', '', '\\Bitrix\\Sale\\Product2ProductTable', 'onSaleDeductOrderHandler', '', 1),
(223, '2015-04-13 11:04:03', 100, 'sale', 'OnSaleCancelOrder', 'sale', '', '\\Bitrix\\Sale\\Product2ProductTable', 'onSaleCancelOrderHandler', '', 1),
(224, '2015-04-13 11:04:03', 100, 'sale', 'OnSalePayOrder', 'sale', '', '\\Bitrix\\Sale\\Product2ProductTable', 'onSalePayOrderHandler', '', 1),
(225, '2015-04-13 11:04:04', 100, 'main', 'OnEventLogGetAuditTypes', 'scale', '', '\\Bitrix\\Scale\\Logger', 'onEventLogGetAuditTypes', '', 1),
(226, '2015-04-13 11:04:05', 100, 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', 1),
(227, '2015-04-13 11:04:05', 100, 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', 1),
(228, '2015-04-13 11:04:05', 100, 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', 1),
(229, '2015-04-13 11:04:05', 100, 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', 1),
(230, '2015-04-13 11:04:05', 100, 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', 1),
(231, '2015-04-13 11:04:05', 100, 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', 1),
(232, '2015-04-13 11:04:05', 100, 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', 1),
(233, '2015-04-13 11:04:05', 100, 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', 1),
(234, '2015-04-13 11:04:05', 90, 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', 1),
(235, '2015-04-13 11:04:06', 100, 'main', 'OnUserDelete', 'security', '', 'CSecurityUser', 'OnUserDelete', '', 1),
(236, '2015-04-13 11:04:06', 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityFilter', 'GetAuditTypes', '', 1),
(237, '2015-04-13 11:04:06', 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityAntiVirus', 'GetAuditTypes', '', 1),
(238, '2015-04-13 11:04:06', 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecurityFilter', 'OnAdminInformerInsertItems', '', 1),
(239, '2015-04-13 11:04:06', 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecuritySiteChecker', 'OnAdminInformerInsertItems', '', 1),
(240, '2015-04-13 11:04:06', 5, 'main', 'OnBeforeProlog', 'security', '', 'CSecurityFilter', 'OnBeforeProlog', '', 1),
(241, '2015-04-13 11:04:06', 9999, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityXSSDetect', 'OnEndBufferContent', '', 1),
(242, '2015-04-13 11:04:06', -1, 'main', 'OnPageStart', 'security', '', 'CSecurityAntiVirus', 'OnPageStart', '', 1),
(243, '2015-04-13 11:04:06', 10000, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityAntiVirus', 'OnEndBufferContent', '', 1),
(244, '2015-04-13 11:04:06', 10001, 'main', 'OnAfterEpilog', 'security', '', 'CSecurityAntiVirus', 'OnAfterEpilog', '', 1),
(245, '2015-04-13 11:04:07', 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2),
(246, '2015-04-13 11:04:07', 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2),
(247, '2015-04-13 11:04:07', 100, 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', 2),
(248, '2015-04-13 11:04:07', 100, 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', 2),
(249, '2015-04-13 11:04:07', 100, 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', 2),
(250, '2015-04-13 11:04:07', 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', 2),
(251, '2015-04-13 11:04:07', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', 2),
(252, '2015-04-13 11:04:07', 100, 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', 2),
(253, '2015-04-13 11:04:07', 100, 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', 2),
(254, '2015-04-13 11:04:07', 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', 2),
(255, '2015-04-13 11:04:07', 100, 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', 2),
(256, '2015-04-13 11:04:07', 100, 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', 2),
(257, '2015-04-13 11:04:07', 100, 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', 2),
(258, '2015-04-13 11:04:07', 100, 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', 2),
(259, '2015-04-13 11:04:07', 100, 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', 2),
(260, '2015-04-13 11:04:07', 100, 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', 2),
(261, '2015-04-13 11:04:07', 100, 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', 2),
(262, '2015-04-13 11:04:07', 100, 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', 2),
(263, '2015-04-13 11:04:08', 100, 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', 1),
(264, '2015-04-13 11:04:08', 100, 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', 1),
(265, '2015-04-13 11:04:08', 100, 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', 1),
(266, '2015-04-13 11:04:08', 100, 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', 1),
(267, '2015-04-13 11:04:08', 100, 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', 1),
(268, '2015-04-13 11:04:08', 100, 'main', 'OnPrologAdminTitle', 'storeassist', '', 'CStoreAssist', 'onPrologAdminTitle', '', 1),
(269, '2015-04-13 11:04:08', 100, 'main', 'OnBuildGlobalMenu', 'storeassist', '', 'CStoreAssist', 'onBuildGlobalMenu', '', 1),
(270, '2015-04-13 11:04:09', 100, 'main', 'OnBeforeLangDelete', 'subscribe', '', 'CRubric', 'OnBeforeLangDelete', '', 1),
(271, '2015-04-13 11:04:09', 100, 'main', 'OnUserDelete', 'subscribe', '', 'CSubscription', 'OnUserDelete', '', 1),
(272, '2015-04-13 11:04:09', 100, 'main', 'OnUserLogout', 'subscribe', '', 'CSubscription', 'OnUserLogout', '', 1),
(273, '2015-04-13 11:04:09', 100, 'main', 'OnGroupDelete', 'subscribe', '', 'CPosting', 'OnGroupDelete', '', 1),
(274, '2015-04-13 11:04:09', 100, 'main', 'OnBeforeProlog', 'main', '/modules/vote/keepvoting.php', '', '', '', 1),
(275, '2015-04-13 11:04:09', 200, 'main', 'OnUserTypeBuildList', 'vote', '', 'CUserTypeVote', 'GetUserTypeDescription', '', 1),
(276, '2015-04-13 11:04:09', 200, 'main', 'OnUserLogin', 'vote', '', 'CVoteUser', 'OnUserLogin', '', 1),
(277, '2015-04-13 11:04:09', 100, 'im', 'OnGetNotifySchema', 'vote', '', 'CVoteNotifySchema', 'OnGetNotifySchema', '', 1),
(278, '2015-04-13 11:07:24', 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1),
(279, '2015-05-26 11:42:02', 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1),
(280, '2015-05-26 11:42:05', 100, 'sale', 'OnBasketAdd', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 1),
(281, '2015-05-26 11:42:05', 100, 'sale', 'OnOrderSave', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 1),
(282, '2015-05-26 11:42:05', 100, 'sale', 'OnSalePayOrder', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 1),
(283, '2015-05-26 11:42:46', 100, 'sender', 'OnConnectorList', 'subscribe', '', 'Bitrix\\Subscribe\\SenderEventHandler', 'onConnectorListSubscriber', '', 1),
(284, '2015-05-26 11:42:52', 100, 'main', 'OnPanelCreate', 'translate', '', 'CTranslateEventHandlers', 'TranslatOnPanelCreate', '', 1),
(285, '2015-05-26 11:43:04', 100, 'sale', 'onBuildCouponProviders', 'catalog', '', '\\Bitrix\\Catalog\\DiscountCouponTable', 'couponManager', '', 2),
(286, '2015-05-26 11:43:21', 100, 'main', 'OnEventLogGetAuditTypes', 'sale', '', 'CSalePaySystemAction', 'OnEventLogGetAuditTypes', '', 1),
(287, '2015-05-26 11:43:24', 100, 'main', 'OnUserLogout', 'sale', '', '\\Bitrix\\Sale\\DiscountCouponsManager', 'logout', '', 1),
(288, '2015-05-26 11:43:25', 100, 'sender', 'OnConnectorList', 'form', '', '\\Bitrix\\Form\\SenderEventHandler', 'onConnectorListForm', '', 1),
(289, '2015-05-26 11:43:30', 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/blog/install/index.php', 'blog', 'installUserFields', '', 1),
(290, '2015-05-26 11:43:44', 100, 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', 2),
(291, '2015-05-26 11:43:44', 100, 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', 2),
(292, '2015-05-26 11:43:44', 100, 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', 2),
(293, '2015-05-26 11:43:44', 100, 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', 2),
(294, '2015-05-26 11:43:44', 100, 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', 2),
(295, '2015-05-26 11:43:44', 100, 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', 2),
(296, '2015-05-26 11:45:07', 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_Date_GetUserTypeDescription', '', 1),
(297, '2015-06-23 22:19:05', 100, 'conversion', 'OnGetCounterTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1),
(298, '2015-06-23 22:19:05', 100, 'conversion', 'OnGetRateTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1),
(299, '2015-06-23 22:19:05', 100, 'forum', 'onAfterTopicAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onTopicAdd', '', 1),
(300, '2015-06-23 22:19:05', 100, 'forum', 'onAfterMessageAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onMessageAdd', '', 1),
(301, '2015-06-23 22:19:07', 100, 'conversion', 'OnGetCounterTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1),
(302, '2015-06-23 22:19:07', 100, 'conversion', 'OnGetRateTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1),
(303, '2015-06-23 22:19:07', 100, 'blog', 'OnPostAdd', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onPostAdd', '', 1),
(304, '2015-06-23 22:19:08', 100, 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', 1),
(305, '2015-07-08 14:06:45', 100, 'sender', 'OnTriggerList', 'sale', '', '\\Bitrix\\Sale\\Sender\\EventHandler', 'onTriggerList', '', 1),
(306, '2015-07-08 14:06:45', 100, 'sender', 'OnPresetMailingList', 'sale', '', '\\Bitrix\\Sale\\Sender\\EventHandler', 'onPresetMailingList', '', 1),
(307, '2015-07-08 14:06:45', 100, 'sender', 'OnPresetTemplateList', 'sale', '', '\\Bitrix\\Sale\\Sender\\EventHandler', 'onPresetTemplateList', '', 1),
(313, '2015-07-08 14:06:48', 100, 'conversion', 'OnGetCounterTypes', 'sale', '', '\\Bitrix\\Sale\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1),
(314, '2015-07-08 14:06:48', 100, 'conversion', 'OnGetRateTypes', 'sale', '', '\\Bitrix\\Sale\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1),
(315, '2015-07-08 14:06:48', 100, 'conversion', 'OnGenerateInitialData', 'sale', '', '\\Bitrix\\Sale\\Internals\\ConversionHandlers', 'onGenerateInitialData', '', 1),
(316, '2015-07-08 14:06:48', 100, 'sale', 'OnBeforeBasketAdd', 'sale', '', '\\Bitrix\\Sale\\Internals\\ConversionHandlers', 'onBeforeBasketAdd', '', 1),
(317, '2015-07-08 14:06:48', 100, 'sale', 'OnBasketAdd', 'sale', '', '\\Bitrix\\Sale\\Internals\\ConversionHandlers', 'onBasketAdd', '', 1),
(318, '2015-07-08 14:06:48', 100, 'sale', 'OnOrderAdd', 'sale', '', '\\Bitrix\\Sale\\Internals\\ConversionHandlers', 'onOrderAdd', '', 1),
(319, '2015-07-08 14:06:48', 100, 'sale', 'OnSalePayOrder', 'sale', '', '\\Bitrix\\Sale\\Internals\\ConversionHandlers', 'onSalePayOrder', '', 1),
(320, '2015-07-17 23:03:16', 100, 'conversion', 'OnSetDayContextAttributes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onSetDayContextAttributes', '', 2),
(321, '2015-07-17 23:03:18', 100, 'conversion', 'OnGetAttributeTypes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onGetAttributeTypes', '', 2),
(322, '2015-07-24 22:11:29', 100, 'catalog', 'OnProductUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2),
(323, '2015-07-24 22:11:29', 100, 'catalog', 'OnProductSetAvailableUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2),
(324, '2015-10-22 00:52:07', 100, 'disk', 'onAfterAjaxActionCreateFolderWithSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1),
(325, '2015-10-22 00:52:07', 100, 'disk', 'onAfterAjaxActionAppendSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1),
(326, '2015-10-22 00:52:07', 100, 'disk', 'onAfterAjaxActionChangeSharingAndRights', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1),
(327, '2015-10-22 00:52:12', 100, 'main', 'OnAfterUserUpdate', 'forum', '', 'CForumUser', 'OnAfterUserUpdate', '', 1),
(328, '2015-11-04 22:49:57', 100, 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', 1),
(329, '2015-11-04 22:49:57', 100, 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', 1);
-- -----------------------------------
-- Dumping table b_operation
-- -----------------------------------
DROP TABLE IF EXISTS `b_operation`;
CREATE TABLE `b_operation` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `BINDING` varchar(50) DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=cp1251;

INSERT INTO `b_operation` VALUES
(1, 'edit_php', 'main', NULL, 'module'),
(2, 'view_own_profile', 'main', NULL, 'module'),
(3, 'edit_own_profile', 'main', NULL, 'module'),
(4, 'view_all_users', 'main', NULL, 'module'),
(5, 'view_groups', 'main', NULL, 'module'),
(6, 'view_tasks', 'main', NULL, 'module'),
(7, 'view_other_settings', 'main', NULL, 'module'),
(8, 'view_subordinate_users', 'main', NULL, 'module'),
(9, 'edit_subordinate_users', 'main', NULL, 'module'),
(10, 'edit_all_users', 'main', NULL, 'module'),
(11, 'edit_groups', 'main', NULL, 'module'),
(12, 'edit_tasks', 'main', NULL, 'module'),
(13, 'edit_other_settings', 'main', NULL, 'module'),
(14, 'cache_control', 'main', NULL, 'module'),
(15, 'lpa_template_edit', 'main', NULL, 'module'),
(16, 'view_event_log', 'main', NULL, 'module'),
(17, 'edit_ratings', 'main', NULL, 'module'),
(18, 'manage_short_uri', 'main', NULL, 'module'),
(19, 'fm_view_permission', 'main', NULL, 'file'),
(20, 'fm_view_file', 'main', NULL, 'file'),
(21, 'fm_view_listing', 'main', NULL, 'file'),
(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
(23, 'fm_create_new_file', 'main', NULL, 'file'),
(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
(25, 'fm_create_new_folder', 'main', NULL, 'file'),
(26, 'fm_delete_file', 'main', NULL, 'file'),
(27, 'fm_delete_folder', 'main', NULL, 'file'),
(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
(29, 'fm_rename_file', 'main', NULL, 'file'),
(30, 'fm_rename_folder', 'main', NULL, 'file'),
(31, 'fm_upload_file', 'main', NULL, 'file'),
(32, 'fm_add_to_menu', 'main', NULL, 'file'),
(33, 'fm_download_file', 'main', NULL, 'file'),
(34, 'fm_lpa', 'main', NULL, 'file'),
(35, 'fm_edit_permission', 'main', NULL, 'file'),
(36, 'catalog_read', 'catalog', NULL, 'module'),
(37, 'catalog_price', 'catalog', NULL, 'module'),
(38, 'catalog_group', 'catalog', NULL, 'module'),
(39, 'catalog_discount', 'catalog', NULL, 'module'),
(40, 'catalog_vat', 'catalog', NULL, 'module'),
(41, 'catalog_extra', 'catalog', NULL, 'module'),
(42, 'catalog_store', 'catalog', NULL, 'module'),
(43, 'catalog_purchas_info', 'catalog', NULL, 'module'),
(44, 'catalog_export_edit', 'catalog', NULL, 'module'),
(45, 'catalog_export_exec', 'catalog', NULL, 'module'),
(46, 'catalog_import_edit', 'catalog', NULL, 'module'),
(47, 'catalog_import_exec', 'catalog', NULL, 'module'),
(48, 'catalog_measure', 'catalog', NULL, 'module'),
(49, 'catalog_settings', 'catalog', NULL, 'module'),
(50, 'clouds_browse', 'clouds', NULL, 'module'),
(51, 'clouds_upload', 'clouds', NULL, 'module'),
(52, 'clouds_config', 'clouds', NULL, 'module'),
(53, 'fileman_view_all_settings', 'fileman', '', 'module'),
(54, 'fileman_edit_menu_types', 'fileman', '', 'module'),
(55, 'fileman_add_element_to_menu', 'fileman', '', 'module'),
(56, 'fileman_edit_menu_elements', 'fileman', '', 'module'),
(57, 'fileman_edit_existent_files', 'fileman', '', 'module'),
(58, 'fileman_edit_existent_folders', 'fileman', '', 'module'),
(59, 'fileman_admin_files', 'fileman', '', 'module'),
(60, 'fileman_admin_folders', 'fileman', '', 'module'),
(61, 'fileman_view_permissions', 'fileman', '', 'module'),
(62, 'fileman_edit_all_settings', 'fileman', '', 'module'),
(63, 'fileman_upload_files', 'fileman', '', 'module'),
(64, 'fileman_view_file_structure', 'fileman', '', 'module'),
(65, 'fileman_install_control', 'fileman', '', 'module'),
(66, 'medialib_view_collection', 'fileman', '', 'medialib'),
(67, 'medialib_new_collection', 'fileman', '', 'medialib'),
(68, 'medialib_edit_collection', 'fileman', '', 'medialib'),
(69, 'medialib_del_collection', 'fileman', '', 'medialib'),
(70, 'medialib_access', 'fileman', '', 'medialib'),
(71, 'medialib_new_item', 'fileman', '', 'medialib'),
(72, 'medialib_edit_item', 'fileman', '', 'medialib'),
(73, 'medialib_del_item', 'fileman', '', 'medialib'),
(74, 'sticker_view', 'fileman', '', 'stickers'),
(75, 'sticker_edit', 'fileman', '', 'stickers'),
(76, 'sticker_new', 'fileman', '', 'stickers'),
(77, 'sticker_del', 'fileman', '', 'stickers'),
(78, 'section_read', 'iblock', NULL, 'iblock'),
(79, 'element_read', 'iblock', NULL, 'iblock'),
(80, 'section_element_bind', 'iblock', NULL, 'iblock'),
(81, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
(82, 'element_edit', 'iblock', NULL, 'iblock'),
(83, 'element_edit_price', 'iblock', NULL, 'iblock'),
(84, 'element_delete', 'iblock', NULL, 'iblock'),
(85, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
(86, 'section_edit', 'iblock', NULL, 'iblock'),
(87, 'section_delete', 'iblock', NULL, 'iblock'),
(88, 'section_section_bind', 'iblock', NULL, 'iblock'),
(89, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
(90, 'iblock_edit', 'iblock', NULL, 'iblock'),
(91, 'iblock_delete', 'iblock', NULL, 'iblock'),
(92, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
(93, 'iblock_export', 'iblock', NULL, 'iblock'),
(94, 'section_rights_edit', 'iblock', NULL, 'iblock'),
(95, 'element_rights_edit', 'iblock', NULL, 'iblock'),
(96, 'security_filter_bypass', 'security', NULL, 'module'),
(97, 'security_edit_user_otp', 'security', NULL, 'module'),
(98, 'security_module_settings_read', 'security', NULL, 'module'),
(99, 'security_panel_view', 'security', NULL, 'module'),
(100, 'security_filter_settings_read', 'security', NULL, 'module'),
(101, 'security_otp_settings_read', 'security', NULL, 'module'),
(102, 'security_iprule_admin_settings_read', 'security', NULL, 'module'),
(103, 'security_session_settings_read', 'security', NULL, 'module'),
(104, 'security_redirect_settings_read', 'security', NULL, 'module'),
(105, 'security_stat_activity_settings_read', 'security', NULL, 'module'),
(106, 'security_iprule_settings_read', 'security', NULL, 'module'),
(107, 'security_antivirus_settings_read', 'security', NULL, 'module'),
(108, 'security_frame_settings_read', 'security', NULL, 'module'),
(109, 'security_module_settings_write', 'security', NULL, 'module'),
(110, 'security_filter_settings_write', 'security', NULL, 'module'),
(111, 'security_otp_settings_write', 'security', NULL, 'module'),
(112, 'security_iprule_admin_settings_write', 'security', NULL, 'module'),
(113, 'security_session_settings_write', 'security', NULL, 'module'),
(114, 'security_redirect_settings_write', 'security', NULL, 'module'),
(115, 'security_stat_activity_settings_write', 'security', NULL, 'module'),
(116, 'security_iprule_settings_write', 'security', NULL, 'module'),
(117, 'security_file_verifier_sign', 'security', NULL, 'module'),
(118, 'security_file_verifier_collect', 'security', NULL, 'module'),
(119, 'security_file_verifier_verify', 'security', NULL, 'module'),
(120, 'security_antivirus_settings_write', 'security', NULL, 'module'),
(121, 'security_frame_settings_write', 'security', NULL, 'module'),
(122, 'seo_settings', 'seo', '', 'module'),
(123, 'seo_tools', 'seo', '', 'module');
-- -----------------------------------
-- Dumping table b_option
-- -----------------------------------
DROP TABLE IF EXISTS `b_option`;
CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `NAME` varchar(50) NOT NULL,
  `VALUE` text,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  UNIQUE KEY `ix_option` (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_option` VALUES
('main', 'rating_authority_rating', '2', NULL, NULL),
('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
('main', 'rating_assign_rating_group', '3', NULL, NULL),
('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
('main', 'rating_assign_authority_group', '4', NULL, NULL),
('main', 'rating_community_size', '1', NULL, NULL),
('main', 'rating_community_authority', '30', NULL, NULL),
('main', 'rating_vote_weight', '10', NULL, NULL),
('main', 'rating_normalization_type', 'auto', NULL, NULL),
('main', 'rating_normalization', '10', NULL, NULL),
('main', 'rating_count_vote', '10', NULL, NULL),
('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
('main', 'rating_community_last_visit', '90', NULL, NULL),
('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
('main', 'rating_assign_type', 'auto', NULL, NULL),
('main', 'rating_vote_type', 'like', NULL, NULL),
('main', 'rating_self_vote', 'Y', NULL, NULL),
('main', 'rating_vote_show', 'Y', NULL, NULL),
('main', 'rating_vote_template', 'like', NULL, NULL),
('main', 'rating_start_authority', '3', NULL, NULL),
('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
('main', 'distributive6', 'Y', NULL, NULL),
('main', '~new_license11_sign', 'Y', NULL, NULL),
('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
('main', 'vendor', '1c_bitrix', NULL, NULL),
('main', 'admin_lid', 'ru', NULL, NULL),
('main', 'update_site', 'www.bitrixsoft.com', NULL, NULL),
('main', 'update_site_ns', 'Y', NULL, NULL),
('main', 'optimize_css_files', 'Y', NULL, NULL),
('main', 'optimize_js_files', 'Y', NULL, NULL),
('main', 'admin_passwordh', 'FVkQfWYUBgYtCUVcAhcECgsTAQ==', NULL, NULL),
('main', 'server_uniq_id', 'f0ece6cb738b8d2e755f11492e350d70', NULL, NULL),
('blog', 'socNetNewPerms', 'Y', NULL, NULL),
('currency', 'installed_currencies', 'RUB,USD,EUR,UAH,BYR', NULL, NULL),
('fileman', 'use_editor_3', 'Y', NULL, NULL),
('forum', 'FILTER_DICT_W', '1', NULL, 'ru'),
('forum', 'FILTER_DICT_T', '2', NULL, 'ru'),
('forum', 'FILTER_DICT_W', '3', NULL, 'en'),
('forum', 'FILTER_DICT_T', '4', NULL, 'en'),
('forum', 'FILTER', 'N', NULL, NULL),
('sale', 'viewed_capability', 'N', NULL, NULL),
('sale', 'viewed_count', '10', NULL, NULL),
('sale', 'viewed_time', '5', NULL, NULL),
('sale', 'p2p_status_list', 'a:7:{i:0;s:1:\"N\";i:1;s:1:\"P\";i:2;s:1:\"F\";i:3;s:10:\"F_CANCELED\";i:4;s:10:\"F_DELIVERY\";i:5;s:5:\"F_PAY\";i:6;s:5:\"F_OUT\";}', NULL, NULL),
('sale', 'product_reserve_clear_period', '3', NULL, NULL),
('sale', 'sale_locationpro_migrated', 'Y', NULL, NULL),
('sale', 'sale_locationpro_enabled', 'Y', NULL, NULL),
('search', 'version', 'v2.0', NULL, NULL),
('search', 'dbnode_id', 'N', NULL, NULL),
('search', 'dbnode_status', 'ok', NULL, NULL),
('security', 'ipcheck_disable_file', '/bitrix/modules/ipcheck_disable_a847cd35c5fc2ff0d1c8fe16f0377cde', NULL, NULL),
('vote', 'VOTE_DIR', '', NULL, NULL),
('vote', 'VOTE_COMPATIBLE_OLD_TEMPLATE', 'N', NULL, NULL),
('main', 'email_from', 'pirogan@harmony.perm.ru', NULL, NULL),
('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
('storeassist', 'num_orders', 'a:2:{s:6:\"newDay\";i:0;s:7:\"prevDay\";i:0;}', NULL, NULL),
('storeassist', 'progress_percent', '0', NULL, NULL),
('main', '~support_finish_date', '2016-05-13', NULL, NULL),
('main', '~PARAM_MAX_SERVERS', '2', NULL, NULL),
('main', '~PARAM_COMPOSITE', 'N', NULL, NULL),
('main', '~PARAM_PHONE_SIP', 'N', NULL, NULL),
('main', '~cpf_map_value', 'YToxOntpOjA7czo1OiJTbWFsbCI7fQ==', NULL, NULL),
('main', '~update_autocheck_result', 'a:4:{s:10:\"check_date\";i:1456507410;s:6:\"result\";b:0;s:5:\"error\";s:0:\"\";s:7:\"modules\";a:0:{}}', NULL, NULL),
('main', 'update_system_check', '03.03.2016 07:33:58', NULL, NULL),
('main', '~new_license14_9_sign', 'Y', NULL, NULL),
('main', 'crc_code', 'T1pBOGpKNmUzUg==', NULL, NULL),
('main', '~PARAM_PARTNER_ID', '607397', NULL, NULL),
('main', 'dump_bucket_id', '0', NULL, NULL),
('main', 'dump_encrypt', '0', NULL, NULL),
('main', 'dump_use_compression', '1', NULL, NULL),
('main', 'skip_symlinks', '0', NULL, NULL),
('main', 'dump_max_exec_time', '20', NULL, NULL),
('main', 'dump_max_exec_time_sleep', '1', NULL, NULL),
('main', 'dump_archive_size_limit', '2097152000', NULL, NULL),
('main', 'dump_max_file_size', '0', NULL, NULL),
('main', 'dump_file_public', '1', NULL, NULL),
('main', 'dump_file_kernel', '1', NULL, NULL),
('main', 'dump_base', '1', NULL, NULL),
('main', 'dump_base_skip_stat', '1', NULL, NULL),
('main', 'dump_base_skip_search', '1', NULL, NULL),
('main', 'dump_base_skip_log', '1', NULL, NULL),
('main', 'dump_integrity_check', '1', NULL, NULL),
('main', 'dump_do_clouds', '0', NULL, NULL),
('main', 'skip_mask', '0', NULL, NULL),
('main', 'dump_site_id', 'a:0:{}', NULL, NULL),
('main', 'last_files_count', '39555', NULL, NULL),
('main', 'update_system_update', '26.02.2016 19:23:30', NULL, NULL),
('pull', 'path_to_modern_listener', 'http://#DOMAIN#/bitrix/sub/', NULL, NULL),
('pull', 'path_to_modern_listener_secure', 'https://#DOMAIN#/bitrix/sub/', NULL, NULL),
('sale', 'link_option_b_sale_loc_2site', 'a:2:{s:2:\"s1\";a:2:{s:1:\"L\";b:0;s:1:\"G\";b:0;}s:2:\"nd\";a:2:{s:1:\"L\";b:0;s:1:\"G\";b:0;}}', NULL, NULL),
('sale', 'project_uses_groups', 'N', NULL, NULL),
('main', 'smile_gallery_converted', '1', NULL, NULL),
('main', 'CAPTCHA_transparentTextPercent', '10', NULL, NULL),
('main', 'CAPTCHA_arBGColor_1', 'FFFFFF', NULL, NULL),
('main', 'CAPTCHA_arBGColor_2', 'FFFFFF', NULL, NULL),
('main', 'CAPTCHA_numEllipses', '100', NULL, NULL),
('main', 'CAPTCHA_arEllipseColor_1', '7F7F7F', NULL, NULL),
('main', 'CAPTCHA_arEllipseColor_2', 'FFFFFF', NULL, NULL),
('main', 'CAPTCHA_bLinesOverText', 'N', NULL, NULL),
('main', 'CAPTCHA_numLines', '20', NULL, NULL),
('main', 'CAPTCHA_arLineColor_1', '6E6E6E', NULL, NULL),
('main', 'CAPTCHA_arLineColor_2', 'FAFAFA', NULL, NULL),
('main', 'CAPTCHA_textStartX', '7', NULL, NULL),
('main', 'CAPTCHA_textFontSize', '20', NULL, NULL),
('main', 'CAPTCHA_arTextColor_1', '000000', NULL, NULL),
('main', 'CAPTCHA_arTextColor_2', '646464', NULL, NULL),
('main', 'CAPTCHA_textAngel_1', '-20', NULL, NULL),
('main', 'CAPTCHA_textAngel_2', '20', NULL, NULL),
('main', 'CAPTCHA_textDistance_1', '27', NULL, NULL),
('main', 'CAPTCHA_textDistance_2', '32', NULL, NULL),
('main', 'CAPTCHA_bWaveTransformation', 'N', NULL, NULL),
('main', 'CAPTCHA_bEmptyText', 'N', NULL, NULL),
('main', 'CAPTCHA_arBorderColor', '000000', NULL, NULL),
('main', 'CAPTCHA_arTTFFiles', 'font.ttf', NULL, NULL),
('main', 'CAPTCHA_letters', '1234567890', NULL, NULL),
('main', 'CAPTCHA_presets', '0', NULL, NULL),
('forum', 'smile_gallery_id', '4', NULL, NULL),
('forum', 'smile_native_gallery_id', '4', NULL, NULL),
('main', 'site_checker_success', '', NULL, NULL),
('main', 'signer_default_key', '7761ca9b1529d3c40409b321584e76eec283c664907d66c54b98cd0cf5824ed6ef29bf70abb1f5bee91437ccd54afedd8a7d32b60ff04b4114b4cfc7bdd9a261', NULL, NULL),
('main', 'site_checker_access', 'Y', NULL, NULL),
('perfmon', 'bitrix_optimal', 'N', NULL, NULL);
-- -----------------------------------
-- Dumping table b_perf_cache
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_cache`;
CREATE TABLE `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) DEFAULT NULL,
  `MODULE_NAME` text,
  `COMPONENT_NAME` text,
  `BASE_DIR` text,
  `INIT_DIR` text,
  `FILE_NAME` text,
  `FILE_PATH` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_cluster
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_cluster`;
CREATE TABLE `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_component
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_component`;
CREATE TABLE `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_error
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_error`;
CREATE TABLE `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text,
  `ERRFILE` text,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_history
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_history`;
CREATE TABLE `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_hit
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_hit`;
CREATE TABLE `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) DEFAULT NULL,
  `SERVER_NAME` varchar(50) DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text,
  `REQUEST_URI` text,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_index_ban
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_index_ban`;
CREATE TABLE `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) DEFAULT NULL,
  `TABLE_NAME` varchar(50) DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_index_complete
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_index_complete`;
CREATE TABLE `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) DEFAULT NULL,
  `TABLE_NAME` varchar(50) DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) DEFAULT NULL,
  `INDEX_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_index_suggest
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_index_suggest`;
CREATE TABLE `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) DEFAULT NULL,
  `SQL_TEXT` text,
  `SQL_EXPLAIN` longtext,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_index_suggest_sql
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_index_suggest_sql`;
CREATE TABLE `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL DEFAULT '0',
  `SQL_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_sql
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_sql`;
CREATE TABLE `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text,
  `COMPONENT_NAME` text,
  `SQL_TEXT` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_sql_backtrace
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_sql_backtrace`;
CREATE TABLE `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL DEFAULT '0',
  `NN` int(18) NOT NULL DEFAULT '0',
  `FILE_NAME` varchar(500) DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_tab_column_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_tab_column_stat`;
CREATE TABLE `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) DEFAULT NULL,
  `COLUMN_NAME` varchar(50) DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_tab_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_tab_stat`;
CREATE TABLE `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) NOT NULL DEFAULT '',
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_perf_test
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_test`;
CREATE TABLE `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_posting
-- -----------------------------------
DROP TABLE IF EXISTS `b_posting`;
CREATE TABLE `b_posting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `STATUS` char(1) NOT NULL DEFAULT 'D',
  `VERSION` char(1) DEFAULT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `SENT_BCC` mediumtext,
  `FROM_FIELD` varchar(255) NOT NULL,
  `TO_FIELD` varchar(255) DEFAULT NULL,
  `BCC_FIELD` mediumtext,
  `EMAIL_FILTER` varchar(255) DEFAULT NULL,
  `SUBJECT` varchar(255) NOT NULL,
  `BODY_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `BODY` mediumtext NOT NULL,
  `DIRECT_SEND` char(1) NOT NULL DEFAULT 'N',
  `CHARSET` varchar(50) DEFAULT NULL,
  `MSG_CHARSET` varchar(255) DEFAULT NULL,
  `SUBSCR_FORMAT` varchar(4) DEFAULT NULL,
  `ERROR_EMAIL` mediumtext,
  `AUTO_SEND_TIME` datetime DEFAULT NULL,
  `BCC_TO_SEND` mediumtext,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_posting_email
-- -----------------------------------
DROP TABLE IF EXISTS `b_posting_email`;
CREATE TABLE `b_posting_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `STATUS` char(1) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `SUBSCRIPTION_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_posting_email_status` (`POSTING_ID`,`STATUS`),
  KEY `ix_posting_email_email` (`POSTING_ID`,`EMAIL`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_posting_file
-- -----------------------------------
DROP TABLE IF EXISTS `b_posting_file`;
CREATE TABLE `b_posting_file` (
  `POSTING_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_FILE` (`POSTING_ID`,`FILE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_posting_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_posting_group`;
CREATE TABLE `b_posting_group` (
  `POSTING_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_GROUP` (`POSTING_ID`,`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_posting_rubric
-- -----------------------------------
DROP TABLE IF EXISTS `b_posting_rubric`;
CREATE TABLE `b_posting_rubric` (
  `POSTING_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_RUBRIC` (`POSTING_ID`,`LIST_RUBRIC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_pull_channel
-- -----------------------------------
DROP TABLE IF EXISTS `b_pull_channel`;
CREATE TABLE `b_pull_channel` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `CHANNEL_TYPE` varchar(50) DEFAULT NULL,
  `CHANNEL_ID` varchar(50) NOT NULL,
  `LAST_ID` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_PULL_CN_UID` (`USER_ID`,`CHANNEL_TYPE`),
  KEY `IX_PULL_CN_CID` (`CHANNEL_ID`),
  KEY `IX_PULL_CN_D` (`DATE_CREATE`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=cp1251;

INSERT INTO `b_pull_channel` VALUES
(64, 1, 'private', '6f31cb1347171d10a42b671106e36f42', 0, '2016-03-03 07:33:58');
-- -----------------------------------
-- Dumping table b_pull_push
-- -----------------------------------
DROP TABLE IF EXISTS `b_pull_push`;
CREATE TABLE `b_pull_push` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DEVICE_TYPE` varchar(50) DEFAULT NULL,
  `APP_ID` varchar(50) DEFAULT NULL,
  `UNIQUE_HASH` varchar(50) DEFAULT NULL,
  `DEVICE_ID` varchar(255) DEFAULT NULL,
  `DEVICE_NAME` varchar(50) DEFAULT NULL,
  `DEVICE_TOKEN` varchar(255) NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_AUTH` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_PULL_PSH_UID` (`USER_ID`),
  KEY `IX_PULL_PSH_UH` (`UNIQUE_HASH`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_pull_push_queue
-- -----------------------------------
DROP TABLE IF EXISTS `b_pull_push_queue`;
CREATE TABLE `b_pull_push_queue` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `SUB_TAG` varchar(255) DEFAULT NULL,
  `MESSAGE` varchar(255) NOT NULL,
  `PARAMS` text,
  `BADGE` int(11) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `APP_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_PULL_PSHQ_UT` (`USER_ID`,`TAG`),
  KEY `IX_PULL_PSHQ_UST` (`USER_ID`,`SUB_TAG`),
  KEY `IX_PULL_PSHQ_UID` (`USER_ID`),
  KEY `IX_PULL_PSHQ_DC` (`DATE_CREATE`),
  KEY `IX_PULL_PSHQ_AID` (`APP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_pull_stack
-- -----------------------------------
DROP TABLE IF EXISTS `b_pull_stack`;
CREATE TABLE `b_pull_stack` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` varchar(50) NOT NULL,
  `MESSAGE` text NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_PULL_STACK_CID` (`CHANNEL_ID`),
  KEY `IX_PULL_STACK_D` (`DATE_CREATE`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=cp1251;

INSERT INTO `b_pull_stack` VALUES
(63, '9d3fd9f57a65aa6bf3ed533145f2df85', 'a:3:{s:9:\"module_id\";s:4:\"pull\";s:7:\"command\";s:11:\"channel_die\";s:6:\"params\";a:2:{s:7:\"replace\";s:0:\"\";s:4:\"from\";s:14:\"delete by user\";}}', '2016-03-03 06:36:00');
-- -----------------------------------
-- Dumping table b_pull_watch
-- -----------------------------------
DROP TABLE IF EXISTS `b_pull_watch`;
CREATE TABLE `b_pull_watch` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `CHANNEL_ID` varchar(50) NOT NULL,
  `TAG` varchar(255) NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_PULL_W_UT` (`USER_ID`,`TAG`),
  KEY `IX_PULL_W_D` (`DATE_CREATE`),
  KEY `IX_PULL_W_T` (`TAG`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_rating
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating`;
CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL,
  `NAME` varchar(512) NOT NULL,
  `ENTITY_ID` varchar(50) NOT NULL,
  `CALCULATION_METHOD` varchar(3) NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) DEFAULT 'N',
  `AUTHORITY` char(1) DEFAULT 'N',
  `CALCULATED` char(1) NOT NULL DEFAULT 'N',
  `CONFIGS` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=cp1251;

INSERT INTO `b_rating` VALUES
(1, 'N', 'Рейтинг', 'USER', 'SUM', '2015-04-13 11:03:42', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),
(2, 'N', 'Авторитет', 'USER', 'SUM', '2015-04-13 11:03:42', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');
-- -----------------------------------
-- Dumping table b_rating_component
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_component`;
CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `RATING_TYPE` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `COMPLEX_NAME` varchar(200) NOT NULL,
  `CLASS` varchar(255) NOT NULL,
  `CALC_METHOD` varchar(255) NOT NULL,
  `EXCEPTION_METHOD` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_rating_component_results
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_component_results`;
CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `RATING_TYPE` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `COMPLEX_NAME` varchar(200) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_rating_prepare
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_prepare`;
CREATE TABLE `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_rating_results
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_results`;
CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT '0',
  `PREVIOUS_POSITION` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_rating_rule
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_rule`;
CREATE TABLE `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `NAME` varchar(256) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `CONDITION_NAME` varchar(200) NOT NULL,
  `CONDITION_MODULE` varchar(50) DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) NOT NULL,
  `CONDITION_METHOD` varchar(255) NOT NULL,
  `CONDITION_CONFIG` text NOT NULL,
  `ACTION_NAME` varchar(200) NOT NULL,
  `ACTION_CONFIG` text NOT NULL,
  `ACTIVATE` char(1) NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) NOT NULL,
  `ACTIVATE_METHOD` varchar(255) NOT NULL,
  `DEACTIVATE` char(1) NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251;

INSERT INTO `b_rating_rule` VALUES
(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2015-04-13 11:03:42', '2015-04-13 11:03:42', NULL),
(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2015-04-13 11:03:42', '2015-04-13 11:03:42', NULL),
(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2015-04-13 11:03:42', '2015-04-13 11:03:42', NULL),
(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2015-04-13 11:03:42', '2015-04-13 11:03:42', NULL),
(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.1000000000000000055511151231257827021181583404541015625;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.1000000000000000055511151231257827021181583404541015625;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2015-04-13 11:03:42', '2015-04-13 11:03:42', NULL);
-- -----------------------------------
-- Dumping table b_rating_rule_vetting
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_rule_vetting`;
CREATE TABLE `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) NOT NULL DEFAULT 'N',
  `APPLIED` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_rating_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_user`;
CREATE TABLE `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

INSERT INTO `b_rating_user` VALUES
(1, 2, 1, 3.0000, 30.0000, 13);
-- -----------------------------------
-- Dumping table b_rating_vote
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_vote`;
CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_4` (`USER_ID`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_rating_vote_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_vote_group`;
CREATE TABLE `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=cp1251;

INSERT INTO `b_rating_vote_group` VALUES
(1, 1, 'R'),
(2, 3, 'R'),
(3, 1, 'R'),
(4, 3, 'R'),
(5, 1, 'A'),
(6, 4, 'A');
-- -----------------------------------
-- Dumping table b_rating_voting
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_voting`;
CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_rating_voting_prepare
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_voting_prepare`;
CREATE TABLE `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_rating_weight
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_weight`;
CREATE TABLE `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

INSERT INTO `b_rating_weight` VALUES
(1, -1000000.0000, 1000000.0000, 1.0000, 10);
-- -----------------------------------
-- Dumping table b_sale_affiliate
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_affiliate`;
CREATE TABLE `b_sale_affiliate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `AFFILIATE_ID` int(11) DEFAULT NULL,
  `PLAN_ID` int(11) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DATE_CREATE` datetime NOT NULL,
  `PAID_SUM` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `APPROVED_SUM` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `PENDING_SUM` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `ITEMS_NUMBER` int(11) NOT NULL DEFAULT '0',
  `ITEMS_SUM` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `LAST_CALCULATE` datetime DEFAULT NULL,
  `AFF_SITE` varchar(200) DEFAULT NULL,
  `AFF_DESCRIPTION` text,
  `FIX_PLAN` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_SAA_USER_ID` (`USER_ID`,`SITE_ID`),
  KEY `IX_SAA_AFFILIATE_ID` (`AFFILIATE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_affiliate_plan
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_affiliate_plan`;
CREATE TABLE `b_sale_affiliate_plan` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `NAME` varchar(250) NOT NULL,
  `DESCRIPTION` text,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `BASE_RATE` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `BASE_RATE_TYPE` char(1) NOT NULL DEFAULT 'P',
  `BASE_RATE_CURRENCY` char(3) DEFAULT NULL,
  `MIN_PAY` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `MIN_PLAN_VALUE` decimal(18,4) DEFAULT NULL,
  `VALUE_CURRENCY` char(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_affiliate_plan_section
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_affiliate_plan_section`;
CREATE TABLE `b_sale_affiliate_plan_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PLAN_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL DEFAULT 'catalog',
  `SECTION_ID` varchar(255) NOT NULL,
  `RATE` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `RATE_TYPE` char(1) NOT NULL DEFAULT 'P',
  `RATE_CURRENCY` char(3) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_SAP_PLAN_ID` (`PLAN_ID`,`MODULE_ID`,`SECTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_affiliate_tier
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_affiliate_tier`;
CREATE TABLE `b_sale_affiliate_tier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `RATE1` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `RATE2` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `RATE3` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `RATE4` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `RATE5` decimal(18,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_SAT_SITE_ID` (`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_affiliate_transact
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_affiliate_transact`;
CREATE TABLE `b_sale_affiliate_transact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AFFILIATE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TRANSACT_DATE` datetime NOT NULL,
  `AMOUNT` decimal(18,4) NOT NULL,
  `CURRENCY` char(3) NOT NULL,
  `DEBIT` char(1) NOT NULL DEFAULT 'N',
  `DESCRIPTION` varchar(100) NOT NULL,
  `EMPLOYEE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SAT_AFFILIATE_ID` (`AFFILIATE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_auxiliary
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_auxiliary`;
CREATE TABLE `b_sale_auxiliary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ITEM` varchar(255) NOT NULL,
  `ITEM_MD5` varchar(32) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_STT_USER_ITEM` (`USER_ID`,`ITEM_MD5`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_basket
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_basket`;
CREATE TABLE `b_sale_basket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FUSER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) DEFAULT NULL,
  `PRODUCT_ID` int(11) NOT NULL,
  `PRODUCT_PRICE_ID` int(11) DEFAULT NULL,
  `PRICE` decimal(18,2) NOT NULL,
  `CURRENCY` char(3) NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `WEIGHT` double(18,2) DEFAULT NULL,
  `QUANTITY` double(18,2) NOT NULL DEFAULT '0.00',
  `LID` char(2) NOT NULL,
  `DELAY` char(1) NOT NULL DEFAULT 'N',
  `NAME` varchar(255) NOT NULL,
  `CAN_BUY` char(1) NOT NULL DEFAULT 'Y',
  `MODULE` varchar(100) DEFAULT NULL,
  `CALLBACK_FUNC` varchar(100) DEFAULT NULL,
  `NOTES` varchar(250) DEFAULT NULL,
  `ORDER_CALLBACK_FUNC` varchar(100) DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(250) DEFAULT NULL,
  `DISCOUNT_PRICE` decimal(18,2) NOT NULL DEFAULT '0.00',
  `CANCEL_CALLBACK_FUNC` varchar(100) DEFAULT NULL,
  `PAY_CALLBACK_FUNC` varchar(100) DEFAULT NULL,
  `PRODUCT_PROVIDER_CLASS` varchar(100) DEFAULT NULL,
  `CATALOG_XML_ID` varchar(100) DEFAULT NULL,
  `PRODUCT_XML_ID` varchar(100) DEFAULT NULL,
  `DISCOUNT_NAME` varchar(255) DEFAULT NULL,
  `DISCOUNT_VALUE` char(32) DEFAULT NULL,
  `DISCOUNT_COUPON` char(32) DEFAULT NULL,
  `VAT_RATE` decimal(18,2) DEFAULT '0.00',
  `SUBSCRIBE` char(1) NOT NULL DEFAULT 'N',
  `DEDUCTED` char(1) NOT NULL DEFAULT 'N',
  `RESERVED` char(1) NOT NULL DEFAULT 'N',
  `BARCODE_MULTI` char(1) NOT NULL DEFAULT 'N',
  `RESERVE_QUANTITY` double DEFAULT NULL,
  `CUSTOM_PRICE` char(1) NOT NULL DEFAULT 'N',
  `DIMENSIONS` varchar(255) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `SET_PARENT_ID` int(11) DEFAULT NULL,
  `MEASURE_CODE` int(11) DEFAULT NULL,
  `MEASURE_NAME` varchar(50) DEFAULT NULL,
  `RECOMMENDATION` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IXS_BASKET_LID` (`LID`),
  KEY `IXS_BASKET_USER_ID` (`FUSER_ID`),
  KEY `IXS_BASKET_ORDER_ID` (`ORDER_ID`),
  KEY `IXS_BASKET_PRODUCT_ID` (`PRODUCT_ID`),
  KEY `IXS_BASKET_PRODUCT_PRICE_ID` (`PRODUCT_PRICE_ID`),
  KEY `IXS_SBAS_XML_ID` (`PRODUCT_XML_ID`,`CATALOG_XML_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_basket_props
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_basket_props`;
CREATE TABLE `b_sale_basket_props` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BASKET_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`ID`),
  KEY `IXS_BASKET_PROPS_BASKET` (`BASKET_ID`),
  KEY `IXS_BASKET_PROPS_CODE` (`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_delivery
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_delivery`;
CREATE TABLE `b_sale_delivery` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `LID` char(2) NOT NULL,
  `PERIOD_FROM` int(11) DEFAULT NULL,
  `PERIOD_TO` int(11) DEFAULT NULL,
  `PERIOD_TYPE` char(1) DEFAULT NULL,
  `WEIGHT_FROM` int(11) DEFAULT NULL,
  `WEIGHT_TO` int(11) DEFAULT NULL,
  `ORDER_PRICE_FROM` decimal(18,2) DEFAULT NULL,
  `ORDER_PRICE_TO` decimal(18,2) DEFAULT NULL,
  `ORDER_CURRENCY` char(3) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `PRICE` decimal(18,2) NOT NULL,
  `CURRENCY` char(3) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DESCRIPTION` text,
  `LOGOTIP` int(11) DEFAULT NULL,
  `STORE` text,
  PRIMARY KEY (`ID`),
  KEY `IXS_DELIVERY_LID` (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_delivery2location
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_delivery2location`;
CREATE TABLE `b_sale_delivery2location` (
  `DELIVERY_ID` int(11) NOT NULL,
  `LOCATION_CODE` varchar(100) NOT NULL,
  `LOCATION_TYPE` char(1) NOT NULL DEFAULT 'L',
  PRIMARY KEY (`DELIVERY_ID`,`LOCATION_CODE`,`LOCATION_TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_delivery2paysystem
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_delivery2paysystem`;
CREATE TABLE `b_sale_delivery2paysystem` (
  `DELIVERY_ID` varchar(35) NOT NULL,
  `DELIVERY_PROFILE_ID` varchar(35) DEFAULT NULL,
  `PAYSYSTEM_ID` int(11) NOT NULL,
  KEY `IX_DELIVERY` (`DELIVERY_ID`),
  KEY `IX_PAYSYSTEM` (`PAYSYSTEM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_delivery_handler
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_delivery_handler`;
CREATE TABLE `b_sale_delivery_handler` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) DEFAULT '',
  `ACTIVE` char(1) DEFAULT 'Y',
  `HID` varchar(50) NOT NULL DEFAULT '',
  `NAME` varchar(255) NOT NULL DEFAULT '',
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DESCRIPTION` text,
  `HANDLER` varchar(255) NOT NULL DEFAULT '',
  `SETTINGS` text,
  `PROFILES` text,
  `TAX_RATE` double DEFAULT '0',
  `LOGOTIP` int(11) DEFAULT NULL,
  `BASE_CURRENCY` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_HID` (`HID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_discount
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_discount`;
CREATE TABLE `b_sale_discount` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) DEFAULT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PRICE_FROM` decimal(18,2) DEFAULT NULL,
  `PRICE_TO` decimal(18,2) DEFAULT NULL,
  `CURRENCY` char(3) DEFAULT NULL,
  `DISCOUNT_VALUE` decimal(18,2) NOT NULL,
  `DISCOUNT_TYPE` char(1) NOT NULL DEFAULT 'P',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '100',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `PRIORITY` int(18) NOT NULL DEFAULT '1',
  `LAST_DISCOUNT` char(1) NOT NULL DEFAULT 'Y',
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `CONDITIONS` mediumtext,
  `UNPACK` mediumtext,
  `ACTIONS` mediumtext,
  `APPLICATION` mediumtext,
  `USE_COUPONS` char(1) NOT NULL DEFAULT 'N',
  `EXECUTE_MODULE` varchar(50) NOT NULL DEFAULT 'all',
  PRIMARY KEY (`ID`),
  KEY `IXS_DISCOUNT_LID` (`LID`),
  KEY `IX_SSD_ACTIVE_DATE` (`ACTIVE_FROM`,`ACTIVE_TO`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_discount_coupon
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_discount_coupon`;
CREATE TABLE `b_sale_discount_coupon` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `COUPON` varchar(32) NOT NULL,
  `TYPE` int(11) NOT NULL DEFAULT '0',
  `MAX_USE` int(11) NOT NULL DEFAULT '0',
  `USE_COUNT` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `DATE_APPLY` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_discount_entities
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_discount_entities`;
CREATE TABLE `b_sale_discount_entities` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `ENTITY` varchar(255) NOT NULL,
  `FIELD_ENTITY` varchar(255) NOT NULL,
  `FIELD_TABLE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SALE_DSC_ENT_DISCOUNT_ID` (`DISCOUNT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_discount_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_discount_group`;
CREATE TABLE `b_sale_discount_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ACTIVE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_S_DISGRP` (`DISCOUNT_ID`,`GROUP_ID`),
  UNIQUE KEY `IX_S_DISGRP_G` (`GROUP_ID`,`DISCOUNT_ID`),
  KEY `IX_S_DISGRP_D` (`DISCOUNT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_discount_module
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_discount_module`;
CREATE TABLE `b_sale_discount_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SALE_DSC_MOD` (`DISCOUNT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_export
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_export`;
CREATE TABLE `b_sale_export` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERSON_TYPE_ID` int(11) NOT NULL,
  `VARS` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_fuser
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_fuser`;
CREATE TABLE `b_sale_fuser` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_ID` (`USER_ID`),
  KEY `IX_CODE` (`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_lang`;
CREATE TABLE `b_sale_lang` (
  `LID` char(2) NOT NULL,
  `CURRENCY` char(3) NOT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_loc_2site
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_loc_2site`;
CREATE TABLE `b_sale_loc_2site` (
  `LOCATION_ID` int(11) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `LOCATION_TYPE` char(1) NOT NULL DEFAULT 'L',
  PRIMARY KEY (`SITE_ID`,`LOCATION_ID`,`LOCATION_TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_loc_def2site
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_loc_def2site`;
CREATE TABLE `b_sale_loc_def2site` (
  `LOCATION_CODE` varchar(100) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `SORT` int(11) DEFAULT '100',
  PRIMARY KEY (`LOCATION_CODE`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_loc_ext
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_loc_ext`;
CREATE TABLE `b_sale_loc_ext` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SERVICE_ID` int(11) NOT NULL,
  `LOCATION_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SALE_LOC_EXT_LID_SID` (`LOCATION_ID`,`SERVICE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_loc_ext_srv
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_loc_ext_srv`;
CREATE TABLE `b_sale_loc_ext_srv` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_loc_name
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_loc_name`;
CREATE TABLE `b_sale_loc_name` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LANGUAGE_ID` char(2) NOT NULL,
  `LOCATION_ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `NAME_UPPER` varchar(100) NOT NULL,
  `SHORT_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SALE_LOC_NAME_NAME_U` (`NAME_UPPER`),
  KEY `IX_B_SALE_LOC_NAME_LI_LI` (`LOCATION_ID`,`LANGUAGE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_loc_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_loc_type`;
CREATE TABLE `b_sale_loc_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(30) NOT NULL,
  `SORT` int(11) DEFAULT '100',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_loc_type_name
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_loc_type_name`;
CREATE TABLE `b_sale_loc_type_name` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LANGUAGE_ID` char(2) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `TYPE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SALE_LOC_TYPE_NAME_TI_LI` (`TYPE_ID`,`LANGUAGE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_location
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_location`;
CREATE TABLE `b_sale_location` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `CODE` varchar(100) NOT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT '0',
  `DEPTH_LEVEL` int(11) DEFAULT '1',
  `TYPE_ID` int(11) DEFAULT NULL,
  `LATITUDE` decimal(8,6) DEFAULT NULL,
  `LONGITUDE` decimal(9,6) DEFAULT NULL,
  `COUNTRY_ID` int(11) DEFAULT NULL,
  `REGION_ID` int(11) DEFAULT NULL,
  `CITY_ID` int(11) DEFAULT NULL,
  `LOC_DEFAULT` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SALE_LOC_CODE` (`CODE`),
  KEY `IX_B_SALE_LOC_MARGINS` (`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `IX_B_SALE_LOC_MARGINS_REV` (`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `IX_B_SALE_LOC_PARENT` (`PARENT_ID`),
  KEY `IX_B_SALE_LOC_DL` (`DEPTH_LEVEL`),
  KEY `IX_B_SALE_LOC_TYPE` (`TYPE_ID`),
  KEY `IXS_LOCATION_COUNTRY_ID` (`COUNTRY_ID`),
  KEY `IXS_LOCATION_REGION_ID` (`REGION_ID`),
  KEY `IXS_LOCATION_CITY_ID` (`CITY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_location2location_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_location2location_group`;
CREATE TABLE `b_sale_location2location_group` (
  `LOCATION_ID` int(11) NOT NULL,
  `LOCATION_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`LOCATION_ID`,`LOCATION_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_location_city
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_location_city`;
CREATE TABLE `b_sale_location_city` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `SHORT_NAME` varchar(100) DEFAULT NULL,
  `REGION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IXS_LOCAT_REGION_ID` (`REGION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_location_city_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_location_city_lang`;
CREATE TABLE `b_sale_location_city_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_ID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SHORT_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXS_LOCAT_CITY_LID` (`CITY_ID`,`LID`),
  KEY `IX_NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_location_country
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_location_country`;
CREATE TABLE `b_sale_location_country` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `SHORT_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_location_country_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_location_country_lang`;
CREATE TABLE `b_sale_location_country_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COUNTRY_ID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SHORT_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXS_LOCAT_CNTR_LID` (`COUNTRY_ID`,`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_location_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_location_group`;
CREATE TABLE `b_sale_location_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SALE_LOC_GROUP_CODE` (`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_location_group_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_location_group_lang`;
CREATE TABLE `b_sale_location_group_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOCATION_GROUP_ID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_LOCATION_GROUP_LID` (`LOCATION_GROUP_ID`,`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_location_region
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_location_region`;
CREATE TABLE `b_sale_location_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `SHORT_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_location_region_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_location_region_lang`;
CREATE TABLE `b_sale_location_region_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REGION_ID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SHORT_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXS_LOCAT_REGION_LID` (`REGION_ID`,`LID`),
  KEY `IXS_NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_location_zip
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_location_zip`;
CREATE TABLE `b_sale_location_zip` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOCATION_ID` int(11) NOT NULL DEFAULT '0',
  `ZIP` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `IX_LOCATION_ID` (`LOCATION_ID`),
  KEY `IX_ZIP` (`ZIP`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_order
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_order`;
CREATE TABLE `b_sale_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) NOT NULL,
  `PERSON_TYPE_ID` int(11) NOT NULL,
  `PAYED` char(1) NOT NULL DEFAULT 'N',
  `DATE_PAYED` datetime DEFAULT NULL,
  `EMP_PAYED_ID` int(11) DEFAULT NULL,
  `CANCELED` char(1) NOT NULL DEFAULT 'N',
  `DATE_CANCELED` datetime DEFAULT NULL,
  `EMP_CANCELED_ID` int(11) DEFAULT NULL,
  `REASON_CANCELED` varchar(255) DEFAULT NULL,
  `STATUS_ID` char(1) NOT NULL DEFAULT 'N',
  `DATE_STATUS` datetime NOT NULL,
  `EMP_STATUS_ID` int(11) DEFAULT NULL,
  `PRICE_DELIVERY` decimal(18,2) NOT NULL,
  `ALLOW_DELIVERY` char(1) NOT NULL DEFAULT 'N',
  `DATE_ALLOW_DELIVERY` datetime DEFAULT NULL,
  `EMP_ALLOW_DELIVERY_ID` int(11) DEFAULT NULL,
  `DEDUCTED` char(1) NOT NULL DEFAULT 'N',
  `DATE_DEDUCTED` datetime DEFAULT NULL,
  `EMP_DEDUCTED_ID` int(11) DEFAULT NULL,
  `REASON_UNDO_DEDUCTED` varchar(255) DEFAULT NULL,
  `MARKED` char(1) NOT NULL DEFAULT 'N',
  `DATE_MARKED` datetime DEFAULT NULL,
  `EMP_MARKED_ID` int(11) DEFAULT NULL,
  `REASON_MARKED` varchar(255) DEFAULT NULL,
  `RESERVED` char(1) NOT NULL DEFAULT 'N',
  `PRICE` decimal(18,2) NOT NULL,
  `CURRENCY` char(3) NOT NULL,
  `DISCOUNT_VALUE` decimal(18,2) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `PAY_SYSTEM_ID` int(11) DEFAULT NULL,
  `DELIVERY_ID` varchar(50) DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `USER_DESCRIPTION` varchar(250) DEFAULT NULL,
  `ADDITIONAL_INFO` varchar(255) DEFAULT NULL,
  `PS_STATUS` char(1) DEFAULT NULL,
  `PS_STATUS_CODE` char(5) DEFAULT NULL,
  `PS_STATUS_DESCRIPTION` varchar(250) DEFAULT NULL,
  `PS_STATUS_MESSAGE` varchar(250) DEFAULT NULL,
  `PS_SUM` decimal(18,2) DEFAULT NULL,
  `PS_CURRENCY` char(3) DEFAULT NULL,
  `PS_RESPONSE_DATE` datetime DEFAULT NULL,
  `COMMENTS` text,
  `TAX_VALUE` decimal(18,2) NOT NULL DEFAULT '0.00',
  `STAT_GID` varchar(255) DEFAULT NULL,
  `SUM_PAID` decimal(18,2) NOT NULL DEFAULT '0.00',
  `RECURRING_ID` int(11) DEFAULT NULL,
  `PAY_VOUCHER_NUM` varchar(20) DEFAULT NULL,
  `PAY_VOUCHER_DATE` date DEFAULT NULL,
  `LOCKED_BY` int(11) DEFAULT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `RECOUNT_FLAG` char(1) NOT NULL DEFAULT 'Y',
  `AFFILIATE_ID` int(11) DEFAULT NULL,
  `DELIVERY_DOC_NUM` varchar(20) DEFAULT NULL,
  `DELIVERY_DOC_DATE` date DEFAULT NULL,
  `UPDATED_1C` char(1) NOT NULL DEFAULT 'N',
  `STORE_ID` int(11) DEFAULT NULL,
  `ORDER_TOPIC` varchar(255) DEFAULT NULL,
  `RESPONSIBLE_ID` int(11) DEFAULT NULL,
  `DATE_PAY_BEFORE` datetime DEFAULT NULL,
  `DATE_BILL` datetime DEFAULT NULL,
  `ACCOUNT_NUMBER` varchar(100) DEFAULT NULL,
  `TRACKING_NUMBER` varchar(255) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `ID_1C` varchar(15) DEFAULT NULL,
  `VERSION_1C` varchar(15) DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  `EXTERNAL_ORDER` char(1) NOT NULL DEFAULT 'N',
  `BX_USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXS_ACCOUNT_NUMBER` (`ACCOUNT_NUMBER`),
  KEY `IXS_ORDER_USER_ID` (`USER_ID`),
  KEY `IXS_ORDER_PERSON_TYPE_ID` (`PERSON_TYPE_ID`),
  KEY `IXS_ORDER_PAYED` (`PAYED`),
  KEY `IXS_ORDER_STATUS_ID` (`STATUS_ID`),
  KEY `IXS_ORDER_REC_ID` (`RECURRING_ID`),
  KEY `IX_SOO_AFFILIATE_ID` (`AFFILIATE_ID`),
  KEY `IXS_ORDER_UPDATED_1C` (`UPDATED_1C`),
  KEY `IXS_SALE_COUNT` (`USER_ID`,`LID`,`PAYED`,`CANCELED`),
  KEY `IXS_DATE_UPDATE` (`DATE_UPDATE`),
  KEY `IXS_XML_ID` (`XML_ID`),
  KEY `IXS_ID_1C` (`ID_1C`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_order_change
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_order_change`;
CREATE TABLE `b_sale_order_change` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` int(11) NOT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DATA` varchar(512) DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_MODIFY` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IXS_ORDER_ID_CHANGE` (`ORDER_ID`),
  KEY `IXS_TYPE_CHANGE` (`TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_order_delivery
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_order_delivery`;
CREATE TABLE `b_sale_order_delivery` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` int(11) NOT NULL,
  `DATE_REQUEST` datetime DEFAULT NULL,
  `DELIVERY_LOCATION` varchar(50) DEFAULT '',
  `PARAMS` text,
  PRIMARY KEY (`ID`),
  KEY `IX_ORDER_ID` (`ORDER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_order_flags2group
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_order_flags2group`;
CREATE TABLE `b_sale_order_flags2group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `ORDER_FLAG` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_sale_ordfla2group` (`GROUP_ID`,`ORDER_FLAG`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_order_history
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_order_history`;
CREATE TABLE `b_sale_order_history` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `H_USER_ID` int(11) unsigned NOT NULL,
  `H_DATE_INSERT` datetime NOT NULL,
  `H_ORDER_ID` int(11) unsigned NOT NULL,
  `H_CURRENCY` char(3) NOT NULL,
  `PERSON_TYPE_ID` int(11) unsigned DEFAULT NULL,
  `PAYED` char(1) DEFAULT NULL,
  `DATE_PAYED` datetime DEFAULT NULL,
  `EMP_PAYED_ID` int(11) unsigned DEFAULT NULL,
  `CANCELED` char(1) DEFAULT NULL,
  `DATE_CANCELED` datetime DEFAULT NULL,
  `REASON_CANCELED` varchar(255) DEFAULT NULL,
  `STATUS_ID` char(1) DEFAULT NULL,
  `DATE_STATUS` datetime DEFAULT NULL,
  `PRICE_DELIVERY` decimal(18,2) DEFAULT NULL,
  `ALLOW_DELIVERY` char(1) DEFAULT NULL,
  `DATE_ALLOW_DELIVERY` datetime DEFAULT NULL,
  `RESERVED` char(1) DEFAULT NULL,
  `DEDUCTED` char(1) DEFAULT NULL,
  `DATE_DEDUCTED` datetime DEFAULT NULL,
  `REASON_UNDO_DEDUCTED` varchar(255) DEFAULT NULL,
  `MARKED` char(1) DEFAULT NULL,
  `DATE_MARKED` datetime DEFAULT NULL,
  `REASON_MARKED` varchar(255) DEFAULT NULL,
  `PRICE` decimal(18,2) DEFAULT NULL,
  `CURRENCY` char(3) DEFAULT NULL,
  `DISCOUNT_VALUE` decimal(18,2) DEFAULT NULL,
  `USER_ID` int(11) unsigned DEFAULT NULL,
  `PAY_SYSTEM_ID` int(11) unsigned DEFAULT NULL,
  `DELIVERY_ID` varchar(50) DEFAULT NULL,
  `PS_STATUS` char(1) DEFAULT NULL,
  `PS_STATUS_CODE` char(5) DEFAULT NULL,
  `PS_STATUS_DESCRIPTION` varchar(250) DEFAULT NULL,
  `PS_STATUS_MESSAGE` varchar(250) DEFAULT NULL,
  `PS_SUM` decimal(18,2) DEFAULT NULL,
  `PS_CURRENCY` char(3) DEFAULT NULL,
  `PS_RESPONSE_DATE` datetime DEFAULT NULL,
  `TAX_VALUE` decimal(18,2) DEFAULT NULL,
  `STAT_GID` varchar(255) DEFAULT NULL,
  `SUM_PAID` decimal(18,2) DEFAULT NULL,
  `PAY_VOUCHER_NUM` varchar(20) DEFAULT NULL,
  `PAY_VOUCHER_DATE` date DEFAULT NULL,
  `AFFILIATE_ID` int(11) unsigned DEFAULT NULL,
  `DELIVERY_DOC_NUM` varchar(20) DEFAULT NULL,
  `DELIVERY_DOC_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ixH_ORDER_ID` (`H_ORDER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_order_processing
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_order_processing`;
CREATE TABLE `b_sale_order_processing` (
  `ORDER_ID` int(11) DEFAULT '0',
  `PRODUCTS_ADDED` char(1) DEFAULT 'N',
  `PRODUCTS_REMOVED` char(1) DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_order_props
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_order_props`;
CREATE TABLE `b_sale_order_props` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERSON_TYPE_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `REQUIED` char(1) NOT NULL DEFAULT 'N',
  `DEFAULT_VALUE` varchar(255) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `USER_PROPS` char(1) NOT NULL DEFAULT 'N',
  `IS_LOCATION` char(1) NOT NULL DEFAULT 'N',
  `PROPS_GROUP_ID` int(11) NOT NULL,
  `SIZE1` int(11) NOT NULL DEFAULT '0',
  `SIZE2` int(11) NOT NULL DEFAULT '0',
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `IS_EMAIL` char(1) NOT NULL DEFAULT 'N',
  `IS_PROFILE_NAME` char(1) NOT NULL DEFAULT 'N',
  `IS_PAYER` char(1) NOT NULL DEFAULT 'N',
  `IS_LOCATION4TAX` char(1) NOT NULL DEFAULT 'N',
  `IS_FILTERED` char(1) NOT NULL DEFAULT 'N',
  `CODE` varchar(50) DEFAULT NULL,
  `IS_ZIP` char(1) NOT NULL DEFAULT 'N',
  `IS_PHONE` char(1) NOT NULL DEFAULT 'N',
  `ACTIVE` varchar(1) NOT NULL DEFAULT 'Y',
  `UTIL` varchar(1) NOT NULL DEFAULT 'N',
  `INPUT_FIELD_LOCATION` int(11) NOT NULL DEFAULT '0',
  `MULTIPLE` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IXS_ORDER_PROPS_PERSON_TYPE_ID` (`PERSON_TYPE_ID`),
  KEY `IXS_CODE_OPP` (`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_order_props_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_order_props_group`;
CREATE TABLE `b_sale_order_props_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERSON_TYPE_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`ID`),
  KEY `IXS_ORDER_PROPS_GROUP_PERSON_TYPE_ID` (`PERSON_TYPE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_order_props_relation
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_order_props_relation`;
CREATE TABLE `b_sale_order_props_relation` (
  `PROPERTY_ID` int(11) NOT NULL,
  `ENTITY_ID` varchar(35) NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  PRIMARY KEY (`PROPERTY_ID`,`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_PROPERTY` (`PROPERTY_ID`),
  KEY `IX_ENTITY_ID` (`ENTITY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_order_props_value
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_order_props_value`;
CREATE TABLE `b_sale_order_props_value` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` int(11) NOT NULL,
  `ORDER_PROPS_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_SOPV_ORD_PROP_UNI` (`ORDER_ID`,`ORDER_PROPS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_order_props_variant
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_order_props_variant`;
CREATE TABLE `b_sale_order_props_variant` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_PROPS_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IXS_ORDER_PROPS_VARIANT_ORDER_PROPS_ID` (`ORDER_PROPS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_order_tax
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_order_tax`;
CREATE TABLE `b_sale_order_tax` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` int(11) NOT NULL,
  `TAX_NAME` varchar(255) NOT NULL,
  `VALUE` decimal(18,2) DEFAULT NULL,
  `VALUE_MONEY` decimal(18,2) NOT NULL,
  `APPLY_ORDER` int(11) NOT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  `IS_PERCENT` char(1) NOT NULL DEFAULT 'Y',
  `IS_IN_PRICE` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ixs_sot_order_id` (`ORDER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_pay_system
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_pay_system`;
CREATE TABLE `b_sale_pay_system` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) DEFAULT NULL,
  `CURRENCY` char(3) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IXS_PAY_SYSTEM_LID` (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_pay_system_action
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_pay_system_action`;
CREATE TABLE `b_sale_pay_system_action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PAY_SYSTEM_ID` int(11) NOT NULL,
  `PERSON_TYPE_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ACTION_FILE` varchar(255) DEFAULT NULL,
  `RESULT_FILE` varchar(255) DEFAULT NULL,
  `NEW_WINDOW` char(1) NOT NULL DEFAULT 'Y',
  `PARAMS` text,
  `TARIF` text,
  `HAVE_PAYMENT` char(1) NOT NULL DEFAULT 'N',
  `HAVE_ACTION` char(1) NOT NULL DEFAULT 'N',
  `HAVE_RESULT` char(1) NOT NULL DEFAULT 'N',
  `HAVE_PREPAY` char(1) NOT NULL DEFAULT 'N',
  `HAVE_RESULT_RECEIVE` char(1) NOT NULL DEFAULT 'N',
  `ENCODING` varchar(45) DEFAULT NULL,
  `LOGOTIP` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_SPSA_PSPT_UNI` (`PAY_SYSTEM_ID`,`PERSON_TYPE_ID`),
  KEY `IXS_PAY_SYSTEM_ACTION_PERSON_TYPE_ID` (`PERSON_TYPE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_person_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_person_type`;
CREATE TABLE `b_sale_person_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '150',
  `ACTIVE` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IXS_PERSON_TYPE_LID` (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_person_type_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_person_type_site`;
CREATE TABLE `b_sale_person_type_site` (
  `PERSON_TYPE_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`PERSON_TYPE_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_product2product
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_product2product`;
CREATE TABLE `b_sale_product2product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) NOT NULL,
  `PARENT_PRODUCT_ID` int(11) NOT NULL,
  `CNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IXS_PRODUCT2PRODUCT_PRODUCT_ID` (`PRODUCT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_recurring
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_recurring`;
CREATE TABLE `b_sale_recurring` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODULE` varchar(100) DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `PRODUCT_NAME` varchar(255) DEFAULT NULL,
  `PRODUCT_URL` varchar(255) DEFAULT NULL,
  `PRODUCT_PRICE_ID` int(11) DEFAULT NULL,
  `PRICE_TYPE` char(1) NOT NULL DEFAULT 'R',
  `RECUR_SCHEME_TYPE` char(1) NOT NULL DEFAULT 'M',
  `RECUR_SCHEME_LENGTH` int(11) NOT NULL DEFAULT '0',
  `WITHOUT_ORDER` char(1) NOT NULL DEFAULT 'N',
  `PRICE` decimal(10,0) NOT NULL DEFAULT '0',
  `CURRENCY` char(3) DEFAULT NULL,
  `CANCELED` char(1) NOT NULL DEFAULT 'N',
  `DATE_CANCELED` datetime DEFAULT NULL,
  `PRIOR_DATE` datetime DEFAULT NULL,
  `NEXT_DATE` datetime NOT NULL,
  `CALLBACK_FUNC` varchar(100) DEFAULT NULL,
  `PRODUCT_PROVIDER_CLASS` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CANCELED_REASON` varchar(255) DEFAULT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `REMAINING_ATTEMPTS` int(11) NOT NULL DEFAULT '0',
  `SUCCESS_PAYMENT` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IX_S_R_USER_ID` (`USER_ID`),
  KEY `IX_S_R_NEXT_DATE` (`NEXT_DATE`,`CANCELED`,`REMAINING_ATTEMPTS`),
  KEY `IX_S_R_PRODUCT_ID` (`MODULE`,`PRODUCT_ID`,`PRODUCT_PRICE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_site2group
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_site2group`;
CREATE TABLE `b_sale_site2group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_sale_site2group` (`GROUP_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_status
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_status`;
CREATE TABLE `b_sale_status` (
  `ID` char(1) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_sale_status` VALUES
('N', 100),
('F', 200);
-- -----------------------------------
-- Dumping table b_sale_status2group
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_status2group`;
CREATE TABLE `b_sale_status2group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `STATUS_ID` char(1) NOT NULL,
  `PERM_VIEW` char(1) NOT NULL DEFAULT 'N',
  `PERM_CANCEL` char(1) NOT NULL DEFAULT 'N',
  `PERM_MARK` char(1) NOT NULL DEFAULT 'N',
  `PERM_DELIVERY` char(1) NOT NULL DEFAULT 'N',
  `PERM_DEDUCTION` char(1) NOT NULL DEFAULT 'N',
  `PERM_PAYMENT` char(1) NOT NULL DEFAULT 'N',
  `PERM_STATUS` char(1) NOT NULL DEFAULT 'N',
  `PERM_UPDATE` char(1) NOT NULL DEFAULT 'N',
  `PERM_DELETE` char(1) NOT NULL DEFAULT 'N',
  `PERM_STATUS_FROM` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_sale_s2g_ix1` (`GROUP_ID`,`STATUS_ID`),
  KEY `ix_sale_s2g_1` (`STATUS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_status_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_status_lang`;
CREATE TABLE `b_sale_status_lang` (
  `STATUS_ID` char(1) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`STATUS_ID`,`LID`),
  UNIQUE KEY `ixs_status_lang_status_id` (`STATUS_ID`,`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_sale_status_lang` VALUES
('N', 'ru', 'Принят', 'Заказ принят, но пока не обрабатывается (например, заказ только что создан или ожидается оплата заказа)'),
('N', 'en', 'Accepted', 'Order has been accepted but is not being processed as yet (for example: order may have just been created, or awaiting payment)'),
('F', 'ru', 'Выполнен', 'Заказ доставлен и оплачен'),
('F', 'en', 'Completed', 'Order has been delivered and paid');
-- -----------------------------------
-- Dumping table b_sale_store_barcode
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_store_barcode`;
CREATE TABLE `b_sale_store_barcode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BASKET_ID` int(11) NOT NULL,
  `BARCODE` varchar(100) DEFAULT NULL,
  `STORE_ID` int(11) NOT NULL,
  `QUANTITY` double NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_MODIFY` datetime DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_tax
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_tax`;
CREATE TABLE `b_sale_tax` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) NOT NULL,
  `NAME` varchar(250) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `itax_lid` (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_tax2location
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_tax2location`;
CREATE TABLE `b_sale_tax2location` (
  `TAX_RATE_ID` int(11) NOT NULL,
  `LOCATION_CODE` varchar(100) NOT NULL,
  `LOCATION_TYPE` char(1) NOT NULL DEFAULT 'L',
  PRIMARY KEY (`TAX_RATE_ID`,`LOCATION_CODE`,`LOCATION_TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_tax_exempt2group
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_tax_exempt2group`;
CREATE TABLE `b_sale_tax_exempt2group` (
  `GROUP_ID` int(11) NOT NULL,
  `TAX_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TAX_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_tax_rate
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_tax_rate`;
CREATE TABLE `b_sale_tax_rate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TAX_ID` int(11) NOT NULL,
  `PERSON_TYPE_ID` int(11) DEFAULT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `CURRENCY` char(3) DEFAULT NULL,
  `IS_PERCENT` char(1) NOT NULL DEFAULT 'Y',
  `IS_IN_PRICE` char(1) NOT NULL DEFAULT 'N',
  `APPLY_ORDER` int(11) NOT NULL DEFAULT '100',
  `TIMESTAMP_X` datetime NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `itax_pers_type` (`PERSON_TYPE_ID`),
  KEY `itax_lid` (`TAX_ID`),
  KEY `itax_inprice` (`IS_IN_PRICE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_trading_platform
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_trading_platform`;
CREATE TABLE `b_sale_trading_platform` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(20) NOT NULL,
  `ACTIVE` char(1) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SETTINGS` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_CODE` (`CODE`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

INSERT INTO `b_sale_trading_platform` VALUES
(1, 'ymarket', 'N', 'Покупки на Яндекс-Маркете', 'Интеграция магазина с программой Яндекса \"Покупка на Маркете\"', '');
-- -----------------------------------
-- Dumping table b_sale_user_account
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_user_account`;
CREATE TABLE `b_sale_user_account` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CURRENT_BUDGET` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `CURRENCY` char(3) NOT NULL,
  `LOCKED` char(1) NOT NULL DEFAULT 'N',
  `DATE_LOCKED` datetime DEFAULT NULL,
  `NOTES` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_S_U_USER_ID` (`USER_ID`,`CURRENCY`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_user_cards
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_user_cards`;
CREATE TABLE `b_sale_user_cards` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '100',
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PAY_SYSTEM_ACTION_ID` int(11) NOT NULL,
  `CURRENCY` char(3) DEFAULT NULL,
  `CARD_TYPE` varchar(20) NOT NULL,
  `CARD_NUM` text NOT NULL,
  `CARD_CODE` varchar(5) DEFAULT NULL,
  `CARD_EXP_MONTH` int(11) NOT NULL,
  `CARD_EXP_YEAR` int(11) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SUM_MIN` decimal(18,4) DEFAULT NULL,
  `SUM_MAX` decimal(18,4) DEFAULT NULL,
  `SUM_CURRENCY` char(3) DEFAULT NULL,
  `LAST_STATUS` char(1) DEFAULT NULL,
  `LAST_STATUS_CODE` varchar(5) DEFAULT NULL,
  `LAST_STATUS_DESCRIPTION` varchar(250) DEFAULT NULL,
  `LAST_STATUS_MESSAGE` varchar(255) DEFAULT NULL,
  `LAST_SUM` decimal(18,4) DEFAULT NULL,
  `LAST_CURRENCY` char(3) DEFAULT NULL,
  `LAST_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_S_U_C_USER_ID` (`USER_ID`,`ACTIVE`,`CURRENCY`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_user_props
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_user_props`;
CREATE TABLE `b_sale_user_props` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `PERSON_TYPE_ID` int(11) NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `XML_ID` varchar(50) DEFAULT NULL,
  `VERSION_1C` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IXS_USER_PROPS_USER_ID` (`USER_ID`),
  KEY `IXS_USER_PROPS_PERSON_TYPE_ID` (`PERSON_TYPE_ID`),
  KEY `IXS_USER_PROPS_XML_ID` (`XML_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_user_props_value
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_user_props_value`;
CREATE TABLE `b_sale_user_props_value` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_PROPS_ID` int(11) NOT NULL,
  `ORDER_PROPS_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IXS_USER_PROPS_VALUE_USER_PROPS_ID` (`USER_PROPS_ID`),
  KEY `IXS_USER_PROPS_VALUE_ORDER_PROPS_ID` (`ORDER_PROPS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_user_transact
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_user_transact`;
CREATE TABLE `b_sale_user_transact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TRANSACT_DATE` datetime NOT NULL,
  `AMOUNT` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `CURRENCY` char(3) NOT NULL,
  `DEBIT` char(1) NOT NULL DEFAULT 'N',
  `ORDER_ID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `NOTES` text,
  `EMPLOYEE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_S_U_T_USER_ID` (`USER_ID`),
  KEY `IX_S_U_T_USER_ID_CURRENCY` (`USER_ID`,`CURRENCY`),
  KEY `IX_S_U_T_ORDER_ID` (`ORDER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sale_viewed_product
-- -----------------------------------
DROP TABLE IF EXISTS `b_sale_viewed_product`;
CREATE TABLE `b_sale_viewed_product` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `FUSER_ID` int(11) unsigned NOT NULL DEFAULT '0',
  `DATE_VISIT` datetime NOT NULL,
  `PRODUCT_ID` int(11) unsigned NOT NULL DEFAULT '0',
  `MODULE` varchar(100) DEFAULT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DETAIL_PAGE_URL` varchar(255) DEFAULT NULL,
  `CURRENCY` char(3) DEFAULT NULL,
  `PRICE` decimal(18,2) NOT NULL DEFAULT '0.00',
  `NOTES` varchar(255) DEFAULT NULL,
  `PREVIEW_PICTURE` int(11) DEFAULT NULL,
  `DETAIL_PICTURE` int(11) DEFAULT NULL,
  `CALLBACK_FUNC` varchar(45) DEFAULT NULL,
  `PRODUCT_PROVIDER_CLASS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ixLID` (`FUSER_ID`,`LID`),
  KEY `ixPRODUCT_ID` (`PRODUCT_ID`),
  KEY `ixDATE_VISIT` (`DATE_VISIT`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_search_content
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content`;
CREATE TABLE `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `ITEM_ID` varchar(255) NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) DEFAULT NULL,
  `ENTITY_ID` varchar(255) DEFAULT NULL,
  `URL` text,
  `TITLE` text,
  `BODY` longtext,
  `TAGS` text,
  `PARAM1` text,
  `PARAM2` text,
  `UPD` varchar(32) DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=cp1251;

INSERT INTO `b_search_content` VALUES
(1, '2015-04-14 21:30:07', 'main', 's1|/about/index.php', 0, NULL, NULL, NULL, '/about/index.php', 'О компании', 'Контакты\rИстория развития \rПортфолио', '', '', '', NULL, NULL, NULL),
(2, '2015-04-14 22:49:13', 'main', 's1|/news/index.php', 0, NULL, NULL, NULL, '/news/index.php', 'Новости', '', '', '', '', NULL, NULL, NULL),
(3, '2015-04-21 07:58:08', 'main', 's1|/goods/index.php', 0, NULL, NULL, NULL, '/goods/index.php', 'Товары', '', '', '', '', NULL, NULL, NULL),
(4, '2015-04-13 22:19:15', 'main', 's1|/services/index.php', 0, NULL, NULL, NULL, '/services/index.php', 'Title', 'Text here....', '', '', '', NULL, NULL, NULL),
(5, '2015-04-13 22:19:47', 'main', 's1|/forum/index.php', 0, NULL, NULL, NULL, '/forum/index.php', 'Title', 'Text here....', '', '', '', NULL, NULL, NULL),
(6, '2015-04-14 21:31:09', 'main', 's1|/about/contacts/index.php', 0, NULL, NULL, NULL, '/about/contacts/index.php', 'Контакты', 'Контакты', '', '', '', NULL, NULL, NULL),
(7, '2015-04-14 21:30:38', 'main', 's1|/about/history/index.php', 0, NULL, NULL, NULL, '/about/history/index.php', 'История развития', 'История развития', '', '', '', NULL, NULL, NULL),
(8, '2015-04-14 21:29:52', 'main', 's1|/about/portfolio/index.php', 0, NULL, NULL, NULL, '/about/portfolio/index.php', 'Портфолио', 'Портфолио', '', '', '', NULL, NULL, NULL),
(9, '2015-04-01 00:00:00', 'iblock', '1', 0, NULL, NULL, NULL, '=ID=1&EXTERNAL_ID=1&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'TASKalfa1800', 'анонс новости\r\nДетальный текст при необходимости.', '', 'news', '1', NULL, '2015-04-01 00:00:00', NULL),
(10, '2015-04-10 21:43:00', 'iblock', '2', 0, NULL, NULL, NULL, '=ID=2&EXTERNAL_ID=2&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'TASKalfaa1800', 'абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра абракадабра', '', 'news', '1', NULL, '2015-04-10 21:43:00', NULL),
(11, '2015-04-14 21:43:01', 'iblock', '3', 0, NULL, NULL, NULL, '=ID=3&EXTERNAL_ID=3&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'ТАСКальфа', 'много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста много-много текста', '', 'news', '1', NULL, NULL, NULL),
(12, '2015-04-23 08:04:58', 'main', 's1|/test.php', 0, NULL, NULL, NULL, '/test.php', 'Partners', '', '', '', '', NULL, NULL, NULL),
(13, '2015-04-21 07:10:42', 'iblock', '4', 0, NULL, NULL, NULL, '=ID=4&EXTERNAL_ID=4&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Canon', '', '', 'catalog', '2', NULL, NULL, NULL),
(14, '2015-04-21 07:46:17', 'iblock', '5', 0, NULL, NULL, NULL, '=ID=5&EXTERNAL_ID=5&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Gigabyte', '', '', 'catalog', '2', NULL, NULL, NULL),
(15, '2015-04-21 07:46:54', 'iblock', '6', 0, NULL, NULL, NULL, '=ID=6&EXTERNAL_ID=6&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Asus', '', '', 'catalog', '2', NULL, NULL, NULL),
(16, '2015-04-21 07:47:20', 'iblock', '7', 0, NULL, NULL, NULL, '=ID=7&EXTERNAL_ID=7&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'NEC', '', '', 'catalog', '2', NULL, NULL, NULL),
(17, '2015-04-23 07:56:18', 'iblock', '8', 0, NULL, NULL, NULL, '=ID=8&EXTERNAL_ID=8&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=3&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Диагностика', 'Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание Описание', '', 'catalog', '3', NULL, NULL, NULL),
(18, '2015-04-23 07:55:56', 'iblock', '9', 0, NULL, NULL, NULL, '=ID=9&EXTERNAL_ID=9&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=3&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремонт', '', '', 'catalog', '3', NULL, NULL, NULL),
(19, '2015-05-13 13:19:31', 'blog', 'U1', 0, NULL, NULL, NULL, NULL, 'Антон Пирожков', '', NULL, 'USER', '1', NULL, NULL, NULL),
(20, '2015-08-07 12:43:39', 'main', 's1|/status/index.php', 0, NULL, NULL, NULL, '/status/index.php', 'Узнать о готовности', 'Для получения информации о состоянии вашего оборудования\rзаполните все поля формы:\rПоправляю!\rНомер документа:\rКириллица (регистр, пробелы и пунктуация не важны)\rДата:\rдд.мм.гггг\rФамилия или название организации:\rКак напечатано в вашем документе\r(регистр, пробелы и пунктуация не важны)\rНомер телефона или другая контактная информация:\rКак напечатано в вашем документе\r(регистр, пробелы и пунктуация не важны)\rВведите код с картинки:\rВведено неверно\nИнформация по состоянию на: .. :\nДата\rНомер\rИдентификация\rСтатус Готовности\rСумма\rПредварительная стоимость = . Окончательноую стоимость уточняйте у менеджера.\rМастер\rФИО Клиента\rТел. Клиента\rИнфо', '', '', '', NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_search_content_freq
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_freq`;
CREATE TABLE `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_search_content_param
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_param`;
CREATE TABLE `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) NOT NULL,
  `PARAM_VALUE` varchar(100) NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_search_content_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_right`;
CREATE TABLE `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_search_content_right` VALUES
(1, 'G2'),
(2, 'G2'),
(3, 'G2'),
(4, 'G2'),
(5, 'G2'),
(6, 'G2'),
(7, 'G2'),
(8, 'G2'),
(9, 'G1'),
(9, 'G2'),
(10, 'G1'),
(10, 'G2'),
(11, 'G1'),
(11, 'G2'),
(12, 'G2'),
(13, 'G1'),
(13, 'G2'),
(14, 'G1'),
(14, 'G2'),
(15, 'G1'),
(15, 'G2'),
(16, 'G1'),
(16, 'G2'),
(17, 'G1'),
(17, 'G2'),
(18, 'G1'),
(18, 'G2'),
(19, 'G2'),
(20, 'G2');
-- -----------------------------------
-- Dumping table b_search_content_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_site`;
CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `URL` text,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_search_content_site` VALUES
(1, 's1', ''),
(2, 's1', ''),
(3, 's1', ''),
(4, 's1', ''),
(5, 's1', ''),
(6, 's1', ''),
(7, 's1', ''),
(8, 's1', ''),
(9, 's1', ''),
(10, 's1', ''),
(11, 's1', ''),
(12, 's1', ''),
(13, 's1', ''),
(14, 's1', ''),
(15, 's1', ''),
(16, 's1', ''),
(17, 's1', ''),
(18, 's1', ''),
(19, 's1', '/users/1.php'),
(20, 's1', '');
-- -----------------------------------
-- Dumping table b_search_content_stem
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_stem`;
CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 DELAY_KEY_WRITE=1;

INSERT INTO `b_search_content_stem` VALUES
(4, 'ru', 1, 0.2314, 1),
(5, 'ru', 1, 0.2314, 1),
(4, 'ru', 2, 0.2314, 2),
(5, 'ru', 2, 0.2314, 2),
(4, 'ru', 3, 0.2314, 3),
(5, 'ru', 3, 0.2314, 3),
(1, 'ru', 4, 0.2314, 3),
(6, 'ru', 4, 0.3667, 1.5),
(1, 'ru', 5, 0.2314, 4),
(7, 'ru', 5, 0.3667, 2),
(1, 'ru', 6, 0.2314, 5),
(7, 'ru', 6, 0.3667, 3),
(1, 'ru', 7, 0.2314, 6),
(8, 'ru', 7, 0.3667, 1.5),
(1, 'ru', 8, 0.2314, 2),
(2, 'ru', 9, 0.2314, 1),
(9, 'ru', 9, 0.2314, 3),
(9, 'ru', 10, 0.2314, 1),
(9, 'ru', 11, 0.2314, 2),
(9, 'ru', 12, 0.2314, 4),
(9, 'ru', 13, 0.2314, 5),
(11, 'ru', 13, 0.8722, 111),
(9, 'ru', 14, 0.2314, 7),
(10, 'ru', 15, 0.1832, 1),
(10, 'ru', 16, 1, 23),
(11, 'ru', 17, 0.1286, 1),
(11, 'ru', 18, 0.8722, 110),
(12, 'ru', 19, 0.2314, 1),
(13, 'ru', 20, 0.2314, 1),
(14, 'ru', 21, 0.2314, 1),
(15, 'ru', 22, 0.2314, 1),
(16, 'ru', 23, 0.2314, 1),
(3, 'ru', 24, 0.2314, 1),
(17, 'ru', 25, 0.1464, 1),
(18, 'ru', 26, 0.2314, 1),
(17, 'ru', 27, 1, 58),
(19, 'ru', 28, 0.2314, 1),
(19, 'ru', 29, 0.2314, 2),
(19, 'ru', 30, 0.2314, 2),
(20, 'ru', 31, 0.1654, 1),
(20, 'ru', 32, 0.2622, 51.5),
(20, 'ru', 33, 0.1654, 5),
(20, 'ru', 34, 0.3309, 50.6667),
(20, 'ru', 35, 0.2622, 46),
(20, 'ru', 36, 0.1654, 10),
(20, 'ru', 37, 0.1654, 11),
(20, 'ru', 38, 0.1654, 13),
(20, 'ru', 39, 0.1654, 14),
(20, 'ru', 40, 0.1654, 15),
(20, 'ru', 41, 0.3309, 59),
(20, 'ru', 42, 0.3309, 47.6667),
(20, 'ru', 43, 0.1654, 23),
(20, 'ru', 44, 0.3309, 49),
(20, 'ru', 45, 0.3309, 50),
(20, 'ru', 46, 0.3309, 52),
(20, 'ru', 47, 0.3309, 54),
(20, 'ru', 48, 0.2622, 63),
(20, 'ru', 49, 0.1654, 31),
(20, 'ru', 50, 0.1654, 37),
(20, 'ru', 51, 0.1654, 43),
(20, 'ru', 52, 0.1654, 44),
(20, 'ru', 53, 0.1654, 46),
(20, 'ru', 54, 0.1654, 47),
(20, 'ru', 55, 0.2622, 57.5),
(20, 'ru', 56, 0.1654, 60),
(20, 'ru', 57, 0.1654, 62),
(20, 'ru', 58, 0.1654, 63),
(20, 'ru', 59, 0.2622, 78),
(20, 'ru', 60, 0.1654, 77),
(20, 'ru', 61, 0.1654, 79),
(20, 'ru', 62, 0.1654, 81),
(20, 'ru', 63, 0.1654, 98),
(20, 'ru', 64, 0.1654, 99),
(20, 'ru', 65, 0.1654, 101),
(20, 'ru', 66, 0.1654, 102),
(20, 'ru', 67, 0.2622, 106.5),
(20, 'ru', 68, 0.1654, 109),
(20, 'ru', 69, 0.1654, 111),
(20, 'ru', 70, 0.1654, 113),
(20, 'ru', 71, 0.1654, 119),
(20, 'ru', 72, 0.1654, 120),
(20, 'ru', 73, 0.2622, 124.5),
(20, 'ru', 74, 0.1654, 122),
(20, 'ru', 75, 0.1654, 129);
-- -----------------------------------
-- Dumping table b_search_content_text
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_text`;
CREATE TABLE `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) NOT NULL,
  `SEARCHABLE_CONTENT` longtext,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_search_content_text` VALUES
(1, '568c06fe4bff9361e45d9b852425e28d', 'О КОМПАНИИ\r\nКОНТАКТЫ\rИСТОРИЯ РАЗВИТИЯ \rПОРТФОЛИО\r\n'),
(2, '34c41ec3032a8bc7a727024d3aa6f1f0', 'НОВОСТИ\r\n\r\n'),
(3, '0cc0ce3b1940442c794215625d72f6ec', 'ТОВАРЫ\r\n\r\n'),
(4, '9ed747910bcc6af2d6a02221bb1cabc7', 'TITLE\r\nTEXT HERE....\r\n'),
(5, '9ed747910bcc6af2d6a02221bb1cabc7', 'TITLE\r\nTEXT HERE....\r\n'),
(6, '8c55ade5a963bcecbae1604f4f01bf73', 'КОНТАКТЫ\r\nКОНТАКТЫ\r\n'),
(7, '045f0e0f2e10455a16e65e6ba95875e6', 'ИСТОРИЯ РАЗВИТИЯ\r\nИСТОРИЯ РАЗВИТИЯ\r\n'),
(8, '1cb31ab761053653b5adf134f193edd0', 'ПОРТФОЛИО\r\nПОРТФОЛИО\r\n'),
(9, 'b8c471ebf43f480ca0a0e8ccdaa65a4d', 'TASKALFA1800\r\nАНОНС НОВОСТИ\r\nДЕТАЛЬНЫЙ ТЕКСТ ПРИ НЕОБХОДИМОСТИ.\r\n'),
(10, 'f2a62aec7a7c59bd7ae61071346478f9', 'TASKALFAA1800\r\nАБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА АБРАКАДАБРА\r\n'),
(11, '0da589c7108a1d98c546b4d4b4161d58', 'ТАСКАЛЬФА\r\nМНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА МНОГО-МНОГО ТЕКСТА\r\n'),
(12, '2c15c7a337ddd84857effe5cbffbe78e', 'PARTNERS\r\n\r\n'),
(13, 'f80439cc77df8d87186bac2e183b8515', 'CANON\r\n\r\n'),
(14, 'fb133687749d7ebf1d8269f94a588356', 'GIGABYTE\r\n\r\n'),
(15, '24272532c6652af9abb55530780ded14', 'ASUS\r\n\r\n'),
(16, '583ce22dd42bd980821fdc968cf48aa3', 'NEC\r\n\r\n'),
(17, '020bcc5a13320b32c579416cba6eae1e', 'ДИАГНОСТИКА\r\nОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ ОПИСАНИЕ\r\n'),
(18, '1809e49aea04d651305864e0cd8a06e2', 'РЕМОНТ\r\n\r\n'),
(19, '2a0ad777fb157063135680da801ee198', 'АНТОН ПИРОЖКОВ\r\n\r\n'),
(20, '6ac3947312aee1aa6011aeb9632ad397', 'УЗНАТЬ О ГОТОВНОСТИ\r\nДЛЯ ПОЛУЧЕНИЯ ИНФОРМАЦИИ О СОСТОЯНИИ ВАШЕГО ОБОРУДОВАНИЯ\rЗАПОЛНИТЕ ВСЕ ПОЛЯ ФОРМЫ:\rПОПРАВЛЯЮ!\rНОМЕР ДОКУМЕНТА:\rКИРИЛЛИЦА (РЕГИСТР, ПРОБЕЛЫ И ПУНКТУАЦИЯ НЕ ВАЖНЫ)\rДАТА:\rДД.ММ.ГГГГ\rФАМИЛИЯ ИЛИ НАЗВАНИЕ ОРГАНИЗАЦИИ:\rКАК НАПЕЧАТАНО В ВАШЕМ ДОКУМЕНТЕ\r(РЕГИСТР, ПРОБЕЛЫ И ПУНКТУАЦИЯ НЕ ВАЖНЫ)\rНОМЕР ТЕЛЕФОНА ИЛИ ДРУГАЯ КОНТАКТНАЯ ИНФОРМАЦИЯ:\rКАК НАПЕЧАТАНО В ВАШЕМ ДОКУМЕНТЕ\r(РЕГИСТР, ПРОБЕЛЫ И ПУНКТУАЦИЯ НЕ ВАЖНЫ)\rВВЕДИТЕ КОД С КАРТИНКИ:\rВВЕДЕНО НЕВЕРНО\nИНФОРМАЦИЯ ПО СОСТОЯНИЮ НА: .. :\nДАТА\rНОМЕР\rИДЕНТИФИКАЦИЯ\rСТАТУС ГОТОВНОСТИ\rСУММА\rПРЕДВАРИТЕЛЬНАЯ СТОИМОСТЬ = . ОКОНЧАТЕЛЬНОУЮ СТОИМОСТЬ УТОЧНЯЙТЕ У МЕНЕДЖЕРА.\rМАСТЕР\rФИО КЛИЕНТА\rТЕЛ. КЛИЕНТА\rИНФО\r\n');
-- -----------------------------------
-- Dumping table b_search_content_title
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_title`;
CREATE TABLE `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 DELAY_KEY_WRITE=1;

INSERT INTO `b_search_content_title` VALUES
(15, 's1', 0, 'ASUS'),
(13, 's1', 0, 'CANON'),
(14, 's1', 0, 'GIGABYTE'),
(16, 's1', 0, 'NEC'),
(12, 's1', 0, 'PARTNERS'),
(9, 's1', 0, 'TASKALFA1800'),
(10, 's1', 0, 'TASKALFAA1800'),
(4, 's1', 0, 'TITLE'),
(5, 's1', 0, 'TITLE'),
(19, 's1', 0, 'АНТОН'),
(20, 's1', 9, 'ГОТОВНОСТИ'),
(17, 's1', 0, 'ДИАГНОСТИКА'),
(7, 's1', 0, 'ИСТОРИЯ'),
(1, 's1', 2, 'КОМПАНИИ'),
(6, 's1', 0, 'КОНТАКТЫ'),
(2, 's1', 0, 'НОВОСТИ'),
(1, 's1', 0, 'О'),
(20, 's1', 7, 'О'),
(19, 's1', 6, 'ПИРОЖКОВ'),
(8, 's1', 0, 'ПОРТФОЛИО'),
(7, 's1', 8, 'РАЗВИТИЯ'),
(18, 's1', 0, 'РЕМОНТ'),
(11, 's1', 0, 'ТАСКАЛЬФА'),
(3, 's1', 0, 'ТОВАРЫ'),
(20, 's1', 0, 'УЗНАТЬ');
-- -----------------------------------
-- Dumping table b_search_custom_rank
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_custom_rank`;
CREATE TABLE `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) NOT NULL,
  `MODULE_ID` varchar(200) NOT NULL,
  `PARAM1` text,
  `PARAM2` text,
  `ITEM_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_search_phrase
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_phrase`;
CREATE TABLE `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) NOT NULL,
  `PHRASE` varchar(250) DEFAULT NULL,
  `TAGS` varchar(250) DEFAULT NULL,
  `URL_TO` text,
  `URL_TO_404` char(1) DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_search_stem
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_stem`;
CREATE TABLE `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=cp1251;

INSERT INTO `b_search_stem` VALUES
(1, 'TITL'),
(2, 'TEXT'),
(3, 'HERE'),
(4, 'КОНТАКТ'),
(5, 'ИСТОР'),
(6, 'РАЗВИТ'),
(7, 'ПОРТФОЛ'),
(8, 'КОМПАН'),
(9, 'НОВОСТ'),
(10, 'TASKALFA1800'),
(11, 'АНОНС'),
(12, 'ДЕТАЛЬН'),
(13, 'ТЕКСТ'),
(14, 'НЕОБХОДИМ'),
(15, 'TASKALFAA1800'),
(16, 'АБРАКАДАБР'),
(17, 'ТАСКАЛЬФ'),
(18, 'МНОГО-МН'),
(19, 'PARTNER'),
(20, 'CANON'),
(21, 'GIGABYT'),
(22, 'ASUS'),
(23, 'NEC'),
(24, 'ТОВАР'),
(25, 'ДИАГНОСТИК'),
(26, 'РЕМОНТ'),
(27, 'ОПИСАН'),
(28, 'АНТОН'),
(29, 'ПИРОЖКОВ'),
(30, 'ПИРОЖК'),
(31, 'УЗНА'),
(32, 'ГОТОВН'),
(33, 'ПОЛУЧЕН'),
(34, 'ИНФОРМАЦ'),
(35, 'СОСТОЯН'),
(36, 'ОБОРУДОВАН'),
(37, 'ЗАПОЛН'),
(38, 'ПОЛ'),
(39, 'ФОРМ'),
(40, 'ПОПРАВЛЯ'),
(41, 'НОМЕР'),
(42, 'ДОКУМЕНТ'),
(43, 'КИРИЛЛИЦ'),
(44, 'РЕГИСТР'),
(45, 'ПРОБЕЛ'),
(46, 'ПУНКТУАЦ'),
(47, 'ВАЖН'),
(48, 'ДАТ'),
(49, 'ДД'),
(50, 'ММ'),
(51, 'ГГГГ'),
(52, 'ФАМИЛ'),
(53, 'НАЗВАН'),
(54, 'ОРГАНИЗАЦ'),
(55, 'НАПЕЧАТА'),
(56, 'ТЕЛЕФОН'),
(57, 'ДРУГ'),
(58, 'КОНТАКТН'),
(59, 'ВВЕД'),
(60, 'КОД'),
(61, 'КАРТИНК'),
(62, 'НЕВЕРН'),
(63, 'ИДЕНТИФИКАЦ'),
(64, 'СТАТУС'),
(65, 'СУММ'),
(66, 'ПРЕДВАРИТЕЛЬН'),
(67, 'СТОИМОСТ'),
(68, 'ОКОНЧАТЕЛЬНО'),
(69, 'УТОЧНЯ'),
(70, 'МЕНЕДЖЕР'),
(71, 'МАСТЕР'),
(72, 'ФИ'),
(73, 'КЛИЕНТ'),
(74, 'ТЕЛ'),
(75, 'ИНФ');
-- -----------------------------------
-- Dumping table b_search_suggest
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_suggest`;
CREATE TABLE `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `FILTER_MD5` varchar(32) NOT NULL,
  `PHRASE` varchar(250) NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_search_tags
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_tags`;
CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `NAME` varchar(255) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 DELAY_KEY_WRITE=1;

-- -----------------------------------
-- Dumping table b_search_user_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_user_right`;
CREATE TABLE `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sec_filter_mask
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_filter_mask`;
CREATE TABLE `b_sec_filter_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) DEFAULT NULL,
  `FILTER_MASK` varchar(250) DEFAULT NULL,
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sec_frame_mask
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_frame_mask`;
CREATE TABLE `b_sec_frame_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) DEFAULT NULL,
  `FRAME_MASK` varchar(250) DEFAULT NULL,
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sec_iprule
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_iprule`;
CREATE TABLE `b_sec_iprule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_TYPE` char(1) NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int(11) DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int(11) DEFAULT NULL,
  `NAME` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sec_iprule_excl_ip
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_iprule_excl_ip`;
CREATE TABLE `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sec_iprule_excl_mask
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_iprule_excl_mask`;
CREATE TABLE `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) NOT NULL DEFAULT '',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sec_iprule_incl_ip
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_iprule_incl_ip`;
CREATE TABLE `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sec_iprule_incl_mask
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_iprule_incl_mask`;
CREATE TABLE `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) NOT NULL DEFAULT '',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sec_recovery_codes
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_recovery_codes`;
CREATE TABLE `b_sec_recovery_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(255) NOT NULL,
  `USED` varchar(1) NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sec_redirect_url
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_redirect_url`;
CREATE TABLE `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `URL` varchar(250) NOT NULL,
  `PARAMETER_NAME` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_sec_redirect_url` VALUES
('Y', 10, '/bitrix/redirect.php', 'goto'),
('Y', 20, '/bitrix/rk.php', 'goto'),
('Y', 30, '/bitrix/click.php', 'goto');
-- -----------------------------------
-- Dumping table b_sec_session
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_session`;
CREATE TABLE `b_sec_session` (
  `SESSION_ID` varchar(250) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SESSION_DATA` longtext,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_b_sec_session_time` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sec_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_user`;
CREATE TABLE `b_sec_user` (
  `USER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) DEFAULT NULL,
  `TYPE` varchar(16) NOT NULL,
  `PARAMS` text,
  `ATTEMPTS` int(18) DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sec_virus
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_virus`;
CREATE TABLE `b_sec_virus` (
  `ID` varchar(32) NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `SENT` char(1) NOT NULL DEFAULT 'N',
  `INFO` longtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sec_white_list
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_white_list`;
CREATE TABLE `b_sec_white_list` (
  `ID` int(11) NOT NULL,
  `WHITE_SUBSTR` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_security_sitecheck
-- -----------------------------------
DROP TABLE IF EXISTS `b_security_sitecheck`;
CREATE TABLE `b_security_sitecheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251;

INSERT INTO `b_security_sitecheck` VALUES
(1, '2015-07-13 10:04:37', 'a:12:{i:0;a:5:{s:5:\"title\";s:23:\"Найдены служебные файлы\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:152:\"Некоторые служебные файлы не были удалены после отладки/установки/переноса проекта, они могут использоваться злоумышленниками для компрометации ресурса.\";s:14:\"recommendation\";s:77:\"Необходимо удалить все найденные файлы или корректно ограничить к ним доступ.\";s:15:\"additional_info\";s:5619:\"Адрес: <a href=\"http://harmony.bosjack.in.ua/bitrix/log.txt?rnd=0.554312193642\" target=\"_blank\">http://harmony.bosjack.in.ua/bitrix/log.txt?rnd=0.554312193642</a><br>Запрос/Ответ: <pre>HEAD /bitrix/log.txt?rnd=0.554312193642 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:16 GMT\nContent-Type: text/html; charset=UTF-8\nConnection: keep-alive\n\n<pre>Адрес: <a href=\"http://harmony.bosjack.in.ua/bitrix/error.log?rnd=0.549948510047\" target=\"_blank\">http://harmony.bosjack.in.ua/bitrix/error.log?rnd=0.549948510047</a><br>Запрос/Ответ: <pre>HEAD /bitrix/error.log?rnd=0.549948510047 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:16 GMT\nContent-Type: text/html; charset=UTF-8\nConnection: keep-alive\n\n<pre>Адрес: <a href=\"http://harmony.bosjack.in.ua/bitrix/user.log?rnd=0.943641060154\" target=\"_blank\">http://harmony.bosjack.in.ua/bitrix/user.log?rnd=0.943641060154</a><br>Запрос/Ответ: <pre>HEAD /bitrix/user.log?rnd=0.943641060154 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:16 GMT\nContent-Type: text/html; charset=UTF-8\nConnection: keep-alive\n\n<pre>Адрес: <a href=\"http://harmony.bosjack.in.ua/bitrix/debug.log?rnd=0.353872294223\" target=\"_blank\">http://harmony.bosjack.in.ua/bitrix/debug.log?rnd=0.353872294223</a><br>Запрос/Ответ: <pre>HEAD /bitrix/debug.log?rnd=0.353872294223 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:16 GMT\nContent-Type: text/html; charset=UTF-8\nConnection: keep-alive\n\n<pre>Адрес: <a href=\"http://harmony.bosjack.in.ua/bitrix/mysql_debug.sql?rnd=0.154783575347\" target=\"_blank\">http://harmony.bosjack.in.ua/bitrix/mysql_debug.sql?rnd=0.154783575347</a><br>Запрос/Ответ: <pre>HEAD /bitrix/mysql_debug.sql?rnd=0.154783575347 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:16 GMT\nContent-Type: text/html; charset=UTF-8\nConnection: keep-alive\n\n<pre>Адрес: <a href=\"http://harmony.bosjack.in.ua/log.txt?rnd=0.84706996007\" target=\"_blank\">http://harmony.bosjack.in.ua/log.txt?rnd=0.84706996007</a><br>Запрос/Ответ: <pre>HEAD /log.txt?rnd=0.84706996007 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:16 GMT\nContent-Type: text/html; charset=UTF-8\nConnection: keep-alive\n\n<pre>Адрес: <a href=\"http://harmony.bosjack.in.ua/debug.log?rnd=0.536062480299\" target=\"_blank\">http://harmony.bosjack.in.ua/debug.log?rnd=0.536062480299</a><br>Запрос/Ответ: <pre>HEAD /debug.log?rnd=0.536062480299 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:16 GMT\nContent-Type: text/html; charset=UTF-8\nConnection: keep-alive\n\n<pre>Адрес: <a href=\"http://harmony.bosjack.in.ua/error.log?rnd=0.696704959498\" target=\"_blank\">http://harmony.bosjack.in.ua/error.log?rnd=0.696704959498</a><br>Запрос/Ответ: <pre>HEAD /error.log?rnd=0.696704959498 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:16 GMT\nContent-Type: text/html; charset=UTF-8\nConnection: keep-alive\n\n<pre>Адрес: <a href=\"http://harmony.bosjack.in.ua/mysql_debug.sql?rnd=0.952872813131\" target=\"_blank\">http://harmony.bosjack.in.ua/mysql_debug.sql?rnd=0.952872813131</a><br>Запрос/Ответ: <pre>HEAD /mysql_debug.sql?rnd=0.952872813131 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:16 GMT\nContent-Type: text/html; charset=UTF-8\nConnection: keep-alive\n\n<pre>Адрес: <a href=\"http://harmony.bosjack.in.ua/user.log?rnd=0.660629306073\" target=\"_blank\">http://harmony.bosjack.in.ua/user.log?rnd=0.660629306073</a><br>Запрос/Ответ: <pre>HEAD /user.log?rnd=0.660629306073 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:16 GMT\nContent-Type: text/html; charset=UTF-8\nConnection: keep-alive\n\n<pre>Адрес: <a href=\"http://harmony.bosjack.in.ua/.mysql_history?rnd=0.495671950013\" target=\"_blank\">http://harmony.bosjack.in.ua/.mysql_history?rnd=0.495671950013</a><br>Запрос/Ответ: <pre>HEAD /.mysql_history?rnd=0.495671950013 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:16 GMT\nContent-Type: text/html; charset=UTF-8\nConnection: keep-alive\n\n<pre>Адрес: <a href=\"http://harmony.bosjack.in.ua/bitrix/.mysql_history?rnd=0.925995365943\" target=\"_blank\">http://harmony.bosjack.in.ua/bitrix/.mysql_history?rnd=0.925995365943</a><br>Запрос/Ответ: <pre>HEAD /bitrix/.mysql_history?rnd=0.925995365943 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:17 GMT\nContent-Type: text/html; charset=UTF-8\nConnection: keep-alive\n\n<pre>\";}i:1;a:5:{s:5:\"title\";s:67:\"Уровень безопасности административной группы не является повышенным\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:95:\"Пониженный уровень безопасности административной группы может значительно помочь злоумышленнику\";s:14:\"recommendation\";s:53:\"Повысить уровень безопасности административной группы\";s:15:\"additional_info\";s:0:\"\";}i:2;a:5:{s:5:\"title\";s:36:\"Символы пароля к БД в одном регистре\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:77:\"Пароль слишком простой, что повышает риск взлома учетной записи в базе данных\";s:14:\"recommendation\";s:48:\"Использовать различный регистр символов в пароле\";s:15:\"additional_info\";s:0:\"\";}i:3;a:5:{s:5:\"title\";s:55:\"Пароль к БД не содержит спецсимволов(знаков препинания)\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:75:\"Пароль слишком прост, что повышает риск взлома учетной записи в базе данных\";s:14:\"recommendation\";s:30:\"Добавить спецсимволов в пароль\";s:15:\"additional_info\";s:0:\"\";}i:4;a:4:{s:5:\"title\";s:58:\"Статический анализ уязвимостей обнаружил 3 проблемных мест\";s:8:\"critical\";s:5:\"HIGHT\";s:14:\"recommendation\";s:51:\"Необходимо обратится к разработчику для исправления\";s:6:\"detail\";s:7593:\"<div class=\"checklist-dot-line\"></div><div class=\"checklist-vulnscan-files\"><div class=\"checklist-vulnscan-vulnscan-blocktitle\">Cross-Site Scripting</div><div id=\"/status/index.php\"><div class=\"checklist-vulnscan-vulnblock\"><span class=\"checklist-vulnscan-filename\">Файл: /status/index.php</span><div style=\"visibility: hidden; display:none;\" class=\"checklist-vulnscan-helpbox\" data-help=\"/status/index.php\"><div class=\"checklist-vulnscan-helpbox-description\">Межсайтовый скриптинг (XSS) уязвимость возникает тогда, когда данные, принятые от пользователя, выводятся в браузер без надлежащей фильтрации. Уязвимость может быть использована для изменения вида HTML страниц уязвимого сайта в контексте браузера целевого пользователя, похищения COOKIE данных браузера целевого пользователя, с последующим внедрением в его сессию, под его учетной записью.</div><div class=\"checklist-vulnscan-helpbox-safe-title\">Как защищаться</div><div class=\"checklist-vulnscan-helpbox-safe-description\">Использовать <b>htmlspecialcharsbx</b>. Параметры тегов с динамическими значениями ограничивать двойными кавычками. Принудительно добавлять протокол (http), где это необходимо, для значений параметров тегов, таких как href или src.</div></div><div class=\"checklist-vulnscan-code\"><div class=\"checklist-vulnscan-code-line\"><div style=\"clear:both;\"><span>17:</span>&nbsp;<span style=\"color: #0000BB;\">$arForm</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'date\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">&nbsp;=&nbsp;</span><span style=\"color: #0000BB;\">str_replace</span><span style=\"color: #007700;\">(</span><span style=\"color: #DD0000;;\">&quot;&nbsp;&quot;</span><span style=\"color: #007700;\">,</span><span style=\"color: #DD0000;;\">&quot;&quot;</span><span style=\"color: #007700;\">,</span><span style=\"color: #0000BB;\">$_REQUEST</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'date\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">)</span></div></div></div><div class=\"checklist-vulnscan-dangerous-is-here\"><div style=\"clear:both;\"><span>88:</span>&nbsp;<span style=\"color: #007700;\">echo</span>&nbsp;<span style=\"color: #0000BB;\"><b>$arForm</b></span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'date\'</span><span style=\"color: #007700;\">]</span></div></div><div class=\"checklist-vulnscan-dependecies\"></div></div></div></div><div class=\"checklist-dot-line\"></div><div class=\"checklist-vulnscan-files\"><div class=\"checklist-vulnscan-vulnscan-blocktitle\">Cross-Site Scripting</div><div id=\"/status/index.php\"><div class=\"checklist-vulnscan-vulnblock\"><span class=\"checklist-vulnscan-filename\">Файл: /status/index.php</span><div style=\"visibility: hidden; display:none;\" class=\"checklist-vulnscan-helpbox\" data-help=\"/status/index.php\"><div class=\"checklist-vulnscan-helpbox-description\">Межсайтовый скриптинг (XSS) уязвимость возникает тогда, когда данные, принятые от пользователя, выводятся в браузер без надлежащей фильтрации. Уязвимость может быть использована для изменения вида HTML страниц уязвимого сайта в контексте браузера целевого пользователя, похищения COOKIE данных браузера целевого пользователя, с последующим внедрением в его сессию, под его учетной записью.</div><div class=\"checklist-vulnscan-helpbox-safe-title\">Как защищаться</div><div class=\"checklist-vulnscan-helpbox-safe-description\">Использовать <b>htmlspecialcharsbx</b>. Параметры тегов с динамическими значениями ограничивать двойными кавычками. Принудительно добавлять протокол (http), где это необходимо, для значений параметров тегов, таких как href или src.</div></div><div class=\"checklist-vulnscan-code\"><div class=\"checklist-vulnscan-code-line\"><div style=\"clear:both;\"><span>18:</span>&nbsp;<span style=\"color: #0000BB;\">$arForm</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'number\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">&nbsp;=&nbsp;</span><span style=\"color: #0000BB;\">strtoupper</span><span style=\"color: #007700;\">(</span><span style=\"color: #0000BB;\">str_replace</span><span style=\"color: #007700;\">(</span><span style=\"color: #DD0000;;\">&quot;&nbsp;&quot;</span><span style=\"color: #007700;\">,</span><span style=\"color: #DD0000;;\">&quot;&quot;</span><span style=\"color: #007700;\">,</span><span style=\"color: #0000BB;\">$_REQUEST</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'number\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">)</span><span style=\"color: #007700;\">)</span></div></div></div><div class=\"checklist-vulnscan-dangerous-is-here\"><div style=\"clear:both;\"><span>89:</span>&nbsp;<span style=\"color: #007700;\">echo</span>&nbsp;<span style=\"color: #0000BB;\"><b>$arForm</b></span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'number\'</span><span style=\"color: #007700;\">]</span></div></div><div class=\"checklist-vulnscan-dependecies\"></div></div></div></div><div class=\"checklist-dot-line\"></div><div class=\"checklist-vulnscan-files\"><div class=\"checklist-vulnscan-vulnscan-blocktitle\">Cross-Site Scripting</div><div id=\"/status/index.php\"><div class=\"checklist-vulnscan-vulnblock\"><span class=\"checklist-vulnscan-filename\">Файл: /status/index.php</span><div style=\"visibility: hidden; display:none;\" class=\"checklist-vulnscan-helpbox\" data-help=\"/status/index.php\"><div class=\"checklist-vulnscan-helpbox-description\">Межсайтовый скриптинг (XSS) уязвимость возникает тогда, когда данные, принятые от пользователя, выводятся в браузер без надлежащей фильтрации. Уязвимость может быть использована для изменения вида HTML страниц уязвимого сайта в контексте браузера целевого пользователя, похищения COOKIE данных браузера целевого пользователя, с последующим внедрением в его сессию, под его учетной записью.</div><div class=\"checklist-vulnscan-helpbox-safe-title\">Как защищаться</div><div class=\"checklist-vulnscan-helpbox-safe-description\">Использовать <b>htmlspecialcharsbx</b>. Параметры тегов с динамическими значениями ограничивать двойными кавычками. Принудительно добавлять протокол (http), где это необходимо, для значений параметров тегов, таких как href или src.</div></div><div class=\"checklist-vulnscan-code\"><div class=\"checklist-vulnscan-code-line\"><div style=\"clear:both;\"><span>19:</span>&nbsp;<span style=\"color: #0000BB;\">$arForm</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'fio\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">&nbsp;=&nbsp;</span><span style=\"color: #0000BB;\">strtoupper</span><span style=\"color: #007700;\">(</span><span style=\"color: #0000BB;\">str_replace</span><span style=\"color: #007700;\">(</span><span style=\"color: #DD0000;;\">&quot;&nbsp;&quot;</span><span style=\"color: #007700;\">,</span><span style=\"color: #DD0000;;\">&quot;&quot;</span><span style=\"color: #007700;\">,</span><span style=\"color: #0000BB;\">$_REQUEST</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'fio\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">)</span><span style=\"color: #007700;\">)</span></div></div></div><div class=\"checklist-vulnscan-dangerous-is-here\"><div style=\"clear:both;\"><span>90:</span>&nbsp;<span style=\"color: #007700;\">echo</span>&nbsp;<span style=\"color: #0000BB;\"><b>$arForm</b></span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'fio\'</span><span style=\"color: #007700;\">]</span></div></div><div class=\"checklist-vulnscan-dependecies\"></div></div></div></div>\";}i:5;a:5:{s:5:\"title\";s:57:\"Cookies - не единственное хранилище идентификатора сессии\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:103:\"Хранение идентификатора сессии не только в Cookies может служить источником атак типа Session Hijacking\";s:14:\"recommendation\";s:69:\"Необходимо в настройках php указать:<br>session.use_only_cookies = On\";s:15:\"additional_info\";s:0:\"\";}i:6;a:5:{s:5:\"title\";s:78:\"Предположительно в директории хранения сессий находятся сессии других проектов\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:96:\"Это может позволить читать/изменять сессионные данные, через скрипты других виртуальных серверов\";s:14:\"recommendation\";s:126:\"Сменить директорию хранения либо включить хранение сессий в БД: <a href=\"/bitrix/admin/security_session.php\">Защита сессий</a>\";s:15:\"additional_info\";s:1522:\"Причина: файл сессии не содержит подписи текущего сайта<br>\nФайл: /home/bosjack/.system/tmp/sess_fic0hefk6lhr1uvgo1559t86c3<br>\nПодпись текущего сайта: d569b8750b86c67036e309dbdef75308<br>\nСодержимое файла: <pre>SESS_AUTH|a:1:{s:6:&quot;POLICY&quot;;a:13:{s:15:&quot;SESSION_TIMEOUT&quot;;i:24;s:15:&quot;SESSION_IP_MASK&quot;;s:7:&quot;0.0.0.0&quot;;s:13:&quot;MAX_STORE_NUM&quot;;i:10;s:13:&quot;STORE_IP_MASK&quot;;s:7:&quot;0.0.0.0&quot;;s:13:&quot;STORE_TIMEOUT&quot;;i:525600;s:17:&quot;CHECKWORD_TIMEOUT&quot;;i:525600;s:15:&quot;PASSWORD_LENGTH&quot;;i:6;s:18:&quot;PASSWORD_UPPERCASE&quot;;s:1:&quot;N&quot;;s:18:&quot;PASSWORD_LOWERCASE&quot;;s:1:&quot;N&quot;;s:15:&quot;PASSWORD_DIGITS&quot;;s:1:&quot;N&quot;;s:20:&quot;PASSWORD_PUNCTUATION&quot;;s:1:&quot;N&quot;;s:14:&quot;LOGIN_ATTEMPTS&quot;;i:0;s:21:&quot;PASSWORD_REQUIREMENTS&quot;;s:83:&quot;РџР°СЂРѕР»СЊ РґРѕР»Р¶РµРЅ Р±С‹С‚СЊ РЅРµ РјРµРЅРµРµ 6 СЃРёРјРІРѕР»РѕРІ РґР»РёРЅРѕР№.&quot;;}}SESS_IP|s:13:&quot;91.214.210.28&quot;;SESS_TIME|i:1436738351;BX_SESSION_SIGN|s:32:&quot;f44c6702ae1184d232e883218f0473a8&quot;;SESS_OPERATIONS|a:0:{}referer1|N;referer2|N;referer3|N;SESS_SEARCHER_ID|i:0;SESS_SEARCHER_NAME|N;SESS_SEARCHER_CHECK_ACTIVITY|s:1:&quot;Y&quot;;SESS_SEARCHER_SAVE_STATISTIC|N;SESS_SEARCHER_HIT_KEEP_DAYS|N;SESS_LAST_PROTOCOL|s:7:&quot;http://&quot;;SESS_LAST_URI|s:33:&quot;http://avto.bosjack.in.ua/?finish&quot;;SESS_LAST_HOST|s:18:&quot;avto.bosjack.in.ua&quot;;SESS_LAST_PAGE|s:26:&quot;http://avto.bosjack.in.ua/&quot;;SESS_LAST</pre>\";}i:7;a:5:{s:5:\"title\";s:60:\"Разрешено отображение сайта во фрейме с произвольного домена\";s:8:\"critical\";s:6:\"MIDDLE\";s:6:\"detail\";s:214:\"Запрет отображения фреймов сайта со сторонних доменов способен предотвратить целый класс атак, таких как <a href=\"https://www.owasp.org/index.php/Clickjacking\" target=\"_blank\">Clickjacking</a>, Framesniffing и т.д.\";s:14:\"recommendation\";s:1300:\"Скорее всего, вам будет достаточно разрешения на просмотр сайта в фреймах только на страницах текущего сайта.\nСделать это достаточно просто, достаточно добавить заголовок ответа \"X-Frame-Options: SAMEORIGIN\" в конфигурации вашего frontend-сервера.\n</p><p>В случае использования nginx:<br>\n1. Найти секцию server, отвечающую за обработку запросов нужного сайта. Зачастую это файлы в /etc/nginx/site-enabled/*.conf<br>\n2. Добавить строку:\n<pre>\nadd_header X-Frame-Options SAMEORIGIN;\n</pre>\n3. Перезапустить nginx<br>\nПодробнее об этой директиве можно прочесть в документации к nginx: <a href=\"http://nginx.org/ru/docs/http/ngx_http_headers_module.html\" target=\"_blank\">Модуль ngx_http_headers_module</a>\n</p><p>В случае использования Apache:<br>\n1. Найти конфигурационный файл для вашего сайта, зачастую это файлы /etc/apache2/httpd.conf, /etc/apache2/vhost.d/*.conf<br>\n2. Добавить строки:\n<pre>\n&lt;IfModule headers_module&gt;\n	Header set X-Frame-Options SAMEORIGIN\n&lt;/IfModule&gt;\n</pre>\n3. Перезапустить Apache<br>\n4. Убедиться, что он корректно обрабатывается Apache и этот заголовок никто не переопределяет<br>\nПодробнее об этой директиве можно прочесть в документации к Apache: <a href=\"http://httpd.apache.org/docs/2.2/mod/mod_headers.html\" target=\"_blank\">Apache Module mod_headers</a>\n</p>\";s:15:\"additional_info\";s:3454:\"Адрес: <a href=\"http://harmony.bosjack.in.ua/\" target=\"_blank\">http://harmony.bosjack.in.ua/</a><br>Запрос/Ответ: <pre>GET / HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:15 GMT\nContent-Type: text/html; charset=windows-1251\nTransfer-Encoding: chunked\nConnection: keep-alive\nP3P: policyref=&quot;/bitrix/p3p.xml&quot;, CP=&quot;NON DSP COR CUR ADM DEV PSA PSD OUR UNR BUS UNI COM NAV INT DEM STA&quot;\nX-Powered-CMS: Bitrix Site Manager (fc880ee711cbbb61fc3d1a8aba383733)\nExpires: Thu, 19 Nov 1981 08:52:00 GMT\nCache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0\nPragma: no-cache\nSet-Cookie: PHPSESSID=9gpt6fk3b6rldvv5phi8iim0r7; path=/; HttpOnly\n\n&lt;!doctype html&gt;\n&lt;html class=&quot;no-js&quot; lang=&quot;&quot;&gt;\n    &lt;head&gt;\n        &lt;meta charset=&quot;utf-8&quot;&gt;\n        &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge,chrome=1&quot;&gt;\n        &lt;title&gt;&lt;/title&gt;\n        &lt;meta name=&quot;description&quot; content=&quot;&quot;&gt;\n        &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1&quot;&gt;\n		&lt;link rel=&quot;icon&quot; type=&quot;image/png&quot; href=&quot;favicon.png&quot; /&gt;\n		&lt;link rel=&quot;shortcut icon&quot; href=&quot;favicon.png&quot; type=&quot;image/png&quot; /&gt;\n        &lt;link rel=&quot;apple-touch-icon&quot; href=&quot;apple-touch-icon.png&quot;&gt;\n		&lt;noscript&gt;&lt;link href=\'http://fonts.googleapis.com/css?family=PT+Sans:400,700&amp;subset=cyrillic,latin\' rel=\'stylesheet\' type=\'text/css\'&gt;&lt;/noscript&gt;\n	    &lt;link rel=&quot;stylesheet&quot; href=&quot;/bitrix/templates/main/css/fontello.css&quot;&gt;\n	    &lt;!--[if IE 7]&gt;&lt;link rel=&quot;stylesheet&quot; href=&quot;/bitrix/templates/main/css/fontello-ie7.css&quot;&gt;&lt;![endif]--&gt;\n        &lt;link rel=&quot;stylesheet&quot; href=&quot;/bitrix/templates/main/css/bootstrap.css&quot;&gt;\n        &lt;link rel=&quot;stylesheet&quot; href=&quot;/bitrix/templates/main/css/bootstrap-theme.min.css&quot;&gt;\n		&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=windows-1251&quot; /&gt;\n&lt;link href=&quot;/bitrix/cache/css/s1/main/kernel_main/kernel_main.css?14326345143041&quot; type=&quot;text/css&quot;  rel=&quot;stylesheet&quot; /&gt;\n&lt;link href=&quot;/bitrix/cache/css/s1/main/page_1ed2c7576590cdd9e7338ca248b1cb83/page_1ed2c7576590cdd9e7338ca248b1cb83.css?1429762394317&quot; type=&quot;text/css&quot;  rel=&quot;stylesheet&quot; /&gt;\n&lt;link href=&quot;/bitrix/cache/css/s1/main/template_acb85738ac41e6c62d5eb73907eef27f/template_acb85738ac41e6c62d5eb73907eef27f.css?14351262385289&quot; type=&quot;text/css&quot;  data-template-style=&quot;true&quot;  rel=&quot;stylesheet&quot; /&gt;\n&lt;script type=&quot;text/javascript&quot;&gt;if(!window.BX)window.BX={message:function(mess){if(typeof mess==\'object\') for(var i in mess) BX.message[i]=mess[i]; return true;}};&lt;/script&gt;\n&lt;script type=&quot;text/javascript&quot;&gt;(window.BX||top.BX).message({\'JS_CORE_LOADING\':\'Загрузка...\',\'JS_CORE_NO_DATA\':\'- Нет данных -\',\'JS_CORE_WINDOW_CLOSE\':\'Закрыть\',\'JS_CORE_WINDOW_EXPAND\':\'Развернуть\',\'JS_CORE_WINDOW_NARROW\':\'Свернуть в окно\',\'JS_CORE_WINDOW_SAVE\':\'Сохранить\',\'JS_CORE_WINDOW_CANCEL\':\'Отменить\'\n----------Only 2Kb of body shown----------<pre>\";}i:8;a:5:{s:5:\"title\";s:27:\"Защита редиректов выключена\";s:8:\"critical\";s:6:\"MIDDLE\";s:6:\"detail\";s:166:\"Редирект на произвольный стороний ресурс может служить подспорьем для множества атак, защита редиректов исключает эту возможность (при использовании стандартного API)\";s:14:\"recommendation\";s:111:\"Включить защиту редиректов: <a href=\"/bitrix/admin/security_redirect.php\" target=\"_blank\">Защита редиректов</a>\";s:15:\"additional_info\";s:0:\"\";}i:9;a:5:{s:5:\"title\";s:45:\"Разрешено чтение файлов по URL (URL wrappers)\";s:8:\"critical\";s:6:\"MIDDLE\";s:6:\"detail\";s:142:\"Если эта, сомнительная, возможность PHP не требуется - рекомендуется отключить, т.к. она может стать отправной точкой для различного типа атак\";s:14:\"recommendation\";s:61:\"Необходимо в настройках php указать:<br>allow_url_fopen = Off\";s:15:\"additional_info\";s:0:\"\";}i:10;a:5:{s:5:\"title\";s:37:\"Включен Automatic MIME Type Detection\";s:8:\"critical\";s:3:\"LOW\";s:6:\"detail\";s:151:\"По умолчанию в Internet Explorer/FlashPlayer включен автоматический mime-сниффинг, что может служить источником XSS нападения или раскрытия информации.\";s:14:\"recommendation\";s:1236:\"Скорее всего, вам не нужна эта функция, поэтому её можно безболезненно отключить, добавив заголовок ответа \"X-Content-Type-Options: nosniff\" в конфигурации вашего веб-сервера.\n</p><p>В случае использования nginx:<br>\n1. Найти секцию server, отвечающую за обработку запросов нужного сайта. Зачастую это файлы в /etc/nginx/site-enabled/*.conf<br>\n2. Добавить строку:\n<pre>\nadd_header X-Content-Type-Options nosniff;\n</pre>\n3. Перезапустить nginx<br>\nПодробнее об этой директиве можно прочесть в документации к nginx: <a href=\"http://nginx.org/ru/docs/http/ngx_http_headers_module.html\" target=\"_blank\">Модуль ngx_http_headers_module</a>\n</p><p>В случае использования Apache:<br>\n1. Найти конфигурационный файл для вашего сайта, зачастую это файлы /etc/apache2/httpd.conf, /etc/apache2/vhost.d/*.conf<br>\n2. Добавить строки:\n<pre>\n&lt;IfModule headers_module&gt;\n	Header set X-Content-Type-Options nosniff\n&lt;/IfModule&gt;\n</pre>\n3. Перезапустить Apache<br>\n4. Убедиться, что он корректно обрабатывается Apache и этот заголовок никто не переопределяет<br>\nПодробнее об этой директиве можно прочесть в документации к Apache: <a href=\"http://httpd.apache.org/docs/2.2/mod/mod_headers.html\" target=\"_blank\">Apache Module mod_headers</a>\n</p>\";s:15:\"additional_info\";s:2786:\"Адрес: <a href=\"http://harmony.bosjack.in.ua/bitrix/js/main/core/core.js?rnd=0.385946310147\" target=\"_blank\">http://harmony.bosjack.in.ua/bitrix/js/main/core/core.js?rnd=0.385946310147</a><br>Запрос/Ответ: <pre>GET /bitrix/js/main/core/core.js?rnd=0.385946310147 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Mon, 13 Jul 2015 07:04:13 GMT\nContent-Type: application/x-javascript\nContent-Length: 103988\nConnection: keep-alive\nLast-Modified: Fri, 05 Jun 2015 08:42:00 GMT\nETag: &quot;557160d8-19634&quot;\nAccept-Ranges: bytes\n\n/**********************************************************************/\n/*********** Bitrix JS Core library ver 0.9.0 beta ********************/\n/**********************************************************************/\n\n;(function(window){\n\nif (!!window.BX &amp;&amp; !!window.BX.extend)\n	return;\n\nvar _bxtmp;\nif (!!window.BX)\n{\n	_bxtmp = window.BX;\n}\n\nwindow.BX = function(node, bCache)\n{\n	if (BX.type.isNotEmptyString(node))\n	{\n		var ob;\n\n		if (!!bCache &amp;&amp; null != NODECACHE[node])\n			ob = NODECACHE[node];\n		ob = ob || document.getElementById(node);\n		if (!!bCache)\n			NODECACHE[node] = ob;\n\n		return ob;\n	}\n	else if (BX.type.isDomNode(node))\n		return node;\n	else if (BX.type.isFunction(node))\n		return BX.ready(node);\n\n	return null;\n};\n\n// language utility\nBX.message = function(mess)\n{\n	if (BX.type.isString(mess))\n	{\n		if (typeof BX.message[mess] == &quot;undefined&quot;)\n		{\n			BX.onCustomEvent(&quot;onBXMessageNotFound&quot;, [mess]);\n			if (typeof BX.message[mess] == &quot;undefined&quot;)\n			{\n				BX.debug(&quot;message undefined: &quot; + mess);\n				BX.message[mess] = &quot;&quot;;\n			}\n\n		}\n\n		return BX.message[mess];\n	}\n	else\n	{\n		for (var i in mess)\n		{\n			if (mess.hasOwnProperty(i))\n			{\n				BX.message[i] = mess[i];\n			}\n		}\n		return true;\n	}\n};\n\nif(!!_bxtmp)\n{\n	for(var i in _bxtmp)\n	{\n		if(_bxtmp.hasOwnProperty(i))\n		{\n			if(!BX[i])\n			{\n				BX[i]=_bxtmp[i];\n			}\n			else if(i==\'message\')\n			{\n				for(var j in _bxtmp[i])\n				{\n					if(_bxtmp[i].hasOwnProperty(j))\n					{\n						BX.message[j]=_bxtmp[i][j];\n					}\n				}\n			}\n		}\n	}\n\n	_bxtmp = null;\n}\n\nvar\n\n/* ready */\n__readyHandler = null,\nreadyBound = false,\nreadyList = [],\n\n/* list of registered proxy functions */\nproxySalt = Math.random(),\nproxyId = 1,\nproxyList = [],\n\n/* getElementById cache */\nNODECACHE = {},\n\n/* List of denied event handlers */\ndeniedEvents = [],\n\n/* list of registered event handlers */\neventsList = [],\n\n/* list of registered custom events */\ncustomEvents = {},\n\n/* list of external garbage collectors */\ngarbageCollectors = [],\n\n/* list of loaded CSS files */\ncssList = [],\ncssInit = false,\n\n/* list\n----------Only 2Kb of body shown----------<pre>\";}i:11;a:5:{s:5:\"title\";s:20:\"Включен вывод ошибок\";s:8:\"critical\";s:3:\"LOW\";s:6:\"detail\";s:109:\"Вывод ошибок предназначен для разработки и тестовых стендов, он не должен использоваться на конечном ресурсе.\";s:14:\"recommendation\";s:60:\"Необходимо в настройках php указать:<br>display_errors = Off\";s:15:\"additional_info\";s:0:\"\";}}'),
(2, '2015-10-22 00:53:44', 'a:13:{i:0;a:5:{s:5:\"title\";s:42:\"Используется опасная/устаревшая версия PHP\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:505:\"Использование опасных/устаревших версий PHP может служить как источником многих атак на сам интерпретатор (например, выполнение произвольного кода в версии 5.3.9) так и подспорьем для уязвимостей в коде проекта.<br>\nК примеру, не правильная работа mbstring может привести к так называемой \"Invalid Byte Sequence Attack\" в абсолютно безобидном на первый взгляд коде, а отсутствие фильтрации null-byte в паттерне регулярных выражений к выполнению произвольного кода при малейшей неосторожности разработчика.\";s:14:\"recommendation\";s:55:\"Необходимо обновить php до последней стабильной версии.\";s:15:\"additional_info\";s:72:\"Текущая версия: 5.4.43<br>Минимально-рекомендуемая: 5.4.45/5.5.29/5.6.13\";}i:1;a:5:{s:5:\"title\";s:67:\"Уровень безопасности административной группы не является повышенным\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:95:\"Пониженный уровень безопасности административной группы может значительно помочь злоумышленнику\";s:14:\"recommendation\";s:53:\"Повысить уровень безопасности административной группы\";s:15:\"additional_info\";s:0:\"\";}i:2;a:5:{s:5:\"title\";s:36:\"Символы пароля к БД в одном регистре\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:77:\"Пароль слишком простой, что повышает риск взлома учетной записи в базе данных\";s:14:\"recommendation\";s:48:\"Использовать различный регистр символов в пароле\";s:15:\"additional_info\";s:0:\"\";}i:3;a:5:{s:5:\"title\";s:55:\"Пароль к БД не содержит спецсимволов(знаков препинания)\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:75:\"Пароль слишком прост, что повышает риск взлома учетной записи в базе данных\";s:14:\"recommendation\";s:30:\"Добавить спецсимволов в пароль\";s:15:\"additional_info\";s:0:\"\";}i:4;a:4:{s:5:\"title\";s:58:\"Статический анализ уязвимостей обнаружил 4 проблемных мест\";s:8:\"critical\";s:5:\"HIGHT\";s:14:\"recommendation\";s:51:\"Необходимо обратится к разработчику для исправления\";s:6:\"detail\";s:3827:\"<div class=\"checklist-dot-line\"></div><div class=\"checklist-vulnscan-files\"><div class=\"checklist-vulnscan-vulnscan-blocktitle\">Cross-Site Scripting</div><div id=\"/status/index.php\"><div class=\"checklist-vulnscan-vulnblock\"><span class=\"checklist-vulnscan-filename\">Файл: /status/index.php</span><div style=\"visibility: hidden; display:none;\" class=\"checklist-vulnscan-helpbox\" data-help=\"/status/index.php\"><div class=\"checklist-vulnscan-helpbox-description\">Межсайтовый скриптинг (XSS) уязвимость возникает тогда, когда данные, принятые от пользователя, выводятся в браузер без надлежащей фильтрации. Уязвимость может быть использована для изменения вида HTML страниц уязвимого сайта в контексте браузера целевого пользователя, похищения COOKIE данных браузера целевого пользователя, с последующим внедрением в его сессию, под его учетной записью.</div><div class=\"checklist-vulnscan-helpbox-safe-title\">Как защищаться</div><div class=\"checklist-vulnscan-helpbox-safe-description\">Использовать <b>htmlspecialcharsbx</b>. Параметры тегов с динамическими значениями ограничивать двойными кавычками. Принудительно добавлять протокол (http), где это необходимо, для значений параметров тегов, таких как href или src.</div></div><div class=\"checklist-vulnscan-code\"></div><div class=\"checklist-vulnscan-dangerous-is-here\"><div style=\"clear:both;\"><span>97:</span>&nbsp;<span style=\"color: #007700;\">echo</span>&nbsp;<span style=\"color: #0000BB;\">trim</span><span style=\"color: #007700;\">(</span><span style=\"color: #0000BB;\"><b>$_REQUEST</b></span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'number\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">)</span></div></div><div class=\"checklist-vulnscan-dependecies\">Необходимые условия:<div style=\"clear:both;\"><span>83:</span>&nbsp;<span style=\"color: #007700;\">if</span><span style=\"color: #007700;\">(</span><span style=\"color: #007700;\">!</span><span style=\"color: #007700;\">isset</span><span style=\"color: #007700;\">(</span><span style=\"color: #0000BB;\">$arResult</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'RESULT\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">)</span><span style=\"color: #007700;\">)</span><span style=\"color: #007700;\">&nbsp;:&nbsp;</span></div></div>\n<div><div class=\"checklist-vulnscan-vulnblocktitle\">Аналогично:</div><div class=\"checklist-vulnscan-codebox\"><div class=\"checklist-vulnscan-code\"><div class=\"checklist-vulnscan-dangerous-is-here\"><div style=\"clear:both;\"><span>111:</span>&nbsp;<span style=\"color: #007700;\">echo</span>&nbsp;<span style=\"color: #0000BB;\">trim</span><span style=\"color: #007700;\">(</span><span style=\"color: #0000BB;\">$_REQUEST</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'date\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">)</span></div></div><div class=\"checklist-vulnscan-dangerous-is-here\"><div style=\"clear:both;\"><span>128:</span>&nbsp;<span style=\"color: #007700;\">echo</span>&nbsp;<span style=\"color: #0000BB;\">trim</span><span style=\"color: #007700;\">(</span><span style=\"color: #0000BB;\">$_REQUEST</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'fio\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">)</span></div></div><div class=\"checklist-vulnscan-dangerous-is-here\"><div style=\"clear:both;\"><span>145:</span>&nbsp;<span style=\"color: #007700;\">echo</span>&nbsp;<span style=\"color: #0000BB;\">trim</span><span style=\"color: #007700;\">(</span><span style=\"color: #0000BB;\">$_REQUEST</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'phone\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">)</span></div></div></div></div></div></div></div></div>\";}i:5;a:5:{s:5:\"title\";s:57:\"Cookies - не единственное хранилище идентификатора сессии\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:103:\"Хранение идентификатора сессии не только в Cookies может служить источником атак типа Session Hijacking\";s:14:\"recommendation\";s:69:\"Необходимо в настройках php указать:<br>session.use_only_cookies = On\";s:15:\"additional_info\";s:0:\"\";}i:6;a:5:{s:5:\"title\";s:60:\"Разрешено отображение сайта во фрейме с произвольного домена\";s:8:\"critical\";s:6:\"MIDDLE\";s:6:\"detail\";s:214:\"Запрет отображения фреймов сайта со сторонних доменов способен предотвратить целый класс атак, таких как <a href=\"https://www.owasp.org/index.php/Clickjacking\" target=\"_blank\">Clickjacking</a>, Framesniffing и т.д.\";s:14:\"recommendation\";s:1300:\"Скорее всего, вам будет достаточно разрешения на просмотр сайта в фреймах только на страницах текущего сайта.\nСделать это достаточно просто, достаточно добавить заголовок ответа \"X-Frame-Options: SAMEORIGIN\" в конфигурации вашего frontend-сервера.\n</p><p>В случае использования nginx:<br>\n1. Найти секцию server, отвечающую за обработку запросов нужного сайта. Зачастую это файлы в /etc/nginx/site-enabled/*.conf<br>\n2. Добавить строку:\n<pre>\nadd_header X-Frame-Options SAMEORIGIN;\n</pre>\n3. Перезапустить nginx<br>\nПодробнее об этой директиве можно прочесть в документации к nginx: <a href=\"http://nginx.org/ru/docs/http/ngx_http_headers_module.html\" target=\"_blank\">Модуль ngx_http_headers_module</a>\n</p><p>В случае использования Apache:<br>\n1. Найти конфигурационный файл для вашего сайта, зачастую это файлы /etc/apache2/httpd.conf, /etc/apache2/vhost.d/*.conf<br>\n2. Добавить строки:\n<pre>\n&lt;IfModule headers_module&gt;\n	Header set X-Frame-Options SAMEORIGIN\n&lt;/IfModule&gt;\n</pre>\n3. Перезапустить Apache<br>\n4. Убедиться, что он корректно обрабатывается Apache и этот заголовок никто не переопределяет<br>\nПодробнее об этой директиве можно прочесть в документации к Apache: <a href=\"http://httpd.apache.org/docs/2.2/mod/mod_headers.html\" target=\"_blank\">Apache Module mod_headers</a>\n</p>\";s:15:\"additional_info\";s:3546:\"Адрес: <a href=\"http://harmony.bosjack.in.ua/\" target=\"_blank\">http://harmony.bosjack.in.ua/</a><br>Запрос/Ответ: <pre>GET / HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Wed, 21 Oct 2015 21:53:25 GMT\nContent-Type: text/html; charset=windows-1251\nTransfer-Encoding: chunked\nConnection: keep-alive\nP3P: policyref=&quot;/bitrix/p3p.xml&quot;, CP=&quot;NON DSP COR CUR ADM DEV PSA PSD OUR UNR BUS UNI COM NAV INT DEM STA&quot;\nX-Powered-CMS: Bitrix Site Manager (fc880ee711cbbb61fc3d1a8aba383733)\nExpires: Thu, 19 Nov 1981 08:52:00 GMT\nCache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0\nPragma: no-cache\nSet-Cookie: PHPSESSID=elsb2rc52q1uthitnehvgc7rj1; path=/; HttpOnly\n\n&lt;!doctype html&gt;\n&lt;html class=&quot;no-js&quot; lang=&quot;&quot;&gt;\n    &lt;head&gt;\n        &lt;meta charset=&quot;utf-8&quot;&gt;\n        &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge,chrome=1&quot;&gt;\n        &lt;title&gt;&lt;/title&gt;\n        &lt;meta name=&quot;description&quot; content=&quot;&quot;&gt;\n        &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1&quot;&gt;\n		&lt;link rel=&quot;icon&quot; type=&quot;image/png&quot; href=&quot;favicon.png&quot; /&gt;\n		&lt;link rel=&quot;shortcut icon&quot; href=&quot;favicon.png&quot; type=&quot;image/png&quot; /&gt;\n        &lt;link rel=&quot;apple-touch-icon&quot; href=&quot;apple-touch-icon.png&quot;&gt;\n		&lt;noscript&gt;&lt;link href=\'http://fonts.googleapis.com/css?family=PT+Sans:400,700&amp;subset=cyrillic,latin\' rel=\'stylesheet\' type=\'text/css\'&gt;&lt;/noscript&gt;\n	    &lt;link rel=&quot;stylesheet&quot; href=&quot;/bitrix/templates/main/css/fontello.css&quot;&gt;\n	    &lt;!--[if IE 7]&gt;&lt;link rel=&quot;stylesheet&quot; href=&quot;/bitrix/templates/main/css/fontello-ie7.css&quot;&gt;&lt;![endif]--&gt;\n        &lt;link rel=&quot;stylesheet&quot; href=&quot;/bitrix/templates/main/css/bootstrap.css&quot;&gt;\n        &lt;link rel=&quot;stylesheet&quot; href=&quot;/bitrix/templates/main/css/bootstrap-theme.min.css&quot;&gt;\n		&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=windows-1251&quot; /&gt;\n&lt;link href=&quot;/bitrix/cache/css/s1/main/page_1ed2c7576590cdd9e7338ca248b1cb83/page_1ed2c7576590cdd9e7338ca248b1cb83.css?1440038961344&quot; type=&quot;text/css&quot;  rel=&quot;stylesheet&quot; /&gt;\n&lt;link href=&quot;/bitrix/cache/css/s1/main/template_d6e97595bb8fec6bb284fe1664ca9087/template_d6e97595bb8fec6bb284fe1664ca9087.css?14441111469623&quot; type=&quot;text/css&quot;  data-template-style=&quot;true&quot;  rel=&quot;stylesheet&quot; /&gt;\n&lt;script type=&quot;text/javascript&quot;&gt;var _ba = _ba || []; _ba.push([&quot;aid&quot;, &quot;fc880ee711cbbb61fc3d1a8aba383733&quot;]); _ba.push([&quot;host&quot;, &quot;harmony.bosjack.in.ua&quot;]); (function() {var ba = document.createElement(&quot;script&quot;); ba.type = &quot;text/javascript&quot;; ba.async = true;ba.src = (document.location.protocol == &quot;https:&quot; ? &quot;https://&quot; : &quot;http://&quot;) + &quot;bitrix.info/ba.js&quot;;var s = document.getElementsByTagName(&quot;script&quot;)[0];s.parentNode.insertBefore(ba, s);})();&lt;/script&gt;\n\n\n\n        &lt;!--[if lt IE 9]&gt;\n            &lt;script src=&quot;/bitrix/templates/main/js/vendor/html5-3.6-respond-1.4.2.min.js&quot;&gt;&lt;/script&gt;\n        &lt;![endif]--&gt;\n----------Only 2Kb of body shown----------<pre>\";}i:7;a:5:{s:5:\"title\";s:27:\"Защита редиректов выключена\";s:8:\"critical\";s:6:\"MIDDLE\";s:6:\"detail\";s:166:\"Редирект на произвольный стороний ресурс может служить подспорьем для множества атак, защита редиректов исключает эту возможность (при использовании стандартного API)\";s:14:\"recommendation\";s:111:\"Включить защиту редиректов: <a href=\"/bitrix/admin/security_redirect.php\" target=\"_blank\">Защита редиректов</a>\";s:15:\"additional_info\";s:0:\"\";}i:8;a:5:{s:5:\"title\";s:45:\"Разрешено чтение файлов по URL (URL wrappers)\";s:8:\"critical\";s:6:\"MIDDLE\";s:6:\"detail\";s:142:\"Если эта, сомнительная, возможность PHP не требуется - рекомендуется отключить, т.к. она может стать отправной точкой для различного типа атак\";s:14:\"recommendation\";s:61:\"Необходимо в настройках php указать:<br>allow_url_fopen = Off\";s:15:\"additional_info\";s:0:\"\";}i:9;a:5:{s:5:\"title\";s:62:\"Установлен не корректный порядок формирования массива _REQUEST\";s:8:\"critical\";s:6:\"MIDDLE\";s:6:\"detail\";s:221:\"Зачастую в массив _REQUEST нет необходимости добавлять любые переменные, кроме массивов _GET и _POST. В противном случае это может привести к раскрытию информации о пользователе/сайте и иным не предсказуемым последствиям.\";s:14:\"recommendation\";s:60:\"Необходимо в настройках php указать:<br>request_order = \"GP\"\";s:15:\"additional_info\";s:45:\"Текущее значение: \"\"<br>Рекомендованное: \"GP\"\";}i:10;a:5:{s:5:\"title\";s:63:\"Временные файлы хранятся в пределах корневой директории проекта\";s:8:\"critical\";s:6:\"MIDDLE\";s:6:\"detail\";s:151:\"Хранение временных файлов, создаваемых при использовании CTempFile, в пределах корневой директории проекта не рекомендовано и несет с собой ряд рисков.\";s:14:\"recommendation\";s:497:\"Необходимо определить константу \"BX_TEMPORARY_FILES_DIRECTORY\" в \"bitrix/php_interface/dbconn.php\" с указанием необходимого пути.<br>\nЗачастую это делается в несколько шагов:<br>\n1. Выбрать подходящую директорию и создать её. Например, если будет выбрана \"/home/bitrix/tmp/www\":\n<pre>\nmkdir -p -m 700 /home/bitrix/tmp/www\n</pre>\n2. Определить соответствующую константу, что бы система начала использовать эту директорию:\n<pre>\ndefine(\"BX_TEMPORARY_FILES_DIRECTORY\", \"/home/bitrix/tmp/www\");\n</pre>\";s:15:\"additional_info\";s:66:\"Текущая директория: /home/bosjack/bosjack.in.ua/harmony/upload/tmp\";}i:11;a:5:{s:5:\"title\";s:37:\"Включен Automatic MIME Type Detection\";s:8:\"critical\";s:3:\"LOW\";s:6:\"detail\";s:151:\"По умолчанию в Internet Explorer/FlashPlayer включен автоматический mime-сниффинг, что может служить источником XSS нападения или раскрытия информации.\";s:14:\"recommendation\";s:1236:\"Скорее всего, вам не нужна эта функция, поэтому её можно безболезненно отключить, добавив заголовок ответа \"X-Content-Type-Options: nosniff\" в конфигурации вашего веб-сервера.\n</p><p>В случае использования nginx:<br>\n1. Найти секцию server, отвечающую за обработку запросов нужного сайта. Зачастую это файлы в /etc/nginx/site-enabled/*.conf<br>\n2. Добавить строку:\n<pre>\nadd_header X-Content-Type-Options nosniff;\n</pre>\n3. Перезапустить nginx<br>\nПодробнее об этой директиве можно прочесть в документации к nginx: <a href=\"http://nginx.org/ru/docs/http/ngx_http_headers_module.html\" target=\"_blank\">Модуль ngx_http_headers_module</a>\n</p><p>В случае использования Apache:<br>\n1. Найти конфигурационный файл для вашего сайта, зачастую это файлы /etc/apache2/httpd.conf, /etc/apache2/vhost.d/*.conf<br>\n2. Добавить строки:\n<pre>\n&lt;IfModule headers_module&gt;\n	Header set X-Content-Type-Options nosniff\n&lt;/IfModule&gt;\n</pre>\n3. Перезапустить Apache<br>\n4. Убедиться, что он корректно обрабатывается Apache и этот заголовок никто не переопределяет<br>\nПодробнее об этой директиве можно прочесть в документации к Apache: <a href=\"http://httpd.apache.org/docs/2.2/mod/mod_headers.html\" target=\"_blank\">Apache Module mod_headers</a>\n</p>\";s:15:\"additional_info\";s:2786:\"Адрес: <a href=\"http://harmony.bosjack.in.ua/bitrix/js/main/core/core.js?rnd=0.904722477184\" target=\"_blank\">http://harmony.bosjack.in.ua/bitrix/js/main/core/core.js?rnd=0.904722477184</a><br>Запрос/Ответ: <pre>GET /bitrix/js/main/core/core.js?rnd=0.904722477184 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Wed, 21 Oct 2015 21:53:23 GMT\nContent-Type: application/x-javascript\nContent-Length: 109040\nConnection: keep-alive\nLast-Modified: Mon, 07 Sep 2015 21:04:12 GMT\nETag: &quot;55edfbcc-1a9f0&quot;\nAccept-Ranges: bytes\n\n/**********************************************************************/\n/*********** Bitrix JS Core library ver 0.9.0 beta ********************/\n/**********************************************************************/\n\n;(function(window){\n\nif (!!window.BX &amp;&amp; !!window.BX.extend)\n	return;\n\nvar _bxtmp;\nif (!!window.BX)\n{\n	_bxtmp = window.BX;\n}\n\nwindow.BX = function(node, bCache)\n{\n	if (BX.type.isNotEmptyString(node))\n	{\n		var ob;\n\n		if (!!bCache &amp;&amp; null != NODECACHE[node])\n			ob = NODECACHE[node];\n		ob = ob || document.getElementById(node);\n		if (!!bCache)\n			NODECACHE[node] = ob;\n\n		return ob;\n	}\n	else if (BX.type.isDomNode(node))\n		return node;\n	else if (BX.type.isFunction(node))\n		return BX.ready(node);\n\n	return null;\n};\n\n// language utility\nBX.message = function(mess)\n{\n	if (BX.type.isString(mess))\n	{\n		if (typeof BX.message[mess] == &quot;undefined&quot;)\n		{\n			BX.onCustomEvent(&quot;onBXMessageNotFound&quot;, [mess]);\n			if (typeof BX.message[mess] == &quot;undefined&quot;)\n			{\n				BX.debug(&quot;message undefined: &quot; + mess);\n				BX.message[mess] = &quot;&quot;;\n			}\n\n		}\n\n		return BX.message[mess];\n	}\n	else\n	{\n		for (var i in mess)\n		{\n			if (mess.hasOwnProperty(i))\n			{\n				BX.message[i] = mess[i];\n			}\n		}\n		return true;\n	}\n};\n\nif(!!_bxtmp)\n{\n	for(var i in _bxtmp)\n	{\n		if(_bxtmp.hasOwnProperty(i))\n		{\n			if(!BX[i])\n			{\n				BX[i]=_bxtmp[i];\n			}\n			else if(i==\'message\')\n			{\n				for(var j in _bxtmp[i])\n				{\n					if(_bxtmp[i].hasOwnProperty(j))\n					{\n						BX.message[j]=_bxtmp[i][j];\n					}\n				}\n			}\n		}\n	}\n\n	_bxtmp = null;\n}\n\nvar\n\n/* ready */\n__readyHandler = null,\nreadyBound = false,\nreadyList = [],\n\n/* list of registered proxy functions */\nproxySalt = Math.random(),\nproxyId = 1,\nproxyList = [],\n\n/* getElementById cache */\nNODECACHE = {},\n\n/* List of denied event handlers */\ndeniedEvents = [],\n\n/* list of registered event handlers */\neventsList = [],\n\n/* list of registered custom events */\ncustomEvents = {},\n\n/* list of external garbage collectors */\ngarbageCollectors = [],\n\n/* list of loaded CSS files */\ncssList = [],\ncssInit = false,\n\n/* list\n----------Only 2Kb of body shown----------<pre>\";}i:12;a:5:{s:5:\"title\";s:20:\"Включен вывод ошибок\";s:8:\"critical\";s:3:\"LOW\";s:6:\"detail\";s:109:\"Вывод ошибок предназначен для разработки и тестовых стендов, он не должен использоваться на конечном ресурсе.\";s:14:\"recommendation\";s:60:\"Необходимо в настройках php указать:<br>display_errors = Off\";s:15:\"additional_info\";s:0:\"\";}}'),
(3, '2016-02-02 15:59:13', 'a:13:{i:0;a:5:{s:5:\"title\";s:67:\"Уровень безопасности административной группы не является повышенным\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:95:\"Пониженный уровень безопасности административной группы может значительно помочь злоумышленнику\";s:14:\"recommendation\";s:222:\"Ужесточить <a href=\"/bitrix/admin/group_edit.php?ID=1&tabControl_active_tab=edit2\"  target=\"_blank\">политики безопасности административной</a> группы или выбрать предопределенную настройку уровня безопасности \"Повышенный\".\";s:15:\"additional_info\";s:0:\"\";}i:1;a:5:{s:5:\"title\";s:36:\"Символы пароля к БД в одном регистре\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:77:\"Пароль слишком простой, что повышает риск взлома учетной записи в базе данных\";s:14:\"recommendation\";s:48:\"Использовать различный регистр символов в пароле\";s:15:\"additional_info\";s:0:\"\";}i:2;a:5:{s:5:\"title\";s:55:\"Пароль к БД не содержит спецсимволов(знаков препинания)\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:75:\"Пароль слишком прост, что повышает риск взлома учетной записи в базе данных\";s:14:\"recommendation\";s:30:\"Добавить спецсимволов в пароль\";s:15:\"additional_info\";s:0:\"\";}i:3;a:4:{s:5:\"title\";s:58:\"Статический анализ уязвимостей обнаружил 4 проблемных мест\";s:8:\"critical\";s:5:\"HIGHT\";s:14:\"recommendation\";s:51:\"Необходимо обратится к разработчику для исправления\";s:6:\"detail\";s:3827:\"<div class=\"checklist-dot-line\"></div><div class=\"checklist-vulnscan-files\"><div class=\"checklist-vulnscan-vulnscan-blocktitle\">Cross-Site Scripting</div><div id=\"/status/index.php\"><div class=\"checklist-vulnscan-vulnblock\"><span class=\"checklist-vulnscan-filename\">Файл: /status/index.php</span><div style=\"visibility: hidden; display:none;\" class=\"checklist-vulnscan-helpbox\" data-help=\"/status/index.php\"><div class=\"checklist-vulnscan-helpbox-description\">Межсайтовый скриптинг (XSS) уязвимость возникает тогда, когда данные, принятые от пользователя, выводятся в браузер без надлежащей фильтрации. Уязвимость может быть использована для изменения вида HTML страниц уязвимого сайта в контексте браузера целевого пользователя, похищения COOKIE данных браузера целевого пользователя, с последующим внедрением в его сессию, под его учетной записью.</div><div class=\"checklist-vulnscan-helpbox-safe-title\">Как защищаться</div><div class=\"checklist-vulnscan-helpbox-safe-description\">Использовать <b>htmlspecialcharsbx</b>. Параметры тегов с динамическими значениями ограничивать двойными кавычками. Принудительно добавлять протокол (http), где это необходимо, для значений параметров тегов, таких как href или src.</div></div><div class=\"checklist-vulnscan-code\"></div><div class=\"checklist-vulnscan-dangerous-is-here\"><div style=\"clear:both;\"><span>97:</span>&nbsp;<span style=\"color: #007700;\">echo</span>&nbsp;<span style=\"color: #0000BB;\">trim</span><span style=\"color: #007700;\">(</span><span style=\"color: #0000BB;\"><b>$_REQUEST</b></span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'number\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">)</span></div></div><div class=\"checklist-vulnscan-dependecies\">Необходимые условия:<div style=\"clear:both;\"><span>83:</span>&nbsp;<span style=\"color: #007700;\">if</span><span style=\"color: #007700;\">(</span><span style=\"color: #007700;\">!</span><span style=\"color: #007700;\">isset</span><span style=\"color: #007700;\">(</span><span style=\"color: #0000BB;\">$arResult</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'RESULT\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">)</span><span style=\"color: #007700;\">)</span><span style=\"color: #007700;\">&nbsp;:&nbsp;</span></div></div>\n<div><div class=\"checklist-vulnscan-vulnblocktitle\">Аналогично:</div><div class=\"checklist-vulnscan-codebox\"><div class=\"checklist-vulnscan-code\"><div class=\"checklist-vulnscan-dangerous-is-here\"><div style=\"clear:both;\"><span>111:</span>&nbsp;<span style=\"color: #007700;\">echo</span>&nbsp;<span style=\"color: #0000BB;\">trim</span><span style=\"color: #007700;\">(</span><span style=\"color: #0000BB;\">$_REQUEST</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'date\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">)</span></div></div><div class=\"checklist-vulnscan-dangerous-is-here\"><div style=\"clear:both;\"><span>128:</span>&nbsp;<span style=\"color: #007700;\">echo</span>&nbsp;<span style=\"color: #0000BB;\">trim</span><span style=\"color: #007700;\">(</span><span style=\"color: #0000BB;\">$_REQUEST</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'fio\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">)</span></div></div><div class=\"checklist-vulnscan-dangerous-is-here\"><div style=\"clear:both;\"><span>145:</span>&nbsp;<span style=\"color: #007700;\">echo</span>&nbsp;<span style=\"color: #0000BB;\">trim</span><span style=\"color: #007700;\">(</span><span style=\"color: #0000BB;\">$_REQUEST</span><span style=\"color: #007700;\">[</span><span style=\"color: #DD0000;\">\'phone\'</span><span style=\"color: #007700;\">]</span><span style=\"color: #007700;\">)</span></div></div></div></div></div></div></div></div>\";}i:4;a:5:{s:5:\"title\";s:57:\"Cookies - не единственное хранилище идентификатора сессии\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:103:\"Хранение идентификатора сессии не только в Cookies может служить источником атак типа Session Hijacking\";s:14:\"recommendation\";s:69:\"Необходимо в настройках php указать:<br>session.use_only_cookies = On\";s:15:\"additional_info\";s:0:\"\";}i:5;a:5:{s:5:\"title\";s:78:\"Предположительно в директории хранения сессий находятся сессии других проектов\";s:8:\"critical\";s:5:\"HIGHT\";s:6:\"detail\";s:96:\"Это может позволить читать/изменять сессионные данные, через скрипты других виртуальных серверов\";s:14:\"recommendation\";s:126:\"Сменить директорию хранения либо включить хранение сессий в БД: <a href=\"/bitrix/admin/security_session.php\">Защита сессий</a>\";s:15:\"additional_info\";s:264:\"Причина: файл сессии не содержит подписи текущего сайта<br>\nФайл: /home/bosjack/.system/tmp/sess_scsq4pm93ekpfpndr8bu67kak3<br>\nПодпись текущего сайта: d569b8750b86c67036e309dbdef75308<br>\nСодержимое файла: <pre>CHECKER_CHECK_SESSION|s:7:&quot;SUCCESS&quot;;</pre>\";}i:6;a:5:{s:5:\"title\";s:60:\"Разрешено отображение сайта во фрейме с произвольного домена\";s:8:\"critical\";s:6:\"MIDDLE\";s:6:\"detail\";s:214:\"Запрет отображения фреймов сайта со сторонних доменов способен предотвратить целый класс атак, таких как <a href=\"https://www.owasp.org/index.php/Clickjacking\" target=\"_blank\">Clickjacking</a>, Framesniffing и т.д.\";s:14:\"recommendation\";s:1300:\"Скорее всего, вам будет достаточно разрешения на просмотр сайта в фреймах только на страницах текущего сайта.\nСделать это достаточно просто, достаточно добавить заголовок ответа \"X-Frame-Options: SAMEORIGIN\" в конфигурации вашего frontend-сервера.\n</p><p>В случае использования nginx:<br>\n1. Найти секцию server, отвечающую за обработку запросов нужного сайта. Зачастую это файлы в /etc/nginx/site-enabled/*.conf<br>\n2. Добавить строку:\n<pre>\nadd_header X-Frame-Options SAMEORIGIN;\n</pre>\n3. Перезапустить nginx<br>\nПодробнее об этой директиве можно прочесть в документации к nginx: <a href=\"http://nginx.org/ru/docs/http/ngx_http_headers_module.html\" target=\"_blank\">Модуль ngx_http_headers_module</a>\n</p><p>В случае использования Apache:<br>\n1. Найти конфигурационный файл для вашего сайта, зачастую это файлы /etc/apache2/httpd.conf, /etc/apache2/vhost.d/*.conf<br>\n2. Добавить строки:\n<pre>\n&lt;IfModule headers_module&gt;\n	Header set X-Frame-Options SAMEORIGIN\n&lt;/IfModule&gt;\n</pre>\n3. Перезапустить Apache<br>\n4. Убедиться, что он корректно обрабатывается Apache и этот заголовок никто не переопределяет<br>\nПодробнее об этой директиве можно прочесть в документации к Apache: <a href=\"http://httpd.apache.org/docs/2.2/mod/mod_headers.html\" target=\"_blank\">Apache Module mod_headers</a>\n</p>\";s:15:\"additional_info\";s:3546:\"Адрес: <a href=\"http://harmony.bosjack.in.ua/\" target=\"_blank\">http://harmony.bosjack.in.ua/</a><br>Запрос/Ответ: <pre>GET / HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Tue, 02 Feb 2016 13:58:53 GMT\nContent-Type: text/html; charset=windows-1251\nTransfer-Encoding: chunked\nConnection: keep-alive\nP3P: policyref=&quot;/bitrix/p3p.xml&quot;, CP=&quot;NON DSP COR CUR ADM DEV PSA PSD OUR UNR BUS UNI COM NAV INT DEM STA&quot;\nX-Powered-CMS: Bitrix Site Manager (fc880ee711cbbb61fc3d1a8aba383733)\nExpires: Thu, 19 Nov 1981 08:52:00 GMT\nCache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0\nPragma: no-cache\nSet-Cookie: PHPSESSID=k53h8849mmuqhp2hnmrm1h9q65; path=/; HttpOnly\n\n&lt;!doctype html&gt;\n&lt;html class=&quot;no-js&quot; lang=&quot;&quot;&gt;\n    &lt;head&gt;\n        &lt;meta charset=&quot;utf-8&quot;&gt;\n        &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge,chrome=1&quot;&gt;\n        &lt;title&gt;&lt;/title&gt;\n        &lt;meta name=&quot;description&quot; content=&quot;&quot;&gt;\n        &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1&quot;&gt;\n		&lt;link rel=&quot;icon&quot; type=&quot;image/png&quot; href=&quot;favicon.png&quot; /&gt;\n		&lt;link rel=&quot;shortcut icon&quot; href=&quot;favicon.png&quot; type=&quot;image/png&quot; /&gt;\n        &lt;link rel=&quot;apple-touch-icon&quot; href=&quot;apple-touch-icon.png&quot;&gt;\n		&lt;noscript&gt;&lt;link href=\'http://fonts.googleapis.com/css?family=PT+Sans:400,700&amp;subset=cyrillic,latin\' rel=\'stylesheet\' type=\'text/css\'&gt;&lt;/noscript&gt;\n	    &lt;link rel=&quot;stylesheet&quot; href=&quot;/bitrix/templates/main/css/fontello.css&quot;&gt;\n	    &lt;!--[if IE 7]&gt;&lt;link rel=&quot;stylesheet&quot; href=&quot;/bitrix/templates/main/css/fontello-ie7.css&quot;&gt;&lt;![endif]--&gt;\n        &lt;link rel=&quot;stylesheet&quot; href=&quot;/bitrix/templates/main/css/bootstrap.css&quot;&gt;\n        &lt;link rel=&quot;stylesheet&quot; href=&quot;/bitrix/templates/main/css/bootstrap-theme.min.css&quot;&gt;\n		&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=windows-1251&quot; /&gt;\n&lt;link href=&quot;/bitrix/cache/css/s1/main/page_1ed2c7576590cdd9e7338ca248b1cb83/page_1ed2c7576590cdd9e7338ca248b1cb83.css?1440038961344&quot; type=&quot;text/css&quot;  rel=&quot;stylesheet&quot; /&gt;\n&lt;link href=&quot;/bitrix/cache/css/s1/main/template_d6e97595bb8fec6bb284fe1664ca9087/template_d6e97595bb8fec6bb284fe1664ca9087.css?14441111469623&quot; type=&quot;text/css&quot;  data-template-style=&quot;true&quot;  rel=&quot;stylesheet&quot; /&gt;\n&lt;script type=&quot;text/javascript&quot;&gt;var _ba = _ba || []; _ba.push([&quot;aid&quot;, &quot;fc880ee711cbbb61fc3d1a8aba383733&quot;]); _ba.push([&quot;host&quot;, &quot;harmony.bosjack.in.ua&quot;]); (function() {var ba = document.createElement(&quot;script&quot;); ba.type = &quot;text/javascript&quot;; ba.async = true;ba.src = (document.location.protocol == &quot;https:&quot; ? &quot;https://&quot; : &quot;http://&quot;) + &quot;bitrix.info/ba.js&quot;;var s = document.getElementsByTagName(&quot;script&quot;)[0];s.parentNode.insertBefore(ba, s);})();&lt;/script&gt;\n\n\n\n        &lt;!--[if lt IE 9]&gt;\n            &lt;script src=&quot;/bitrix/templates/main/js/vendor/html5-3.6-respond-1.4.2.min.js&quot;&gt;&lt;/script&gt;\n        &lt;![endif]--&gt;\n----------Only 2Kb of body shown----------<pre>\";}i:7;a:5:{s:5:\"title\";s:27:\"Защита редиректов выключена\";s:8:\"critical\";s:6:\"MIDDLE\";s:6:\"detail\";s:167:\"Редирект на произвольный сторонний ресурс может служить подспорьем для множества атак, защита редиректов исключает эту возможность (при использовании стандартного API)\";s:14:\"recommendation\";s:111:\"Включить защиту редиректов: <a href=\"/bitrix/admin/security_redirect.php\" target=\"_blank\">Защита редиректов</a>\";s:15:\"additional_info\";s:0:\"\";}i:8;a:5:{s:5:\"title\";s:45:\"Разрешено чтение файлов по URL (URL wrappers)\";s:8:\"critical\";s:6:\"MIDDLE\";s:6:\"detail\";s:142:\"Если эта, сомнительная, возможность PHP не требуется - рекомендуется отключить, т.к. она может стать отправной точкой для различного типа атак\";s:14:\"recommendation\";s:61:\"Необходимо в настройках php указать:<br>allow_url_fopen = Off\";s:15:\"additional_info\";s:0:\"\";}i:9;a:5:{s:5:\"title\";s:62:\"Установлен не корректный порядок формирования массива _REQUEST\";s:8:\"critical\";s:6:\"MIDDLE\";s:6:\"detail\";s:221:\"Зачастую в массив _REQUEST нет необходимости добавлять любые переменные, кроме массивов _GET и _POST. В противном случае это может привести к раскрытию информации о пользователе/сайте и иным не предсказуемым последствиям.\";s:14:\"recommendation\";s:60:\"Необходимо в настройках php указать:<br>request_order = \"GP\"\";s:15:\"additional_info\";s:45:\"Текущее значение: \"\"<br>Рекомендованное: \"GP\"\";}i:10;a:5:{s:5:\"title\";s:63:\"Временные файлы хранятся в пределах корневой директории проекта\";s:8:\"critical\";s:6:\"MIDDLE\";s:6:\"detail\";s:151:\"Хранение временных файлов, создаваемых при использовании CTempFile, в пределах корневой директории проекта не рекомендовано и несет с собой ряд рисков.\";s:14:\"recommendation\";s:584:\"Необходимо определить константу \"BX_TEMPORARY_FILES_DIRECTORY\" в \"bitrix/php_interface/dbconn.php\" с указанием необходимого пути.<br>\nВыполните следующие шаги:<br>\n1. Выберите директорию вне корня проекта. Например, это может быть \"/home/bitrix/tmp/www\"<br>\n2. Создайте ее. Для этого выполните следующую комманду:\n<pre>\nmkdir -p -m 700 /полный/путь/к/директории\n</pre>\n3. В файле \"bitrix/php_interface/dbconn.php\" определите соответствующую константу, что бы система начала использовать эту директорию:\n<pre>\ndefine(\"BX_TEMPORARY_FILES_DIRECTORY\", \"/полный/путь/к/директории\");\n</pre>\";s:15:\"additional_info\";s:66:\"Текущая директория: /home/bosjack/bosjack.in.ua/harmony/upload/tmp\";}i:11;a:5:{s:5:\"title\";s:37:\"Включен Automatic MIME Type Detection\";s:8:\"critical\";s:3:\"LOW\";s:6:\"detail\";s:151:\"По умолчанию в Internet Explorer/FlashPlayer включен автоматический mime-сниффинг, что может служить источником XSS нападения или раскрытия информации.\";s:14:\"recommendation\";s:1236:\"Скорее всего, вам не нужна эта функция, поэтому её можно безболезненно отключить, добавив заголовок ответа \"X-Content-Type-Options: nosniff\" в конфигурации вашего веб-сервера.\n</p><p>В случае использования nginx:<br>\n1. Найти секцию server, отвечающую за обработку запросов нужного сайта. Зачастую это файлы в /etc/nginx/site-enabled/*.conf<br>\n2. Добавить строку:\n<pre>\nadd_header X-Content-Type-Options nosniff;\n</pre>\n3. Перезапустить nginx<br>\nПодробнее об этой директиве можно прочесть в документации к nginx: <a href=\"http://nginx.org/ru/docs/http/ngx_http_headers_module.html\" target=\"_blank\">Модуль ngx_http_headers_module</a>\n</p><p>В случае использования Apache:<br>\n1. Найти конфигурационный файл для вашего сайта, зачастую это файлы /etc/apache2/httpd.conf, /etc/apache2/vhost.d/*.conf<br>\n2. Добавить строки:\n<pre>\n&lt;IfModule headers_module&gt;\n	Header set X-Content-Type-Options nosniff\n&lt;/IfModule&gt;\n</pre>\n3. Перезапустить Apache<br>\n4. Убедиться, что он корректно обрабатывается Apache и этот заголовок никто не переопределяет<br>\nПодробнее об этой директиве можно прочесть в документации к Apache: <a href=\"http://httpd.apache.org/docs/2.2/mod/mod_headers.html\" target=\"_blank\">Apache Module mod_headers</a>\n</p>\";s:15:\"additional_info\";s:2783:\"Адрес: <a href=\"http://harmony.bosjack.in.ua/bitrix/js/main/core/core.js?rnd=0.61178521404\" target=\"_blank\">http://harmony.bosjack.in.ua/bitrix/js/main/core/core.js?rnd=0.61178521404</a><br>Запрос/Ответ: <pre>GET /bitrix/js/main/core/core.js?rnd=0.61178521404 HTTP/1.1\nhost: harmony.bosjack.in.ua\naccept: */*\nuser-agent: BitrixCloud BitrixSecurityScanner/Robin-Scooter\n\nHTTP/1.1 200 OK\nServer: nginx\nDate: Tue, 02 Feb 2016 13:58:51 GMT\nContent-Type: application/x-javascript\nContent-Length: 110032\nConnection: keep-alive\nLast-Modified: Wed, 04 Nov 2015 20:49:57 GMT\nETag: &quot;563a6f75-1add0&quot;\nAccept-Ranges: bytes\n\n/**********************************************************************/\n/*********** Bitrix JS Core library ver 0.9.0 beta ********************/\n/**********************************************************************/\n\n;(function(window){\n\nif (!!window.BX &amp;&amp; !!window.BX.extend)\n	return;\n\nvar _bxtmp;\nif (!!window.BX)\n{\n	_bxtmp = window.BX;\n}\n\nwindow.BX = function(node, bCache)\n{\n	if (BX.type.isNotEmptyString(node))\n	{\n		var ob;\n\n		if (!!bCache &amp;&amp; null != NODECACHE[node])\n			ob = NODECACHE[node];\n		ob = ob || document.getElementById(node);\n		if (!!bCache)\n			NODECACHE[node] = ob;\n\n		return ob;\n	}\n	else if (BX.type.isDomNode(node))\n		return node;\n	else if (BX.type.isFunction(node))\n		return BX.ready(node);\n\n	return null;\n};\n\n// language utility\nBX.message = function(mess)\n{\n	if (BX.type.isString(mess))\n	{\n		if (typeof BX.message[mess] == &quot;undefined&quot;)\n		{\n			BX.onCustomEvent(&quot;onBXMessageNotFound&quot;, [mess]);\n			if (typeof BX.message[mess] == &quot;undefined&quot;)\n			{\n				BX.debug(&quot;message undefined: &quot; + mess);\n				BX.message[mess] = &quot;&quot;;\n			}\n\n		}\n\n		return BX.message[mess];\n	}\n	else\n	{\n		for (var i in mess)\n		{\n			if (mess.hasOwnProperty(i))\n			{\n				BX.message[i] = mess[i];\n			}\n		}\n		return true;\n	}\n};\n\nif(!!_bxtmp)\n{\n	for(var i in _bxtmp)\n	{\n		if(_bxtmp.hasOwnProperty(i))\n		{\n			if(!BX[i])\n			{\n				BX[i]=_bxtmp[i];\n			}\n			else if(i==\'message\')\n			{\n				for(var j in _bxtmp[i])\n				{\n					if(_bxtmp[i].hasOwnProperty(j))\n					{\n						BX.message[j]=_bxtmp[i][j];\n					}\n				}\n			}\n		}\n	}\n\n	_bxtmp = null;\n}\n\nvar\n\n/* ready */\n__readyHandler = null,\nreadyBound = false,\nreadyList = [],\n\n/* list of registered proxy functions */\nproxySalt = Math.random(),\nproxyId = 1,\nproxyList = [],\n\n/* getElementById cache */\nNODECACHE = {},\n\n/* List of denied event handlers */\ndeniedEvents = [],\n\n/* list of registered event handlers */\neventsList = [],\n\n/* list of registered custom events */\ncustomEvents = {},\n\n/* list of external garbage collectors */\ngarbageCollectors = [],\n\n/* list of loaded CSS files */\ncssList = [],\ncssInit = false,\n\n/* list\n----------Only 2Kb of body shown----------<pre>\";}i:12;a:5:{s:5:\"title\";s:20:\"Включен вывод ошибок\";s:8:\"critical\";s:3:\"LOW\";s:6:\"detail\";s:109:\"Вывод ошибок предназначен для разработки и тестовых стендов, он не должен использоваться на конечном ресурсе.\";s:14:\"recommendation\";s:60:\"Необходимо в настройках php указать:<br>display_errors = Off\";s:15:\"additional_info\";s:0:\"\";}}');
-- -----------------------------------
-- Dumping table b_seo_adv_autolog
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_autolog`;
CREATE TABLE `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT '0',
  `SUCCESS` char(1) DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_seo_adv_banner
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_banner`;
CREATE TABLE `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) NOT NULL,
  `OWNER_NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `XML_ID` varchar(255) NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SETTINGS` text,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_seo_adv_campaign
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_campaign`;
CREATE TABLE `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) NOT NULL,
  `OWNER_NAME` varchar(255) NOT NULL,
  `XML_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_seo_adv_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_group`;
CREATE TABLE `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) NOT NULL,
  `OWNER_NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `XML_ID` varchar(255) NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SETTINGS` text,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_seo_adv_link
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_link`;
CREATE TABLE `b_seo_adv_link` (
  `LINK_TYPE` char(1) NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_seo_adv_log
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_log`;
CREATE TABLE `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REQUEST_URI` varchar(100) NOT NULL,
  `REQUEST_DATA` text,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_seo_adv_order
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_order`;
CREATE TABLE `b_seo_adv_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_seo_adv_region
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_region`;
CREATE TABLE `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) NOT NULL,
  `OWNER_NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `XML_ID` varchar(255) NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SETTINGS` text,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_seo_keywords
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_keywords`;
CREATE TABLE `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `KEYWORDS` text,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_seo_search_engine
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_search_engine`;
CREATE TABLE `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `SORT` int(5) DEFAULT '100',
  `NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `SETTINGS` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251;

INSERT INTO `b_seo_search_engine` VALUES
(1, 'google', 'Y', 200, 'Google', '868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com', 'EItMlJpZLC2WRPKB6QsA5bV9', 'urn:ietf:wg:oauth:2.0:oob', NULL),
(2, 'yandex', 'Y', 300, 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', NULL),
(3, 'yandex_direct', 'Y', 400, 'Yandex.Direct', '', '', 'https://oauth.yandex.ru/verification_code', '');
-- -----------------------------------
-- Dumping table b_seo_sitemap
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_sitemap`;
CREATE TABLE `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SITE_ID` char(2) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `NAME` varchar(255) DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_seo_sitemap_entity
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_entity`;
CREATE TABLE `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_seo_sitemap_iblock
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_iblock`;
CREATE TABLE `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_seo_sitemap_runtime
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_runtime`;
CREATE TABLE `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_seo_yandex_direct_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_yandex_direct_stat`;
CREATE TABLE `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int(7) DEFAULT '0',
  `CLICKS_SEARCH` int(7) DEFAULT '0',
  `CLICKS_CONTEXT` int(7) DEFAULT '0',
  `SHOWS` int(7) DEFAULT '0',
  `SHOWS_SEARCH` int(7) DEFAULT '0',
  `SHOWS_CONTEXT` int(7) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_short_uri
-- -----------------------------------
DROP TABLE IF EXISTS `b_short_uri`;
CREATE TABLE `b_short_uri` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URI` varchar(250) NOT NULL,
  `URI_CRC` int(18) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(18) NOT NULL,
  `STATUS` int(18) NOT NULL DEFAULT '301',
  `MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LAST_USED` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `NUMBER_USED` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_site_template
-- -----------------------------------
DROP TABLE IF EXISTS `b_site_template`;
CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `CONDITION` varchar(255) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SITE_TEMPLATE` (`SITE_ID`,`CONDITION`,`TEMPLATE`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

INSERT INTO `b_site_template` VALUES
(1, 's1', '', 1, 'main');
-- -----------------------------------
-- Dumping table b_smile
-- -----------------------------------
DROP TABLE IF EXISTS `b_smile`;
CREATE TABLE `b_smile` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) NOT NULL DEFAULT 'S',
  `SET_ID` int(18) NOT NULL DEFAULT '0',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `TYPING` varchar(100) DEFAULT NULL,
  `CLICKABLE` char(1) NOT NULL DEFAULT 'Y',
  `IMAGE` varchar(255) NOT NULL,
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  `HIDDEN` char(1) NOT NULL DEFAULT 'N',
  `IMAGE_DEFINITION` varchar(10) NOT NULL DEFAULT 'SD',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=cp1251;

INSERT INTO `b_smile` VALUES
(23, 'S', 3, 100, ':) :-)', 'Y', 'bx_smile_smile.png', 20, 20, 'N', 'UHD'),
(24, 'S', 3, 105, ';) ;-)', 'Y', 'bx_smile_wink.png', 20, 20, 'N', 'UHD'),
(25, 'S', 3, 110, ':D :-D', 'Y', 'bx_smile_biggrin.png', 20, 20, 'N', 'UHD'),
(26, 'S', 3, 115, '8) 8-)', 'Y', 'bx_smile_cool.png', 20, 20, 'N', 'UHD'),
(27, 'S', 3, 120, ':facepalm:', 'Y', 'bx_smile_facepalm.png', 20, 20, 'N', 'UHD'),
(28, 'S', 3, 125, ':{} :-{}', 'Y', 'bx_smile_kiss.png', 20, 20, 'N', 'UHD'),
(29, 'S', 3, 130, ':( :-(', 'Y', 'bx_smile_sad.png', 20, 20, 'N', 'UHD'),
(30, 'S', 3, 135, ':| :-|', 'Y', 'bx_smile_neutral.png', 20, 20, 'N', 'UHD'),
(31, 'S', 3, 140, ':oops:', 'Y', 'bx_smile_redface.png', 20, 20, 'N', 'UHD'),
(32, 'S', 3, 145, ':cry: :~(', 'Y', 'bx_smile_cry.png', 20, 20, 'N', 'UHD'),
(33, 'S', 3, 150, ':evil: >:-<', 'Y', 'bx_smile_evil.png', 20, 20, 'N', 'UHD'),
(34, 'S', 3, 155, ':o :-o :shock:', 'Y', 'bx_smile_eek.png', 20, 20, 'N', 'UHD'),
(35, 'S', 3, 160, ':/ :-/', 'Y', 'bx_smile_confuse.png', 20, 20, 'N', 'UHD'),
(36, 'S', 3, 165, ':idea:', 'Y', 'bx_smile_idea.png', 20, 20, 'N', 'UHD'),
(37, 'S', 3, 170, ':?:', 'Y', 'bx_smile_question.png', 20, 20, 'N', 'UHD'),
(38, 'S', 3, 175, ':!:', 'Y', 'bx_smile_exclaim.png', 20, 20, 'N', 'UHD'),
(39, 'S', 3, 180, ':like:', 'Y', 'bx_smile_like.png', 20, 20, 'N', 'UHD'),
(40, 'I', 3, 175, 'ICON_NOTE', 'Y', 'bx_icon_1.gif', 15, 15, 'N', 'SD'),
(41, 'I', 3, 180, 'ICON_DIRRECTION', 'Y', 'bx_icon_2.gif', 15, 15, 'N', 'SD'),
(42, 'I', 3, 185, 'ICON_IDEA', 'Y', 'bx_icon_3.gif', 15, 15, 'N', 'SD'),
(43, 'I', 3, 190, 'ICON_ATTANSION', 'Y', 'bx_icon_4.gif', 15, 15, 'N', 'SD'),
(44, 'I', 3, 195, 'ICON_QUESTION', 'Y', 'bx_icon_5.gif', 15, 15, 'N', 'SD'),
(45, 'I', 3, 200, 'ICON_BAD', 'Y', 'bx_icon_6.gif', 15, 15, 'N', 'SD'),
(46, 'I', 3, 205, 'ICON_GOOD', 'Y', 'bx_icon_7.gif', 15, 15, 'N', 'SD'),
(47, 'S', 5, 30, ':D :-D', 'Y', 'icon_biggrin.png', 16, 16, 'N', 'SD'),
(48, 'S', 5, 10, ':) :-)', 'Y', 'icon_smile.png', 16, 16, 'N', 'SD'),
(49, 'S', 5, 50, ':( :-(', 'Y', 'icon_sad.png', 16, 16, 'N', 'SD'),
(50, 'S', 5, 90, ':o :-o :shock:', 'Y', 'icon_eek.png', 16, 16, 'N', 'SD'),
(51, 'S', 5, 40, '8) 8-)', 'Y', 'icon_cool.png', 16, 16, 'N', 'SD'),
(52, 'S', 5, 110, ':{} :-{}', 'Y', 'icon_kiss.png', 16, 16, 'N', 'SD'),
(53, 'S', 5, 100, ':oops:', 'Y', 'icon_redface.png', 16, 16, 'N', 'SD'),
(54, 'S', 5, 70, ':cry: :~(', 'Y', 'icon_cry.png', 16, 16, 'N', 'SD'),
(55, 'S', 5, 80, ':evil: >:-<', 'Y', 'icon_evil.png', 16, 16, 'N', 'SD'),
(56, 'S', 5, 20, ';) ;-)', 'Y', 'icon_wink.png', 16, 16, 'N', 'SD'),
(57, 'S', 5, 130, ':!:', 'Y', 'icon_exclaim.png', 16, 16, 'N', 'SD'),
(58, 'S', 5, 120, ':?:', 'Y', 'icon_question.png', 16, 16, 'N', 'SD'),
(59, 'S', 5, 140, ':idea:', 'Y', 'icon_idea.png', 16, 16, 'N', 'SD'),
(60, 'S', 5, 60, ':| :-|', 'Y', 'icon_neutral.png', 16, 16, 'N', 'SD'),
(61, 'S', 5, 60, ':\\  :-\\  :/ :-/', 'Y', 'icon_confuse.png', 16, 16, 'N', 'SD'),
(62, 'I', 5, 150, 'ICON_NOTE', 'Y', 'icon1.gif', 15, 15, 'N', 'SD'),
(63, 'I', 5, 150, 'ICON_DIRRECTION', 'Y', 'icon2.gif', 15, 15, 'N', 'SD'),
(64, 'I', 5, 150, 'ICON_IDEA', 'Y', 'icon3.gif', 15, 15, 'N', 'SD'),
(65, 'I', 5, 150, 'ICON_ATTANSION', 'Y', 'icon4.gif', 15, 15, 'N', 'SD'),
(66, 'I', 5, 150, 'ICON_QUESTION', 'Y', 'icon5.gif', 15, 15, 'N', 'SD'),
(67, 'I', 5, 150, 'ICON_BAD', 'Y', 'icon6.gif', 15, 15, 'N', 'SD'),
(68, 'I', 5, 150, 'ICON_GOOD', 'Y', 'icon7.gif', 15, 15, 'N', 'SD');
-- -----------------------------------
-- Dumping table b_smile_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_smile_lang`;
CREATE TABLE `b_smile_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=cp1251;

INSERT INTO `b_smile_lang` VALUES
(33, 'P', 2, 'ru', 'Стандартная галерея'),
(34, 'P', 2, 'en', 'Standard gallery'),
(35, 'G', 3, 'ru', 'Основной набор'),
(36, 'G', 3, 'en', 'Default pack'),
(37, 'S', 23, 'ru', 'С улыбкой'),
(38, 'S', 23, 'en', 'Smile'),
(39, 'S', 24, 'ru', 'Шутливо'),
(40, 'S', 24, 'en', 'Wink'),
(41, 'S', 25, 'ru', 'Широкая улыбка'),
(42, 'S', 25, 'en', 'Big grin'),
(43, 'S', 26, 'ru', 'Здорово'),
(44, 'S', 26, 'en', 'Cool'),
(45, 'S', 27, 'ru', 'Разочарование'),
(46, 'S', 27, 'en', 'Facepalm'),
(47, 'S', 28, 'ru', 'Поцелуй'),
(48, 'S', 28, 'en', 'Kiss'),
(49, 'S', 29, 'ru', 'Печально'),
(50, 'S', 29, 'en', 'Sad'),
(51, 'S', 30, 'ru', 'Скептически'),
(52, 'S', 30, 'en', 'Skeptic'),
(53, 'S', 31, 'ru', 'Смущенный'),
(54, 'S', 31, 'en', 'Embarrassed'),
(55, 'S', 32, 'ru', 'Очень грустно'),
(56, 'S', 32, 'en', 'Crying'),
(57, 'S', 33, 'ru', 'Со злостью'),
(58, 'S', 33, 'en', 'Angry'),
(59, 'S', 34, 'ru', 'Удивленно'),
(60, 'S', 34, 'en', 'Surprised'),
(61, 'S', 35, 'ru', 'Смущенно'),
(62, 'S', 35, 'en', 'Confused'),
(63, 'S', 36, 'ru', 'Идея'),
(64, 'S', 36, 'en', 'Idea'),
(65, 'S', 37, 'ru', 'Вопрос'),
(66, 'S', 37, 'en', 'Question'),
(67, 'S', 38, 'ru', 'Восклицание'),
(68, 'S', 38, 'en', 'Exclamation'),
(69, 'S', 39, 'ru', 'Нравится'),
(70, 'S', 39, 'en', 'Like'),
(71, 'P', 4, 'en', 'Forum Gallery'),
(72, 'P', 4, 'ru', 'Галерея смайлов форума'),
(73, 'G', 5, 'en', 'Forum emoticons'),
(74, 'G', 5, 'ru', 'Набор смайлов форума'),
(75, 'S', 47, 'en', 'Big grin'),
(76, 'S', 47, 'ru', 'Широкая улыбка'),
(77, 'S', 48, 'en', 'Smile'),
(78, 'S', 48, 'ru', 'С улыбкой'),
(79, 'S', 49, 'en', 'Sad'),
(80, 'S', 49, 'ru', 'Печально'),
(81, 'S', 50, 'en', 'Surprised'),
(82, 'S', 50, 'ru', 'Удивленно'),
(83, 'S', 51, 'en', 'Cool'),
(84, 'S', 51, 'ru', 'Здорово'),
(85, 'S', 52, 'en', 'Kiss'),
(86, 'S', 52, 'ru', 'Поцелуй'),
(87, 'S', 53, 'en', 'Embaressed'),
(88, 'S', 53, 'ru', 'Смущенно'),
(89, 'S', 54, 'en', 'Crying'),
(90, 'S', 54, 'ru', 'Очень грустно'),
(91, 'S', 55, 'en', 'Angry'),
(92, 'S', 55, 'ru', 'Со злостью'),
(93, 'S', 56, 'en', 'Wink'),
(94, 'S', 56, 'ru', 'Шутливо'),
(95, 'S', 57, 'en', 'Exclamation'),
(96, 'S', 57, 'ru', 'Восклицание'),
(97, 'S', 58, 'en', 'Question'),
(98, 'S', 58, 'ru', 'Вопрос'),
(99, 'S', 59, 'en', 'Idea'),
(100, 'S', 59, 'ru', 'Идея'),
(101, 'S', 60, 'en', 'Speechless'),
(102, 'S', 60, 'ru', 'Нет слов'),
(103, 'S', 61, 'en', 'Skeptical'),
(104, 'S', 61, 'ru', 'Озадаченно'),
(105, 'S', 62, 'en', 'Note'),
(106, 'S', 62, 'ru', 'Заметка'),
(107, 'S', 63, 'en', 'Direction'),
(108, 'S', 63, 'ru', 'Направление'),
(109, 'S', 64, 'en', 'Idea'),
(110, 'S', 64, 'ru', 'Идея'),
(111, 'S', 65, 'en', 'Attention'),
(112, 'S', 65, 'ru', 'Внимание'),
(113, 'S', 66, 'en', 'Question'),
(114, 'S', 66, 'ru', 'Вопрос'),
(115, 'S', 67, 'en', 'Thumbs Down'),
(116, 'S', 67, 'ru', 'Плохо'),
(117, 'S', 68, 'en', 'Thumbs Up'),
(118, 'S', 68, 'ru', 'Хорошо');
-- -----------------------------------
-- Dumping table b_smile_set
-- -----------------------------------
DROP TABLE IF EXISTS `b_smile_set`;
CREATE TABLE `b_smile_set` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STRING_ID` varchar(255) DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT '150',
  `TYPE` char(1) NOT NULL DEFAULT 'G',
  `PARENT_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251;

INSERT INTO `b_smile_set` VALUES
(2, 'bitrix', 150, 'P', 0),
(3, 'bitrix_main', 150, 'G', 2),
(4, 'bitrix_forum', 400, 'P', 0),
(5, 'bitrix_forum_main', 150, 'G', 4);
-- -----------------------------------
-- Dumping table b_socialservices_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_message`;
CREATE TABLE `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) NOT NULL,
  `MESSAGE` varchar(1000) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_socialservices_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_user`;
CREATE TABLE `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `LAST_NAME` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) NOT NULL,
  `CAN_DELETE` char(1) NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) DEFAULT NULL,
  `PERMISSIONS` varchar(555) DEFAULT NULL,
  `OATOKEN` varchar(1000) DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` varchar(250) DEFAULT NULL,
  `REFRESH_TOKEN` varchar(1000) DEFAULT NULL,
  `SEND_ACTIVITY` char(1) DEFAULT 'Y',
  `SITE_ID` varchar(50) DEFAULT NULL,
  `INITIALIZED` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_1` (`USER_ID`),
  KEY `IX_B_SOCIALSERVICES_US_2` (`INITIALIZED`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_socialservices_user_link
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_user_link`;
CREATE TABLE `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) NOT NULL,
  `LINK_NAME` varchar(255) DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) DEFAULT NULL,
  `LINK_PICTURE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sticker
-- -----------------------------------
DROP TABLE IF EXISTS `b_sticker`;
CREATE TABLE `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) DEFAULT NULL,
  `PAGE_URL` varchar(255) NOT NULL,
  `PAGE_TITLE` varchar(255) NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) NOT NULL DEFAULT 'N',
  `CONTENT` text,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) NOT NULL DEFAULT 'N',
  `CLOSED` char(1) NOT NULL DEFAULT 'N',
  `DELETED` char(1) NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_sticker_group_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_sticker_group_task`;
CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_subscription
-- -----------------------------------
DROP TABLE IF EXISTS `b_subscription`;
CREATE TABLE `b_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `EMAIL` varchar(255) NOT NULL,
  `FORMAT` varchar(4) NOT NULL DEFAULT 'text',
  `CONFIRM_CODE` varchar(8) DEFAULT NULL,
  `CONFIRMED` char(1) NOT NULL DEFAULT 'N',
  `DATE_CONFIRM` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SUBSCRIPTION_EMAIL` (`EMAIL`,`USER_ID`),
  KEY `IX_DATE_CONFIRM` (`CONFIRMED`,`DATE_CONFIRM`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_subscription_rubric
-- -----------------------------------
DROP TABLE IF EXISTS `b_subscription_rubric`;
CREATE TABLE `b_subscription_rubric` (
  `SUBSCRIPTION_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_SUBSCRIPTION_RUBRIC` (`SUBSCRIPTION_ID`,`LIST_RUBRIC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_task`;
CREATE TABLE `b_task` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `LETTER` char(1) DEFAULT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `SYS` char(1) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `BINDING` varchar(50) DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=cp1251;

INSERT INTO `b_task` VALUES
(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
(12, 'catalog_denied', 'D', 'catalog', 'Y', NULL, 'module'),
(13, 'catalog_read', 'R', 'catalog', 'Y', NULL, 'module'),
(14, 'catalog_price_edit', 'T', 'catalog', 'Y', NULL, 'module'),
(15, 'catalog_store_edit', 'S', 'catalog', 'Y', NULL, 'module'),
(16, 'catalog_export_import', 'U', 'catalog', 'Y', NULL, 'module'),
(17, 'catalog_full_access', 'W', 'catalog', 'Y', NULL, 'module'),
(18, 'clouds_denied', 'D', 'clouds', 'Y', NULL, 'module'),
(19, 'clouds_browse', 'F', 'clouds', 'Y', NULL, 'module'),
(20, 'clouds_upload', 'U', 'clouds', 'Y', NULL, 'module'),
(21, 'clouds_full_access', 'W', 'clouds', 'Y', NULL, 'module'),
(22, 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'),
(23, 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'),
(24, 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'),
(25, 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'),
(26, 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'),
(27, 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'),
(28, 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'),
(29, 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'),
(30, 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'),
(31, 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'),
(32, 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'),
(33, 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'),
(34, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
(35, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
(36, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
(37, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
(38, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
(39, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
(40, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
(41, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
(42, 'security_denied', 'D', 'security', 'Y', NULL, 'module'),
(43, 'security_filter', 'F', 'security', 'Y', NULL, 'module'),
(44, 'security_otp', 'S', 'security', 'Y', NULL, 'module'),
(45, 'security_view_all_settings', 'T', 'security', 'Y', NULL, 'module'),
(46, 'security_full_access', 'W', 'security', 'Y', NULL, 'module'),
(47, 'seo_denied', 'D', 'seo', 'Y', '', 'module'),
(48, 'seo_edit', 'F', 'seo', 'Y', '', 'module'),
(49, 'seo_full_access', 'W', 'seo', 'Y', '', 'module');
-- -----------------------------------
-- Dumping table b_task_operation
-- -----------------------------------
DROP TABLE IF EXISTS `b_task_operation`;
CREATE TABLE `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_task_operation` VALUES
(2, 2),
(2, 3),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 2),
(5, 3),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(8, 19),
(8, 20),
(8, 21),
(9, 19),
(9, 20),
(9, 21),
(9, 22),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(10, 23),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(11, 19),
(11, 20),
(11, 21),
(11, 24),
(11, 28),
(13, 36),
(14, 36),
(14, 37),
(14, 38),
(14, 39),
(14, 40),
(14, 41),
(14, 42),
(15, 36),
(15, 37),
(15, 41),
(15, 42),
(15, 43),
(16, 36),
(16, 44),
(16, 45),
(16, 46),
(16, 47),
(17, 36),
(17, 37),
(17, 38),
(17, 39),
(17, 40),
(17, 41),
(17, 42),
(17, 43),
(17, 44),
(17, 45),
(17, 46),
(17, 47),
(17, 48),
(17, 49),
(19, 50),
(20, 50),
(20, 51),
(21, 50),
(21, 51),
(21, 52),
(23, 55),
(23, 56),
(23, 57),
(23, 58),
(23, 59),
(23, 60),
(23, 61),
(23, 63),
(23, 64),
(24, 53),
(24, 54),
(24, 55),
(24, 56),
(24, 57),
(24, 58),
(24, 59),
(24, 60),
(24, 61),
(24, 62),
(24, 63),
(24, 64),
(24, 65),
(26, 66),
(27, 66),
(27, 67),
(27, 71),
(28, 66),
(28, 71),
(28, 72),
(28, 73),
(29, 66),
(29, 67),
(29, 68),
(29, 69),
(29, 71),
(29, 72),
(29, 73),
(30, 66),
(30, 67),
(30, 68),
(30, 69),
(30, 70),
(30, 71),
(30, 72),
(30, 73),
(32, 74),
(33, 74),
(33, 75),
(33, 76),
(33, 77),
(35, 78),
(35, 79),
(36, 80),
(37, 78),
(37, 79),
(37, 81),
(38, 78),
(38, 79),
(38, 80),
(38, 81),
(39, 78),
(39, 79),
(39, 80),
(39, 81),
(39, 82),
(39, 83),
(39, 84),
(39, 85),
(40, 78),
(40, 79),
(40, 80),
(40, 81),
(40, 82),
(40, 83),
(40, 84),
(40, 85),
(40, 86),
(40, 87),
(40, 88),
(40, 89),
(41, 78),
(41, 79),
(41, 80),
(41, 81),
(41, 82),
(41, 83),
(41, 84),
(41, 85),
(41, 86),
(41, 87),
(41, 88),
(41, 89),
(41, 90),
(41, 91),
(41, 92),
(41, 93),
(41, 94),
(41, 95),
(43, 96),
(44, 97),
(45, 98),
(45, 99),
(45, 100),
(45, 101),
(45, 102),
(45, 103),
(45, 104),
(45, 105),
(45, 106),
(45, 107),
(45, 108),
(46, 96),
(46, 97),
(46, 98),
(46, 99),
(46, 100),
(46, 101),
(46, 102),
(46, 103),
(46, 104),
(46, 105),
(46, 106),
(46, 107),
(46, 108),
(46, 109),
(46, 110),
(46, 111),
(46, 112),
(46, 113),
(46, 114),
(46, 115),
(46, 116),
(46, 117),
(46, 118),
(46, 119),
(46, 120),
(46, 121),
(48, 123),
(49, 122),
(49, 123);
-- -----------------------------------
-- Dumping table b_undo
-- -----------------------------------
DROP TABLE IF EXISTS `b_undo`;
CREATE TABLE `b_undo` (
  `ID` varchar(255) NOT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `UNDO_TYPE` varchar(50) DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) DEFAULT NULL,
  `CONTENT` mediumtext,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_undo` VALUES
('243793f57dea182e39780ea55789ee672', 'main', 'autosave', 'CAutoSave::_Restore', 'a:19:{s:4:\"edit\";s:1:\"Y\";s:2:\"ID\";s:4:\"main\";s:4:\"NAME\";s:15:\"Основной шаблон\";s:11:\"DESCRIPTION\";s:15:\"Основной шаблон\";s:4:\"SORT\";s:0:\"\";s:4:\"TYPE\";s:0:\"\";s:7:\"CONTENT\";s:9081:\"<!doctype html>\n<html class=\"no-js\" lang=\"\">\n    <head>\n        <meta charset=\"utf-8\">\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n        <title><?$APPLICATION->ShowTitle()?></title>\n        <meta name=\"description\" content=\"\">\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n		<link rel=\"icon\" type=\"image/png\" href=\"favicon.png\" />\n		<link rel=\"shortcut icon\" href=\"favicon.png\" type=\"image/png\" />\n        <link rel=\"apple-touch-icon\" href=\"apple-touch-icon.png\">\n		<noscript><link href=\'http://fonts.googleapis.com/css?family=PT+Sans:400,700&subset=cyrillic,latin\' rel=\'stylesheet\' type=\'text/css\'></noscript>\n	    <link rel=\"stylesheet\" href=\"/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/css/fontello.css\">\n	    <!--[if IE 7]><link rel=\"stylesheet\" href=\"/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/css/fontello-ie7.css\"><![endif]-->\n        <link rel=\"stylesheet\" href=\"/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/css/bootstrap.css\">\n        <link rel=\"stylesheet\" href=\"/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/css/bootstrap-theme.min.css\">\n		<?$APPLICATION->ShowHead()?>\n\n        <!--[if lt IE 9]>\n            <script src=\"/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/js/vendor/html5-3.6-respond-1.4.2.min.js\"></script>\n        <![endif]-->\n		<link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css\">\n		<script src=\"//code.jquery.com/jquery-1.10.2.js\"></script>\n		<script src=\"//code.jquery.com/ui/1.11.4/jquery-ui.js\"></script>\n		<script src=\"/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/js/vendor/jquery.maskedinput.min.js\"></script>\n    </head>\n    <body>\n		<?$APPLICATION->ShowPanel();?>\n        <!--[if lt IE 8]>\n            <p class=\"browserupgrade\">Вы используете <strong>очень</strong> старую версию браузера. Пожалуйста <a href=\"http://browsehappy.com/\">обновите его</a> для корректного отображения современных сайтов.</p>\n        <![endif]-->\n	\n	<!-- Верхнее меню -->		\n    <nav class=\"navbar hnav\" role=\"navigation\">\n      <div class=\"container\">\n        <div class=\"logo-container\">\n          \n		  <div class=\"logo\">\n          	<a href=\"/\"><img src=\"/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/img/harmony-logo.png\"></a>\n		  </div>\n          \n        </div>\n		\n		<!-- Кнопка отображения меню для смартфонов -->	\n        <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar\" aria-expanded=\"false\" aria-controls=\"navbar\" style=\"color: #000; position: relative; z-index: 99;\">\n          <span class=\"sr-only\">Меню</span>\n          <span class=\"icon-bar\"></span>\n          <span class=\"icon-bar\"></span>\n          <span class=\"icon-bar\"></span>\n        </button>\n		\n		<!-- Скрывающаяся область адаптивного меню -->	\n		<div class=\"menu-container\">\n        	<div id=\"navbar\" class=\"navbar-collapse collapse text-right \">\n<?$APPLICATION->IncludeComponent(\"bitrix:menu\", \".default\", Array(\n	\"ROOT_MENU_TYPE\" => \"top\",	// Тип меню для первого уровня\n		\"MENU_CACHE_TYPE\" => \"A\",	// Тип кеширования\n		\"MENU_CACHE_TIME\" => \"3600\",	// Время кеширования (сек.)\n		\"MENU_CACHE_USE_GROUPS\" => \"Y\",	// Учитывать права доступа\n		\"MENU_CACHE_GET_VARS\" => \"\",	// Значимые переменные запроса\n		\"MAX_LEVEL\" => \"1\",	// Уровень вложенности меню\n		\"CHILD_MENU_TYPE\" => \"submenu\",	// Тип меню для остальных уровней\n		\"USE_EXT\" => \"Y\",	// Подключать файлы с именами вида .тип_меню.menu_ext.php\n		\"DELAY\" => \"Y\",	// Откладывать выполнение шаблона меню\n		\"ALLOW_MULTI_SELECT\" => \"Y\",	// Разрешить несколько активных пунктов одновременно\n	),\n	false\n);?>\n        	</div><!--/.navbar-collapse -->\n		</div>	\n      </div>\n    </nav>\n\n    \n	<!-- Центральный контейнер -->	\n    <div class=\"container\">\n      \n      <div class=\"row\">\n		<!-- Правый сайдбар -->	  \n        <div class=\"col-md-4 sidebar\">\n          	<div class=\"phones\">\n<?$APPLICATION->IncludeComponent(\n	\"bitrix:main.include\", \n	\".default\", \n	array(\n		\"AREA_FILE_SHOW\" => \"sect\",\n		\"AREA_FILE_RECURSIVE\" => \"Y\",\n		\"AREA_FILE_SUFFIX\" => \"phone\",\n		\"EDIT_TEMPLATE\" => \"\"\n	),\n	false\n);?>\n			</div>\n			<!-- Карта в сайдбаре -->	 	\n			<div class=\"map\" id=\"mapid\">\n				\n			</div>	\n			\n			<div class=\"mapcaption\">\n				<a href=\"\" data-toggle=\"modal\" data-target=\".bs-example-modal-lg\">ул. Пермская, 34 на карте</a>\n			</div>\n			\n			<!-- Правый сайдбар -->	 	\n			<div class=\"side-menu\">\n				<ul class=\"nav nav-pills nav-stacked\">\n					<li><a href=\"/status/\" class=\"the-icons span3\"><i class=\"icon-tools\"></i>Узнать о готовности</a></li>\n				</ul>\n				<ul class=\"nav nav-pills nav-stacked\">		\n					<li><a href=\"\" class=\"the-icons span3\"><i class=\"icon-basket-alt\"></i>Сделать заказ</a></li>\n				</ul>	\n				<ul class=\"nav nav-pills nav-stacked\">	\n					<li class=\"text-center\"><h4><strong>Онлайн-консультанты:</strong></h4></li>\n					<li><a href=\"\" class=\"the-icons span3\"><i class=\"icon-box\"></i>Продажи<i class=\"icon-icq online\"></i></a></li>\n					<li><a href=\"\" class=\"the-icons span3\"><i class=\"icon-print\"></i>Сервис оргтехники<i class=\"icon-icq\"></i></a></li>\n					<li><a href=\"\" class=\"the-icons span3\"><i class=\"icon-desktop\"></i>Сервис компьютерной техники<i class=\"icon-icq\"></i></a></li>\n				</ul>	\n			</div>	\n			\n			\n        </div> <!-- конец сайдбара -->	\n		\n		<!-- Основной блок -->	 \n        <div class=\"col-md-8 mainfield\">#WORK_AREA#        </div>\n        \n       \n      </div>\n\n      \n\n      \n    </div> <!-- /container --> \n	\n	<!-- Подвал -->	    \n    <footer>\n		<div class=\"container\">\n			<div class=\"col-md-4\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.include\", \n	\".default\", \n	array(\n		\"AREA_FILE_SHOW\" => \"sect\",\n		\"AREA_FILE_RECURSIVE\" => \"Y\",\n		\"AREA_FILE_SUFFIX\" => \"copyright\",\n		\"EDIT_TEMPLATE\" => \"\"\n	),\n	false\n);?></div>	\n			<div class=\"col-md-4 counter\">\n      	  		<!-- counter -->\n			</div>\n			<div class=\"col-md-4 design\">\n      	  		<a href=\"http://www.senator.perm.ru\">&copy; Дизайн и разработка сайта:<br />\nИмиджевый центр «<span>Сенатор</span>», 2015.</a>\n			</div>\n		</div>	\n    </footer>\n	\n	\n  	<!-- Модальное окно с большой картой -->	\n\n 	 <div class=\"modal fade bs-example-modal-lg\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myLargeModalLabel\" aria-hidden=\"true\">\n   	 <div class=\"modal-dialog modal-lg\">\n     	 <div class=\"modal-content\">\n			<div class=\"modal-header\">\n		          <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n		          <h4 class=\"modal-title text-center\" id=\"gridSystemModalLabel\">Технический центр «Гармония»</h4>\n			  </div>\n			<div class=\"large-map\" id=\"largemap\">\n		\n			</div>\n			<div class=\"mapcaption\">\n				г. Пермь, ул. Пермская, 34\n			</div>	\n     	 </div>\n   	 </div>\n  	</div>\n  	<!-- Конец модального окна -->\n	<!-- Конец подвала -->	\n	\n	   <script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js\"></script>\n        <script>window.jQuery || document.write(\'<script src=\"/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/js/vendor/jquery-1.11.2.min.js\"><\\/script>\')</script>\n\n        <script src=\"/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/js/vendor/bootstrap.min.js\"></script>\n  \n	   \n	   \n        <script src=\"/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/js/plugins.js\"></script>\n        <script src=\"/bitrix/templates/<? echo SITE_TEMPLATE_ID;?>/js/main.js\"></script>\n		\n		<!-- Яндекс карты -->					\n		<script type=\'text/javascript\' src=\'http://api-maps.yandex.ru/2.1/?load=package.full&#038;lang=ru-RU&#038;ver=3.9.2\'></script>	\n		<!-- Карта в сайдбаре -->\n 	    <script type=\"text/javascript\">\n 	   		//<![CDATA[\n 	   		ymaps.ready(VasuMap);\n 	   		function VasuMap(){var YMapId = document.getElementById(\"mapid\");var l_YMapId = YMapId.id;var l_YaMap1 = new ymaps.Map(l_YMapId,{center: [58.014325,56.254484], type:\'yandex#map\', zoom:16, controls:[]},{maxZoom:17, minZoom:0}); var l_collection = new ymaps.GeoObjectCollection();var l_Placemark = new ymaps.Placemark([58.014325,56.254484],{},{preset:\"islands#dotIcon\",iconColor:\"#007330\"});\n 	   			var x = \'Технический центр «Гармония»\'; \n 	   			l_Placemark.properties.set(\"balloonContent\",x)\n 	   			l_collection.add(l_Placemark);\n 	   			if (l_collection.getLength()>0){\n 	   					 l_YaMap1.geoObjects.add(l_collection);\n 	   			}\n 	   			};\n 	   			//]]&gt;\n 		</script>\n		<!-- Большая карта в модальном окне -->\n		<script type=\"text/javascript\">\n			//<![CDATA[\n			ymaps.ready(VasuMap);\n			function VasuMap(){var YMapId = document.getElementById(\"largemap\");var l_YMapId = YMapId.id;var l_YaMap1 = new ymaps.Map(l_YMapId,{center: [58.014325,56.254484], type:\'yandex#map\', zoom:16, controls:[]},{maxZoom:17, minZoom:0}); var l_collection = new ymaps.GeoObjectCollection();var l_Placemark = new ymaps.Placemark([58.014325,56.254484],{},{preset:\"islands#dotIcon\",iconColor:\"#007330\"});\n			var x = \'Технический центр «Гармония»\'; \n			l_Placemark.properties.set(\"balloonContent\",x)\n			l_collection.add(l_Placemark);\n			if (l_collection.getLength()>0){\n				  	   	l_YaMap1.geoObjects.add(l_collection);\n			}\n			};\n			//]]&gt;\n		</script>			\n    </body>\n</html>\n\";s:6:\"STYLES\";s:0:\"\";s:6:\"CODE_0\";s:0:\"\";s:7:\"VALUE_0\";s:0:\"\";s:6:\"maxind\";s:1:\"0\";s:11:\"styles_path\";s:69:\"/home/bosjack/bosjack.in.ua/harmony/bitrix/templates/main/.styles.php\";s:12:\"propeditmore\";s:0:\"\";s:15:\"TEMPLATE_STYLES\";s:8516:\".red {\n	color: red;\n}\n\n/* ==========================================================================\n   Author\'s custom styles\n   ========================================================================== */\n\n\nbody {border-top: 3px #35ab66 solid; background: #fff; font-family: \'PT Sans\', sans-serif !important; color: #555;}\na {text-decoration: underline;}\na:link, a:visited  {color: #2999c5;}\na:hover {color: #19b2ee;}\nfooter {border-top: 1px #efefef solid; font-size: 1em; margin-top: 3em;}\nfooter .container {border-top: 3px #efefef solid; padding: 2em 0;}\n.design a {text-decoration: none; color: #333;}\n.design a span {text-decoration: underline; color: #2999c5;}\n.design a:hover span {color: #19b2ee;}\n.hnav {background: url(\'img/stripes.gif\') #f8f8f8; border-top: none !important; border-radius: 0 !important; border-bottom: 2px #efefef solid; min-height: 0 !important; position: relative; }\n.logo-container {float: left; width: 250px; display: block;}\n.menu-container {float: right; width: 100%; display: block;}\n.navbar-toggle {float: right; width: 50px; padding: 15px 9px;}\n#navbar {font-size: 1.4em; line-height: 1.4em;}\n.navbar-collapse {padding: 0;}\n.design, .counter { margin-top: 0.5em;}\n\n/* ==========================================================================\n   Добавлено от 6.06.2015\n   ========================================================================== */\n   \n/* ==========================================================================\n   Добавлено от 11.09.2015\n   ========================================================================== */\n\n   .STable {border: 2px #35ab66 solid; text-align: left; display: table; width: 100%; margin: 1em 0}\n   .STable label {clear: both; width: 100%; position: relative;}\n   .SCell {padding: 0.5em 1em; display: table-cell;}\n   .SRow {display: table-row; width: 100%; position: relative; border-bottom:  1px #35ab66 solid; }\n   .SRow:last {border-bottom:  none;}\n\n\n   /* ==========================================================================\n   Конец вставки от 11.09.2015\n   ========================================================================== */\n.status {border-radius: 10px; padding: 1em 4em; text-align: center;  margin: 0 auto;}\n\nh1{margin-top: 0 !important;}\n.status label {clear: both;  position: relative;  margin: 0.1em 0 0.1em 0; font-size: 1.5em; font-weight: normal;}\n.status small {clear: both; width: 100%; display: position: relative;  margin: 0 0 0.3em 0;}\n.status input {max-width: 100%; margin: 0.1em 0 0.1em 0; font-size: 1.5em; border: 2px #35ab66 solid; text-align: center;}\n.StatusCaptcha img {margin: 0.4em 0 0.4em 0; font-size: 200%;}\n.status .alert { position: relative;  margin: 0.3em 0 0.3em 0; padding: 0.2em 0.5em;}\n\n.FormComment {color: #35ab66; margin: 0 0 1em 0;display:block;}\n.CommentWrong {color: #ff4442; display:none; margin: 0 0 1em 0;}\n.InputWrong {border: 2px #ff4442 solid !important;}\n\n/*edited*/\n.InputError input {\n	border: 2px #ff4442 solid !important;\n} \n.InputError .FormComment {\n	display:none;\n}\n.InputError .CommentWrong {\n	color: #ff4442;\n	display:block;\n}\n.StatusNumber, .StatusDate, .StatusName, .StatusPhone, .StatusCaptcha, .StatusCode {position: relative;  margin: 0 auto; max-width: 20em; width: 20em;}\n.StatusNumber input, .StatusDate input, .StatusName input, .StatusPhone input {padding: 0 30px 0 30px !important; text-align: left !important;}\n.StatusCode {width: 220px;}\n.StatusNumber:before, .StatusDate:before {\n	position: absolute;\n	display: block;\n	width: 2em;\n	text-align: right;\n	top: 0.2em;\n	z-index: 99;\n	overflow: visible;\n	left: -0.5em;\n	font-size: 1.5em;\n	color: #ccc;\n}\n.StatusNumber:before {content: \"№\";}\n.StatusDate:before {content: \"от\";}\n\n#submit { font-size: 1.2em; font-weight: bold;   background: url(\'../img/ButtonBG.gif\') #b6e5aa; color: #666; border: 2px #b6e5aa solid; border-radius: 10px; padding: 0.7em 1em 0.7em 2.5em; position: relative;}\n#submit:hover {color: #19b2ee;}\n\n.StatusHeader {font-weight: bold; font-size: 1.4em; margin: 0; padding: 0;}\n\n.StaturSubmit div:hover {}\n\n.StatusSubmit {position: relataie; z-index: 1; width: 250px; margin: 0 auto;}\n.StatusSubmit div {position: relative; z-index: 1;}\n.StatusSubmit div:before {position: absolute; z-index: 99; font-size: 1.2em; top: 1.1em; left: 2em}\n\n\n.menu-container {font-weight: bold;}\n.phones {font-weight: bold;}\n.side-menu ul li {font-weight: bold;}\n.menu-container .nav-pills>li>a:link, .menu-container .nav-pills>li>a:visited {text-decoration: none !important; position: relative; padding: 10px 1.4em 10px 1.4em;}\n.menu-container .nav-pills>li>a:link:after, .menu-container .nav-pills>li>a:visited:after {display: block; position: relative;  height: 1px; content:\"\"; border-bottom: 1px #444 solid;  top: -0.5em;}\n\n.nav-justified > li {margin: 0 1em 0 1em}\n.nav-justified {display: table; width: 100%; table-layout: auto; position: relative;}\n.the-icons i:before {text-decoration: none !important;}\n.map {height: 130px !important;}\n.icon-cw {font-size: 2.0em !important; position: relative; top: 0.15em;}\n.StatusCaptcha a:link, .StatusCaptcha a:visited {color: #35ab66; text-decoration: none;}\n.icon-cancel  { font-size: 1.2em; color: #ccc; position: absolute !important; right: 0.3em; top: 0.50em;}\n.icon-cw {border:none!important; display:inline-block;}\n   \n   /* ==========================================================================\n   Конец вставки от 6.06.2015\n   ========================================================================== */\n\n@media (min-width: 768px) {\n#navbar  {font-size: 1.1em; line-height: 1.4em;}\n.logo-container {float: left; width: 33.33333333%;}\n.menu-container {float: right; width: 66.66666667%;}\n.nav-pills>li.active {border-left: 2px #efefef solid; border-right: 2px #efefef solid;  top: 2px; background: #fff;}\n\n\n}\n\n@media (min-width: 980px) { \n#navbar {font-size: 1.4em; line-height: 1.4em;}\n.counter {text-align: center; margin-top: 0em;}\n.design {text-align: right; margin-top: 0em;}\n.sidebar {float: right !important;}\n}\n\n\n.mainfield {margin-top: 1.5em;}\n\n.menu-container .nav-pills>li>a {border-radius: 0; border:  none !important; line-height: 45px; white-space: nowrap;  min-height: 65px;}\n.menu-container .nav-pills>li.active>a, .nav-pills>li.active>a:hover, .nav-pills>li.active>a:focus { color: #444444;  top: -2px; background: #fff;}\n\n.menu-container .nav-pills>li>a:link, .menu-container .nav-pills>li>a:visited {color: #444444; text-decoration: underline;}\n.nav-pills>li>a:hover {text-decoration: underline;}\n.logo {height: 100%; position: relative; min-height: 65px; line-height: 65px; left: -10px;}\n.logo img {vertical-align: middle;  max-width: 90%;}\n.navbar-toggle .icon-bar {background: #ccc;}\n\n.phones {font-size: 1.5em; text-align: center; margin: 1em 0 0.5em 0;}\n.phones span {color: #00963f;}\n\n.map {height: 100px; border-radius: 10px; border: 1px #efefef solid; overflow: hidden; position: relative; display: block; \n	\n-webkit-mask-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAA5JREFUeNpiYGBgAAgwAAAEAAGbA+oJAAAAAElFTkSuQmCC);\n}\n\n.large-map {height: 300px;}\n\n.mapcaption {text-align: center; margin-bottom: 1em;}\n\n.side-menu {font-size: 1.2em;  margin: 0 auto;}\n.side-menu li i {margin: 0 0.7em 0 0; color: #555;}\n.side-menu h4 {margin: 0.5em 0 0 0;}\n\n.side-menu ul {border-radius: 10px !important; border: 1px #efefef solid; background: url(\'img/stripes.gif\') #f8f8f8; margin: 0.5em auto;}\n.online {color: #29d535 !important;}\n\n.carousel-indicators {bottom: -40px;}\n.carousel-indicators li {border-color: #999; background:  #999;}\n\n.carousel-inner .item  {border-radius: 10px; overflow: hidden;}\n.carousel-control.left, .carousel-control.right {background: none;}\n\n.brands .col-md-4 {text-align: center; height: 182px; overflow: hidden; margin-bottom: 20px;}\n.brands .block {\n	border: 1px #efefef solid; border-radius: 10px; padding: 5px 0;\n}\n.brands h4 {\n	margin: 0;\n	font-weight: bold;\n}\n.thumb {line-height: 110px;}\n\n.pagination {margin: 1em auto; text-align: center;}\n.pagination li a:link, .pagination li a:visited {background: url(\'img/stripes.gif\') #f8f8f8;}\n.pagination li.active a {border: 1px #ddd solid !important; color: #555 !important; background: #fff !important; }\n.pagination li a:hover {background: #efefef;}\n\n/* .status form input[type=\'text\'] {\n	width: 400px;\n}\n.status form label {\n	width: 200px;\n	font-weight: normal;\n} */\n.status .err {\n	color: red;\n}\n.status h4 {\n	font-weight: bold;\n}\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\";s:4:\"save\";s:0:\"\";s:5:\"apply\";s:0:\"\";s:16:\"template_preview\";s:0:\"\";s:6:\"cancel\";s:0:\"\";s:21:\"tabControl_active_tab\";s:5:\"edit1\";}', 1, 1456984190),
('21599afc1d3949dfc3def9f1cc7b0a2e5', 'main', 'autosave', 'CAutoSave::_Restore', 'a:23:{s:4:\"site\";s:2:\"s1\";s:4:\"path\";s:11:\"/index.html\";s:7:\"logical\";s:0:\"\";s:5:\"saveb\";s:0:\"\";s:4:\"save\";s:0:\"\";s:10:\"fullscreen\";s:1:\"N\";s:8:\"template\";s:0:\"\";s:8:\"back_url\";s:0:\"\";s:5:\"title\";s:42:\"UKRAINE.com.ua : поздравляем, сайт создан!\";s:3:\"new\";s:1:\"n\";s:8:\"filename\";s:10:\"index.html\";s:6:\"ofp_id\";s:0:\"\";s:7:\"filesrc\";s:975:\"<div class=\"container\">\n	<div class=\"content\">\n		 <!-- div class=\"menu\">\n			<a rel=\"nofollow\" href=\"http://www.ukraine.com.ua/domains/\">Регистрация домена</a><br><br>\n			<a rel=\"nofollow\" href=\"http://www.ukraine.com.ua/\">Хостинг</a>\n		</div -->\n		<div class=\"text\">\n			<h1>Сайт harmony.bosjack.in.ua готов к использованию</h1>\n			 Поздравляем, Ваш сайт создан и готов к использованию!<br>\n			<br>\n			 Чтобы на этом месте оказался Ваш сайт, удалите файл index.html в папке сайта и запишите в эту папку файлы своего сайта.<br>\n			<br>\n			 В разделе <a href=\"http://www.ukraine.com.ua/FAQ/\" target=\"_blank\">вопросы и ответы</a>, Вы можете прочесть о том, как закачать сайт на хостинг. <br>\n			 Если у Вас возникнут трудности — смело обращайтесь в нашу <a rel=\"nofollow\" href=\"http://adm.tools/support/\">службу поддержки</a>.\n		</div>\n	</div>\n	 <!-- div class=\"footer\">\n		&copy; Хостинг провайдер и регистратор доменных имен \"Хостинг Украина\", 2005&ndash;2014.\n	</div -->\n</div>\";s:11:\"add_to_menu\";s:0:\"\";s:8:\"menutype\";s:4:\"left\";s:8:\"itemtype\";s:0:\"\";s:4:\"newp\";s:0:\"\";s:7:\"newppos\";s:1:\"0\";s:8:\"menuitem\";s:0:\"\";s:6:\"apply2\";s:0:\"\";s:5:\"apply\";s:0:\"\";s:6:\"cancel\";s:0:\"\";s:21:\"tabControl_active_tab\";s:5:\"edit1\";}', 1, 1456995065),
('22bd0916de4a3ec5f556fe9c9f6b03aeb', 'main', 'autosave', 'CAutoSave::_Restore', 'a:13:{s:7:\"logical\";s:1:\"Y\";s:6:\"filter\";s:1:\"Y\";s:10:\"set_filter\";s:1:\"Y\";s:4:\"site\";s:2:\"s1\";s:4:\"path\";s:19:\"/services/index.php\";s:4:\"save\";s:0:\"\";s:8:\"full_src\";s:1:\"Y\";s:8:\"template\";s:0:\"\";s:8:\"back_url\";s:0:\"\";s:7:\"filesrc\";s:1920:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Title\");\n?>\n<?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"service\", \n	array(\n		\"IBLOCK_TYPE\" => \"catalog\",\n		\"IBLOCK_ID\" => \"3\",\n		\"NEWS_COUNT\" => \"1000\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"FILTER_NAME\" => \"\",\n		\"FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"FILE\",\n		),\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_SHADOW\" => \"Y\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"SET_TITLE\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"PAGER_TITLE\" => \"\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"N\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"N\"\n	),\n	false\n);?>\n<div class=\"container-fluid\">\n<?$APPLICATION->IncludeComponent(\n	\"bitrix:main.include\", \n	\".default\", \n	array(\n		\"AREA_FILE_SHOW\" => \"sect\",\n		\"AREA_FILE_RECURSIVE\" => \"Y\",\n		\"AREA_FILE_SUFFIX\" => \"service\",\n		\"EDIT_TEMPLATE\" => \"\"\n	),\n	false\n);?>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";s:5:\"apply\";s:0:\"\";s:6:\"cancel\";s:0:\"\";s:21:\"tabControl_active_tab\";s:5:\"edit1\";}', 1, 1456995242);
-- -----------------------------------
-- Dumping table b_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOGIN` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `CHECKWORD` varchar(50) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) DEFAULT NULL,
  `PERSONAL_GENDER` char(1) DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) DEFAULT NULL,
  `PERSONAL_STREET` text,
  `PERSONAL_MAILBOX` varchar(255) DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) DEFAULT NULL,
  `PERSONAL_NOTES` text,
  `WORK_COMPANY` varchar(255) DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) DEFAULT NULL,
  `WORK_POSITION` varchar(255) DEFAULT NULL,
  `WORK_WWW` varchar(255) DEFAULT NULL,
  `WORK_PHONE` varchar(255) DEFAULT NULL,
  `WORK_FAX` varchar(255) DEFAULT NULL,
  `WORK_PAGER` varchar(255) DEFAULT NULL,
  `WORK_STREET` text,
  `WORK_MAILBOX` varchar(255) DEFAULT NULL,
  `WORK_CITY` varchar(255) DEFAULT NULL,
  `WORK_STATE` varchar(255) DEFAULT NULL,
  `WORK_ZIP` varchar(255) DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) DEFAULT NULL,
  `WORK_PROFILE` text,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text,
  `ADMIN_NOTES` text,
  `STORED_HASH` varchar(32) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) DEFAULT NULL,
  `TIME_ZONE` varchar(50) DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(18) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `BX_USER_ID` varchar(32) DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;

INSERT INTO `b_user` VALUES
(1, '2015-05-13 13:19:31', 'admin', '#0Zf6M}w30a851c6b50bc123205faa49f2708047', 'FTsKWfPC07d53d4365cf319257af870eaaf61838', 'Y', 'Антон', 'Пирожков', 'pirogan@harmony.perm.ru', '2016-03-03 14:29:09', '2015-04-13 11:07:24', 's1', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', NULL, '', '', NULL, '', NULL, NULL, '2015-05-13 13:19:31', '', NULL, 0, NULL, '', NULL, NULL, '', 'a9852743579adc1903b458631c89bd3d', NULL);
-- -----------------------------------
-- Dumping table b_user_access
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_access`;
CREATE TABLE `b_user_access` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) DEFAULT NULL,
  `ACCESS_CODE` varchar(100) DEFAULT NULL,
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_user_access` VALUES
(0, 'group', 'G2'),
(1, 'group', 'G2'),
(1, 'group', 'G4'),
(1, 'group', 'G3'),
(1, 'group', 'G1'),
(1, 'user', 'U1');
-- -----------------------------------
-- Dumping table b_user_access_check
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_access_check`;
CREATE TABLE `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) DEFAULT NULL,
  KEY `ix_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_user_access_check` VALUES
(1, 'group'),
(1, 'user');
-- -----------------------------------
-- Dumping table b_user_counter
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_counter`;
CREATE TABLE `b_user_counter` (
  `USER_ID` int(18) NOT NULL,
  `SITE_ID` char(2) NOT NULL DEFAULT '**',
  `CODE` varchar(50) NOT NULL,
  `CNT` int(18) NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `PARAMS` text,
  `SENT` char(1) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_sent` (`SENT`),
  KEY `ix_buc_code` (`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_user_digest
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_digest`;
CREATE TABLE `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_user_field
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field`;
CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(20) DEFAULT NULL,
  `FIELD_NAME` varchar(20) DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) NOT NULL DEFAULT 'N',
  `SETTINGS` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251;

INSERT INTO `b_user_field` VALUES
(1, 'BLOG_POST', 'UF_BLOG_POST_DOC', 'file', 'UF_BLOG_POST_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
(2, 'BLOG_COMMENT', 'UF_BLOG_COMMENT_DOC', 'file', 'UF_BLOG_COMMENT_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
(3, 'BLOG_POST', 'UF_GRATITUDE', 'integer', 'UF_GRATITUDE', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}');
-- -----------------------------------
-- Dumping table b_user_field_confirm
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_confirm`;
CREATE TABLE `b_user_field_confirm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FIELD` varchar(255) NOT NULL,
  `FIELD_VALUE` varchar(255) NOT NULL,
  `CONFIRM_CODE` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_user_field_enum
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_enum`;
CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) NOT NULL,
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_user_field_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_lang`;
CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) NOT NULL DEFAULT '',
  `EDIT_FORM_LABEL` varchar(255) DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_user_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_group`;
CREATE TABLE `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

INSERT INTO `b_user_group` VALUES
(1, 1, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL);
-- -----------------------------------
-- Dumping table b_user_hit_auth
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_hit_auth`;
CREATE TABLE `b_user_hit_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_user_option
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_option`;
CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `CATEGORY` varchar(50) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `COMMON` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_user_option_user` (`USER_ID`,`CATEGORY`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=cp1251;

INSERT INTO `b_user_option` VALUES
(1, NULL, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:11:{s:28:\"ADMIN_ORDERS_GRAPH@111111111\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:22:\"ADMIN_ORDERS@111111111\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:708:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:18:\"Информация о сайте\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:24:\"ADMIN_PRODUCTS@111111111\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:5;s:4:\"HIDE\";s:1:\"N\";}s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:6;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:7;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:8;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:18:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}s:22:\"ADMIN_MOBILESHOP@13391\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:4;s:4:\"HIDE\";s:1:\"N\";}}}}', 'Y'),
(2, 1, 'admin_panel', 'settings', 'a:3:{s:4:\"edit\";s:3:\"off\";s:3:\"fix\";s:2:\"on\";s:9:\"collapsed\";s:2:\"on\";}', 'N'),
(3, 1, 'hot_keys', 'user_defined', 'b:1;', 'N'),
(4, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:\"stick\";s:1:\"N\";}', 'N'),
(5, 1, 'admin_menu', 'pos', 'a:3:{s:8:\"sections\";s:400:\"menu_system,menu_site,menu_fileman,menu_iblock,menu_iblock_/news,menu_iblock_/catalog,menu_iblock_/catalog/2,iblock_admin,menu_iblock_/catalog/3,menu_util,backup,menu_templates,menu_webforms,menu_search_stat,interface,menu_marketplace,menu_perfmon,iblock_export,iblock_import,menu_catalog_store,menu_sale_settings,menu_module_settings,menu_fileman_site_s1_,menu_fileman_file_s1_,menu_fileman_site_nd_\";s:5:\"width\";s:18:\"396.19000244140625\";s:3:\"ver\";s:2:\"on\";}', 'N'),
(6, 1, 'fileman', 'code_editor', 'a:1:{s:5:\"theme\";s:5:\"light\";}', 'N'),
(7, 1, 'BX.WindowManager.9.5', 'options_b78a432664ad5c12f79c9747e8089bf9', 'a:2:{s:3:\"pin\";s:4:\"true\";s:9:\"transform\";s:5:\"false\";}', 'N'),
(8, 1, 'fileman', 'last_pathes', 's:248:\"a:10:{i:0;s:6:\"/goods\";i:1;s:9:\"/services\";i:2;s:7:\"/status\";i:3;s:8:\"/site_nd\";i:4;s:7:\"/bitrix\";i:5;s:6:\"/about\";i:6;s:5:\"/news\";i:7;s:22:\"/bitrix/templates/main\";i:8;s:25:\"/bitrix/templates/main/js\";i:9;s:33:\"/bitrix/templates/main/components\";}\";', 'N'),
(9, 1, 'html_editor', 'user_settings_', 'a:1:{s:13:\"taskbar_shown\";s:1:\"1\";}', 'N'),
(10, 1, 'list', 'tbl_dump', 'a:4:{s:7:\"columns\";s:20:\"NAME,SIZE,PLACE,DATE\";s:2:\"by\";s:9:\"timestamp\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}', 'N'),
(11, NULL, 'list', 'tbl_dump', 'a:4:{s:7:\"columns\";s:20:\"NAME,SIZE,PLACE,DATE\";s:2:\"by\";s:9:\"timestamp\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}', 'Y'),
(12, 1, 'fileman', 'medialib_def_type', 's:1:\"3\";', 'N'),
(13, 1, 'filter', 'b_catalog_store_filter', 'a:1:{s:4:\"rows\";s:1:\"0\";}', 'N'),
(14, 1, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:10:{s:22:\"ADMIN_ORDERS@111111111\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:708:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:18:\"Информация о сайте\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}s:22:\"ADMIN_MOBILESHOP@13391\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:4;s:4:\"HIDE\";s:1:\"N\";}s:24:\"ADMIN_PRODUCTS@111111111\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:5;s:4:\"HIDE\";s:1:\"N\";}s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:6;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:7;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:8;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:18:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}}}}', 'N'),
(15, 1, 'edit', 'admin_tabs', 'a:1:{s:7:\"fix_top\";s:3:\"off\";}', 'N'),
(16, 1, 'edit', 'tabControl_1e6c0e4773ce47165fccb9d6ce22f76c', 'a:1:{s:6:\"expand\";s:2:\"on\";}', 'N');
-- -----------------------------------
-- Dumping table b_user_stored_auth
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_stored_auth`;
CREATE TABLE `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) NOT NULL,
  `TEMP_HASH` char(1) NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251;

INSERT INTO `b_user_stored_auth` VALUES
(3, 1, '2015-05-26 17:52:54', '2015-06-25 08:14:56', 'b1e66582c8a164fcc7d05945363081c8', 'N', 1540805148),
(5, 1, '2016-03-03 07:33:56', '2016-03-03 07:33:56', 'c5a675601607806f758c025d58ca7c8a', 'N', 1319104290);
-- -----------------------------------
-- Dumping table b_utm_blog_comment
-- -----------------------------------
DROP TABLE IF EXISTS `b_utm_blog_comment`;
CREATE TABLE `b_utm_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_COMMENT_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_COMMENT_2` (`VALUE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_utm_blog_post
-- -----------------------------------
DROP TABLE IF EXISTS `b_utm_blog_post`;
CREATE TABLE `b_utm_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_POST_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_POST_2` (`VALUE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_uts_blog_comment
-- -----------------------------------
DROP TABLE IF EXISTS `b_uts_blog_comment`;
CREATE TABLE `b_uts_blog_comment` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_COMMENT_DOC` text,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_uts_blog_post
-- -----------------------------------
DROP TABLE IF EXISTS `b_uts_blog_post`;
CREATE TABLE `b_uts_blog_post` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_POST_DOC` text,
  `UF_GRATITUDE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_vote
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote`;
CREATE TABLE `b_vote` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NOTIFY` char(1) NOT NULL DEFAULT 'N',
  `AUTHOR_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_START` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_END` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `URL` varchar(255) DEFAULT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` text,
  `DESCRIPTION_TYPE` varchar(4) NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(255) DEFAULT NULL,
  `EVENT2` varchar(255) DEFAULT NULL,
  `EVENT3` varchar(255) DEFAULT NULL,
  `UNIQUE_TYPE` int(18) NOT NULL DEFAULT '2',
  `KEEP_IP_SEC` int(18) DEFAULT NULL,
  `DELAY` int(18) DEFAULT NULL,
  `DELAY_TYPE` char(1) DEFAULT NULL,
  `TEMPLATE` varchar(255) DEFAULT NULL,
  `RESULT_TEMPLATE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CHANNEL_ID` (`CHANNEL_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_vote_answer
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_answer`;
CREATE TABLE `b_vote_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `MESSAGE` text,
  `MESSAGE_TYPE` varchar(4) NOT NULL DEFAULT 'html',
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `FIELD_TYPE` int(5) NOT NULL DEFAULT '0',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` varchar(255) DEFAULT NULL,
  `COLOR` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_QUESTION_ID` (`QUESTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_vote_channel
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_channel`;
CREATE TABLE `b_vote_channel` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SYMBOLIC_NAME` varchar(255) NOT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) NOT NULL DEFAULT 'N',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TITLE` varchar(255) NOT NULL,
  `VOTE_SINGLE` char(1) NOT NULL DEFAULT 'Y',
  `USE_CAPTCHA` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_vote_channel_2_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_channel_2_group`;
CREATE TABLE `b_vote_channel_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_CHANNEL_ID_GROUP_ID` (`CHANNEL_ID`,`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_vote_channel_2_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_channel_2_site`;
CREATE TABLE `b_vote_channel_2_site` (
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`CHANNEL_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_vote_event
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_event`;
CREATE TABLE `b_vote_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `VOTE_USER_ID` int(18) NOT NULL DEFAULT '0',
  `DATE_VOTE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) DEFAULT NULL,
  `VALID` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IX_USER_ID` (`VOTE_USER_ID`),
  KEY `IX_B_VOTE_EVENT_2` (`VOTE_ID`,`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_vote_event_answer
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_event_answer`;
CREATE TABLE `b_vote_event_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) NOT NULL DEFAULT '0',
  `MESSAGE` text,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_QUESTION_ID` (`EVENT_QUESTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_vote_event_question
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_event_question`;
CREATE TABLE `b_vote_event_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int(18) NOT NULL DEFAULT '0',
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_ID` (`EVENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_vote_question
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_question`;
CREATE TABLE `b_vote_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `QUESTION` text NOT NULL,
  `QUESTION_TYPE` varchar(4) NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `DIAGRAM` char(1) NOT NULL DEFAULT 'Y',
  `REQUIRED` char(1) NOT NULL DEFAULT 'N',
  `DIAGRAM_TYPE` varchar(10) NOT NULL DEFAULT 'histogram',
  `TEMPLATE` varchar(255) DEFAULT NULL,
  `TEMPLATE_NEW` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_ID` (`VOTE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- -----------------------------------
-- Dumping table b_vote_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_user`;
CREATE TABLE `b_vote_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `AUTH_USER_ID` int(18) DEFAULT NULL,
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `DATE_FIRST` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_LAST` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_IP` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- Finished: 2016-03-03 14:30:23