-- Problem: Find wine varieties tasted by 'Roger Voss' with a value in region_1
-- Concepts: IS NOT NULL, AND, DISTINCT

SELECT DISTINCT variety
FROM winemag_p2
WHERE taster_name = 'Roger Voss'
  AND region_1 IS NOT NULL;

-- Notes:
-- IS NOT NULL / IS NULL is the required syntax to check for missing values - cannot use = NULL or != NULL, since SQL's three-valued logic treats NULL as "unknown," not a comparable value (equality checks against it don't behave as expected).
-- AND combines the two conditions (taster_name match + non-null region_1), both must be true for a row to survive.
-- DISTINCT removes duplicate variety names in the final output.
