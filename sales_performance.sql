--Sales Performance--

--Monthly revenue trend across all stores
SELECT 
    FORMAT(order_date, 'MMM-yyyy') AS month_year,
    SUM(total_net_revenue) AS total_revenue
FROM global_fashion
GROUP BY FORMAT(order_date, 'MMM-yyyy'),
         YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);


--Top 20 city in the USA that generates the most revenue?
SELECT TOP 20 
    city, SUM(total_net_revenue) AS revenue
FROM global_fashion
WHERE country = 'United States'
GROUP BY city
ORDER BY revenue DESC;


--Top 10 best-selling products by revenue
SELECT TOP 10 
    p.[Sub Category] AS category,
    SUM(t.[Line Total]) AS revenue
FROM transactions t
JOIN products p ON t.[Product Id] = p.[Product Id]
GROUP BY p.[Sub Category]
ORDER BY revenue DESC;