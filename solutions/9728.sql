-- Problem: Number of violations
-- Concepts: EXTRACT(YEAR), IS NOT NULL, WHERE + AND, GROUP BY, ORDER BY - combined

SELECT EXTRACT(YEAR FROM inspection_date) AS inspection_year, COUNT(*) AS n_violations
FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe'
  AND violation_id IS NOT NULL
GROUP BY 1
ORDER BY inspection_year ASC;

-- Notes:
-- violation_id IS NOT NULL filters to only rows that represent an actual violation, not just any inspection (per the problem's hint).
-- EXTRACT(YEAR FROM inspection_date) pulls just the year out of the full date, same function as Day 17's MONTH extraction, different part.
-- GROUP BY 1 groups by the year expression (position 1 in SELECT), not by violation_id or the raw full date - grouping key must match what "per year" actually means.
-- Combines five previously-learned concepts in one query; the main challenge was keeping each piece in its correct clause (SELECT expression vs WHERE condition vs GROUP BY target), not any single concept being new.
