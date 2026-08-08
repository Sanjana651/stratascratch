-- Problem: Unique Users Per Client Per Month
-- Concepts: COUNT(DISTINCT ...), GROUP BY multiple columns, EXTRACT(MONTH)

SELECT client_id, EXTRACT(MONTH FROM time_id) AS month, COUNT(DISTINCT user_id) AS users_num
FROM fact_events
GROUP BY 1, 2
ORDER BY 1;

-- Notes:
-- COUNT(DISTINCT column) counts unique/distinct values in a column, not just rows or non-null values. First active use of DISTINCT inside an aggregate (vs Day 7's DISTINCT in SELECT list for deduplication).
-- GROUP BY 1, 2 groups by both client_id and month, creating separate buckets for each client-month combination, so COUNT(DISTINCT ...) is calculated independently per bucket.
-- EXTRACT(MONTH FROM time_id) extracts month number (1-12) from date (Days 17, 20 reinforced).
