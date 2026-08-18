-- Problem: Number of Shipments Per Month
-- Concepts: TO_CHAR() for date formatting, COUNT(DISTINCT (col1, col2)) for composite keys

SELECT 
  TO_CHAR(shipment_date, 'YYYY-MM') AS year_month,
  COUNT(DISTINCT (shipment_id, sub_id)) AS num_shipments
FROM amazon_shipment
GROUP BY 1
ORDER BY 1, 2;

-- Notes:
-- TO_CHAR(date_column, 'YYYY-MM') formats a date into string format 'YYYY-MM' (e.g. 2026-08). Very useful for output formatting requirements beyond just extracting individual parts (YEAR/MONTH/DAY).
-- COUNT(DISTINCT (col1, col2)) counts unique COMBINATIONS of multiple columns - a composite key. Different from COUNT(DISTINCT col1) which only looks at one column. Here, (shipment_id=100, sub_id=1) is one distinct pair, (shipment_id=100, sub_id=2) is a different pair.
-- Multiple rows with the same pair count as one shipment.
-- GROUP BY 1 groups by year_month (position 1), so COUNT is per month.
