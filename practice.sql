-- Active: 1747495598865@@127.0.0.1@5432@mydatabase
CREATE Table students (
    student_id SERIAL PRIMARY KEY,
    student_name TEXT,
    "age" int,
    score NUMERIC(6, 2),
    department_id int,
    Foreign Key (department_id) REFERENCES departments (department_id)
);

CREATE Table departments (
    department_id SERIAL PRIMARY KEY,
    department_name TEXT
);

CREATE Table course_enrollments (
    course_id SERIAL PRIMARY KEY,
    student_id int,
    Foreign Key (student_id) REFERENCES students (student_id),
    course_title text,
    enrolled_on DATE
)

INSERT INTO
    departments (department_name)
VALUES ('Computer Science'),
    ('Mathematics'),
    ('Physics');

INSERT INTO
    students (
        student_name,
        age,
        score,
        department_id
    )
VALUES ('Alice Johnson', 20, 88.50, 1),
    ('Bob Smith', 22, 76.25, 2),
    ('Charlie Brown', 21, 92.00, 1),
    ('Diana Prince', 23, 85.00, 3),
    ('Ethan Hunt', 20, 90.75, 1);

INSERT INTO
    course_enrollments (
        student_id,
        course_title,
        enrolled_on
    )
VALUES (
        1,
        'Intro to Programming',
        '2025-01-15'
    ),
    (
        2,
        'Linear Algebra',
        '2025-01-17'
    ),
    (
        3,
        'Data Structures',
        '2025-01-20'
    ),
    (
        4,
        'Quantum Mechanics',
        '2025-02-01'
    ),
    (
        5,
        'Operating Systems',
        '2025-02-10'
    ),
    (1, 'Databases', '2025-03-01'),
    (3, 'Algorithms', '2025-03-05');

SELECT *
FROM students
WHERE
    score > (
        SELECT AVG(score)
        FROM students
    );

SELECT *
FROM students
WHERE
    score > (
        SELECT avg(score)
        from students
    );

SELECT * FROM students WHERE age > ( SELECT avg(age) FROM students );

SELECT * FROM students;

SELECT course_title FROM course_enrollments GROUP BY course_title;

SELECT name
FROM students
WHERE
    student_id IN (
        SELECT student_id
        FROM course_enrollments
    );

SELECT student_id FROM course_enrollments;

SELECT * FROM departments;

SELECT *
FROM departments d
WHERE
    EXISTS (
        SELECT *
        FROM students s
        WHERE
            s.department_id = d.department_id
            AND s.score > 90
    );

CREATE View show_each_sdnt_info 
AS
SELECT
    student_name,
    department_name,
    score
from students
    JOIN departments USING (department_id)

SELECT * FROM show_each_sdnt_info;


