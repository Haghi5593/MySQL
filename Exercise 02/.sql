CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO students (id, name, email) VALUES
(1, 'Ayaan', 'ayaan@gmail.com'),
(2, 'Max', 'max@yahoo.com'),
(3, 'Sara', 'sara@gmail.com'),
(4, 'Ayaan', 'ayaan@outlook.com'),
(5, 'John', 'john@gmail.com');

-- 1) AND: Gmail users with ID > 2
SELECT * FROM students
WHERE email LIKE '%@gmail.com'
AND id > 2;

-- 2) OR: students named Ayaan or Max
SELECT * FROM students
WHERE name = 'Ayaan'
OR name = 'Max';

-- 3) Fixed query using parentheses
SELECT * FROM students
WHERE (name = 'Ayaan' OR name = 'Max')
AND id < 3;

-- 4) LIKE + AND + OR combined
SELECT * FROM students
WHERE (email LIKE '%@gmail.com' OR email LIKE '%@yahoo.com')
AND id > 1;

-- 5) SAFE UPDATE / DELETE (SELECT first)

-- Check the row
SELECT * FROM students
WHERE id = 5;

-- Safe UPDATE
UPDATE students
SET name = 'Johnny'
WHERE id = 5;

-- Safe DELETE (commented out for safety)
-- DELETE FROM students
-- WHERE id = 5;
