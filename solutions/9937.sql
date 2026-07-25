-- Problem: Find all athletes who were older than 40 years when they won either Bronze or Silver medals
-- Concepts: operator precedence (AND vs OR), parentheses to force grouping, IN as alternative to OR

SELECT name
FROM olympics_athletes_events
WHERE age > 40 AND (medal = 'Bronze' OR medal = 'Silver');

-- Alternative, using IN (functionally identical):
-- SELECT name
-- FROM olympics_athletes_events
-- WHERE age > 40 AND medal IN ('Bronze', 'Silver');

-- Notes:
-- Key bug caught: without parentheses, "age > 40 AND medal = 'Bronze' OR medal = 'Silver'" is evaluated by SQL as (age > 40 AND medal = 'Bronze') OR (medal = 'Silver')
-- - because AND binds tighter than OR. This would incorrectly include ANY Silver medalist regardless of age.
-- Fix: explicit parentheses around (medal = 'Bronze' OR medal = 'Silver') force the age condition to apply to the whole medal group together.
-- General rule: always parenthesize explicitly when mixing AND and OR in the same WHERE clause - default precedence can silently change meaning, with no error to flag it.
