-- =========================
-- 1. CREATE DATABASE
-- =========================
CREATE DATABASE university_db;
USE university_db;

-- =========================
-- 2. CREATE TABLES
-- =========================
CREATE TABLE department (
    dept_name VARCHAR(50) PRIMARY KEY,
    building VARCHAR(50),
    budget INT
);

CREATE TABLE course (
    course_id VARCHAR(20) PRIMARY KEY,
    title VARCHAR(100),
    dept_name VARCHAR(50),
    credits INT
);

CREATE TABLE instructor (
    ID INT PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INT
);

CREATE TABLE section (
    course_id VARCHAR(20),
    sec_id INT,
    semester VARCHAR(20),
    year INT,
    building VARCHAR(50)
);

CREATE TABLE teaches (
    ID INT,
    course_id VARCHAR(20),
    sec_id INT,
    semester VARCHAR(20),
    year INT
);

-- =========================
-- 3. INSERT DATA
-- =========================
INSERT INTO department VALUES
('CSE','A',100000),
('EEE','B',90000),
('Physics','C',80000);

INSERT INTO course VALUES
('C101','Database','CSE',3),
('C102','Algorithms','CSE',3),
('E101','Circuits','EEE',3);

INSERT INTO instructor VALUES
(12121,'Rahim','CSE',80000),
(12122,'Karim','CSE',95000),
(12123,'Sakib','EEE',92000),
(12124,'Nafis','Physics',70000);

INSERT INTO section VALUES
('C101',1,'Fall',2017,'A'),
('C101',2,'Spring',2018,'A'),
('C102',1,'Fall',2017,'B');

INSERT INTO teaches VALUES
(12122,'C101',1,'Fall',2017),
(12122,'C101',2,'Spring',2018),
(12123,'C102',1,'Fall',2017),
(12124,'C101',2,'Spring',2018);

-- =========================
-- 4. QUERIES (ANSWERS)
-- =========================

-- i. Instructors with salary > 90000
SELECT *
FROM instructor
WHERE salary > 90000;

-- ii. Courses taught in both Fall 2017 and Spring 2018
SELECT course_id
FROM teaches
WHERE semester='Fall' AND year=2017

INTERSECT

SELECT course_id
FROM teaches
WHERE semester='Spring' AND year=2018;

-- iii. Instructors earning more than ID = 12121
SELECT ID, name
FROM instructor
WHERE salary > (
    SELECT salary
    FROM instructor
    WHERE ID = 12121
);

-- iv. Instructors who have taught at least one course
SELECT DISTINCT name
FROM instructor
JOIN teaches
ON instructor.ID = teaches.ID;

-- v. All instructors except Physics department
SELECT name
FROM instructor
WHERE dept_name <> 'Physics';