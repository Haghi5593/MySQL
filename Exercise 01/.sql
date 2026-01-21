-- Exercise 01: SQL Pattern Matching with LIKE Operator
CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO student (name, email) VALUES
('Ahmed', 'ahmed@gmail.com'),
('Khalid', 'khalid@yahoo.com'),
('Said', 'said@outlook.com'),
('Omar', 'omar@gmail.com'),
('Noor', 'noor@yahoo.com'),
('Abdi', 'abdi@gmail.com'),
('Hodan', 'hodan@edu.com');

SELECT * FROM student
WHERE name LIKE '%d';

SELECT * FROM student
WHERE email LIKE '%@gmail.com';

SELECT * FROM student
WHERE email LIKE '%o%';

SELECT * FROM student
WHERE name LIKE '____';

SELECT * FROM student
WHERE email LIKE '%@yahoo.com';
