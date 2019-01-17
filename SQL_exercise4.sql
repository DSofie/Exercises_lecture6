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
-- Table `mydb`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doctor` (
  `ID_Doctor` INT NOT NULL,
  `Name` VARCHAR(50) NULL,
  `Date_of_birth` DATE NULL,
  `Adress` VARCHAR(150) NULL,
  `Phone_number` INT NULL,
  `Salary` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Doctor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medical` (
  `ID_Overtime` INT NOT NULL,
  `Overtime_rate` VARCHAR(45) NULL,
  `Doctor_ID` INT NOT NULL,
  PRIMARY KEY (`ID_Overtime`),
  UNIQUE INDEX `Doctor_ID_UNIQUE` (`Doctor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Medical_1`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `mydb`.`Doctor` (`ID_Doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Specialist` (
  `ID_Field` INT NOT NULL,
  `Field-area` VARCHAR(45) NULL,
  `Doctor_ID` INT NOT NULL,
  PRIMARY KEY (`ID_Field`),
  INDEX `fk_Specialist_1_idx` (`Doctor_ID` ASC) VISIBLE,
  UNIQUE INDEX `Doctor_ID_UNIQUE` (`Doctor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Specialist_1`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `mydb`.`Doctor` (`ID_Doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `ID_Patient` INT NOT NULL,
  `Name` VARCHAR(50) NULL,
  `Adress` VARCHAR(100) NULL,
  `Phone_number` INT NULL,
  `Date_of_birth` DATE NULL,
  PRIMARY KEY (`ID_Patient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Appointment` (
  `ID_Appointment` INT NOT NULL,
  `Date` DATE NULL,
  `Time` VARCHAR(45) NULL,
  `Doctor_ID` INT NOT NULL,
  `Patient_ID` INT NOT NULL,
  PRIMARY KEY (`ID_Appointment`),
  UNIQUE INDEX `Doctor_ID_UNIQUE` (`Doctor_ID` ASC) VISIBLE,
  UNIQUE INDEX `Patient_ID_UNIQUE` (`Patient_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Appointment_1`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `mydb`.`Doctor` (`ID_Doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_2`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `mydb`.`Patient` (`ID_Patient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `ID_Payment` INT NOT NULL,
  `Details` VARCHAR(200) NULL,
  `Method` VARCHAR(45) NULL,
  `Patient_ID` INT NOT NULL,
  PRIMARY KEY (`ID_Payment`),
  UNIQUE INDEX `Patient_ID_UNIQUE` (`Patient_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Payment_1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `mydb`.`Patient` (`ID_Patient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill` (
  `ID_Bill` INT NOT NULL,
  `Total` INT NULL,
  `Doctor_ID` INT NOT NULL,
  PRIMARY KEY (`ID_Bill`),
  UNIQUE INDEX `Doctor_ID_UNIQUE` (`Doctor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Bill_1`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `mydb`.`Doctor` (`ID_Doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bill-payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bill-payment` (
  `ID` INT NOT NULL,
  `Bill_ID` INT NOT NULL,
  `Payment_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Bill_ID_UNIQUE` (`Bill_ID` ASC) VISIBLE,
  UNIQUE INDEX `Payment_ID_UNIQUE` (`Payment_ID` ASC) VISIBLE,
  CONSTRAINT `fk_bill-payment_1`
    FOREIGN KEY (`Bill_ID`)
    REFERENCES `mydb`.`Bill` (`ID_Bill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill-payment_2`
    FOREIGN KEY (`Payment_ID`)
    REFERENCES `mydb`.`Payment` (`ID_Payment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
