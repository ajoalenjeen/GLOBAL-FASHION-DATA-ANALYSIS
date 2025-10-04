--Returns & Retention

--% of transactions that are returns vs sales
SELECT 
    CASE WHEN is_return = 1 THEN 'Return' ELSE 'Sale' END AS transaction_type,
    COUNT(*) AS num_transactions,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS DECIMAL(5,2)) AS percentage
FROM transactions 
GROUP BY CASE WHEN is_return = 1 THEN 'Return' ELSE 'Sale' END;


--Churn Analysis
WITH last_purchase AS (
    SELECT
        customer_id,
        order_date,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn,
        first_purchase_date,
        cohort_year
    FROM global_fashion
),
churned AS (
    SELECT
        customer_id,
        order_date AS last_purchase_date,
        cohort_year,
        CASE
            WHEN order_date < DATEADD(MONTH, -6, (SELECT MAX(date) FROM transactions)) THEN 'Churned'
            ELSE 'Active'
        END AS customer_status
    FROM last_purchase
    WHERE rn = 1
      AND first_purchase_date < DATEADD(MONTH, -6, (SELECT MAX(date) FROM transactions))
)
SELECT
    cohort_year,
    customer_status,
    COUNT(customer_id) AS num_customers,
    SUM(COUNT(customer_id)) OVER(PARTITION BY cohort_year) AS total_customers,
    CAST(COUNT(customer_id) * 1.0 / SUM(COUNT(customer_id)) OVER(PARTITION BY cohort_year) AS DECIMAL(5,2)) AS percentage
FROM churned
GROUP BY cohort_year, customer_status
ORDER BY cohort_year, customer_status;