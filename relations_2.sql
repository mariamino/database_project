-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `videoclub` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `videoclub` ;

-- -----------------------------------------------------
-- Table `videoclub`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`actor` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(250) NULL DEFAULT NULL,
  `last_name` VARCHAR(250) NULL DEFAULT NULL,
  `last_update` VARCHAR(250) NULL DEFAULT NULL,
  `name` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(250) NULL DEFAULT NULL,
  `last_update` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` VARCHAR(50) NULL DEFAULT NULL,
  `inventory_id` INT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `return_date` VARCHAR(50) NULL DEFAULT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  `last_update` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`inventory` (
  `inventory_id` INT NOT NULL,
  `store_id` INT NULL DEFAULT NULL,
  `last_update` VARCHAR(50) NULL DEFAULT NULL,
  `film_id` INT NULL DEFAULT NULL,
  `rental_rental_id` INT NOT NULL,
  PRIMARY KEY (`inventory_id`, `rental_rental_id`),
  INDEX `fk_inventory_rental1_idx` (`rental_rental_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_rental1`
    FOREIGN KEY (`rental_rental_id`)
    REFERENCES `videoclub`.`rental` (`rental_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`film` (
  `film_id` INT NOT NULL,
  `description` VARCHAR(50) NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` DECIMAL(50,0) NULL DEFAULT NULL,
  `lenght` INT NULL DEFAULT NULL,
  `replacement_cost` DECIMAL(50,0) NULL DEFAULT NULL,
  `rating` VARCHAR(50) NULL DEFAULT NULL,
  `special_features` VARCHAR(50) NULL DEFAULT NULL,
  `last_update` VARCHAR(50) NULL DEFAULT NULL,
  `language_id` INT NULL DEFAULT NULL,
  `title` VARCHAR(50) NULL,
  `inventory_inventory_id` INT NOT NULL,
  `inventory_rental_rental_id` INT NOT NULL,
  PRIMARY KEY (`film_id`, `inventory_inventory_id`, `inventory_rental_rental_id`),
  INDEX `fk_film_inventory1_idx` (`inventory_inventory_id` ASC, `inventory_rental_rental_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_inventory1`
    FOREIGN KEY (`inventory_inventory_id` , `inventory_rental_rental_id`)
    REFERENCES `videoclub`.`inventory` (`inventory_id` , `rental_rental_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`language` (
  `language_id` INT NOT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `last_update` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`film_has_language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`film_has_language` (
  `film_film_id` INT NOT NULL,
  `language_language_id` INT NOT NULL,
  PRIMARY KEY (`film_film_id`, `language_language_id`),
  INDEX `fk_film_has_language_language1_idx` (`language_language_id` ASC) VISIBLE,
  INDEX `fk_film_has_language_film_idx` (`film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_has_language_film`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `videoclub`.`film` (`film_id`),
  CONSTRAINT `fk_film_has_language_language1`
    FOREIGN KEY (`language_language_id`)
    REFERENCES `videoclub`.`language` (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`old_HDD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`old_HDD` (
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `category_category_id` INT NOT NULL,
  `actor_actor_id` INT NOT NULL,
  `film_film_id` INT NOT NULL,
  `title` VARCHAR(50) NULL DEFAULT NULL,
  `actor_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`category_category_id`, `actor_actor_id`, `film_film_id`),
  INDEX `fk_old_HDD_actor1_idx` (`name` ASC) VISIBLE,
  INDEX `fk_old_HDD_film1_idx` (`title` ASC) VISIBLE,
  INDEX `fk_old_HDD_actor1` (`actor_actor_id` ASC) VISIBLE,
  INDEX `fk_old_HDD_film1` (`film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_old_HDD_actor1`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `videoclub`.`actor` (`actor_id`),
  CONSTRAINT `fk_old_HDD_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `videoclub`.`category` (`category_id`),
  CONSTRAINT `fk_old_HDD_film1`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `videoclub`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
