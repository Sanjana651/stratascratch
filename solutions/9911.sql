-- Problem: Departments With 5 Employees
-- Concepts: HAVING (filtering after GROUP BY/aggregation)

SELECT department
FROM employee
GROUP BY department
HAVING COUNT(*) >= 5;

-- Alternative, showing the count too (useful for sanity-checking):
-- SELECT department, COUNT(*) AS employee_count
-- FROM employee
-- GROUP BY department
-- HAVING COUNT(*) >= 5;

-- Notes:
-- WHERE filters raw individual rows BEFORE grouping - it runs too early to reference a calculated aggregate like COUNT(*), since that value doesn't exist yet at that point in processing.
-- HAVING filters the GROUPS themselves, AFTER GROUP BY has formed them and aggregates have been calculated - this is the only clause that can filter based on an aggregate's value.
-- Rule of thumb: if the filter condition involves an aggregate function (COUNT/SUM/AVG/MAX/MIN), it belongs in HAVING, not WHERE.
-- HAVING can reference an aggregate (COUNT(*)) even if that aggregate isn't included in the SELECT list at all - it operates on the groups, independent of what's chosen for display.
-- WHERE and HAVING can both appear in the same query: WHERE filters rows before grouping, HAVING filters the resulting groups afterward.
