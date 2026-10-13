-- Lab Sheet 5: SQL Joins
-- DBMS: MySQL
-- Run this file from top to bottom.

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Course;

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(60),
    Duration VARCHAR(30)
);
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Dept_ID INT NULL,
    Course_ID INT NULL
);
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department_ID INT NULL,
    Manager_ID INT NULL,
    Salary DECIMAL(10,2)
);

INSERT INTO Department VALUES
(1, 'Computer Science', 'Block A'),
(2, 'Commerce', 'Block B'),
(3, 'Management', 'Block C'),
(4, 'Electrical', 'Block D');

INSERT INTO Course VALUES
(101, 'BCA', '3 years'),
(102, 'BTech CSE', '4 years'),
(103, 'BCom', '3 years');

INSERT INTO Student VALUES
(1, 'Aman', 1, 101),
(2, 'Neha', 1, 102),
(3, 'Rohit', 2, 103),
(4, 'Priya', 3, 101),
(5, 'Karan', NULL, NULL);

INSERT INTO Employee VALUES
(201, 'Vikas', 1, NULL, 65000),
(202, 'Meena', 1, 201, 45000),
(203, 'Sahil', 2, 201, 38000),
(204, 'Pooja', 3, 202, 42000);

-- 1. INNER JOIN between Student and Department.
SELECT s.Name, d.Dept_Name
FROM Student s
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 2. Student names with department names.
SELECT s.Name AS Student_Name, d.Dept_Name
FROM Student s
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 3. Employee names with department names.
SELECT e.Emp_Name, d.Dept_Name
FROM Employee e
INNER JOIN Department d ON e.Department_ID = d.Dept_ID;

-- 4. Students with their course details.
SELECT s.Name, c.Course_Name, c.Duration
FROM Student s
INNER JOIN Course c ON s.Course_ID = c.Course_ID;

-- 5. Students in a particular department.
SELECT s.Name, d.Dept_Name
FROM Student s
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_Name = 'Computer Science';

-- 6. LEFT OUTER JOIN.
SELECT s.Name, d.Dept_Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 7. All students, including those without a matching department.
SELECT s.Student_ID, s.Name, d.Dept_Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 8. RIGHT OUTER JOIN.
SELECT s.Name, d.Dept_Name
FROM Student s
RIGHT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 9. All departments, including departments without students.
SELECT d.Dept_Name, s.Name
FROM Department d
LEFT JOIN Student s ON d.Dept_ID = s.Dept_ID;

-- 10. Students not assigned to a department.
SELECT s.Student_ID, s.Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- 11. Departments having no students.
SELECT d.Dept_ID, d.Dept_Name
FROM Department d
LEFT JOIN Student s ON d.Dept_ID = s.Dept_ID
WHERE s.Student_ID IS NULL;

-- 12. FULL OUTER JOIN workaround in MySQL using LEFT JOIN + RIGHT-only rows.
SELECT s.Name, d.Dept_Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
UNION
SELECT s.Name, d.Dept_Name
FROM Student s
RIGHT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 13. CROSS JOIN between Student and Course.
SELECT s.Name, c.Course_Name
FROM Student s
CROSS JOIN Course c;

-- 14. Number of possible Student-Course combinations.
SELECT COUNT(*) AS Possible_Combinations
FROM Student
CROSS JOIN Course;

-- 15. NATURAL JOIN (matching column name: Dept_ID).
-- Student and Department both have Dept_ID.
SELECT Name, Dept_Name
FROM Student
NATURAL JOIN Department;

-- 16. Compare NATURAL JOIN with explicit INNER JOIN.
SELECT s.Name, d.Dept_Name
FROM Student s
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 17. SELF JOIN to show employee-manager relationships.
SELECT e.Emp_Name AS Employee, m.Emp_Name AS Manager
FROM Employee e
LEFT JOIN Employee m ON e.Manager_ID = m.Emp_ID;

-- 18. Employees with their managers (same self-join, with salary).
SELECT e.Emp_Name AS Employee, e.Salary, m.Emp_Name AS Manager
FROM Employee e
LEFT JOIN Employee m ON e.Manager_ID = m.Emp_ID;

-- 19. Join three tables: Student, Department and Course.
SELECT s.Name, d.Dept_Name, c.Course_Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
LEFT JOIN Course c ON s.Course_ID = c.Course_ID;

-- 20. Student name, course name and department name.
SELECT s.Name AS Student_Name, c.Course_Name, d.Dept_Name
FROM Student s
LEFT JOIN Course c ON s.Course_ID = c.Course_ID
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 21. Employees whose salary is greater than the average salary of their department.
SELECT e.Emp_Name, e.Salary, d.Dept_Name
FROM Employee e
JOIN Department d ON e.Department_ID = d.Dept_ID
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employee e2
    WHERE e2.Department_ID = e.Department_ID
);

-- 22. Department having the maximum number of students.
SELECT d.Dept_Name, COUNT(s.Student_ID) AS Student_Count
FROM Department d
LEFT JOIN Student s ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name
HAVING COUNT(s.Student_ID) = (
    SELECT MAX(dept_counts.student_count)
    FROM (
        SELECT COUNT(s2.Student_ID) AS student_count
        FROM Department d2
        LEFT JOIN Student s2 ON d2.Dept_ID = s2.Dept_ID
        GROUP BY d2.Dept_ID
    ) AS dept_counts
);

-- 23. Departments and total students in each.
SELECT d.Dept_Name, COUNT(s.Student_ID) AS Total_Students
FROM Department d
LEFT JOIN Student s ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;

-- 24. Courses and number of students enrolled in each.
SELECT c.Course_Name, COUNT(s.Student_ID) AS Enrolled_Students
FROM Course c
LEFT JOIN Student s ON c.Course_ID = s.Course_ID
GROUP BY c.Course_ID, c.Course_Name;

-- 25. Student-department-course report with JOINs and aggregate functions.
SELECT d.Dept_Name, c.Course_Name,
       COUNT(s.Student_ID) AS Total_Students
FROM Department d
LEFT JOIN Student s ON d.Dept_ID = s.Dept_ID
LEFT JOIN Course c ON s.Course_ID = c.Course_ID
GROUP BY d.Dept_ID, d.Dept_Name, c.Course_ID, c.Course_Name
ORDER BY d.Dept_Name, c.Course_Name;
