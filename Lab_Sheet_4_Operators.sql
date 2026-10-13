-- Lab Sheet 4: SQL Operators
-- DBMS: MySQL
-- Run this file from top to bottom.

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Student_Union;

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50),
    Email VARCHAR(100) NULL
);
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(60),
    Price DECIMAL(10,2),
    Quantity INT
);
CREATE TABLE Student_Union (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Student VALUES
(1, 'Aman', 19, 'BCA', 'Roorkee', 'aman@example.com'),
(2, 'Neha', 20, 'BTech', 'Delhi', NULL),
(3, 'Rohit', 18, 'BCA', 'Meerut', 'rohit@example.com'),
(4, 'Priya', 21, 'BTech', 'Roorkee', NULL),
(5, 'Karan', 22, 'BCom', 'Haridwar', 'karan@example.com');

INSERT INTO Employee VALUES
(101, 'Vikas', 'IT', 42000),
(102, 'Meena', 'HR', 35000),
(103, 'Sahil', 'Sales', 30000),
(104, 'Pooja', 'IT', 51000);

INSERT INTO Product VALUES
(1, 'Keyboard', 850, 4),
(2, 'Mouse', 450, 0),
(3, 'Monitor', 7800, 5);

INSERT INTO Student_Union VALUES
(3, 'Rohit'), (4, 'Priya'), (6, 'Ishita');

-- Arithmetic Operators

-- 1. Addition.
SELECT 10 + 5 AS Addition;

-- 2. Subtraction.
SELECT 10 - 5 AS Subtraction;

-- 3. Multiplication.
SELECT 10 * 5 AS Multiplication;

-- 4. Division.
SELECT 10 / 5 AS Division;

-- 5. Calculate total amount for each product.
SELECT Product_Name, Price, Quantity, Price * Quantity AS Total_Amount
FROM Product;

-- Logical Operators

-- 6. AND: both conditions must be true.
SELECT * FROM Student WHERE Course = 'BCA' AND City = 'Roorkee';

-- 7. OR: either condition may be true.
SELECT * FROM Student WHERE City = 'Delhi' OR City = 'Meerut';

-- 8. NOT: returns rows that do not match the condition.
SELECT * FROM Student WHERE NOT Course = 'BCA';

-- 9. Students in a specific course AND city.
SELECT * FROM Student WHERE Course = 'BTech' AND City = 'Roorkee';

-- 10. Employees from either of two departments.
SELECT * FROM Employee WHERE Department = 'IT' OR Department = 'HR';

-- Comparison Operators

-- 11. Equal to (=).
SELECT * FROM Student WHERE City = 'Delhi';

-- 12. Greater than (>).
SELECT * FROM Employee WHERE Salary > 35000;

-- 13. Less than (<).
SELECT * FROM Student WHERE Age < 20;

-- 14. Greater than or equal to and less than or equal to.
SELECT * FROM Employee WHERE Salary >= 30000 AND Salary <= 42000;

-- 15. Not equal to (<> or !=).
SELECT * FROM Student WHERE Course <> 'BCA';

-- Special Operators

-- 16. BETWEEN includes both endpoints.
SELECT * FROM Employee WHERE Salary BETWEEN 30000 AND 45000;

-- 17. IN selects any value from a list.
SELECT * FROM Student WHERE City IN ('Delhi', 'Roorkee');

-- 18. NOT IN excludes the listed values.
SELECT * FROM Student WHERE City NOT IN ('Delhi', 'Roorkee');

-- 19. LIKE finds names beginning with A.
SELECT * FROM Student WHERE Name LIKE 'A%';

-- 20. IS NULL and IS NOT NULL.
SELECT * FROM Student WHERE Email IS NULL;
SELECT * FROM Student WHERE Email IS NOT NULL;

-- Set Operations

-- 21. UNION combines results and removes duplicates.
SELECT Name FROM Student WHERE Course = 'BCA'
UNION
SELECT Name FROM Student_Union;

-- 22. UNION ALL keeps duplicates.
SELECT Name FROM Student WHERE Course = 'BCA'
UNION ALL
SELECT Name FROM Student_Union;

-- 23. MySQL versions before 8.0.31 do not support INTERSECT.
-- Use an INNER JOIN as an equivalent demonstration.
SELECT DISTINCT s.Name
FROM Student s
INNER JOIN Student_Union u ON s.Name = u.Name;

-- 24. MySQL versions before 8.0.31 do not support EXCEPT.
-- Use LEFT JOIN to show names from Student that are not in Student_Union.
SELECT s.Name
FROM Student s
LEFT JOIN Student_Union u ON s.Name = u.Name
WHERE u.Name IS NULL;

-- 25. Combine arithmetic, logical, comparison and special operators.
SELECT Product_Name, Price, Quantity, Price * Quantity AS Total_Amount
FROM Product
WHERE Price > 500 AND Quantity BETWEEN 1 AND 10
  AND Product_Name LIKE '%o%';
