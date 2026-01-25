CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100),
    score INT
);

/* ===============================
    Insert sample data
   =============================== */

INSERT INTO students (name, email, score) VALUES
('Ayaan', 'ayaan@gmail.com', 85),
('Max', 'max@yahoo.com', 72),
('Sara', 'sara@gmail.com', 90),
('Ali', 'ali@hotmail.com', 65),
('Fatima', 'fatima@gmail.com', 78),
('John', 'john@yahoo.com', 88);

/* ===============================
    How many students total?
   =============================== */

SELECT 
    COUNT(*) AS 'Total students'
FROM students;

/* ===============================
    Highest and lowest score
   =============================== */

SELECT 
    MAX(score) AS 'Highest score',
    MIN(score) AS 'Lowest score'
FROM students;

/* ===============================
    Students per domain
   =============================== */

SELECT 
    SUBSTRING_INDEX(email, '@', -1) AS 'Domain',
    COUNT(*) AS 'Students per domain'
FROM students
GROUP BY Domain;

/* ===============================
    Average score per domain
   =============================== */

SELECT 
    SUBSTRING_INDEX(email, '@', -1) AS 'Domain',
    AVG(score) AS 'Average score'
FROM students
GROUP BY Domain;
