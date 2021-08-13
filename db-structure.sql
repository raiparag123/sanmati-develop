CREATE TABLE `admin_user` (
	`admin_id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`email_id` varchar(50) NOT NULL,
	`admin_type` varchar(10) NOT NULL,
	`doc` DATETIME NOT NULL,
	`is_active` TINYINT(1) NOT NULL DEFAULT '1',
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`admin_id`)
);

CREATE TABLE `module` (
	`module_id` INT NOT NULL AUTO_INCREMENT,
	`module_name` varchar(99) NOT NULL UNIQUE,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`module_id`)
);

CREATE TABLE `admin_permisson` (
	`permission_id` INT NOT NULL AUTO_INCREMENT,
	`module_id` INT NOT NULL,
	`admin_id` INT NOT NULL,
	`view` TINYINT(1) NOT NULL,
	`edit` TINYINT(1) NOT NULL,
	`delete` TINYINT(1) NOT NULL,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`permission_id`)
);

CREATE TABLE `customer` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(99) NOT NULL,
	`mobile_number` varchar(99) NOT NULL,
	`email_id` varchar(99) NOT NULL,
	`location` varchar(999) NOT NULL,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE `category` (
	`category_id` INT NOT NULL AUTO_INCREMENT,
	`category_name` varchar(99) NOT NULL UNIQUE,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`category_id`)
);

CREATE TABLE `sub_category_1` (
	`sub_category_id` INT NOT NULL AUTO_INCREMENT,
	`category_name` varchar(99) NOT NULL UNIQUE,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL,
	PRIMARY KEY (`sub_category_id`)
);

CREATE TABLE `product` (
	`product_id` INT NOT NULL AUTO_INCREMENT,
	`product_name` varchar(99) NOT NULL,
	`product_code` varchar(99) NOT NULL,
	`product_desc` varchar(999) NOT NULL,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`product_id`)
);

CREATE TABLE `product_category` (
	`product_category_id` INT NOT NULL AUTO_INCREMENT,
	`product_id` INT NOT NULL,
	`category_id` INT NOT NULL,
	`sub_category_1_id` INT NOT NULL,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`product_category_id`)
);

CREATE TABLE `attribute` (
	`attribute_id` INT NOT NULL AUTO_INCREMENT,
	`attribute_name` varchar(99) NOT NULL,
	`attribute_unit` varchar(99),
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`attribute_id`)
);

CREATE TABLE `product_attribute` (
	`product_attribute_id` INT NOT NULL AUTO_INCREMENT,
	`product_id` INT NOT NULL,
	`attribute_id` INT NOT NULL,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`product_attribute_id`)
);

CREATE TABLE `product_media` (
	`product_media_id` INT NOT NULL AUTO_INCREMENT,
	`product_id` INT NOT NULL,
	`media_url` varchar(999) NOT NULL,
	`media_seq` INT(20) NOT NULL,
	`media_type` varchar(10) NOT NULL,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`product_media_id`)
);

CREATE TABLE `real_stock_request` (
	`request_id` INT NOT NULL AUTO_INCREMENT,
	`doc` DATETIME NOT NULL,
	`doe` DATETIME NOT NULL,
	`url` varchar(999) NOT NULL,
	`url_hit` INT NOT NULL,
	`is_active` TINYINT(1) NOT NULL DEFAULT '1',
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`request_id`)
);

CREATE TABLE `real_stock_customer` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(99),
	`mobile_number` varchar(99),
	`email_id` varchar(99),
	`location` varchar(999),
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE `real_stock_request_detail` (
	`detail_id` INT NOT NULL AUTO_INCREMENT,
	`request_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`detail_id`)
);

ALTER TABLE `admin_permisson` ADD CONSTRAINT `admin_permisson_fk0` FOREIGN KEY (`module_id`) REFERENCES `module`(`module_id`);

ALTER TABLE `admin_permisson` ADD CONSTRAINT `admin_permisson_fk1` FOREIGN KEY (`admin_id`) REFERENCES `admin_user`(`admin_id`);

ALTER TABLE `product_category` ADD CONSTRAINT `product_category_fk0` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);

ALTER TABLE `product_category` ADD CONSTRAINT `product_category_fk1` FOREIGN KEY (`category_id`) REFERENCES `category`(`category_id`);

ALTER TABLE `product_category` ADD CONSTRAINT `product_category_fk2` FOREIGN KEY (`sub_category_1_id`) REFERENCES `sub_category_1`(`sub_category_id`);

ALTER TABLE `product_attribute` ADD CONSTRAINT `product_attribute_fk0` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);

ALTER TABLE `product_attribute` ADD CONSTRAINT `product_attribute_fk1` FOREIGN KEY (`attribute_id`) REFERENCES `attribute`(`attribute_id`);

ALTER TABLE `product_media` ADD CONSTRAINT `product_media_fk0` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);

ALTER TABLE `real_stock_request_detail` ADD CONSTRAINT `real_stock_request_detail_fk0` FOREIGN KEY (`request_id`) REFERENCES `real_stock_request`(`request_id`);

