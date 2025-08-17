
-- STEP 1: CREATE DATABASE AND SELECT IT
CREATE DATABASE IF NOT EXISTS `alx_book_store`;
USE `alx_book_store`;

-- STEP 2: CREATE AUTHORS TABLE
CREATE TABLE `Authors` (
  `author_id` INT AUTO_INCREMENT PRIMARY KEY,
  `author_name` VARCHAR(215) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

-- STEP 3: CREATE CUSTOMERS TABLE
CREATE TABLE `Customers` (
  `customer_id` INT AUTO_INCREMENT PRIMARY KEY,
  `customer_name` VARCHAR(215) NOT NULL,
  `email` VARCHAR(215),
  `address` TEXT
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

-- STEP 4: CREATE BOOKS TABLE (WITH FOREIGN KEY TO AUTHORS)
CREATE TABLE `Books` (
  `book_id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(130) NOT NULL,
  `author_id` INT,
  `price` DOUBLE,
  `publication_date` DATE,
  CONSTRAINT `fk_books_author`
    FOREIGN KEY (`author_id`) REFERENCES `Authors`(`author_id`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

-- Helpful index for the foreign key
CREATE INDEX `idx_books_author_id` ON `Books`(`author_id`);

-- STEP 5: CREATE ORDERS TABLE (WITH FOREIGN KEY TO CUSTOMERS)
CREATE TABLE `Orders` (
  `order_id` INT AUTO_INCREMENT PRIMARY KEY,
  `customer_id` INT,
  `order_date` DATE,
  CONSTRAINT `fk_orders_customer`
    FOREIGN KEY (`customer_id`) REFERENCES `Customers`(`customer_id`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

-- Helpful index for the foreign key
CREATE INDEX `idx_orders_customer_id` ON `Orders`(`customer_id`);

-- STEP 6: CREATE ORDER_DETAILS TABLE (WITH FKs TO ORDERS AND BOOKS)
CREATE TABLE `Order_Details` (
  `orderdetailid` INT AUTO_INCREMENT PRIMARY KEY,
  `order_id` INT,
  `book_id` INT,
  `quantity` DOUBLE,
  CONSTRAINT `fk_orderdetails_order`
    FOREIGN KEY (`order_id`) REFERENCES `Orders`(`order_id`)
    ON UPDATE RESTRICT ON DELETE CASCADE,
  CONSTRAINT `fk_orderdetails_book`
    FOREIGN KEY (`book_id`) REFERENCES `Books`(`book_id`)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

-- Helpful indexes for the foreign keys
CREATE INDEX `idx_orderdetails_order_id` ON `Order_Details`(`order_id`);
CREATE INDEX `idx_orderdetails_book_id` ON `Order_Details`(`book_id`);

-- SCHEMA COMPLETE
