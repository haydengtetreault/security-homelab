-- Run as the MariaDB admin. Replace the password placeholder.
CREATE DATABASE guestbook CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'guestbook_app'@'localhost' IDENTIFIED BY 'CHANGE_ME';
GRANT SELECT, INSERT, UPDATE, DELETE ON guestbook.* TO 'guestbook_app'@'localhost';
FLUSH PRIVILEGES;

USE guestbook;
CREATE TABLE entries (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  message TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
