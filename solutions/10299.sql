-- Problem: Finding Updated Records
-- Concepts: DISTINCT ON, GROUP BY + MAX, positional GROUP BY/ORDER BY

-- Approach 1: GROUP BY + MAX (portable across SQL dialects)
SELECT id, first_name, last_name, department_id, MAX(salary) AS current_salary
FROM ms_employee_salary
GROUP BY 1, 2, 3, 4
ORDER BY 1;

-- Approach 2: DISTINCT ON (PostgreSQL-specific)
SELECT DISTINCT ON (id)
    id, first_name, last_name, department_id, salary AS current_salary
FROM ms_employee_salary
ORDER BY id ASC, salary DESC;

-- Notes:
-- Problem assumes salary is non-decreasing over time, so an employee's
-- "current" salary is simply their MAX recorded salary.
-- GROUP BY works here because first_name/last_name/department_id are
-- assumed constant per employee across duplicate records.
-- DISTINCT ON is more general: it picks a whole row per group based on
-- ORDER BY, rather than aggregating a single column.
