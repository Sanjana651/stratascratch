-- Problem: Olympics Events List By Age
-- Concepts: multiple aggregates (MIN/AVG/MAX) in one SELECT, no GROUP BY needed

SELECT MIN(age) AS lowest_age,
       AVG(age) AS mean_age,
       MAX(age) AS highest_age
FROM olympics_athletes_events;

-- Notes:
-- No GROUP BY needed - same reasoning as Day 6 (Samantha/Lisa's combined total): with no grouping key, aggregates are calculated across the entire table, collapsing everything into a single output row.
-- Multiple aggregate functions can sit side by side in one SELECT - each one independently scans the same column and produces its own value, all placed into the same single row.
-- Problem's hint about athletes in multiple disciplines just means: don't deduplicate first, every row counts independently in the calculation.
