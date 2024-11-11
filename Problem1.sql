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