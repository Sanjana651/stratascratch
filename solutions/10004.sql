-- Problem: Find all Lyft rides which happened on rainy days before noon
-- Concepts: reinforcing WHERE + AND, verifying exact text values before filtering

SELECT *
FROM lyft_rides
WHERE weather = 'rainy'
  AND hour < 12;

-- Notes:
-- Verified 'rainy' was the exact stored text via SELECT DISTINCT weather FROM lyft_rides; before trusting the filter -
-- text comparisons in Postgres are case-sensitive, so this check avoids
-- a silent zero-row bug if the actual value were e.g. 'Rain' or 'Rainy'.
-- "Before noon" means hour < 12 (24-hour time), not <= 12.
