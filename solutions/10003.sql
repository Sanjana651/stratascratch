-- Problem: Lyft Driver Wages
-- Concepts: OR vs AND - recognizing "either...or" phrasing

SELECT *
FROM lyft_drivers
WHERE yearly_salary <= 30000 OR yearly_salary >= 70000;

-- Notes:
-- "Either...or" in plain English maps to OR, not AND.
-- Using AND here (yearly_salary <= 30000 AND yearly_salary >= 70000) would be a logically impossible condition on a single column - no value can be both <= 30000 and >= 70000 at once, so it would always return zero rows.
-- Quick test: could a single row ever satisfy both conditions simultaneously?
-- If no, use OR. If yes, AND is likely correct (see Day 7's problem).
