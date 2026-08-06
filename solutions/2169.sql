-- Problem: Contact Information Completeness
-- Concepts: CASE WHEN for conditional counting, casting for decimal division

SELECT 
  COUNT(CASE WHEN phone_number IS NULL THEN 1 END)::DECIMAL / COUNT(*) AS null_phone_ratio
FROM techcorp_workforce;

-- Notes:
-- CASE WHEN (new today) lets you count conditionally: "if phone_number IS NULL, count this row (return 1), else don't" - used inside COUNT().
-- Integer division trap: COUNT() returns an integer, so 69 / 223 truncates to 0, not 0.31. Cast one operand to DECIMAL (::DECIMAL in PostgreSQL) to force decimal division and get the proper ratio.
-- No WHERE clause needed - the filtering logic lives inside CASE WHEN.
-- No GROUP BY needed - one combined ratio across all employees.
