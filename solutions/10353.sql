-- Problem: Workers With The Highest Salaries
-- Concepts: DISTINCT ON as derived table (subquery in FROM), JOIN as implicit filter, scoping an aggregate subquery to a filtered subset

SELECT current_title.worker_title
FROM worker w
JOIN (
    SELECT DISTINCT ON (worker_ref_id)
        worker_ref_id, worker_title
    FROM title
    ORDER BY worker_ref_id ASC, affected_from DESC
) AS current_title
ON w.worker_id = current_title.worker_ref_id
WHERE w.salary = (
    SELECT MAX(salary)
    FROM worker
    WHERE worker_id IN (SELECT worker_ref_id FROM title)
);

-- Notes:
-- 1. title has multiple historical rows per worker (job title changes over time), so DISTINCT ON is used as a derived table to collapse it to one row (the most recent title) per worker before joining.
-- 2. JOIN (inner join) to this derived table automatically excludes workers with no title record at all - no separate WHERE...IN check needed for that.
-- 3. Key bug found during debugging: MAX(salary) must be scoped to only workers who have a title record. The overall highest-paid worker had no title at all, so a naive MAX(salary) FROM worker (unfiltered) returned a max value nobody in the filtered set could match, giving zero rows. The MAX() subquery needed the same existence filter applied.
