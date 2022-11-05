USE `es_extended_rpbase`;

CREATE TABLE IF NOT EXISTS `allhousing` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `ownername` varchar(50) NOT NULL,
  `owned` tinyint(4) NOT NULL,
  `price` int(11) NOT NULL,
  `resalepercent` int(11) NOT NULL,
  `resalejob` varchar(50) NOT NULL,
  `entry` longtext DEFAULT NULL,
  `garage` longtext DEFAULT NULL,
  `furniture` longtext DEFAULT NULL,
  `shell` varchar(50) NOT NULL,
  `interior` varchar(50) NOT NULL,
  `shells` longtext DEFAULT NULL,
  `doors` longtext DEFAULT NULL,
  `housekeys` longtext DEFAULT NULL,
  `wardrobe` longtext DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `inventorylocation` longtext DEFAULT NULL,
  `mortgage_owed` int(11) NOT NULL DEFAULT 0,
  `last_repayment` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `owned_vehicles` ADD `storedhouse` int(11) NOT NULL;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	    ('fogliemaria', 'Foglie di Marijuana', 40, 0, 1),
        ('Marijuana ', 'Pacchetto di Marijuana', 20, 0, 1),
        ('cocaina', 'Foglie di Cocaina', 40, 0, 1),
        ('cocainaprocesso', 'Cocaina Processata', 40, 0, 1),
        ('meth', 'Raccolta meth', 40, 0, 1),
        ('procmeth', 'Processo meth', 40, 0, 1)
;


INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('arAmmo', 'Colpi Assalto', 1, 0, 1),
	('pAmmo', 'Colpi di pistola', 1, 0, 1),
	('smgAmmo', 'Colpi SMG', 1, 0, 1),
	('stAmmo', 'Colpi shotgun', 1, 0, 1),
	('weapon_clip_extended', 'Caricatore Esteso', 1, 0, 1),
	('weapon_suppressor', 'Silenziatore', 1, 0, 1),
	('weapon_flashlight', 'Torcia per armi', 1, 0, 1);


ALTER TABLE users ADD secondjob VARCHAR(32) NOT NULL DEFAULT 'unemployed';
ALTER TABLE users ADD secondjob_grade VARCHAR(32) NOT NULL DEFAULT '0';

CREATE TABLE IF NOT EXISTS `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
);


CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) NULL DEFAULT NULL,
  `keybind1` varchar(50) NULL DEFAULT "num4",
  `emote1` varchar(255) NULL DEFAULT "",
  `keybind2` varchar(50) NULL DEFAULT "num5",
  `emote2` varchar(255) NULL DEFAULT "",
  `keybind3` varchar(50) NULL DEFAULT "num6",
  `emote3` varchar(255) NULL DEFAULT "",
  `keybind4` varchar(50) NULL DEFAULT "num7",
  `emote4` varchar(255) NULL DEFAULT "",
  `keybind5` varchar(50) NULL DEFAULT "num8",
  `emote5` varchar(255) NULL DEFAULT "",
  `keybind6` varchar(50) NULL DEFAULT "num9",
  `emote6` varchar(255) NULL DEFAULT ""
) ENGINE=InnoDB COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `carthief` (
  `identifier` varchar(255) CHARACTER SET utf8 NOT NULL,
  `timeleft` INT(5) DEFAULT b'0',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;