--Customer Insights--

--Customer Segmentation
WITH customer_data AS (
    SELECT customer_id, SUM(total_net_revenue) AS total_revenue
    FROM global_fashion
    GROUP BY customer_id
),
percentiles AS (
    SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_revenue) OVER () AS p25,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_revenue) OVER () AS p75
    FROM customer_data
), 
segmented AS (
    SELECT
        c.customer_id,
        c.total_revenue,
        CASE
            WHEN c.total_revenue < p.p25 THEN 'Low-Value'
            WHEN c.total_revenue BETWEEN p.p25 AND p.p75 THEN 'Mid-Value'
            ELSE 'High-Value'
        END AS customer_segment
    FROM customer_data c
    CROSS APPLY ( SELECT DISTINCT p25, p75 FROM percentiles) p
)
SELECT
    customer_segment,
    CAST(SUM(total_revenue) AS DECIMAL(10,2)) AS total_revenue,
    CAST(SUM(total_revenue) * 1.0 / (SELECT SUM(total_revenue) FROM segmented) AS DECIMAL(10,2)) AS percentage,
    COUNT(customer_id) AS customer_count,
    CAST(SUM(total_revenue) * 1.0 / COUNT(customer_id) AS DECIMAL(10,2)) AS average
FROM segmented 
GROUP BY customer_segment
ORDER BY total_revenue DESC;


--% of repeat vs one-time buyers
WITH order_counts AS (
    SELECT [Customer ID], COUNT(*) AS order_count
    FROM transactions
    GROUP BY [Customer ID]
)
SELECT 
    CASE 
        WHEN order_count = 1 THEN 'One-Time Buyer' ELSE 'Repeat Buyer' 
    END AS buyer_type,
    COUNT(*) AS customer_count,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS DECIMAL(5,2)) AS percentage
FROM order_counts
GROUP BY CASE WHEN order_count = 1 THEN 'One-Time Buyer' ELSE 'Repeat Buyer' END;