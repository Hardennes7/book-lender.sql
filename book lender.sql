-- CREATE DATABASE  bookLender;
USE bookLender;

-- Users table
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  role ENUM('reader', 'seller'),
  phone VARCHAR(20),
  email VARCHAR(100) UNIQUE
);

-- Books table
CREATE TABLE books (
  id INT AUTO_INCREMENT PRIMARY KEY,
  seller_id INT,
  title VARCHAR(255),
  description TEXT,
  file_url TEXT,  -- URL to viewable book
  price DECIMAL(10, 2),
  FOREIGN KEY (seller_id) REFERENCES users(id)
);

-- Lending table
CREATE TABLE lending (
  id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT,
  reader_id INT,
  start_time DATETIME,
  end_time DATETIME,
  FOREIGN KEY (book_id) REFERENCES books(id),
  FOREIGN KEY (reader_id) REFERENCES users(id)
);

-- Transactions table
CREATE TABLE transactions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  reader_id INT,
  book_id INT,
  amount DECIMAL(10, 2),
  seller_fee DECIMAL(10, 2),
  service_fee DECIMAL(10, 2),
  payment_status VARCHAR(50),
  FOREIGN KEY (reader_id) REFERENCES users(id),
  FOREIGN KEY (book_id) REFERENCES books(id)
);
