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

## Day 9 — Verifying assumptions before filtering
- No new SQL concept - reinforced WHERE + AND from earlier days.
- Key habit: always check SELECT DISTINCT on a text column being filtered, to confirm the exact stored value/casing before trusting a WHERE clause - a mismatch produces zero rows silently, with no error to flag it.
- Boundary conditions ("before noon") need care: hour < 12, not <= 12.

## Day 10 — OR vs AND
- "Either...or" in English almost always maps to SQL's OR, not AND.
- Test: can a single row ever satisfy both conditions at the same time on the same column? If no, OR is needed (impossible with AND - always zero rows). If yes, AND may be correct (e.g. Day 7's taster_name + region_1 check, which are on different columns and can both be true together).

## Day 11 — COUNT() and why GROUP BY is required, not just conventional
- COUNT(column) counts non-NULL rows per group; COUNT(*) counts all rows per group. When grouping by a column that's always non-null (like the grouping key itself), both give identical results - COUNT(*) is the more conventional default otherwise.
- GROUP BY isn't just a syntax rule - it resolves a genuine ambiguity. Without it, selecting a raw column (artist) alongside an aggregate (COUNT(artist)) asks for both "one value per row" and "one summary value for the whole table" simultaneously, which SQL can't reconcile - hence the error. GROUP BY fixes this by redefining what "one row" means: one bucket per distinct grouping-key value.
- Positional ORDER BY must reference the column actually being sorted by, not just habitually the first position.

## Day 12 — WHERE filters before GROUP BY/aggregation
- Same COUNT + GROUP BY + ORDER BY DESC structure as Day 11, with a WHERE clause added to restrict which rows get counted in the first place.
- Query processing order: FROM -> WHERE -> GROUP BY -> SELECT (aggregates calculated per group) -> ORDER BY. WHERE always operates on raw, ungrouped rows, before any bucketing happens.
- Three separate composable jobs: WHERE narrows which rows count, GROUP BY decides how they're bucketed, the aggregate function calculates within each bucket.

## Day 13 — Multiple aggregates in one query, no GROUP BY
- Multiple aggregate functions (MIN, AVG, MAX, etc.) can be listed side by side in the same SELECT - each is calculated independently over the same rows, all producing one combined output row.
- Reinforces Day 6: no GROUP BY means the aggregate(s) apply across the entire table, not per-group.
- A hint saying "don't worry about duplicates/edge cases" often just means no extra DISTINCT/dedup logic is needed - every row counts as-is.

## Day 14 — Operator precedence: AND vs OR
- AND binds tighter than OR in SQL (same as in math/most languages). "A AND B OR C" is evaluated as "(A AND B) OR C", NOT "A AND (B OR C)" - these can have very different meanings.
- Always use explicit parentheses when mixing AND and OR in the same WHERE clause, to force the grouping actually intended. No error is raised for the "wrong" grouping - it's syntactically valid either way, just logically different.
- IN (...) can replace multiple "column = X OR column = Y" conditions, same as Day 6, and avoids this precedence trap entirely for that part.

## Day 15 — Ambiguous column names after JOIN
- When two joined tables share a column name (e.g. both have `id`), that name becomes ambiguous anywhere it's referenced after the JOIN - not just in SELECT, but in WHERE, ORDER BY, etc. Must qualify with the table alias (c.id vs o.id) or PostgreSQL raises an ambiguity error.
- GROUP BY is only needed when aggregating (SUM/COUNT/AVG/etc in SELECT) - joining multiple tables alone doesn't require it.
- Reinforced: OR (not AND) for "equals one of several values" on the same column - same lesson as Day 10.

## Day 16 — HAVING (filtering groups, not rows)
- WHERE filters raw rows before grouping - cannot reference an aggregate (COUNT/SUM/AVG/etc), since that value isn't calculated yet at that stage.
- HAVING filters groups AFTER GROUP BY + aggregation - the only clause that can filter based on an aggregate's calculated value.
- Rule of thumb: aggregate in the filter condition -> HAVING. Plain raw column condition -> WHERE.
- HAVING can reference an aggregate not present in SELECT at all - it operates on groups, independent of what's displayed.
- WHERE and HAVING can coexist: WHERE filters rows first, HAVING filters the resulting groups afterward.

## Day 17 — EXTRACT() for pulling date components
- EXTRACT(part FROM date_column) pulls a specific component (MONTH, YEAR, DAY, etc.) out of a full date value, ignoring the rest.
- Useful for "regardless of year, which month/day did this happen in" type conditions - compares the extracted number, not the whole date.
- Reinforced AND (combining conditions) and COUNT(*) with no GROUP BY (single combined total across all matching rows).

## Day 18 — LIKE pattern matching and LENGTH()
- LIKE matches text against a pattern using % as a wildcard for "any sequence of characters, including none." '%h' = ends with h, 'h%' = starts with h, '%h%' = contains h anywhere.
- LENGTH(column) returns the character count of a text value - often combined with LIKE when a problem cares about both pattern and exact size (e.g. "6 letters, ending in h").
- First time doing partial/pattern text matching, as opposed to exact equality (= 'value') used in all prior text filters.

## Day 19 — LIKE wildcard placement (starts with vs contains vs ends with)
- Reinforces Day 18. The placement of % fully determines the pattern's meaning:
    'text%'  -> starts with 'text'
    '%text'  -> ends with 'text'
    '%text%' -> contains 'text' anywhere
- Recognizing which shape a problem needs, based on wording like "starts with"/"ends with"/"contains", is the core skill - the LIKE syntax itself doesn't change.

## Day 20 — Combining multiple concepts, keeping clauses straight
- No new individual concept - combined EXTRACT(), IS NOT NULL, WHERE+AND, GROUP BY, and ORDER BY from prior days into one query.
- Main challenge: keeping each piece in its correct clause. A SELECT expression (EXTRACT(...) AS alias), a WHERE condition, and a GROUP BY target are different jobs - easy to blur together in a query with many moving parts. Working through clause order (SELECT -> FROM -> WHERE -> GROUP BY -> ORDER BY) one at a time resolves this.

## Day 21 — Careful column selection in wide tables
- No new SQL syntax - the lesson was reading a wide table's schema carefully before picking a column to filter on.
- Similarly-named/ambiguous columns (owner_name vs pe_description vs program_element_pe) don't cause SQL errors if the wrong one is picked - the query runs fine but silently answers a different question than intended (same class of bug as Day 9's case-sensitivity issue).
- Habit: reason about what each column plausibly represents (e.g. "pe" likely = program element, paired with a numeric code column right next to it) before trusting a column name at face value.

