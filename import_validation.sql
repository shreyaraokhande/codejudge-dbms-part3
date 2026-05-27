-- Check total imported student records

SELECT COUNT(*) AS total_students
FROM students;

--------------------------------------------------

-- Check records with missing student names

SELECT *
FROM students
WHERE student_name IS NULL;

--------------------------------------------------

-- Check records with missing emails

SELECT *
FROM students
WHERE email IS NULL;

--------------------------------------------------

-- Check duplicate student emails

SELECT
    email,
    COUNT(*) AS duplicate_count
FROM students
GROUP BY email
HAVING COUNT(*) > 1;

--------------------------------------------------

-- Check duplicate course codes

SELECT
    course_code,
    COUNT(*) AS duplicate_count
FROM courses
GROUP BY course_code
HAVING COUNT(*) > 1;

--------------------------------------------------

-- Check submissions with NULL problem IDs

SELECT *
FROM submissions
WHERE problem_id IS NULL;

--------------------------------------------------

-- Check invalid scores

SELECT *
FROM submissions
WHERE score < 0;

--------------------------------------------------

-- Check attendance rows with invalid status

SELECT *
FROM attendance
WHERE attendance_status NOT IN
('present','absent','late');
