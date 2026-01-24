CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

--Insert data
INSERT INTO students (name, email) VALUES
('Ayaan', 'ayaan@gmail.com'),
('Max', 'max@yahoo.com'),
('Sara', 'sara@gmail.com'),
('Omar', 'omar@gmail.com');

--Show the last 2 students (using DESC)
SELECT *
FROM students
ORDER BY id DESC
LIMIT 2;

--Show only Gmail students, sorted by name (ASC)
SELECT *
FROM students
WHERE email LIKE '%@gmail.com'
ORDER BY name ASC;

--Limit to 1 row and rename columns
SELECT
    name AS Student,
    email AS `Email Address`
FROM students
ORDER BY id ASC
LIMIT 1;

--Custom query using ORDER BY + LIMIT + AS
SELECT
    name AS Student,
    email AS `Email Address`
FROM students
WHERE email LIKE '%@gmail.com'
ORDER BY id DESC
LIMIT 1;
