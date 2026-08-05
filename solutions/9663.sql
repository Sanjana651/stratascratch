-- Problem: Most Profitable Financial Company
-- Concepts: LIMIT (brand new), ORDER BY DESC for "top N" queries

SELECT company, continent
FROM forbes_global_2010_2014
WHERE sector = 'Financials'
ORDER BY profits DESC
LIMIT 1;

-- Alternative approach (same result, using Day 4/8 pattern):
-- SELECT company, continent
-- FROM forbes_global_2010_2014
-- WHERE sector = 'Financials'
--   AND profits = (SELECT MAX(profits) FROM forbes_global_2010_2014 WHERE sector = 'Financials');

-- Notes:
-- LIMIT N keeps only the first N rows from the result, after all other clauses have run. Used here with ORDER BY DESC to get the "top 1" (most profitable) company.
-- Two valid approaches:
--   1. Sort by metric DESC, then LIMIT 1 (simpler for "top 1" queries)
--   2. WHERE column = (SELECT MAX(column) ...) subquery pattern (more general, works well if you needed top 5, 10, etc. with different logic)
