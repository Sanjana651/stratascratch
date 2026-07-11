# Concepts Learned

## Day 1 — Filtering across related tables
- When you need columns from **only one** table but must filter based on a condition in **another** table, prefer a subquery (`IN` / `EXISTS`) over a `JOIN`.
- `JOIN`s on one-to-many relationships (e.g., one post → many reactions) create duplicate rows; requires `DISTINCT` to clean up.
- `EXISTS` can be more efficient than `IN` on large tables since it short-circuits on the first match.
- PostgreSQL string comparisons are case-sensitive by default — always check actual distinct values in a column before filtering (`SELECT DISTINCT column FROM table;`).

## Day 2 — Picking one row per group
- `GROUP BY` + `MAX()`: works when non-aggregated selected columns are constant within each group; every non-aggregated column in SELECT must appear in GROUP BY.
- `DISTINCT ON (column)` (PostgreSQL-specific): keeps one whole row per group, chosen by `ORDER BY` — more flexible than GROUP BY since it doesn't require aggregating every other column.
- Positional GROUP BY / ORDER BY (`GROUP BY 1,2,3` / `ORDER BY 1`) refers to column position in the SELECT list — valid shorthand, but slightly less readable.
