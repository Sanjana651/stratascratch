-- Problem: Inspection For Glassell Coffee Shop
-- Concepts: careful column selection in a wide table (reading the schema correctly)

SELECT *
FROM los_angeles_restaurant_health_inspections
WHERE owner_name = 'GLASSELL COFFEE SHOP LLC';

-- Notes:
-- Initial mistake: filtered on pe_description instead of owner_name. pe_description almost certainly describes "program element" (paired with the numeric program_element_pe column) - i.e. inspection category/type, not the business owner's name.
-- No SQL error results from filtering on the wrong column here - the query just silently returns the wrong (likely empty or unrelated) result. Same class of bug as Day 9's case-sensitivity lesson: the query runs fine but quietly answers a different question.
-- Lesson: in wide tables with many similarly-named columns, reason through what each column plausibly represents before committing to one, rather than grabbing the first plausible-sounding match.
