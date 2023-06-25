-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `customer_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `MOBILE` INT NULL,
  `email_id` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`movie` (
  `idmovie` NVARCHAR(20) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `stock` INT NOT NULL,
  PRIMARY KEY (`idmovie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`coupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`coupon` (
  `idcoupon` INT NOT NULL,
  `discount` INT NOT NULL,
  PRIMARY KEY (`idcoupon`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rent` (
  `return_date` DATE NOT NULL,
  `rent_date` DATE NULL,
  `movie_idmovie` NVARCHAR(20) NOT NULL,
  `customer_customer_id` INT NOT NULL,
  `coupon_idcoupon` INT NOT NULL,
  PRIMARY KEY (`return_date`, `movie_idmovie`, `customer_customer_id`, `coupon_idcoupon`),
  INDEX `fk_rent_movie_idx` (`movie_idmovie` ASC) VISIBLE,
  INDEX `fk_rent_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  INDEX `fk_rent_coupon1_idx` (`coupon_idcoupon` ASC) VISIBLE,
  CONSTRAINT `fk_rent_movie`
    FOREIGN KEY (`movie_idmovie`)
    REFERENCES `mydb`.`movie` (`idmovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rent_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `mydb`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rent_coupon1`
    FOREIGN KEY (`coupon_idcoupon`)
    REFERENCES `mydb`.`coupon` (`idcoupon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
