-- Problem: Top Ranked Songs
-- Concepts: WHERE before GROUP BY, COUNT() on a filtered subset

SELECT trackname, COUNT(position) AS times_top1
FROM spotify_worldwide_daily_song_ranking
WHERE position = 1
GROUP BY 1
ORDER BY 2 DESC;

-- Notes:
-- Same core structure as Day 11 (COUNT + GROUP BY + ORDER BY DESC), with one addition: WHERE position = 1 filters rows BEFORE grouping/counting, so only "song was ranked #1" appearances get counted, not all appearances.
-- Processing order: FROM -> WHERE (filter rows) -> GROUP BY (bucket by trackname) -> aggregate (COUNT within each bucket) -> ORDER BY (sort the final grouped result).
-- WHERE narrows which rows get counted; GROUP BY decides how they're bucketed; the aggregate function calculates within each bucket - three separate, composable jobs.
