-- ============================================
--Customer Insights--
-- ============================================


-- Customer Segmentation (by Year)
WITH customer_data AS (
    SELECT 
        customer_id,
        EXTRACT(YEAR FROM date)::INT AS year,
        SUM(line_total) AS total_revenue
    FROM transactions
    GROUP BY customer_id, EXTRACT(YEAR FROM date)
),
percentiles AS (
    SELECT
        year,
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_revenue) AS p25,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_revenue) AS p75
    FROM customer_data
    GROUP BY year
),
segmented AS (
    SELECT
        c.customer_id,
        c.year,
        c.total_revenue,
        CASE
            WHEN c.total_revenue < p.p25 THEN 'Low-Value'
            WHEN c.total_revenue <= p.p75 THEN 'Mid-Value'
            ELSE 'High-Value'
        END AS customer_segment
    FROM customer_data c
    JOIN percentiles p ON c.year = p.year
)
SELECT
    year,
    customer_segment,
    ROUND(SUM(total_revenue)::NUMERIC, 2) AS total_revenue,
    ROUND((SUM(total_revenue) * 100.0 / SUM(SUM(total_revenue)) OVER(PARTITION BY year))::NUMERIC, 2) AS percentage,
    COUNT(customer_id) AS customer_count,
    ROUND((SUM(total_revenue) / COUNT(customer_id))::NUMERIC, 2) AS avg_revenue_per_customer
FROM segmented
GROUP BY year, customer_segment
ORDER BY year, total_revenue DESC;


-- % of Repeat vs One-Time Buyers (by Year)
WITH order_counts AS (
    SELECT 
        customer_id,
        EXTRACT(YEAR FROM date)::INT AS year,
        COUNT(DISTINCT invoice_id) AS order_count
    FROM transactions
    GROUP BY customer_id, EXTRACT(YEAR FROM date)
)
SELECT
    year,
    CASE 
        WHEN order_count = 1 THEN 'One-Time Buyer' 
        ELSE 'Repeat Buyer' 
    END AS buyer_type,
    COUNT(*) AS customer_count,
    ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(PARTITION BY year))::NUMERIC, 2) AS percentage
FROM order_counts
GROUP BY 
    year,
    CASE 
        WHEN order_count = 1 THEN 'One-Time Buyer' 
        ELSE 'Repeat Buyer' 
    END
ORDER BY year, buyer_type;
