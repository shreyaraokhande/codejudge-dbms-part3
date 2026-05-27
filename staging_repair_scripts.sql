-- Create backup table before repairs

CREATE TABLE students_backup AS
SELECT *
FROM students;

--------------------------------------------------

-- Replace NULL emails with placeholder values

UPDATE students
SET email = CONCAT('unknown_', student_id, '@example.com')
WHERE email IS NULL;

--------------------------------------------------

-- Remove duplicate student emails keeping lowest ID

DELETE FROM students
WHERE student_id NOT IN
(
    SELECT MIN(student_id)
    FROM students
    GROUP BY email
);

--------------------------------------------------

-- Fix invalid attendance statuses

UPDATE attendance
SET attendance_status = 'absent'
WHERE attendance_status NOT IN
('present','absent','late');

--------------------------------------------------

-- Fix invalid difficulty values

UPDATE problems
SET difficulty = 'medium'
WHERE difficulty NOT IN
('easy','medium','hard');

--------------------------------------------------

-- Remove submissions with invalid negative scores

DELETE FROM submissions
WHERE score < 0;

--------------------------------------------------

-- Remove orphan enrollments

DELETE FROM enrollments
WHERE student_id NOT IN
(
    SELECT student_id
    FROM students
);

--------------------------------------------------

-- Revalidate repaired data

SELECT *
FROM students
WHERE email IS NULL;

SELECT *
FROM submissions
WHERE score < 0;
