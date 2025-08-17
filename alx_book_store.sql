-- STEP 1: CREATE DATABASE
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- STEP 2: SELECT DATABASE
USE alx_book_store;

-- STEP 3: CREATE AUTHORS TABLE
CREATE TABLE Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL
);

-- STEP 4: CREATE BOOKS TABLE
CREATE TABLE Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT,
  price DOUBLE,
  publication_date DATE,
  FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- STEP 5: CREATE CUSTOMERS TABLE
CREATE TABLE Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215),
  address TEXT
);

-- STEP 6: CREATE ORDERS TABLE
CREATE TABLE Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- STEP 7: CREATE ORDER_DETAILS TABLE
CREATE TABLE Order_details (
  orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  book_id INT,
  quantity DOUBLE,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (book_id) REFERENCES books(book_id)
);
