-- Find orphan enrollments without valid students

SELECT e.*
FROM enrollments e
LEFT JOIN students s
ON e.student_id = s.student_id
WHERE s.student_id IS NULL;

--------------------------------------------------

-- Find orphan enrollments without valid courses

SELECT e.*
FROM enrollments e
LEFT JOIN courses c
ON e.course_id = c.course_id
WHERE c.course_id IS NULL;

--------------------------------------------------

-- Find submissions linked to missing problems

SELECT s.*
FROM submissions s
LEFT JOIN problems p
ON s.problem_id = p.problem_id
WHERE p.problem_id IS NULL;

--------------------------------------------------

-- Find submissions linked to missing students

SELECT s.*
FROM submissions s
LEFT JOIN students st
ON s.student_id = st.student_id
WHERE st.student_id IS NULL;

--------------------------------------------------

-- Detect duplicate student emails

SELECT
    email,
    COUNT(*) AS duplicate_count
FROM students
GROUP BY email
HAVING COUNT(*) > 1;

--------------------------------------------------

-- Detect duplicate phone numbers

SELECT
    phone,
    COUNT(*) AS duplicate_count
FROM students
GROUP BY phone
HAVING COUNT(*) > 1;

--------------------------------------------------

-- Check NULL primary-key-like values

SELECT *
FROM students
WHERE student_id IS NULL;

--------------------------------------------------

-- Check invalid test result references

SELECT tr.*
FROM test_results tr
LEFT JOIN submissions s
ON tr.submission_id = s.submission_id
WHERE s.submission_id IS NULL;
