-- ============================================
--Returns & Retention
-- ============================================


-- % of Transactions: Returns vs Sales
SELECT 
    EXTRACT(YEAR FROM date)::INT AS year,
    transaction_type,
    COUNT(*) AS num_transactions,
    ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(PARTITION BY EXTRACT(YEAR FROM date)))::NUMERIC, 2) AS percentage
FROM transactions
GROUP BY EXTRACT(YEAR FROM date), transaction_type
ORDER BY year, transaction_type;



-- Churn Analysis
WITH last_purchase AS (
    SELECT
        t.customer_id,
        t.date AS order_date,
        ROW_NUMBER() OVER (PARTITION BY t.customer_id ORDER BY t.date DESC) AS rn,
        MIN(t.date) OVER (PARTITION BY t.customer_id) AS first_purchase_date,
        EXTRACT(YEAR FROM MIN(t.date) OVER (PARTITION BY t.customer_id))::INT AS cohort_year
    FROM transactions t
),
churned AS (
    SELECT
        customer_id,
        order_date AS last_purchase_date,
        cohort_year,
        CASE
            WHEN order_date < (SELECT MAX(date) - INTERVAL '6 months' FROM transactions) THEN 'Churned'
            ELSE 'Active'
        END AS customer_status
    FROM last_purchase
    WHERE rn = 1
      AND first_purchase_date < (SELECT MAX(date) - INTERVAL '6 months' FROM transactions)
)
SELECT
    cohort_year,
    customer_status,
    COUNT(customer_id) AS num_customers,
    SUM(COUNT(customer_id)) OVER (PARTITION BY cohort_year) AS total_customers,
    ROUND((COUNT(customer_id) * 100.0 / SUM(COUNT(customer_id)) OVER (PARTITION BY cohort_year))::NUMERIC, 2) AS percentage
FROM churned
GROUP BY cohort_year, customer_status
ORDER BY cohort_year, customer_status;
