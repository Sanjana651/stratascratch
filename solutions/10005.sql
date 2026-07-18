-- Problem: Hour Of Highest Gas Expense
-- Concepts: MAX() subquery as a stepping stone to filter to a specific row

SELECT hour
FROM lyft_rides
WHERE gasoline_cost = (SELECT MAX(gasoline_cost) FROM lyft_rides);

-- Notes:
-- Same core pattern as Day 4 (highest-salary workers): use MAX() as a subquery to calculate the target value first, then filter the outer query to the row(s) matching it, and select whatever column is needed.
-- Problem guarantees only one ride has this max (no ties), so exactly one row is returned here - the query itself doesn't need to change to handle that guarantee, it's just a property of the data.