## Day 22 — Applying prior lessons without friction
- No new SQL concept - reinforced column selection (facility_name vs owner_name from Day 21), WHERE + AND, and boundary conditions (< vs <=) from earlier days.
- This problem validated Day 21's reasoning: pe_description (today's column) confirmed to be risk category, not owner info - showed that careful column-name reasoning pays off when the same column comes up in different problems with different meanings.
- Concepts from earlier days becoming automatic, not requiring step-by-step reasoning each time.

## Day 23 — LIMIT for "top N" queries
- LIMIT N keeps only the first N rows from a result, after all other clauses (WHERE, GROUP BY, ORDER BY) have already run.
- Common pattern: ORDER BY metric DESC, then LIMIT 1 to get the single "top" row by that metric.
- Two valid approaches to "find the maximum": (1) LIMIT 1 after sort (simpler, more readable for top 1), or (2) WHERE = (SELECT MAX(...)) subquery (more general, easier to extend to "top 5" or "top 10").

## Day 24 — Reinforcement of GROUP BY + COUNT + ORDER BY pattern
- No new concepts - reinforced the WHERE -> GROUP BY -> COUNT per group -> ORDER BY pattern from Days 11, 12, 15/16, 20.
- Highlighted case-sensitivity issue again (Day 9): device = 'macbook pro' vs stored 'MacBookPro' would silently return zero rows if they don't match exactly.

## Day 25 — CASE WHEN for conditional counting, casting for decimal division
- CASE WHEN condition THEN value END inside an aggregate (COUNT, SUM) lets you calculate conditionally - "count this row if condition holds." Used when a WHERE clause can't express the logic (need different conditions for numerator vs denominator in same query).
- Integer division trap: COUNT() / COUNT() with both being integers truncates to an integer result (69/223 -> 0, not 0.31). Cast one operand to DECIMAL (::DECIMAL in PostgreSQL) to force decimal division.
- First time needing to handle ratio/percentage calculations.

## Day 26 — Straightforward IS NULL filtering
- No new concepts - reinforced IS NULL filtering from Days 7, 17, 25, now as automatic habit rather than something requiring step-by-step reasoning.
- Simple single-condition WHERE clause, no GROUP BY or ORDER BY needed.
- Fundamentals becoming second nature.

## Day 27 — COUNT(DISTINCT ...) for unique value counts
- COUNT(DISTINCT column) counts unique/distinct values in a column, distinct from COUNT(*) (rows) or COUNT(column) (non-null values).
- First active use of DISTINCT inside an aggregate - Day 7 used DISTINCT in SELECT list for deduplication, now using it to filter COUNT's scope.
- GROUP BY with multiple columns (GROUP BY 1, 2) creates separate buckets for each combination of grouping keys, so aggregates are calculated independently per bucket (e.g. per client-month pair).
