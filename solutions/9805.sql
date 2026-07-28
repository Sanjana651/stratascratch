-- Problem: Find drafts which contains the word 'optimism'
-- Concepts: LIKE with % wildcard placement (starts with vs contains)

SELECT *
FROM google_file_store
WHERE filename LIKE 'draft%'
  AND contents LIKE '%optimism%';

-- Notes:
-- Reinforces Day 18's LIKE pattern matching, with the key distinction being WHERE the % wildcard goes:
--   'draft%'      -> starts with 'draft' (% only at the end)
--   '%optimism%'  -> contains 'optimism' anywhere (% on both sides)
--   '%h'          -> ends with 'h' (% only at the start, from Day 18)
-- AND combines both column conditions, both must hold true.
