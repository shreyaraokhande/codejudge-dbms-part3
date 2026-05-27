# Repair Plan

# Objective

The purpose of this repair plan is to identify, isolate, and safely repair inconsistent or invalid records detected during integrity audits.

---

# Common Data Issues Identified

## Missing Values
Examples:
- NULL emails
- NULL student names
- missing foreign keys

---

## Duplicate Records
Examples:
- duplicate student emails
- duplicate phone numbers
- duplicate course codes

---

## Orphan Records
Examples:
- enrollments without valid students
- submissions linked to missing problems

---

## Invalid Domain Values
Examples:
- invalid attendance status
- invalid difficulty values
- negative scores

---

# Repair Strategy

## Step 1 - Use Staging Tables

Raw imported CSV data should first be loaded into temporary staging tables.

Purpose:
- avoid corrupting production tables
- isolate invalid records
- perform validation before insertion

---

## Step 2 - Validate Imported Data

Run:
- NULL checks
- duplicate checks
- foreign key checks
- domain validation queries

---

## Step 3 - Repair Invalid Records

Methods:
- UPDATE invalid values
- DELETE corrupt duplicates
- replace NULL values
- fix foreign-key mappings

---

## Step 4 - Revalidate Data

After repairs:
- rerun integrity checks
- verify repaired rows
- confirm constraints are satisfied

---

# Safety Principles

- avoid direct destructive operations
- use backup copies before updates
- repair data incrementally
- verify changes after execution

---

# Final Outcome

The repair workflow improves:
- consistency
- integrity
- reliability
- maintainability

while preserving valid records safely.
