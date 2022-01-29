-- MySQL Script generated by MySQL Workbench
-- Fri Jan 28 01:17:49 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema vs20211029
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `vs20211029` ;

-- -----------------------------------------------------
-- Schema vs20211029
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vs20211029` DEFAULT CHARACTER SET utf8 ;
USE `vs20211029` ;

-- -----------------------------------------------------
-- Table `vs20211029`.`companies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vs20211029`.`companies` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `display_order` INT NOT NULL,
  `active` TINYINT NOT NULL,
  `logo` VARCHAR(200) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `icon` VARCHAR(200) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `vs20211029`.`organizations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vs20211029`.`organizations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_type_id` INT UNSIGNED NULL,
  `organization_parent_id` INT UNSIGNED NULL DEFAULT NULL,
  `name` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `country_id` INT UNSIGNED NULL DEFAULT NULL,
  `state` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `city` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `zipcode` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `address` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `email` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `phone_code` VARCHAR(10) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `email_booking` VARCHAR(1000) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `phone` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `email_voucher` VARCHAR(1000) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `booking_allowed` TINYINT(1) NOT NULL DEFAULT '1',
  `voucher_allowed` TINYINT(1) NOT NULL DEFAULT '1',
  `net_rates` TINYINT(1) NOT NULL DEFAULT '0',
  `active` TINYINT NOT NULL DEFAULT '0',
  `promos_active` TINYINT NOT NULL DEFAULT '0',
  `notify_past_due` TINYINT NOT NULL DEFAULT '1',
  `latitude` DECIMAL(10,7) NULL DEFAULT NULL,
  `longitude` DECIMAL(10,7) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `organizations_organization_parent_id_foreign`
    FOREIGN KEY (`organization_parent_id`)
    REFERENCES `vs20211029`.`organizations` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `organizations_organization_type_id_foreign`
    FOREIGN KEY (`organization_type_id`)
    REFERENCES `vs20211029`.`organization_types` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 43
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE INDEX `organizations_organization_type_id_foreign` ON `vs20211029`.`organizations` (`organization_type_id` ASC);

CREATE INDEX `organizations_organization_parent_id_foreign` ON `vs20211029`.`organizations` (`organization_parent_id` ASC);


-- -----------------------------------------------------
-- Table `vs20211029`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vs20211029`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `last_name` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `email` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
  `password` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `photo` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `gender` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `active` INT NOT NULL,
  `terms_and_conditions` TINYINT(1) NULL DEFAULT '0',
  `language_code` VARCHAR(10) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `remember_token` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `users_organization_id_foreign`
    FOREIGN KEY (`organization_id`)
    REFERENCES `vs20211029`.`organizations` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 64
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE UNIQUE INDEX `users_email_unique` ON `vs20211029`.`users` (`email` ASC);

CREATE INDEX `users_organization_id_foreign` ON `vs20211029`.`users` (`organization_id` ASC);


