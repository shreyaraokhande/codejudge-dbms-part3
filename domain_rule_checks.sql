-- Validate allowed difficulty values

SELECT *
FROM problems
WHERE difficulty NOT IN
('easy','medium','hard');

--------------------------------------------------

-- Validate attendance statuses

SELECT *
FROM attendance
WHERE attendance_status NOT IN
('present','absent','late');

--------------------------------------------------

-- Validate enrollment statuses

SELECT *
FROM enrollments
WHERE enrollment_status NOT IN
('active','completed','dropped');

--------------------------------------------------

-- Validate plagiarism percentage range

SELECT *
FROM plagiarism_flags
WHERE similarity_percentage < 0
   OR similarity_percentage > 100;

--------------------------------------------------

-- Validate non-negative scores

SELECT *
FROM submissions
WHERE score < 0;

--------------------------------------------------

-- Validate request statuses

SELECT *
FROM regrade_requests
WHERE request_status NOT IN
('pending','approved','rejected');
