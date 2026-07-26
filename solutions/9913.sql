-- Problem: Order Details
-- Concepts: JOIN, OR vs AND on same column, ambiguous column names after JOIN

SELECT c.first_name, o.order_date, o.order_details, o.total_order_cost
FROM customers c
JOIN orders o ON c.id = o.cust_id
WHERE first_name = 'Jill' OR first_name = 'Eva'
ORDER BY c.id;

-- Notes:
-- OR (not AND) is correct here - a single row's first_name can only be one value at a time, same lesson as Day 10.
-- No GROUP BY needed - nothing is being aggregated, just displaying raw joined order rows. GROUP BY is only required when aggregating, not simply because multiple tables are joined.
-- Both customers and orders have a column named `id` - after joining, referencing `id` anywhere (SELECT, WHERE, ORDER BY, etc.) is ambiguous and must be qualified with the table alias (c.id vs o.id).
