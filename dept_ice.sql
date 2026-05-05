CREATE DATABASE Dept_of_ICE;
USE Dept_of_ICE;


CREATE TABLE students (
    Student_ID   CHAR(6) PRIMARY KEY,
    Name         VARCHAR(20),
    Phone_number VARCHAR(15),
    Gender       CHAR(1)
);

CREATE TABLE courses (
    Course_ID    CHAR(7) PRIMARY KEY,
    Course_Title VARCHAR(20),
    Credits      FLOAT
);


CREATE TABLE enrollments (
    Enrollment_ID   INT AUTO_INCREMENT PRIMARY KEY,
    Student_ID      CHAR(6),
    Course_ID       CHAR(7),
    Enrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Student_ID) REFERENCES students(Student_ID),
    FOREIGN KEY (Course_ID)  REFERENCES courses(Course_ID)
);


INSERT INTO students VALUES
('210601','Foisal','01732910665','M'),
('210602','Hassan','01932910666','M'),
('210603','Shruty','01532910667','F');


INSERT INTO courses VALUES
('ICE3101','DBMS',3),
('ICE3102','WEB',3),
('ICE3103','AI',3);


INSERT INTO enrollments (Student_ID, Course_ID) VALUES
('210601','ICE3101'),
('210602','ICE3101'),
('210603','ICE3102');


SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

UPDATE students
SET Phone_number = '017XXXXXXXX'
WHERE Student_ID = '210601';


ALTER TABLE students
ADD No_stu_taken INT DEFAULT 0;

ALTER TABLE courses
ADD No_std_taken INT DEFAULT 0;

---------------------------------------------------
-- Trigger: update student course count
---------------------------------------------------
DELIMITER //

CREATE TRIGGER update_taken_course_count
AFTER INSERT ON enrollments
FOR EACH ROW
BEGIN
    UPDATE students
    SET No_stu_taken = (
        SELECT COUNT(*)
        FROM enrollments
        WHERE Student_ID = NEW.Student_ID
    )
    WHERE Student_ID = NEW.Student_ID;
END //

DELIMITER ;


UPDATE students s
SET No_stu_taken = (
    SELECT COUNT(*)
    FROM enrollments e
    WHERE e.Student_ID = s.Student_ID
);

---------------------------------------------------
-- Test trigger
---------------------------------------------------
INSERT INTO enrollments (Student_ID, Course_ID)
VALUES ('210601','ICE3102');

INSERT INTO enrollments (Student_ID, Course_ID)
VALUES ('210602','ICE3102');


SELECT * FROM students;
SELECT * FROM enrollments;