-- -----------------------------------------------------
-- Table `vs20211029`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vs20211029`.`bookings` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `source_id` INT UNSIGNED NULL DEFAULT NULL,
  `user_id` INT UNSIGNED NULL DEFAULT NULL,
  `organization_id` INT UNSIGNED NULL DEFAULT NULL,
  `name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `guid` CHAR(36) NULL DEFAULT NULL,
  `age` VARCHAR(100) NOT NULL,
  `residence_country_id` INT UNSIGNED NULL,
  `email` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `phone` VARCHAR(100) NULL DEFAULT NULL,
  `number` VARCHAR(100) NOT NULL,
  `booking_status_id` INT UNSIGNED NULL,
  `pickup_office_id` INT UNSIGNED NULL,
  `dropoff_office_id` INT UNSIGNED NULL,
  `pickup_country_id` INT UNSIGNED NULL,
  `dropoff_country_id` INT UNSIGNED NULL,
  `company_id` INT UNSIGNED NOT NULL,
  `data_serialized` TEXT NULL DEFAULT NULL,
  `params_serialized` TEXT NULL DEFAULT NULL,
  `response_serialized` TEXT NULL DEFAULT NULL,
  `wizard_number` VARCHAR(100) NULL DEFAULT NULL,
  `discount_number` VARCHAR(100) NULL DEFAULT NULL,
  `coupon` VARCHAR(100) NULL DEFAULT NULL,
  `air_company` VARCHAR(100) NULL DEFAULT NULL,
  `flight_number` VARCHAR(100) NULL DEFAULT NULL,
  `frequent_flyer_program` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `frequent_flyer_membership` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `travel_agency` VARCHAR(100) NULL DEFAULT NULL,
  `travel_agency_email` VARCHAR(100) NULL DEFAULT NULL,
  `travel_agency_reward` VARCHAR(100) NULL DEFAULT NULL,
  `car_specs` TEXT NULL DEFAULT NULL,
  `car_code` VARCHAR(100) NULL DEFAULT NULL,
  `car_group` VARCHAR(100) NULL DEFAULT NULL,
  `car_image` TEXT NULL DEFAULT NULL,
  `car_name` VARCHAR(100) NULL DEFAULT NULL,
  `car_type` VARCHAR(100) NULL DEFAULT NULL,
  `iata` VARCHAR(100) NULL DEFAULT NULL,
  `id_landing` INT UNSIGNED NULL DEFAULT NULL,
  `name_landing` VARCHAR(100) NULL DEFAULT NULL,
  `vip_type` INT UNSIGNED NULL DEFAULT NULL,
  `pickup_date` DATE NULL DEFAULT NULL,
  `dropoff_date` DATE NULL DEFAULT NULL,
  `pickup_time` TIME NULL DEFAULT NULL,
  `dropoff_time` TIME NULL DEFAULT NULL,
  `rate` VARCHAR(100) NULL DEFAULT NULL,
  `base_rate` DECIMAL(15,2) NULL DEFAULT NULL,
  `base_rate_with_taxes` DECIMAL(15,2) NULL DEFAULT NULL,
  `taxes_total` DECIMAL(15,2) NULL DEFAULT NULL,
  `equipment_total` DECIMAL(15,2) NULL DEFAULT NULL,
  `estimated_total_amount` DECIMAL(15,2) NULL DEFAULT NULL,
  `taxes` TEXT NULL DEFAULT NULL,
  `manual_voucher` TINYINT(1) NOT NULL DEFAULT '0',
  `issue_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `Booking_ibfk_1`
    FOREIGN KEY (`residence_country_id`)
    REFERENCES `vs20211029`.`countries` (`id`),
  CONSTRAINT `Booking_ibfk_2`
    FOREIGN KEY (`pickup_office_id`)
    REFERENCES `vs20211029`.`offices` (`id`),
  CONSTRAINT `Booking_ibfk_3`
    FOREIGN KEY (`dropoff_office_id`)
    REFERENCES `vs20211029`.`offices` (`id`),
  CONSTRAINT `Booking_ibfk_4`
    FOREIGN KEY (`pickup_country_id`)
    REFERENCES `vs20211029`.`countries` (`id`),
  CONSTRAINT `Booking_ibfk_5`
    FOREIGN KEY (`dropoff_country_id`)
    REFERENCES `vs20211029`.`countries` (`id`),
  CONSTRAINT `Booking_ibfk_6`
    FOREIGN KEY (`company_id`)
    REFERENCES `vs20211029`.`companies` (`id`),
  CONSTRAINT `bookings_FK`
    FOREIGN KEY (`user_id`)
    REFERENCES `vs20211029`.`users` (`id`),
  CONSTRAINT `bookings_FK_1`
    FOREIGN KEY (`booking_status_id`)
    REFERENCES `vs20211029`.`booking_status` (`id`),
  CONSTRAINT `bookings_ibfk_1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `vs20211029`.`organizations` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4014
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `CountryOfResidence` ON `vs20211029`.`bookings` (`residence_country_id` ASC);

CREATE INDEX `CodeLongPickUp` ON `vs20211029`.`bookings` (`pickup_office_id` ASC);

