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
-- Table `mydb`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutation` (
  `ID` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `chromosome` INT NULL,
  `patient_name` VARCHAR(45) NOT NULL,
  `patient_syndrome` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`, `patient_name`),
  UNIQUE INDEX `gene_name_UNIQUE` (`gene_name` ASC) VISIBLE,
  UNIQUE INDEX `patient_syndrome_UNIQUE` (`patient_syndrome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `ID` INT NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `Sex` ENUM("M", "F") NULL,
  `diagnosis_age` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Patient_1_idx` (`patient_name` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_1`
    FOREIGN KEY (`patient_name`)
    REFERENCES `mydb`.`Mutation` (`patient_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome` (
  `ID` INT NOT NULL,
  `syndrome_name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Syndrome_1_idx` (`syndrome_name` ASC) VISIBLE,
  CONSTRAINT `fk_Syndrome_1`
    FOREIGN KEY (`syndrome_name`)
    REFERENCES `mydb`.`Mutation` (`patient_syndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `ID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Gene_1_idx` (`name` ASC) VISIBLE,
  CONSTRAINT `fk_Gene_1`
    FOREIGN KEY (`name`)
    REFERENCES `mydb`.`Mutation` (`gene_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
