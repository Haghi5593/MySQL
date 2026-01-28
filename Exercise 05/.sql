CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) 
);

CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

--     INSERT DATA

-- Students
INSERT INTO students (name, email) VALUES
('Ali', 'ali@gmail.com'),
('Ayaan', 'ayaan@gmail.com'),
('Max', 'max@gmail.com');

-- Courses
INSERT INTO courses (title) VALUES
('SQL Fundamentals'),
('HTML & CSS'),
('JavaScript Basics');

-- Enrollments
INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1), -- Ali → SQL
(1, 2), -- Ali → HTML & CSS
(2, 3); -- Ayaan → JavaScript

--    INNER JOIN: Who is enrolled

SELECT students.name, courses.title
FROM students
INNER JOIN enrollments ON students.id = enrollments.student_id
INNER JOIN courses ON courses.id = enrollments.course_id;

--    LEFT JOIN: All students + courses (NULL if none)
 

SELECT students.name, courses.title
FROM students
LEFT JOIN enrollments ON students.id = enrollments.student_id
LEFT JOIN courses ON courses.id = enrollments.course_id;

--    BONUS: Count students per course
  

SELECT
    courses.title,
    COUNT(enrollments.student_id) AS student_count
FROM courses
LEFT JOIN enrollments ON courses.id = enrollments.course_id
GROUP BY courses.id, courses.title;
