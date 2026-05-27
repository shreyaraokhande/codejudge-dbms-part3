# Before and After Repair Evidence

# Example 1 - NULL Emails

## Before Repair

| student_id | student_name | email |
|---|---|---|
| 101 | Rahul Sharma | NULL |

Issue:
- email value missing

---

## Repair Applied

```sql
UPDATE students
SET email = CONCAT('unknown_', student_id, '@example.com')
WHERE email IS NULL;
```

---

## After Repair

| student_id | student_name | email |
|---|---|---|
| 101 | Rahul Sharma | unknown_101@example.com |

Status:
- repaired successfully

---

# Example 2 - Invalid Attendance Status

## Before Repair

| attendance_id | student_id | attendance_status |
|---|---|---|
| 12 | 205 | vacation |

Issue:
- invalid domain value

---

## Repair Applied

```sql
UPDATE attendance
SET attendance_status = 'absent'
WHERE attendance_status NOT IN ('present','absent','late');
```

---

## After Repair

| attendance_id | student_id | attendance_status |
|---|---|---|
| 12 | 205 | absent |

Status:
- repaired successfully

---

# Example 3 - Negative Scores

## Before Repair

| submission_id | score |
|---|---|
| 501 | -10 |

Issue:
- invalid negative score

---

## Repair Applied

```sql
DELETE FROM submissions
WHERE score < 0;
```

---

## After Repair

Result:
- invalid row removed

Status:
- integrity restored

---

# Final Validation

After repairs:
- NULL violations reduced
- invalid domain values corrected
- duplicate records removed
- orphan records deleted
- integrity constraints restored
