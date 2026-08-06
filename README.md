# Stratascratch
<h1 align="center">🐘 SQL Practice — StrataScratch</h1>

<p align="center">
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/Solved-24-brightgreen?style=for-the-badge" />
</p>

<p align="center"><i>One SQL problem a day, solved in PostgreSQL, with the reasoning behind every query — not just the answer.</i></p>

---

### 📌 Why this repo exists

I'm building SQL fluency through consistent, deliberate practice. Every solution here captures not just *what* I wrote, but *why* — which approach I chose, what alternatives existed, and what I'd improve now.

### 🗂️ Structure

```
solutions/   → one .sql file per problem, fully commented
notes/       → concepts and patterns learned along the way
```

### 🏷️ Topics Covered

`subqueries` `IN / EXISTS` `cross-table filtering` `DISTINCT` `DISTINCT ON` `GROUP BY + MAX` `positional grouping` `JOIN` `SUM` `derived tables` `scoped aggregate subqueries` `window functions` `PARTITION BY` `IN with literals` `IS NOT NULL` `AND` `OR` `COUNT` `AVG` `MIN` `operator precedence` `ambiguous column resolution` `HAVING` `EXTRACT` `LIKE` `LENGTH` `LIMIT`

### ✅ Progress

| # | Question | Key Concept(s) | Solution |
|---|----------|-----------------|----------|
| 10087 | [Find All Posts Which Were Reacted To With A Heart](https://platform.stratascratch.com/coding/10087-find-all-posts-which-were-reacted-to-with-a-heart?code_type=1) | Subquery, `IN`, cross-table filtering | [solutions/10087.sql](solutions/10087.sql) |
| 10299 | [Finding Updated Records](https://platform.stratascratch.com/coding/10299-finding-updated-records?code_type=1) | `DISTINCT ON`, `GROUP BY` + `MAX`, positional grouping | [solutions/10299.sql](solutions/10299.sql) |
| 10183 | [Total Cost Of Orders](https://platform.stratascratch.com/coding/10183-total-cost-of-orders?code_type=1) | JOIN, `GROUP BY`, `SUM`, positional grouping | [solutions/10183.sql](solutions/10183.sql) |
| 10353 | [Workers With The Highest Salaries](https://platform.stratascratch.com/coding/10353-workers-with-the-highest-salaries?code_type=1) | `DISTINCT ON` as derived table, `JOIN`, scoped aggregate subquery | [solutions/10353.sql](solutions/10353.sql) |
| 9917 | [Average Salaries](https://platform.stratascratch.com/coding/9917-average-salaries?code_type=1) | Window function, `OVER (PARTITION BY)` | [solutions/9917.sql](solutions/9917.sql) |
| 10127 | [Calculate Samantha's and Lisa's total sales revenue](https://platform.stratascratch.com/coding/10127-calculate-samanthas-and-lisas-total-sales-revenue?code_type=1) | `IN` with literal values, `SUM()` with no `GROUP BY` | [solutions/10127.sql](solutions/10127.sql) |
| 10024 | [Find wine varieties tasted by 'Roger Voss' with a value in region_1](https://platform.stratascratch.com/coding/10024-find-wine-varieties-tasted-by-roger-voss-and-with-a-value-in-the-region-1-column-of-the-dataset?code_type=1) | `IS NOT NULL`, `AND`, `DISTINCT` | [solutions/10024.sql](solutions/10024.sql) |
| 10005 | [Hour Of Highest Gas Expense](https://platform.stratascratch.com/coding/10005-hour-of-highest-gas-expense?code_type=1) | `MAX()` subquery pattern | [solutions/10005.sql](solutions/10005.sql) |
| 10004 | [Find all Lyft rides which happened on rainy days before noon](https://platform.stratascratch.com/coding/10004-find-all-lyft-rides-which-happened-on-rainy-days-before-noon?code_type=1) | `WHERE` + `AND`, verifying exact text values | [solutions/10004.sql](solutions/10004.sql) |
| 10003 | [Lyft Driver Wages](https://platform.stratascratch.com/coding/10003-lyft-driver-wages?code_type=1) | `OR` vs `AND` | [solutions/10003.sql](solutions/10003.sql) |
| 9992 | [Artist Appearance Count](https://platform.stratascratch.com/coding/9992-artist-appearance-count?code_type=1) | `COUNT()`, `GROUP BY`, positional `ORDER BY` | [solutions/9992.sql](solutions/9992.sql) |
| 9991 | [Top Ranked Songs](https://platform.stratascratch.com/coding/9991-top-ranked-songs?code_type=1) | `WHERE` + `GROUP BY` + `COUNT()` | [solutions/9991.sql](solutions/9991.sql) |
| 9943 | [Olympics Events List By Age](https://platform.stratascratch.com/coding/9943-olympics-events-list-by-age?code_type=1) | `MIN`, `AVG`, `MAX` in one query | [solutions/9943.sql](solutions/9943.sql) |
| 9937 | [Find all athletes who were older than 40 years when they won either Bronze or Silver medals](https://platform.stratascratch.com/coding/9937-find-all-athletes-who-were-older-than-40-years-when-they-won-either-bronze-or-silver-medals?code_type=1) | `AND`/`OR` precedence, parentheses, `IN` | [solutions/9937.sql](solutions/9937.sql) |
| 9913 | [Order Details](https://platform.stratascratch.com/coding/9913-order-details?code_type=1) | `JOIN`, ambiguous column names, `OR` | [solutions/9913.sql](solutions/9913.sql) |
| 9911 | [Departments With 5 Employees](https://platform.stratascratch.com/coding/9911-departments-with-5-employees?code_type=1) | `HAVING`, `GROUP BY`, `COUNT()` | [solutions/9911.sql](solutions/9911.sql) |
| 9845 | [April Admin Employees](https://platform.stratascratch.com/coding/9845-april-admin-employees?code_type=1) | `EXTRACT()`, `AND`, `COUNT` | [solutions/9845.sql](solutions/9845.sql) |
| 9842 | [First Names With Six Letters Ending in 'h'](https://platform.stratascratch.com/coding/9842-first-names-with-six-letters-ending-in-h?code_type=1) | `LIKE`, `%` wildcard, `LENGTH()` | [solutions/9842.sql](solutions/9842.sql) |
| 9805 | [Find drafts which contains the word 'optimism'](https://platform.stratascratch.com/coding/9805-find-drafts-which-contains-the-word-optimism?code_type=1) | `LIKE`, wildcard placement | [solutions/9805.sql](solutions/9805.sql) |
| 9728 | [Number of violations](https://platform.stratascratch.com/coding/9728-number-of-violations?code_type=1) | `EXTRACT`, `IS NOT NULL`, `GROUP BY`, `ORDER BY` combined | [solutions/9728.sql](solutions/9728.sql) |
| 9689 | [Inspection For Glassell Coffee Shop](https://platform.stratascratch.com/coding/9689-inspection-for-glassell-coffee-shop?code_type=1) | Careful column selection in wide tables | [solutions/9689.sql](solutions/9689.sql) |
| 9688 | [Churro Activity Date](https://platform.stratascratch.com/coding/9688-churro-activity-date?code_type=1) | `WHERE`, `AND`, column selection | [solutions/9688.sql](solutions/9688.sql) |
| 9663 | [Most Profitable Financial Company](https://platform.stratascratch.com/coding/9663-most-profitable-financial-company?code_type=1) | `LIMIT`, `ORDER BY DESC` | [solutions/9663.sql](solutions/9663.sql) |
| 9653 | [MacBookPro User Event Count](https://platform.stratascratch.com/coding/9653-macbookpro-user-event-count?code_type=1) | `WHERE`, `GROUP BY`, `COUNT`, `ORDER BY` | [solutions/9653.sql](solutions/9653.sql) |

### 🧠 Concepts Learned

Full running log in [notes/concepts-learned.md](notes/concepts-learned.md).

**So far:**
- Subquery (`IN` / `EXISTS`) vs `JOIN` for filtering across related tables
- Avoiding duplicate rows from one-to-many joins with `DISTINCT`
- `GROUP BY` + `MAX()` vs `DISTINCT ON` for picking one row per group
- Positional `GROUP BY` / `ORDER BY` (referencing column position instead of name)
- JOIN + GROUP BY + SUM() to aggregate values across a joined table
- Using DISTINCT ON as a derived table (subquery in FROM) before joining
- Scoping an aggregate subquery (MAX/MIN) to match the same filter condition as the outer query
- Window functions (AVG() OVER (PARTITION BY ...)) to attach group-level aggregates without collapsing rows
- IN with a fixed list of literal values (shorthand for multiple OR conditions)
- SUM() with no GROUP BY to collapse all matching rows into one combined total
- IS NULL / IS NOT NULL for correctly checking missing values (not = NULL)
- OR vs AND: "either...or" maps to OR; AND on the same column with mutually exclusive ranges is always false
- COUNT() for counting rows per group; GROUP BY resolves the ambiguity of mixing raw columns with aggregates in the same SELECT
- Multiple aggregates (MIN/AVG/MAX) side by side in one SELECT, all calculated over the same row set
- AND/OR operator precedence: AND binds tighter than OR - always parenthesize explicitly when mixing them
- Qualifying ambiguous column names (shared between joined tables) with table aliases, anywhere they're referenced
- HAVING to filter groups by an aggregate value, after GROUP BY (WHERE can't do this - it runs before aggregation exists)
- EXTRACT(part FROM date) to pull a specific component (month/year/day) from a date column
- LIKE with % wildcard for pattern matching (starts with / ends with / contains); LENGTH() for character count
- LIMIT N to keep only the first N rows; commonly paired with ORDER BY DESC to get "top N" results
---

<p align="center"><sub>Consistency beats intensity — one query a day.</sub></p>
