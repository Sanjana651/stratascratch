-- Problem: April Admin Employees
-- Concepts: EXTRACT(part FROM date), AND, COUNT with no GROUP BY

SELECT COUNT(*) AS n_admins
FROM worker
WHERE department = 'Admin'
  AND EXTRACT(MONTH FROM joining_date) >= 4;

-- Notes:
-- EXTRACT(MONTH FROM joining_date) pulls just the month number (1-12) out of a full date value, ignoring year and day - lets you filter on "which month, regardless of year" rather than comparing whole dates.
-- Other parts can be extracted similarly: EXTRACT(YEAR FROM ...), EXTRACT(DAY FROM ...), etc.
-- AND combines the department condition with the month condition - both must hold true together.
-- COUNT(*) with no GROUP BY collapses all matching rows into one single combined total, same reasoning as Day 6 and Day 13.
