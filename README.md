# Stratascratch
<h1 align="center">🐘 SQL Practice — StrataScratch</h1>

<p align="center">
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/Solved-5-brightgreen?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Streak-Day%205-orange?style=for-the-badge" />
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

`subqueries` `IN / EXISTS` `cross-table filtering` `DISTINCT` `DISTINCT ON` `GROUP BY + MAX` `positional grouping` `JOIN` `SUM` `derived tables` `scoped aggregate subqueries` `window functions` `PARTITION BY`

### ✅ Progress

| # | Question | Key Concept(s) | Solution |
|---|----------|-----------------|----------|
| 10087 | [Find All Posts Which Were Reacted To With A Heart](https://platform.stratascratch.com/coding/10087-find-all-posts-which-were-reacted-to-with-a-heart?code_type=1) | Subquery, `IN`, cross-table filtering | [solutions/10087.sql](solutions/10087.sql) |
| 10299 | [Finding Updated Records](https://platform.stratascratch.com/coding/10299-finding-updated-records?code_type=1) | `DISTINCT ON`, `GROUP BY` + `MAX`, positional grouping | [solutions/10299.sql](solutions/10299.sql) |
| 10183 | [Total Cost Of Orders](https://platform.stratascratch.com/coding/10183-total-cost-of-orders?code_type=1) | JOIN, `GROUP BY`, `SUM`, positional grouping | [solutions/10183.sql](solutions/10183.sql) |
| 10353 | [Workers With The Highest Salaries](https://platform.stratascratch.com/coding/10353-workers-with-the-highest-salaries?code_type=1) | `DISTINCT ON` as derived table, `JOIN`, scoped aggregate subquery | [solutions/10353.sql](solutions/10353.sql) |
| 9917 | [Average Salaries](https://platform.stratascratch.com/coding/9917-average-salaries?code_type=1) | Window function, `OVER (PARTITION BY)` | [solutions/9917.sql](solutions/9917.sql) |


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

---

<p align="center"><sub>Consistency beats intensity — one query a day.</sub></p>
