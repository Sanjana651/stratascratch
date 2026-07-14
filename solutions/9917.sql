-- Problem: Average Salaries
-- Concepts: Window functions, OVER (PARTITION BY ...)

SELECT department, first_name, salary,
       AVG(salary) OVER (PARTITION BY department) AS department_avg_salary FROM employee;

-- Notes:
-- GROUP BY would collapse rows into one per department, losing individual employee rows - not what we want here.
-- A window function (AVG(...) OVER (PARTITION BY department)) calculates the average per department WITHOUT collapsing rows: every employee row survives, and the department average is attached as an extra column.
-- PARTITION BY defines the "group" the aggregate is calculated over, but unlike GROUP BY, it doesn't merge rows in the output.
