-- Problem: Total Cost Of Orders
-- Concepts: JOIN, GROUP BY, SUM(), positional grouping/ordering

SELECT c.id, c.first_name, SUM(total_order_cost) AS total_cost
FROM orders o
JOIN customers c ON o.cust_id = c.id
GROUP BY 1, 2
ORDER BY 2;

-- Notes:
-- first_name lives in customers, total_order_cost lives in orders, so a JOIN is needed to bring both into one combined table.
-- GROUP BY 1,2 clusters rows by customer (id, first_name).
-- SUM(total_order_cost) is calculated per group, not included in GROUP BY, since it's the aggregated value being computed, not a grouping key.
