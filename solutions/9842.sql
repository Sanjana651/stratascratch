-- Problem: First Names With Six Letters Ending in 'h'
-- Concepts: LIKE with % wildcard (pattern matching), LENGTH()

SELECT *
FROM worker
WHERE first_name LIKE '%h'
  AND LENGTH(first_name) = 6;

-- Notes:
-- LIKE matches text against a pattern. % means "any sequence of characters, including zero characters."
--   '%h'  -> ends with h
--   'h%'  -> starts with h
--   '%h%' -> contains h anywhere
-- LENGTH(column) returns the number of characters in a text value - combined here with AND to require both conditions (ends in 'h' AND exactly 6 characters long) simultaneously.
