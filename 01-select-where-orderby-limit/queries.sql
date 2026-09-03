-- Table: Employee(id, name, department, salary, join_date)

-- Q1: Get all columns for employees in the 'Sales' department
SELECT *
FROM Employee
WHERE department = 'Sales';

-- Q2: Get name and salary of employees earning more than 50000, sorted highest first
SELECT name, salary
FROM Employee
WHERE salary > 50000
ORDER BY salary DESC;

-- Q3: Find employees whose name starts with 'A'
SELECT name
FROM Employee
WHERE name LIKE 'A%';

-- Q4: Get the 3 most recently joined employees
SELECT name, join_date
FROM Employee
ORDER BY join_date DESC
LIMIT 3;

-- Q5: Find employees in 'Sales' OR 'Marketing', earning above 40000,
--     sorted by salary descending, only top 5
SELECT name, department, salary
FROM Employee
WHERE (department = 'Sales' OR department = 'Marketing')
  AND salary > 40000
ORDER BY salary DESC
LIMIT 5;