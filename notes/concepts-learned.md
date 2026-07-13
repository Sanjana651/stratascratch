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

## Day 3 — Aggregating across a joined table
- JOIN is needed when the final output requires actual columns from two different tables (not just filtering based on one).
- GROUP BY should only reference the columns that define what a "bucket" is (e.g., customer id, name) — not the aggregate function itself.
- SUM() calculates a total per group, evaluated after GROUP BY clusters the rows.
- Positional ORDER BY/GROUP BY must match the actual number and order of columns in the SELECT list — mismatches cause errors.

## Day 4 — Derived tables and scoping aggregates correctly
- DISTINCT ON can be used as a subquery inside FROM (a "derived table") to collapse a multi-row-per-entity table down to one row per entity *before* joining it elsewhere.
- An inner JOIN automatically filters out rows with no match on the other side - it can replace a separate WHERE...IN existence check in some cases.
- When a condition like "among X who satisfy Y" appears in a problem, any aggregate (MAX, MIN, etc.) computed as part of that condition must be scoped to the *same* filtered subset - not computed over the whole unfiltered table. Otherwise the aggregate can reflect a value from an excluded row, silently breaking the match.
