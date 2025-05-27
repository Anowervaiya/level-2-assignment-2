-- Active: 1747495598865@@127.0.0.1@5432@mydatabase
-- 1. Create departments first
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);



CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(20)
);



-- 2. Then create students (with reference to departments)
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    department_id INTEGER  REFERENCES  departments (department_id) ON DELETE set null,
    last_login DATE
);


DROP Table students;
DROP Table departments CASCADE;

SELECT * from departments;

INSERT INTO departments (department_name) VALUES
('Computer Science'),
('Electrical Engineering'),
('Business Administration'),
('Mechanical Engineering'),
('Psychology');

INSERT INTO courses (course_name) VALUES
('Database Systems'),
('Data Structures'),
('Microeconomics'),
('Thermodynamics'),
('Cognitive Psychology');

INSERT INTO students (student_name, department_id, last_login) VALUES
('Alice Johnson', 1, '2025-04-18'),
('Bob Smith', 2, '2025-04-19'),
('Charlie Davis', 3, '2025-05-17'),
('Diana Evans', 1, '2025-05-15'),
('Ethan Clark', 5, '2025-05-10');

DELETE FROM departments 
  WHERE department_id = 1;

  SELECT * FROM departments;
  SELECT * FROM students;

select * FROM students 
  WHERE last_login >= CURRENT_DATE - INTERVAL '30 days' ;


select extract(MONTH from last_login) as last_log , count(*) FROM students 
GROUP BY last_log 
HAVING count(*) > 2
 ;


SELECT department_name, student_name from students 
 inner JOIN departments USING(department_id);