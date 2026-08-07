-- Problem: Users Missing Phone Numbers
-- Concepts: IS NULL (straightforward filtering)

SELECT user_id, user_name
FROM fintech_app_users
WHERE phone_number IS NULL;

-- Notes:
-- Straightforward single-condition filter using IS NULL (Days 7, 17, 25).
-- No GROUP BY or ORDER BY needed - just returning a list of matching users, one row per user.
-- Fundamentals have become automatic by this point.
