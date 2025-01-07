DROP SCHEMA IF EXISTS pokemon_db;
CREATE SCHEMA pokemon_db;
USE pokemon_db;

CREATE TABLE IF NOT EXISTS `pokemon` (
	`pokemon_id` int NOT NULL,
	`name` varchar(50) NOT NULL,
	`form` varchar(20) NOT NULL,
	`type_1` varchar(20) NOT NULL,
	`type_2` varchar(20),
	`base_hp` int NOT NULL,
	`base_attack` int NOT NULL,
	`base_defense` int NOT NULL,
	`base_sp_attack` int NOT NULL,
	`base_sp_defense` int NOT NULL,
	`base_speed` int NOT NULL,
	`is_legendary` boolean NOT NULL,
	`pokedex_number` int NOT NULL,
	`chapter` int NOT NULL,
	`has_mega` boolean NOT NULL,
	PRIMARY KEY (`pokemon_id`)
);

CREATE TABLE IF NOT EXISTS `moves` (
	`move_id` int NOT NULL,
	`name` varchar(50) NOT NULL,
	`type` varchar(20) NOT NULL,
	`power` int NOT NULL,
	`accuracy` int NOT NULL,
	`pp` int NOT NULL,
	`priority` int NOT NULL,
	`effect` text NOT NULL,
	`move_type` varchar(20) NOT NULL,
	PRIMARY KEY (`move_id`)
);

CREATE TABLE IF NOT EXISTS `abilities` (
	`ability_id` int NOT NULL,
	`name` varchar(50) NOT NULL,
	`description` text NOT NULL,
	PRIMARY KEY (`ability_id`)
);

CREATE TABLE IF NOT EXISTS `items` (
	`item_id` int NOT NULL,
	`name` varchar(50) NOT NULL,
	`effect` text NOT NULL,
	`is_consumable` boolean NOT NULL,
	`chapter` int NOT NULL,
	`type` varchar(20) NOT NULL,
	PRIMARY KEY (`item_id`)
);

CREATE TABLE IF NOT EXISTS `pokemon_moves` (
	`pokemon_id` int NOT NULL,
	`move_id` int NOT NULL,
	`learned_through` varchar(20) NOT NULL,
	`at_lvl` int,
	`at_chapter` int,
	PRIMARY KEY (`pokemon_id`, `move_id`)
);

CREATE TABLE IF NOT EXISTS `pokemon_abilities` (
	`pokemon_id` int NOT NULL,
	`ability_id` int NOT NULL,
	`rarity` varchar(20) NOT NULL,
	PRIMARY KEY (`pokemon_id`, `ability_id`)
);

CREATE TABLE IF NOT EXISTS `users` (
	`user_id` int NOT NULL,
	`username` varchar(50) NOT NULL,
	`email` varchar(100) NOT NULL UNIQUE,
	`password_hash` varchar(255) NOT NULL,
	`created_at` timestamp NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE IF NOT EXISTS `teams` (
	`team_id` int NOT NULL,
	`user_id` int NOT NULL,
	`team_name` varchar(50) NOT NULL,
	`chapter` int NOT NULL,
	PRIMARY KEY (`team_id`)
);

CREATE TABLE IF NOT EXISTS `team_pokemon` (
	`team_id` int NOT NULL,
	`pokemon_id` int NOT NULL,
	`nickname` varchar(50),
	`item_id` int NOT NULL,
	`ability_id` int NOT NULL,
	`move_1` int NOT NULL,
	`move_2` int,
	`move_3` int,
	`move_4` int,
	`level` int NOT NULL,
	`ev_hp` int NOT NULL,
	`ev_attack` int NOT NULL,
	`ev_defense` int NOT NULL,
	`ev_sp_attack` int NOT NULL,
	`ev_sp_defense` int NOT NULL,
	`ev_speed` int NOT NULL,
	`iv_hp` int NOT NULL,
	`iv_attack` int NOT NULL,
	`iv_defense` int NOT NULL,
	`iv_sp_attack` int NOT NULL,
	`iv_sp_defense` int NOT NULL,
	`iv_speed` int NOT NULL,
	`nature` varchar(20) NOT NULL,
	PRIMARY KEY (`team_id`, `pokemon_id`)
);





ALTER TABLE `pokemon_moves` ADD CONSTRAINT `pokemon_moves_fk0` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon`(`pokemon_id`);

ALTER TABLE `pokemon_moves` ADD CONSTRAINT `pokemon_moves_fk1` FOREIGN KEY (`move_id`) REFERENCES `moves`(`move_id`);
ALTER TABLE `pokemon_abilities` ADD CONSTRAINT `pokemon_abilities_fk0` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon`(`pokemon_id`);

ALTER TABLE `pokemon_abilities` ADD CONSTRAINT `pokemon_abilities_fk1` FOREIGN KEY (`ability_id`) REFERENCES `abilities`(`ability_id`);

ALTER TABLE `teams` ADD CONSTRAINT `teams_fk1` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);
ALTER TABLE `team_pokemon` ADD CONSTRAINT `team_pokemon_fk0` FOREIGN KEY (`team_id`) REFERENCES `teams`(`team_id`);

ALTER TABLE `team_pokemon` ADD CONSTRAINT `team_pokemon_fk1` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon`(`pokemon_id`);

ALTER TABLE `team_pokemon` ADD CONSTRAINT `team_pokemon_fk3` FOREIGN KEY (`item_id`) REFERENCES `items`(`item_id`);

ALTER TABLE `team_pokemon` ADD CONSTRAINT `team_pokemon_fk4` FOREIGN KEY (`ability_id`) REFERENCES `abilities`(`ability_id`);

ALTER TABLE `team_pokemon` ADD CONSTRAINT `team_pokemon_fk5` FOREIGN KEY (`move_1`) REFERENCES `moves`(`move_id`);

ALTER TABLE `team_pokemon` ADD CONSTRAINT `team_pokemon_fk6` FOREIGN KEY (`move_2`) REFERENCES `moves`(`move_id`);

ALTER TABLE `team_pokemon` ADD CONSTRAINT `team_pokemon_fk7` FOREIGN KEY (`move_3`) REFERENCES `moves`(`move_id`);

ALTER TABLE `team_pokemon` ADD CONSTRAINT `team_pokemon_fk8` FOREIGN KEY (`move_4`) REFERENCES `moves`(`move_id`);