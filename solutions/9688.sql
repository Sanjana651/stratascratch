-- Problem: Churro Activity Date
-- Concepts: column selection (applying Day 21's lesson), WHERE + AND

SELECT activity_date, pe_description
FROM los_angeles_restaurant_health_inspections
WHERE facility_name = 'STREET CHURROS'
  AND score < 95;

-- Notes:
-- Applied Day 21's lesson: facility_name (not owner_name) for filtering by facility name. pe_description (yesterday's column) is confirmed here to be the risk category, validating yesterday's reasoning that it
-- describes the inspection program/risk type, not the owner.
-- "Below 95" means score < 95, not <= 95 (same boundary discussion as Day 9's "before noon").
-- Straightforward two-condition WHERE + AND, fully within toolkit by now.
