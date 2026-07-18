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

## Day 5 — Window functions
- GROUP BY collapses rows into one per group - loses individual row detail.
- Window functions (AGGREGATE(...) OVER (PARTITION BY column)) calculate an aggregate per group WITHOUT collapsing rows - every original row survives, with the aggregate attached as an extra column.
- PARTITION BY defines the "window" (group) the calculation applies to, analogous to GROUP BY's grouping key, but without merging output rows.
- Use case signal: "output X for each row, along with a group-level aggregate alongside it" -> window function, not GROUP BY.

## Day 6 — IN with literal values, aggregate with no GROUP BY
- IN works with a fixed list of literal values, not just a subquery - shorthand for multiple OR conditions on the same column.
- SUM() (or any aggregate) with no GROUP BY collapses ALL matching rows into a single combined value - useful when a problem wants one total, not a per-group breakdown.
- When a problem's wording is ambiguous about "total" vs "totals per X", check the expected output's row count/shape to confirm which is meant.

## Day 7 — Handling NULL values correctly
- IS NULL / IS NOT NULL is the required syntax for checking missing values -
  = NULL or != NULL do not work due to SQL's three-valued logic (NULL means "unknown," not a value that can be equality-compared).
- Combined with AND to require multiple conditions simultaneously, and DISTINCT to deduplicate the final output - both concepts reused correctly from earlier days without needing them re-explained.

## Day 8 — Reusing the MAX() subquery pattern
- Same pattern as Day 4: WHERE column = (SELECT MAX(column) FROM table) finds the row(s) matching the maximum value, then any other column from that row can be selected.
- Whether this returns one row or multiple (ties) depends on the data, not the query - the query logic stays the same either way.
