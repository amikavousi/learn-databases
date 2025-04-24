/* =============================================
   Section 1: Basic Example – Personal Contacts DB
   Purpose: Introduce basic database and table creation
   ============================================= */

-- 👍 Create the database
CREATE DATABASE IF NOT EXISTS contacts_db;
USE contacts_db;

SELECT * FROM blog.users;

-- 👨‍🏫 Create a simple table to store contacts
CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESCRIBE contacts;


/* =============================================
   Section 2: Intermediate Example – Online Store
   Purpose: Teach multiple tables, constraints, and relationships
   ============================================= */

-- 👍 Create the database
DROP DATABASE IF EXISTS online_store;
CREATE DATABASE online_store;
USE online_store;

-- 👨‍🏫 Roles table for user access levels
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 👨‍🏫 Users table with foreign key to roles
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 👨‍🏫 Products table with a foreign key to users (owner/creator)
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    seller_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) CHECK (price >= 0),
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_id) REFERENCES users(id)
        ON DELETE CASCADE
);


/* =============================================
   Section 3: Advanced Example – School Management
   Purpose: Use ENUMs, table renaming, altering, constraints
   ============================================= */

-- 👍 Create the database
CREATE DATABASE IF NOT EXISTS school_mgmt;
USE school_mgmt;

-- 👨‍🏫 Users table with roles like teacher or student
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role ENUM('teacher', 'student') NOT NULL DEFAULT 'student',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 👨‍🏫 Classes table linked to a teacher (user)
CREATE TABLE IF NOT EXISTS school_mgmt.classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    class_title VARCHAR(100) NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES users(id)
        ON DELETE CASCADE
);

-- 👨‍🏫 Groups for class activities or teams
CREATE TABLE `groups` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 👨‍🏫 Table Alterations: Teach altering table structure
ALTER TABLE `groups` ADD COLUMN capacity INT;
ALTER TABLE `groups` RENAME COLUMN title TO group_name;
ALTER TABLE `groups` DROP COLUMN created_at;

-- 👨‍🏫 Table Rename
RENAME TABLE school_mgmt.`groups` TO class_groups;

-- 👨‍🏫 Trancate Table
TRUNCATE TABLE users;

/* =============================================
   Comments in SQL
   ============================================= */

-- This is a single-line comment using --
# This is a single-line comment using #
/*
This is a multi-line
comment in SQL
*/