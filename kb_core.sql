CREATE DATABASE IF NOT EXISTS `gta_rp`;
USE `gta_rp`;

CREATE TABLE `users` (
  `identifier` VARCHAR(60) NOT NULL,
  `role_id` INT(11) NOT NULL DEFAULT 1,
  `position` VARCHAR(255) NULL DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',

  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `credentials` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cred_groups` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(5) NOT NULL,
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `roles` VALUES
  (1, 'user'),
  (2, 'mod'),
  (3, 'admin'),
  (4, 's_adm')
;

CREATE TABLE `cred_group_has_credential` (
  `cred_group_id` INT(11) NOT NULL,
  `credential_id` INT(11) NOT NULL,

  PRIMARY KEY (`cred_group_id`, `credential_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `role_has_credential` (
  `role_id` INT(11) NOT NULL,
  `credential_id` INT(11) NOT NULL,

  PRIMARY KEY (`role_id`, `credential_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `role_has_cred_group` (
  `role_id` INT(11) NOT NULL,
  `cred_group_id` INT(11) NOT NULL,

  PRIMARY KEY (`role_id`, `cred_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `commands` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `minimum_role_id` INT(11) NOT NULL DEFAULT 5,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `commands` VALUES
  (1, 'showmyrole', 'Show your own role on this server', 1)
;