ALTER TABLE `real_stock_request_detail` ADD CONSTRAINT `real_stock_request_detail_fk1` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);




CREATE TABLE `sub_category_2` (
	`sub_category_id` INT NOT NULL AUTO_INCREMENT,
	`category_name` varchar(99) NOT NULL UNIQUE,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL,
	PRIMARY KEY (`sub_category_id`)
);

ALTER TABLE product_category
ADD `sub_category_2_id` INT NOT NULL;

ALTER TABLE `product_category` ADD CONSTRAINT `product_category_fk3` FOREIGN KEY (`sub_category_2_id`) REFERENCES `sub_category_2`(`sub_category_id`); 





CREATE TABLE `sub_category_3` (
	`sub_category_id` INT NOT NULL AUTO_INCREMENT,
	`category_name` varchar(99) NOT NULL UNIQUE,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL,
	PRIMARY KEY (`sub_category_id`)
);

CREATE TABLE `sub_category_4` (
	`sub_category_id` INT NOT NULL AUTO_INCREMENT,
	`category_name` varchar(99) NOT NULL UNIQUE,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL,
	PRIMARY KEY (`sub_category_id`)
);

CREATE TABLE `sub_category_5` (
	`sub_category_id` INT NOT NULL AUTO_INCREMENT,
	`category_name` varchar(99) NOT NULL UNIQUE,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL,
	PRIMARY KEY (`sub_category_id`)
);

CREATE TABLE `sub_category_6` (
	`sub_category_id` INT NOT NULL AUTO_INCREMENT,
	`category_name` varchar(99) NOT NULL UNIQUE,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL,
	PRIMARY KEY (`sub_category_id`)
);
CREATE TABLE `sub_category_7` (
	`sub_category_id` INT NOT NULL AUTO_INCREMENT,
	`category_name` varchar(99) NOT NULL UNIQUE,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL,
	PRIMARY KEY (`sub_category_id`)
);

CREATE TABLE `sub_category_8` (
	`sub_category_id` INT NOT NULL AUTO_INCREMENT,
	`category_name` varchar(99) NOT NULL UNIQUE,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL,
	PRIMARY KEY (`sub_category_id`)
);

CREATE TABLE `sub_category_9` (
	`sub_category_id` INT NOT NULL AUTO_INCREMENT,
	`category_name` varchar(99) NOT NULL UNIQUE,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL,
	PRIMARY KEY (`sub_category_id`)
);

CREATE TABLE `sub_category_10` (
	`sub_category_id` INT NOT NULL AUTO_INCREMENT,
	`category_name` varchar(99) NOT NULL UNIQUE,
	`doc` DATETIME NOT NULL,
	`is_deleted` TINYINT(1) NOT NULL,
	PRIMARY KEY (`sub_category_id`)
);

ALTER TABLE product_category
ADD `sub_category_3_id` INT NOT NULL;

ALTER TABLE product_category
ADD `sub_category_4_id` INT NOT NULL;

ALTER TABLE product_category
ADD `sub_category_5_id` INT NOT NULL;

ALTER TABLE product_category
ADD `sub_category_6_id` INT NOT NULL;

ALTER TABLE product_category
ADD `sub_category_7_id` INT NOT NULL;

ALTER TABLE product_category
ADD `sub_category_8_id` INT NOT NULL;

ALTER TABLE product_category
ADD `sub_category_9_id` INT NOT NULL;


ALTER TABLE product_category
ADD `sub_category_10_id` INT NOT NULL;


ALTER TABLE `product_category` ADD CONSTRAINT `product_category_fk4` FOREIGN KEY (`sub_category_3_id`) REFERENCES `sub_category_3`(`sub_category_id`); 

ALTER TABLE `product_category` ADD CONSTRAINT `product_category_fk5` FOREIGN KEY (`sub_category_4_id`) REFERENCES `sub_category_4`(`sub_category_id`); 

ALTER TABLE `product_category` ADD CONSTRAINT `product_category_fk6` FOREIGN KEY (`sub_category_5_id`) REFERENCES `sub_category_5`(`sub_category_id`); 

ALTER TABLE `product_category` ADD CONSTRAINT `product_category_fk7` FOREIGN KEY (`sub_category_6_id`) REFERENCES `sub_category_6`(`sub_category_id`); 

ALTER TABLE `product_category` ADD CONSTRAINT `product_category_fk8` FOREIGN KEY (`sub_category_7_id`) REFERENCES `sub_category_7`(`sub_category_id`); 

ALTER TABLE `product_category` ADD CONSTRAINT `product_category_fk9` FOREIGN KEY (`sub_category_8_id`) REFERENCES `sub_category_8`(`sub_category_id`); 

ALTER TABLE `product_category` ADD CONSTRAINT `product_category_fk10` FOREIGN KEY (`sub_category_9_id`) REFERENCES `sub_category_9`(`sub_category_id`); 

ALTER TABLE `product_category` ADD CONSTRAINT `product_category_fk11` FOREIGN KEY (`sub_category_10_id`) REFERENCES `sub_category_10`(`sub_category_id`); 


