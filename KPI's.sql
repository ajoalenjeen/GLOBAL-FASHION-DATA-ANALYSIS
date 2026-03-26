-- ============================================
-- KPI
-- ============================================


-- 1. Total Customers
SELECT 
    EXTRACT(YEAR FROM date)::INT AS year,
    COUNT(DISTINCT customer_id) AS total_customers
FROM transactions
GROUP BY EXTRACT(YEAR FROM date)
ORDER BY year;


-- 2. Total revenue
SELECT 
    EXTRACT(YEAR FROM date)::INT AS year,
    ROUND(SUM(line_total)::NUMERIC, 2) AS total_revenue
FROM transactions
WHERE transaction_type = 'Sale'
GROUP BY EXTRACT(YEAR FROM date)
ORDER BY year;


-- 3. Return Loss 
SELECT 
    EXTRACT(YEAR FROM date)::INT AS year,
    ROUND(SUM(line_total)::NUMERIC, 2) AS return_loss
FROM transactions
WHERE transaction_type = 'Return'
GROUP BY EXTRACT(YEAR FROM date)
ORDER BY year;


-- 4. Total Orders 
SELECT 
    EXTRACT(YEAR FROM date)::INT AS year,
    COUNT(DISTINCT invoice_id) AS total_orders
FROM transactions
GROUP BY EXTRACT(YEAR FROM date)
ORDER BY year;


-- 5. Total Quantity Sold 
SELECT 
    EXTRACT(YEAR FROM date)::INT AS year,
    SUM(quantity) AS total_quantity
FROM transactions
WHERE transaction_type = 'Sale'
GROUP BY EXTRACT(YEAR FROM date)
ORDER BY year;

