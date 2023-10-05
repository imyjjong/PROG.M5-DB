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
-- Table `mydb`.`username`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`username` (
  `usernameID` INT UNSIGNED NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `phone` TEXT(15) NOT NULL,
  PRIMARY KEY (`usernameID`),
  UNIQUE INDEX `usernameID_UNIQUE` (`usernameID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gamer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gamer` (
  `gamerID` INT UNSIGNED NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `playhours` DECIMAL NOT NULL,
  `amountGames` DECIMAL(25) NOT NULL,
  `username_usernameID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`gamerID`),
  UNIQUE INDEX `gamerID_UNIQUE` (`gamerID` ASC) VISIBLE,
  INDEX `fk_gamer_username_idx` (`username_usernameID` ASC) VISIBLE,
  CONSTRAINT `fk_gamer_username`
    FOREIGN KEY (`username_usernameID`)
    REFERENCES `mydb`.`username` (`usernameID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`games` (
  `gamesID` INT UNSIGNED NOT NULL,
  `achievements` VARCHAR(45) NOT NULL,
  `genre` VARCHAR(45) NOT NULL,
  `playtime` DECIMAL NOT NULL,
  `gamescol` VARCHAR(45) NULL,
  PRIMARY KEY (`gamesID`),
  UNIQUE INDEX `gamesID_UNIQUE` (`gamesID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gamer_has_games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gamer_has_games` (
  `gamer_gamerID` INT UNSIGNED NOT NULL,
  `games_gamesID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`gamer_gamerID`, `games_gamesID`),
  INDEX `fk_gamer_has_games_games1_idx` (`games_gamesID` ASC) VISIBLE,
  INDEX `fk_gamer_has_games_gamer1_idx` (`gamer_gamerID` ASC) VISIBLE,
  CONSTRAINT `fk_gamer_has_games_gamer1`
    FOREIGN KEY (`gamer_gamerID`)
    REFERENCES `mydb`.`gamer` (`gamerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gamer_has_games_games1`
    FOREIGN KEY (`games_gamesID`)
    REFERENCES `mydb`.`games` (`gamesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
