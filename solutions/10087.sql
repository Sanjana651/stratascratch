-- Problem: Find all posts which were reacted to with a heart
-- Concepts: subquery, IN, filtering across related tables

SELECT *
FROM facebook_posts
WHERE post_id IN (
    SELECT post_id
    FROM facebook_reactions
    WHERE reaction = 'heart'
);

-- Notes:
-- Used a subquery instead of JOIN to avoid duplicate rows, since one post can have many reactions (one-to-many relationship).
-- Alternative approaches: JOIN + DISTINCT, or EXISTS.
