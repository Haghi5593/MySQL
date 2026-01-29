CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);



--     INSERT 1000+ ROWS

INSERT INTO students (name, email)
SELECT
    CONCAT('Student_', n),
    CONCAT('student', n, '@example.com')
FROM (
    SELECT a.N + b.N * 10 + c.N * 100 + 1 AS n
    FROM
        (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
        (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
        (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
) numbers;



--     QUERY THAT BENEFITS FROM AN INDEX

SELECT * FROM students
WHERE email = 'student900@example.com';



--     MEASURE WITH AND WITHOUT INDEX USING EXPLAIN

-- Without index
EXPLAIN SELECT * FROM students
WHERE email = 'student900@example.com';

-- Create index
CREATE INDEX idx_students_email ON students(email);

-- With index
EXPLAIN SELECT * FROM students
WHERE email = 'student900@example.com';



--     SUMMARY: WHAT CHANGED AND WHY

/*
Without index:
- MySQL performs a full table scan (type: ALL)
- Checks all ~1000 rows
- Slower as data grows

With index:
- MySQL uses the email index (type: ref)
- Checks only 1 row
- Much faster and scalable

Why:
Indexes allow the database to locate rows directly
instead of scanning the entire table.
*/
