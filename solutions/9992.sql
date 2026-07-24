-- Problem: Artist Appearance Count
-- Concepts: COUNT(), GROUP BY, positional GROUP BY/ORDER BY, ORDER BY DESC

SELECT artist, COUNT(artist) AS n_occurences
FROM spotify_worldwide_daily_song_ranking
GROUP BY 1
ORDER BY 2 DESC;

-- Notes:
-- COUNT(artist) counts rows per group (per artist) - since every row in a group already shares the same artist value, COUNT(artist), COUNT(*), and
-- COUNT(any_non_null_column) all give the same result here. COUNT(*) is usually the more conventional default unless specifically counting non-NULL values of one particular column.
-- GROUP BY 1 groups by `artist` (position 1 in SELECT) - without it, selecting both a raw column (artist) and an aggregate (COUNT(artist))
-- together is ambiguous and errors out: GROUP BY resolves this by redefining "one row" as "one artist's whole bucket of entries."
-- ORDER BY 2 DESC sorts by n_occurences (position 2), not artist name - position number must match what you actually intend to sort by.
