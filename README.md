# Stratascratch
<h1 align="center">🐘 SQL Practice — StrataScratch</h1>

<p align="center">
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/Solved-9-brightgreen?style=for-the-badge" />
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

`subqueries` `IN / EXISTS` `cross-table filtering` `DISTINCT` `DISTINCT ON` `GROUP BY + MAX` `positional grouping` `JOIN` `SUM` `derived tables` `scoped aggregate subqueries` `window functions` `PARTITION BY` `IN with literals` `IS NOT NULL`

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

---

<p align="center"><sub>Consistency beats intensity — one query a day.</sub></p>
