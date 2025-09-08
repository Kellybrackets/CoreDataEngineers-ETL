-- 1. Orders with gloss_qty or poster_qty > 4000
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

-- 2. Orders where standard_qty = 0 AND gloss_qty or poster_qty > 1000
SELECT *
FROM orders
WHERE standard_qty = 0
  AND (gloss_qty > 1000 OR poster_qty > 1000);

-- 3. Companies starting with C or W, primary contact contains 'ana' or 'Ana', but not 'eana'
SELECT name, primary_poc
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
  AND (primary_poc ILIKE '%ana%')
  AND primary_poc NOT ILIKE '%eana%';

-- 4. Region for each sales rep with associated accounts, sorted alphabetically
SELECT r.name, s.name, a.name
FROM regions r
JOIN sales_reps s ON r.id = s.region_id
JOIN accounts a ON s.id = a.sales_rep_id
ORDER BY a.name ASC;
