CREATE OR ALTER VIEW global_fashion AS
WITH customer_revenue AS (
    SELECT
        t.[Customer Id] as customer_id,
        CAST(t.date AS DATE) AS order_date,
        SUM(t.[Line Total]) AS total_net_revenue,
        COUNT(t.[Invoice ID]) AS num_orders,
        MAX(c.country) as country,
        MAX(c.city) AS city,
        MAX(c.name) AS full_name,
        MAX(c.[Date Of Birth]) AS dob
    FROM transactions t
    INNER JOIN customers c ON c.[Customer Id] = t.[Customer Id]
    GROUP BY t.[Customer Id], CAST(t.date AS DATE)
)
SELECT
    customer_id,
    order_date,
    total_net_revenue,
    num_orders,
    country,
    city,
    DATEDIFF(YEAR, dob, GETDATE()) AS age, 
    full_name,
    MIN(order_date) OVER (PARTITION BY customer_id) AS first_purchase_date,
    YEAR(MIN(order_date) OVER (PARTITION BY customer_id)) AS cohort_year
FROM customer_revenue;

