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
  `description` VARCHAR(50) NULL,
  `release_year` INT NULL,
  `rental_duration` INT NULL,
  `rental_rate` DECIMAL(50) NULL,
  `lenght` INT NULL,
  `replacement_cost` DECIMAL(50) NULL,
  `rating` VARCHAR(50) NULL,
  `special_features` VARCHAR(50) NULL,
  `last_update` VARCHAR(50) NULL,
  `language_id` INT NULL,
  `title` VARCHAR(50) NULL,
  PRIMARY KEY (`film_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` VARCHAR(50) NULL,
  `inventory_id` INT NULL,
  `customer_id` INT NULL,
  `return_date` VARCHAR(50) NULL,
  `staff_id` INT NULL,
  `last_update` VARCHAR(50) NULL,
  PRIMARY KEY (`rental_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`inventory` (
  `inventory_id` INT NOT NULL,
  `store_id` INT NULL,
  `last_update` VARCHAR(50) NULL,
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
  `name` VARCHAR(50) NULL,
  `last_update` VARCHAR(50) NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`old_HDD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`old_HDD` (
  `first_name` VARCHAR(50) NULL,
  `last_name` VARCHAR(50) NULL,
  `release_year` INT NULL,
  `category_id` INT NULL,
  `name` VARCHAR(50) NULL,
  `category_category_id` INT NOT NULL,
  `actor_actor_id` INT NOT NULL,
  `film_film_id` INT NOT NULL,
  `title` VARCHAR(50) NULL,
  `actor_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`category_category_id`,`actor_actor_id`,`film_film_id`),
  INDEX `fk_old_HDD_actor1_idx` (`name` ASC) VISIBLE,
  INDEX `fk_old_HDD_film1_idx` (`title` ASC) VISIBLE,
  CONSTRAINT `fk_old_HDD_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `videoclub`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_old_HDD_actor1`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `videoclub`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_old_HDD_film1`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `videoclub`.`film` (`film_id`)
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
