-- Lab Sheet 1: DDL Commands (CREATE, ALTER and DROP)
-- DBMS: MySQL
-- Run this file from top to bottom.

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- 1. Create the Student table.
CREATE TABLE IF NOT EXISTS Student (
    Student_ID INT,
    Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

-- 2. Create the Employee table.
CREATE TABLE IF NOT EXISTS Employee (
    Emp_ID INT,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- 3. Create the Department table.
CREATE TABLE IF NOT EXISTS Department (
    Dept_ID INT,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

-- 4. Create the Product table.
CREATE TABLE IF NOT EXISTS Product (
    Product_ID INT,
    Product_Name VARCHAR(80),
    Price DECIMAL(10,2),
    Quantity INT
);

-- 5. Create the Customer table.
CREATE TABLE IF NOT EXISTS Customer (
    Customer_ID INT,
    Customer_Name VARCHAR(80),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- 6. Create the Course table.
CREATE TABLE IF NOT EXISTS Course (
    Course_ID INT,
    Course_Name VARCHAR(80),
    Duration VARCHAR(30),
    Fees DECIMAL(10,2)
);

-- 7. Create the Faculty table.
CREATE TABLE IF NOT EXISTS Faculty (
    Faculty_ID INT,
    Faculty_Name VARCHAR(80),
    Subject VARCHAR(60),
    Salary DECIMAL(10,2)
);

-- 8. Create the Library table.
CREATE TABLE IF NOT EXISTS Library (
    Book_ID INT,
    Book_Name VARCHAR(100),
    Author VARCHAR(80),
    Price DECIMAL(10,2)
);

-- 9. Department table with a primary key.
CREATE TABLE IF NOT EXISTS Department_PK (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

-- 10. Student table with a primary key and NOT NULL name.
CREATE TABLE IF NOT EXISTS Student_Constraints (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

-- 11. Employee table with a UNIQUE Email.
CREATE TABLE IF NOT EXISTS Employee_Unique (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- 12. Product table with a CHECK constraint.
CREATE TABLE IF NOT EXISTS Product_Check (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(80),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Quantity INT
);

-- 13. Add Email column to Student.
ALTER TABLE Student ADD COLUMN Email VARCHAR(100);

-- 14. Add Phone column to Student.
ALTER TABLE Student ADD COLUMN Phone VARCHAR(20);

-- 15. Modify the Name column size.
ALTER TABLE Student MODIFY COLUMN Name VARCHAR(100);

-- 16. Rename Student table.
ALTER TABLE Student RENAME TO Student_Details;

-- 17. Rename City column to Address.
ALTER TABLE Student_Details RENAME COLUMN City TO Address;

-- 18. Add Salary column to Employee.
ALTER TABLE Employee ADD COLUMN Salary_Bonus DECIMAL(10,2);

-- 19. Drop Phone column from Student_Details.
ALTER TABLE Student_Details DROP COLUMN Phone;

-- 20. Drop Email column from Student_Details.
ALTER TABLE Student_Details DROP COLUMN Email;

-- 21. TRUNCATE removes all rows but keeps the table structure.
-- This table is empty in this demonstration, so it is safe to run.
TRUNCATE TABLE Library;

-- 22. Drop the Course table.
DROP TABLE IF EXISTS Course;

-- 23. Drop the Customer table.
DROP TABLE IF EXISTS Customer;

-- 24. Complete Student table using PRIMARY KEY, NOT NULL, UNIQUE and CHECK.
CREATE TABLE IF NOT EXISTS Student_Complete (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(60) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 16),
    Course VARCHAR(60),
    City VARCHAR(50)
);

-- 25. Demonstrate ALTER and DROP operations on the complete table.
ALTER TABLE Student_Complete ADD COLUMN Phone VARCHAR(20);
ALTER TABLE Student_Complete MODIFY COLUMN City VARCHAR(80);
ALTER TABLE Student_Complete DROP COLUMN Phone;

-- Check the tables and final structure.
SHOW TABLES;
DESCRIBE Student_Details;
DESCRIBE Student_Complete;
