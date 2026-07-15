-- Problem: Calculate Samantha's and Lisa's total sales revenue
-- Concepts: IN with literal values, SUM() with no GROUP BY (single combined total)

SELECT SUM(sales_revenue) AS total_revenue
FROM sales_performance
WHERE salesperson IN ('Samantha', 'Lisa');

-- Notes:
-- IN can filter against a fixed list of literal values, not just a subquery (equivalent to salesperson = 'Samantha' OR salesperson = 'Lisa', cleaner).
-- No GROUP BY used deliberately: the problem asks for ONE combined total across both salespeople, not separate totals per person - confirmed by checking the expected output shape (one row, not two).
-- SUM() with no GROUP BY collapses all matching rows into a single value.
