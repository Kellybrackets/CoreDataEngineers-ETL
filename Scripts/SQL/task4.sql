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
SELECT company_name, primary_contact
FROM companies
WHERE (company_name LIKE 'C%' OR company_name LIKE 'W%')
  AND (primary_contact ILIKE '%ana%')
  AND primary_contact NOT ILIKE '%eana%';

-- 4. Region for each sales rep with associated accounts, sorted alphabetically
SELECT r.region_name, s.sales_rep_name, a.account_name
FROM regions r
JOIN sales_reps s ON r.region_id = s.region_id
JOIN accounts a ON s.sales_rep_id = a.sales_rep_id
ORDER BY a.account_name ASC;