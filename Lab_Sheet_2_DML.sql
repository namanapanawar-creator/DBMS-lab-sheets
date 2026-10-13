-- Lab Sheet 2: DML Commands (INSERT, UPDATE and DELETE)
-- DBMS: MySQL
-- Run this file from top to bottom.

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Course;

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(80),
    Price DECIMAL(10,2),
    Quantity INT
);
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(80),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(80),
    Duration VARCHAR(30),
    Fees DECIMAL(10,2)
);

-- 1. Insert one student.
INSERT INTO Student VALUES (1, 'Aman', 19, 'BCA', 'Roorkee');

-- 2. Insert five records using separate INSERT statements.
INSERT INTO Student VALUES (2, 'Neha', 20, 'BTech', 'Delhi');
INSERT INTO Student VALUES (3, 'Rohit', 18, 'BCA', 'Meerut');
INSERT INTO Student VALUES (4, 'Priya', 21, 'BTech', 'Roorkee');
INSERT INTO Student VALUES (5, 'Karan', 20, 'BCom', 'Haridwar');
INSERT INTO Student VALUES (6, 'Simran', 19, 'BCA', 'Delhi');

-- 3. Insert multiple records with one statement.
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES
(7, 'Ishita', 18, 'BBA', 'Dehradun'),
(8, 'Arjun', 22, 'BTech', 'Haridwar');

-- 4. Insert Employee records.
INSERT INTO Employee VALUES
(101, 'Vikas', 'IT', 42000),
(102, 'Meena', 'HR', 35000),
(103, 'Sahil', 'Sales', 30000);

-- 5. Insert Department records.
INSERT INTO Department VALUES
(1, 'IT', 'Block A'),
(2, 'HR', 'Block B'),
(3, 'Sales', 'Block C');

-- 6. Insert Product records.
INSERT INTO Product VALUES
(1, 'Keyboard', 850, 15),
(2, 'Mouse', 450, 0),
(3, 'Monitor', 7800, 5);

-- 7. Insert Customer records.
INSERT INTO Customer VALUES
(1, 'Riya Sharma', 'riya@example.com', '9876501234'),
(2, 'Mohit Verma', 'mohit@example.com', '9876501235');

-- 8. Insert Course records.
INSERT INTO Course VALUES
(1, 'BCA', '3 years', 65000),
(2, 'BTech CSE', '4 years', 95000);

-- 9. Insert a student with values for all columns.
INSERT INTO Student VALUES (9, 'Pooja', 20, 'BBA', 'Dehradun');

-- 10. Insert by specifying selected columns; unspecified columns become NULL.
INSERT INTO Student (Student_ID, Name, Course) VALUES (10, 'Dev', 'BCA');

-- 11. Update the city of one student.
UPDATE Student SET City = 'Chandigarh' WHERE Student_ID = 2;

-- 12. Update one employee's salary.
UPDATE Employee SET Salary = 45000 WHERE Emp_ID = 101;

-- 13. Increase all employee salaries by 10%.
UPDATE Employee SET Salary = Salary * 1.10;

-- 14. Increase all product prices by 5%.
UPDATE Product SET Price = Price * 1.05;

-- 15. Change one student's course.
UPDATE Student SET Course = 'BTech CSE' WHERE Student_ID = 3;

-- 16. Update an employee's department.
UPDATE Employee SET Department = 'Operations' WHERE Emp_ID = 103;

-- 17. Change students' city from Meerut to Delhi.
UPDATE Student SET City = 'Delhi' WHERE City = 'Meerut';

-- 18. Update the fees of a particular course.
UPDATE Course SET Fees = 70000 WHERE Course_ID = 1;

-- 19. Update multiple columns at the same time.
UPDATE Student SET Age = 21, City = 'Roorkee' WHERE Student_ID = 4;

-- 20. Delete one student by Student_ID.
DELETE FROM Student WHERE Student_ID = 10;

-- 21. Delete students belonging to a particular city.
DELETE FROM Student WHERE City = 'Chandigarh';

-- 22. Delete employees whose salary is below a specified amount.
DELETE FROM Employee WHERE Salary < 32000;

-- 23. Delete products whose quantity is zero.
DELETE FROM Product WHERE Quantity = 0;

-- 24. Delete rows using multiple conditions (AND / OR).
DELETE FROM Student
WHERE (Course = 'BCom' AND Age < 21) OR City = 'Haridwar';

-- 25. Display the Student table after INSERT, UPDATE and DELETE operations.
SELECT * FROM Student ORDER BY Student_ID;
