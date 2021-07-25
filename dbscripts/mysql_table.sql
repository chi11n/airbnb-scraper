CREATE TABLE `rooms` (
	id INT NOT NULL,
	`name` VARCHAR(256) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`city` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`state` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`country` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`url` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`price_rate` INT NULL DEFAULT NULL,
	`price_rate_type` VARCHAR(256) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`total_price` INT NULL DEFAULT NULL,
	`room_and_property_type` VARCHAR(256) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`latitude` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`longitude` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`monthly_price_factor` DECIMAL(5,2) NULL DEFAULT NULL,
	`weekly_price_factor` DECIMAL(5,2) NULL DEFAULT NULL,
	`room_type` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`person_capacity` INT NULL DEFAULT NULL,
	`review_count` INT NULL DEFAULT NULL,
	`review_score` DECIMAL(5,2) NULL DEFAULT NULL,
	`rating_accuracy` DECIMAL(5,2) NULL DEFAULT NULL,
	`rating_checkin` DECIMAL(5,2) NULL DEFAULT NULL,
	`rating_cleanliness` DECIMAL(5,2) NULL DEFAULT NULL,
	`rating_communication` DECIMAL(5,2) NULL DEFAULT NULL,
	`rating_location` DECIMAL(5,2) NULL DEFAULT NULL,
	`rating_value` DECIMAL(5,2) NULL DEFAULT NULL,
	`star_rating` DECIMAL(5,2) NULL DEFAULT NULL,
	`satisfaction_guest` DECIMAL(5,2) NULL DEFAULT NULL,
	`neighborhood_overview` VARCHAR(256) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`access` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`response_rate` VARCHAR(256) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`response_time` VARCHAR(256) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`availability_percentage` DECIMAL(5,2) NULL DEFAULT NULL,
	PRIMARY KEY (id)
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;


CREATE TABLE `region` (
	id INT NOT NULL AUTO_INCREMENT,
	`region` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`city` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (id)
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;