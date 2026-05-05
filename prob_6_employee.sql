-- =========================
-- 1. CREATE DATABASE
-- =========================
CREATE DATABASE employee_db;
USE employee_db;

-- =========================
-- 2. CREATE TABLES
-- =========================
CREATE TABLE employee (
    person_name VARCHAR(50) PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE works (
    person_name VARCHAR(50),
    company_name VARCHAR(50),
    salary INT
);

CREATE TABLE company (
    company_name VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50)
);

-- =========================
-- 3. INSERT SAMPLE DATA
-- =========================
INSERT INTO employee VALUES
('Rahim','Street1','Pabna'),
('Karim','Street2','Natore'),
('Sakib','Street3','Pabna'),
('Nafis','Street4','Dhaka'),
('Emon','Street5','Natore');

INSERT INTO company VALUES
('Square','Dhaka'),
('ACI','Pabna'),
('Beximco','Natore');

INSERT INTO works VALUES
('Rahim','Square',80000),
('Karim','ACI',120000),
('Sakib','Square',95000),
('Nafis','Beximco',70000),
('Emon','Square',100000);

-- =========================
-- 4. QUERIES (ANSWERS)
-- =========================

-- i. Employees who live in Pabna
SELECT person_name
FROM employee
WHERE city = 'Pabna';

-- ii. Employees in Pabna with salary > 100000
SELECT e.person_name
FROM employee e
JOIN works w ON e.person_name = w.person_name
WHERE e.city = 'Pabna' AND w.salary > 100000;

-- iii. Employees in Square company with salary between 90000 and 100000
SELECT person_name
FROM works
WHERE company_name = 'Square'
AND salary BETWEEN 90000 AND 100000;

-- iv. Employees living in Pabna OR Natore
SELECT person_name
FROM employee
WHERE city = 'Pabna' OR city = 'Natore';

-- v. Employees who earn more than Rahim
SELECT person_name
FROM works
WHERE salary > (
    SELECT salary
    FROM works
    WHERE person_name = 'Rahim'
);