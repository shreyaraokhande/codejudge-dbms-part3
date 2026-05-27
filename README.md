# CodeJudge DBMS Part 3 - Data Integrity Audit and Repair

## Overview

This repository contains SQL validation scripts, integrity audits, repair logic, and documentation for identifying and fixing issues in the CodeJudge database system.

The objective of this part is to:

- validate imported CSV data
- detect integrity violations
- identify duplicate and inconsistent records
- validate domain rules
- repair corrupted or invalid data safely
- demonstrate before-and-after repair evidence

---

# Repository Contents

| File | Purpose |
|---|---|
| import_validation.sql | CSV import and validation checks |
| integrity_audit.sql | PK/FK/null/duplicate audits |
| domain_rule_checks.sql | Business rule and domain validations |
| repair_plan.md | Strategy for identifying and repairing data |
| staging_repair_scripts.sql | Safe repair/update scripts |
| before_after_evidence.md | Examples of detected and repaired issues |

---

# Topics Covered

- NULL validation
- duplicate detection
- orphan record detection
- invalid foreign keys
- domain constraints
- safe UPDATE statements
- staging table repair strategy
- integrity restoration

---

# Database Context

The database represents an educational coding platform containing students, enrollments, submissions, problems, contests, attendance, and execution records.

---

# Final Note

The scripts were designed using relational database integrity principles while prioritizing safety, traceability, and maintainability.
