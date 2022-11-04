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
  `first_name` VARCHAR(250) NULL,
  `last_name` VARCHAR(250) NULL,
  `last_update` VARCHAR(250) NULL,
  `name` VARCHAR(250) NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(250) NULL,
  `last_update` VARCHAR(250) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`film` (
  `film_id` INT NOT NULL,
  `description` VARCHAR(250) NULL,
  `release_year` INT NULL,
  `rental_duration` INT NULL,
  `rental_rate` DECIMAL(250) NULL,
  `lenght` INT NULL,
  `replacement_cost` DECIMAL(250) NULL,
  `rating` VARCHAR(250) NULL,
  `special_features` VARCHAR(250) NULL,
  `last_update` VARCHAR(250) NULL,
  `language_id` INT NULL,
  `title` VARCHAR(250) NULL,
  PRIMARY KEY (`film_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` VARCHAR(250) NULL,
  `inventory_id` INT NULL,
  `customer_id` INT NULL,
  `return_date` VARCHAR(250) NULL,
  `staff_id` INT NULL,
  `last_update` VARCHAR(250) NULL,
  PRIMARY KEY (`rental_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`inventory` (
  `inventory_id` INT NOT NULL,
  `store_id` INT NULL,
  `last_update` VARCHAR(250) NULL,
  `film_id` INT NULL,
  `film_film_id` INT NOT NULL,
  `rental_rental_id` INT NOT NULL,
  PRIMARY KEY (`inventory_id`, `film_film_id`, `rental_rental_id`),
  INDEX `fk_inventory_film1_idx` (`film_film_id` ASC) VISIBLE,
  INDEX `fk_inventory_rental1_idx` (`rental_rental_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_film1`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `videoclub`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_rental1`
    FOREIGN KEY (`rental_rental_id`)
    REFERENCES `videoclub`.`rental` (`rental_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`language` (
  `language_id` INT NOT NULL,
  `name` VARCHAR(250) NULL,
  `last_update` VARCHAR(250) NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`old_HDD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`old_HDD` (
  `first_name` VARCHAR(450) NULL,
  `last_name` VARCHAR(450) NULL,
  `release_year` INT NULL,
  `category_id` INT NULL,
  `name` VARCHAR(450) NULL,
  `category_category_id` INT NOT NULL,
  `title` VARCHAR(250) NULL,
  PRIMARY KEY (`category_category_id`),
  INDEX `fk_old_HDD_actor1_idx` (`name` ASC) VISIBLE,
  INDEX `fk_old_HDD_film1_idx` (`title` ASC) VISIBLE,
  CONSTRAINT `fk_old_HDD_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `cinema`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_old_HDD_actor1`
    FOREIGN KEY (`name`)
    REFERENCES `videoclub`.`actor` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_old_HDD_film1`
    FOREIGN KEY (`title`)
    REFERENCES `videoclub`.`film` (`title`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


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
    REFERENCES `videoclub`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_has_language_language1`
    FOREIGN KEY (`language_language_id`)
    REFERENCES `videoclub`.`language` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
