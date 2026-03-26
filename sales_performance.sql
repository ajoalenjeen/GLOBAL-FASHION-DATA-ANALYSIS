-- ============================================
--Sales Performance--
-- ============================================


-- Monthly Revenue Trend Across All Stores (by Year)
SELECT 
    EXTRACT(YEAR FROM date)::INT AS year,
    TO_CHAR(date, 'Mon-YYYY') AS month_year,
    ROUND(SUM(line_total)::NUMERIC, 2) AS total_revenue
FROM transactions
GROUP BY EXTRACT(YEAR FROM date),
         EXTRACT(MONTH FROM date),
         TO_CHAR(date, 'Mon-YYYY')
ORDER BY EXTRACT(YEAR FROM date), 
         EXTRACT(MONTH FROM date);


-- Revenue by Country (by Year)
SELECT 
    EXTRACT(YEAR FROM t.date)::INT AS year,
    s.country,
    ROUND(SUM(t.line_total)::NUMERIC, 2) AS revenue,
    COUNT(DISTINCT t.invoice_id) AS total_orders,
    COUNT(DISTINCT t.customer_id) AS unique_customers,
    ROUND((SUM(t.line_total) / COUNT(DISTINCT t.invoice_id))::NUMERIC, 2) AS avg_order_value
FROM transactions t
JOIN stores s ON t.store_id = s.store_id
GROUP BY EXTRACT(YEAR FROM t.date), s.country
ORDER BY year, revenue DESC;


-- Top 10 Best-Selling Products by Revenue (by Year)
SELECT 
    year,
    sub_category,
    revenue
FROM (
    SELECT 
        EXTRACT(YEAR FROM t.date)::INT AS year,
        p.sub_category,
        ROUND(SUM(t.line_total)::NUMERIC, 2) AS revenue,
        ROW_NUMBER() OVER(PARTITION BY EXTRACT(YEAR FROM t.date) ORDER BY SUM(t.line_total) DESC) AS rn
    FROM transactions t
    JOIN products p ON t.product_id = p.product_id
    GROUP BY EXTRACT(YEAR FROM t.date), p.sub_category
) ranked
WHERE rn <= 10
ORDER BY year, revenue DESC;
