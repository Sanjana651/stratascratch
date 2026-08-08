-- Problem: High Earners in Support Departments
-- Concepts: multiple conditions with AND, IN for "equals one of several values"

SELECT first_name, last_name, department, salary
FROM techcorp_workforce
WHERE salary > 80000
  AND department IN ('HR', 'Admin');

-- Alternative, using OR with explicit parentheses (functionally identical):
-- SELECT first_name, last_name, department, salary
-- FROM techcorp_workforce
-- WHERE salary > 80000
--   AND (department = 'HR' OR department = 'Admin');

-- Notes:
-- IN syntax uses comma-separated list: IN ('value1', 'value2'), not IN ('value1' or 'value2') - common mistake when first learning IN.
-- salary > 80000 is strictly greater than (not including 80000 itself).
-- AND combines salary and department conditions so both must hold.
-- IN and OR are functionally equivalent for "equals one of several values" - IN is often cleaner for multiple literals (Days 6, 14, 15).
