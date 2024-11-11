--Tables

CREATE TABLE students (

    id SERIAL PRIMARY KEY
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    school_enrollment_date DATE NOT NULL

);


CREATE TABLE professors (

    id SERIAL PRIMARY KEY
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    department VARCHAR(255) NOT NULL

);


CREATE TABLE courses (

    id SERIAL PRIMARY KEY
    course_name VARCHAR(255)
    course_description VARCHAR(255)
    professor_id VARCHAR(255)

);


CREATE TABLE enrollments (

    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
    
);


--Insert info into tables

INSERT INTO students (first_name, last_name, email, school_enrollment_date) VALUES
('Daisy', 'Masey', 'daisy_masey@email.com', '2016-07-05'),
('Cathy', 'Hatte', 'cathy_hatte@email.com', '2013-11-21'),
('Sam', 'Iams', 'sam_iams@email.com', '2019-11-08'),
('Horton', 'Whom', 'horton_whom@email.com', '2018-03-14'),
('Marco', 'Mulberry', 'marco_mulberry@email.com', '2019-12-21');


INSERT INTO professors (first_name, last_name, department) VALUES
('Zelda', 'Highrule', 'History'),
('Scott', 'Link', 'Engineering'),
('Jesse', 'Blueman', 'Chemistry'),
('Norman', 'Bateson', 'Psychology');


INSERT INTO courses (course_name, course_description, professor_id) VALUES
('History 101', 'Introduction to History', 1),
('Engineering 101', 'Introduction to Engineering', 2),
('Chemistry 101', 'Introduction to Chemistry', 3);
('Psychology 101', 'Introduction to Psychology', 4);


INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 2, '2016-07-21'), 
(3, 3, '2016-07-21'),  
(4, 4, '2016-03-21'),  
(2, 1, '2016-03-21'),  
(5, 1, '2016-05-21');  


--Queries

--List students enrolled in a course

SELECT CONCAT(students.first_name, ' ', students.last_name ) AS full_name
FROM students
JOIN enrollments ON students.id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.id
WHERE courses.course_name = 'History 101';


--List courses and who teaches them

SELECT courses.course_name, CONCAT(professors.first_name, ' ', professors.last_name) AS professor_full_name
FROM courses
JOIN professors ON courses.professor_id = professors.id;


--List courses that have students enrolled

SELECT DISTINCT courses.course_name
FROM courses
JOIN enrollments ON courses.id = enrollments.course_id;


--Update email

UPDATE students
SET email = 'NEWdaisy_masey@NEWemail.com'
WHERE id = 1;


--Delete student from course

DELETE FROM enrollments
WHERE student_id = 2 AND course_id = 1;