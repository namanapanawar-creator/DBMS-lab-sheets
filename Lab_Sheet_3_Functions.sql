-- Lab Sheet 3: SQL Functions
-- DBMS: MySQL
-- Run this file from top to bottom.

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(40),
    Last_Name VARCHAR(40),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50),
    Admission_Date DATE
);
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(60),
    Salary DECIMAL(10,2),
    Joining_Date DATE
);

INSERT INTO Student VALUES
(1, 'Aman', 'Kumar', 19, 'BCA', 'Roorkee', '2025-07-15'),
(2, 'Neha', 'Sharma', 20, 'BTech', 'Delhi', '2024-08-10'),
(3, 'Rohit', 'Singh', 18, 'BCA', 'Meerut', '2025-01-20'),
(4, 'Priya', 'Verma', 21, 'BTech', 'Roorkee', '2023-07-05');

INSERT INTO Employee VALUES
(101, 'Vikas', 42500.75, '2022-04-12'),
(102, 'Meena', 35800.40, '2023-09-01'),
(103, 'Sahil', 30750.90, '2021-02-18');

-- A. Number Functions

-- 1. ABS() returns the absolute value.
SELECT ABS(-25) AS Absolute_Value;

-- 2. ROUND() rounds a number to the given decimal places.
SELECT ROUND(123.456, 2) AS Rounded_Value;

-- 3. CEIL() rounds upward and FLOOR() rounds downward.
SELECT CEIL(12.3) AS Rounded_Up, FLOOR(12.9) AS Rounded_Down;

-- 4. MOD() returns the remainder.
SELECT MOD(17, 5) AS Remainder;

-- 5. Show rounded employee salaries.
SELECT Emp_Name, Salary, ROUND(Salary) AS Rounded_Salary
FROM Employee;

-- B. Aggregate Functions

-- 6. Count students.
SELECT COUNT(*) AS Total_Students FROM Student;

-- 7. Total salary.
SELECT SUM(Salary) AS Total_Salary FROM Employee;

-- 8. Average salary.
SELECT AVG(Salary) AS Average_Salary FROM Employee;

-- 9. Highest salary.
SELECT MAX(Salary) AS Highest_Salary FROM Employee;

-- 10. Lowest salary.
SELECT MIN(Salary) AS Lowest_Salary FROM Employee;

-- C. Character Functions

-- 11. Convert names to uppercase.
SELECT First_Name, UPPER(First_Name) AS Upper_Name FROM Student;

-- 12. Convert names to lowercase.
SELECT First_Name, LOWER(First_Name) AS Lower_Name FROM Student;

-- 13. Find the length of each first name.
SELECT First_Name, LENGTH(First_Name) AS Name_Length FROM Student;

-- 14. Join first and last names.
SELECT CONCAT(First_Name, ' ', Last_Name) AS Full_Name FROM Student;

-- 15. Display the first three characters of names.
SELECT First_Name, SUBSTRING(First_Name, 1, 3) AS Short_Name FROM Student;

-- D. Conversion Functions

-- 16. Convert a number to a string.
SELECT CAST(12345 AS CHAR) AS Number_As_Text;

-- 17. Convert text to a number.
SELECT CAST('250' AS UNSIGNED) AS Text_As_Number;

-- 18. Display a date in a different format.
SELECT DATE_FORMAT(Admission_Date, '%d-%m-%Y') AS Formatted_Date
FROM Student;

-- 19. Demonstrate CAST().
SELECT CAST(45.678 AS DECIMAL(6,2)) AS Cast_Decimal;

-- 20. Demonstrate CONVERT() in MySQL.
SELECT CONVERT('2026-01-15', DATE) AS Converted_Date;

-- E. Date Functions

-- 21. Display the current date.
SELECT CURDATE() AS Current_Date;

-- 22. Extract year, month and day from a date.
SELECT Admission_Date,
       YEAR(Admission_Date) AS Admission_Year,
       MONTH(Admission_Date) AS Admission_Month,
       DAY(Admission_Date) AS Admission_Day
FROM Student;

-- 23. Find the difference between two dates in days.
SELECT DATEDIFF('2026-10-13', '2026-01-01') AS Days_Difference;

-- 24. Add a specified number of days to a date.
SELECT DATE_ADD('2026-01-01', INTERVAL 30 DAY) AS New_Date;

-- 25. Display employees' joining dates in a required format.
SELECT Emp_Name, DATE_FORMAT(Joining_Date, '%d %M %Y') AS Joining_Date_Formatted
FROM Employee;
