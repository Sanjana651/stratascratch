-- Problem: MacBookPro User Event Count
-- Concepts: WHERE, GROUP BY, COUNT, ORDER BY (reinforcement)

SELECT event_name, COUNT(*) AS event_count
FROM playbook_events
WHERE device = 'macbook pro'
GROUP BY 1
ORDER BY 2 DESC;

-- Notes:
-- Reinforces Days 11, 12, 15/16, 20 pattern: WHERE -> GROUP BY -> COUNT per group -> ORDER BY the count.
-- device = 'macbook pro' filters to MacBook Pro users (note: case-sensitive in PostgreSQL - verify exact stored value if getting zero rows).
-- GROUP BY 1 groups by event_name (position 1 in SELECT).
-- ORDER BY 2 DESC sorts by event_count (position 2), highest first.
