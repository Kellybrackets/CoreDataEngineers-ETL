-- Create regions table
CREATE TABLE regions (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Create sales_reps table
CREATE TABLE sales_reps (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region_id INTEGER NOT NULL,
    FOREIGN KEY (region_id) REFERENCES regions(id)
);

-- Create accounts table
CREATE TABLE accounts (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    website VARCHAR(100),
    lat DECIMAL(10, 8),
    long DECIMAL(11, 8),
    primary_poc VARCHAR(100),
    sales_rep_id INTEGER NOT NULL,
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(id)
);

-- Create orders table
CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    account_id INTEGER NOT NULL,
    occurred_at TIMESTAMP NOT NULL,
    standard_qty INTEGER,
    gloss_qty INTEGER,
    poster_qty INTEGER,
    total INTEGER,
    standard_amt_usd DECIMAL(10, 2),
    gloss_amt_usd DECIMAL(10, 2),
    poster_amt_usd DECIMAL(10, 2),
    total_amt_usd DECIMAL(10, 2),
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);



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