CREATE INDEX `CodeLongDropOff` ON `vs20211029`.`bookings` (`dropoff_office_id` ASC);

CREATE INDEX `CountryPickUp` ON `vs20211029`.`bookings` (`pickup_country_id` ASC);

CREATE INDEX `CountryDropOff` ON `vs20211029`.`bookings` (`dropoff_country_id` ASC);

CREATE INDEX `Company` ON `vs20211029`.`bookings` (`company_id` ASC);

CREATE INDEX `bookings_FK` ON `vs20211029`.`bookings` (`user_id` ASC);

CREATE INDEX `bookings_booking_status_id_IDX` USING BTREE ON `vs20211029`.`bookings` (`booking_status_id`);

CREATE INDEX `organization_id` ON `vs20211029`.`bookings` (`organization_id` ASC);


-- -----------------------------------------------------
-- Table `vs20211029`.`payment_file_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vs20211029`.`payment_file_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `display_order` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `vs20211029`.`payment_files`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vs20211029`.`payment_files` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `organization_id` INT UNSIGNED NOT NULL,
  `payment_file_status_id` INT NOT NULL,
  `company_id` INT UNSIGNED NOT NULL,
  `cycle_start` DATE NOT NULL,
  `cycle_end` DATE NOT NULL,
  `account` VARCHAR(50) NOT NULL,
  `iata` VARCHAR(50) NULL DEFAULT NULL,
  `vouchers_count` INT NULL DEFAULT NULL,
  `gross_amount` DECIMAL(15,2) NULL DEFAULT NULL,
  `commission_amount` DECIMAL(15,2) NULL DEFAULT NULL,
  `net_amount` DECIMAL(15,2) NULL DEFAULT NULL,
  `abg_user_id` INT UNSIGNED NULL DEFAULT NULL,
  `comments` VARCHAR(1000) NULL DEFAULT NULL,
  `batch_file_id` INT UNSIGNED NULL DEFAULT NULL,
  `extract_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_payment_files_companies1`
    FOREIGN KEY (`company_id`)
    REFERENCES `vs20211029`.`companies` (`id`),
  CONSTRAINT `fk_payment_files_organizations1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `vs20211029`.`organizations` (`id`),
  CONSTRAINT `fk_payment_files_payment_file_batch_files1`
    FOREIGN KEY (`batch_file_id`)
    REFERENCES `vs20211029`.`payment_file_batch_files` (`id`),
  CONSTRAINT `fk_payment_files_payment_file_status1`
    FOREIGN KEY (`payment_file_status_id`)
    REFERENCES `vs20211029`.`payment_file_status` (`id`),
  CONSTRAINT `fk_payment_files_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `vs20211029`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 142
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_payment_files_payment_file_status1_idx` ON `vs20211029`.`payment_files` (`payment_file_status_id` ASC);

CREATE INDEX `fk_payment_files_users1_idx` ON `vs20211029`.`payment_files` (`user_id` ASC);

CREATE INDEX `fk_payment_files_organizations1_idx` ON `vs20211029`.`payment_files` (`organization_id` ASC);

CREATE INDEX `fk_payment_files_companies1_idx` ON `vs20211029`.`payment_files` (`company_id` ASC);

CREATE INDEX `fk_payment_files_payment_file_batch_files1_idx` ON `vs20211029`.`payment_files` (`batch_file_id` ASC);


-- -----------------------------------------------------
-- Table `vs20211029`.`voucher_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vs20211029`.`voucher_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `display_order` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `vs20211029`.`vouchers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vs20211029`.`vouchers` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `booking_id` INT UNSIGNED NOT NULL,
  `gsa_organization_id` INT UNSIGNED NOT NULL,
  `organization_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `company_id` INT UNSIGNED NOT NULL,
  `iata_code` VARCHAR(50) NOT NULL,
  `number` VARCHAR(50) NULL DEFAULT NULL,
  `voucher_status_id` INT NOT NULL,
  `voucher_sub_status_id` INT UNSIGNED NULL DEFAULT NULL,
  `payment_file_id` INT UNSIGNED NULL DEFAULT NULL COMMENT 'Esta columna identifica el lote en el que es incluido este voucher.\\nSi el lote se rechaza, este campo se blanquea. (queda la información en payment_file_vouchers)\\n',
  `past_due` TINYINT UNSIGNED NOT NULL DEFAULT '1',
  `account` VARCHAR(50) NOT NULL,
  `booking_base_rate` DECIMAL(15,2) NOT NULL,
  `booking_taxes` DECIMAL(15,2) NOT NULL,
  `booking_total` DECIMAL(15,2) NOT NULL,
  `gross_amount` DECIMAL(15,2) NOT NULL COMMENT 'El monto por el cual se generó el Voucher.\\ndebe corresponder con el booking_base_rate o booking_total.\\n',
  `gsa_comission_rate` DECIMAL(10,2) NOT NULL,
  `gsa_taxes_included` TINYINT(1) NOT NULL COMMENT 'Indica si comisiona sobre los impuestos\\n',
  `gsa_comission_amount` DECIMAL(15,2) NOT NULL COMMENT 'Importe calculado de la comisión GSA.',
  `agency_comission_rate` DECIMAL(10,2) NULL DEFAULT NULL COMMENT 'Comisión de la Agencia.',
  `agency_taxes_included` TINYINT(1) NULL DEFAULT NULL COMMENT 'Si comisiona sobre los impuestos.',
  `agency_comission_amount` DECIMAL(10,2) NULL DEFAULT NULL,
  `abg_net_amount` DECIMAL(15,2) NOT NULL COMMENT 'Importe correspondiente a ABG. (gross_amount - gsa_comission_amount)\\n',
  `issue_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `agency_file_number` VARCHAR(100) NULL DEFAULT NULL,
  `net_rate` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Las tarifas netas tienen valor 1',
  `manual_voucher` TINYINT(1) NOT NULL DEFAULT '0',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_vouchers_bookings1`
    FOREIGN KEY (`booking_id`)
    REFERENCES `vs20211029`.`bookings` (`id`),
  CONSTRAINT `fk_vouchers_companies1`
    FOREIGN KEY (`company_id`)
    REFERENCES `vs20211029`.`companies` (`id`),
  CONSTRAINT `fk_vouchers_organizations1`
    FOREIGN KEY (`gsa_organization_id`)
    REFERENCES `vs20211029`.`organizations` (`id`),
  CONSTRAINT `fk_vouchers_payment_files1`
    FOREIGN KEY (`payment_file_id`)
    REFERENCES `vs20211029`.`payment_files` (`id`),
  CONSTRAINT `fk_vouchers_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `vs20211029`.`users` (`id`),
  CONSTRAINT `fk_vouchers_voucher_status1`
    FOREIGN KEY (`voucher_status_id`)
    REFERENCES `vs20211029`.`voucher_status` (`id`),
  CONSTRAINT `fk_vouchers_organizations2`
    FOREIGN KEY (`organization_id`)
    REFERENCES `vs20211029`.`organizations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1757
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_vouchers_bookings1_idx` ON `vs20211029`.`vouchers` (`booking_id` ASC);

CREATE INDEX `fk_vouchers_users1_idx` ON `vs20211029`.`vouchers` (`user_id` ASC);

CREATE INDEX `fk_vouchers_companies1_idx` ON `vs20211029`.`vouchers` (`company_id` ASC);

CREATE INDEX `fk_vouchers_voucher_status1_idx` ON `vs20211029`.`vouchers` (`voucher_status_id` ASC);

CREATE INDEX `fk_vouchers_payment_files1_idx` ON `vs20211029`.`vouchers` (`payment_file_id` ASC);

CREATE INDEX `fk_vouchers_organizations1_idx` ON `vs20211029`.`vouchers` (`gsa_organization_id` ASC);

CREATE INDEX `vouchers_number_IDX` USING BTREE ON `vs20211029`.`vouchers` (`number`);

CREATE INDEX `fk_vouchers_organizations2_idx` ON `vs20211029`.`vouchers` (`organization_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;