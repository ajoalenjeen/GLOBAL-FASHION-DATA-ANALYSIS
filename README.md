# GLOBAL FASHION DATA

## Project Overview

This project analyzes Global Fashion retail transactions using SQL Server. The goal is to uncover insights about sales performance, customer behavior, profitability, and retention that could guide business strategy.

## Business Questions

Sales Performance: 
* Monthly Sales Performance → What are the revenue trends over time?
* Top Stores & Products → Which cities and products generate the most revenue?

Customer Insights:
* Customer Segmentation → Who are our most valuable customers?
* Repeat vs One-Time Buyers → What % of customers return?

Returns & Retention:
* Returns → What % of transactions are returns?
* Churn Analysis → Which customers have stopped purchasing?

## Data Cleaning 

#### Query: [data_cleaning.sql](/data_cleaning.sql)

* Standardized country names (中国 → China, España → Spain).

* Converted dates into proper DATE format.

* Added is_return flag for negative transactions.

* Standardized gender values.

#### Query: [create_view.sql](/create_view.sql)

* Created global_fashion view combining transactions + customers.

* Calculated age, first purchase date, and cohort year.

* Aggregated daily customer revenue and purchase counts.

## Analysis

### Sales Performance:
#### Query: [sales_performance](/sales_performance.sql)
#### 1.Monthly Trends
![monthly trends](/Images/Monthly_trends.png)

Revenue has seasonal peaks in September–December, with December as the strongest month both in 2023 and 2024.

#### 2.Top 20 city in the USA that generates the most revenue
![top 20 cities](/Images/Top_20_cities.png)

* New York ($15.3M) and Los Angeles ($14.6M) completely dominate revenue — way ahead of other cities and Chicago is a distant 3rd at ~$4M.

* The rest (Houston, Phoenix, Newark, etc.) are under $1M each.

#### 3.Top 10 best-selling products by revenue
![top 10 categories](/Images/Top_10_categories.png)

* Coats and Blazers ($6.4M) and Pants and Jeans ($5.9M) are the top sellers.

* Suits and Blazers ($5M) and Sportswear ($4.2M) also generate strong revenue.

* Lower down the list, categories like Shirts & Blouses (~$1.7M) still make solid contributions.

### Customer Insights:
#### Query: [customer_insights](/customer_insights.sql)
#### 1.Customer Segmentation
Assigned customers to High, Mid, and Low-value segments

![customer_segmentation](/Images/customer_segmentation.png)

Revenue Share by Segment (Pie Chart)

* High-Value customers (just ~53k people) generate 61% of all revenue.

* Mid-Value customers (106k people) contribute 35% of revenue.

* Low-Value customers (53k people) contribute only 4% of revenue.

Average Revenue per Customer (Bar Chart)

* High-Value: $529 per customer.

* Mid-Value: $154 per customer.

* Low-Value: just $33 per customer.

#### 2.Percentage of repeat vs one-time buyers
![%](/Images/Repeat_customers.png)

* Out of all customers, nearly 75% are repeat buyers, while 25% purchase only once.

* This suggests strong customer retention and loyalty, which is a positive signal for long-term growth.

### Returns & Retention:
#### Query: [return_and_retention](/return_and_retention.sql)
#### 1.Return vs Sales
![return](/Images/Return.png)

* Out of ~1.05M total transactions, only 5.3% are returns.

* This suggests that the majority of customers are satisfied with their purchases, and return rates are within a healthy range for fashion retail.

#### 2.Churn Analysis:
![churn](/Images/churn_analysis.png)

* 2023 Cohort: 47% Active vs 53% Churned.

* 2024 Cohort: 32% Active vs 68% Churned.


## Recommendation:

1.Insight: High-Value customers (only ~25% of total) generate >60% of total revenue.
Recommendation:

* Launch a VIP loyalty program (exclusive discounts, early access, personal styling).

* Offer targeted rewards to retain these top spenders and encourage repeat purchases.

2.Insight: Churn increased from 53% (2023) to 68% (2024) cohorts.
Recommendation:

* Implement a “welcome-back” campaign within 3–6 months of inactivity.

* Introduce personalized recommendations and loyalty points for early repeat purchases.

* Send automated “We miss you” or seasonal reactivation emails.

3.Insight: Sales are heavily concentrated in New York and Los Angeles (>50% of U.S. revenue).
Recommendation:

* Expand targeted ads and pop-ups in mid-tier cities (Chicago, Houston, Phoenix).

* Partner with local influencers or events to increase visibility in underserved regions.

4.Insight: Coats & Blazers, Pants & Jeans, and Suits lead both revenue and profit.
Recommendation:

* Prioritize these in inventory planning and marketing campaigns.

* Bundle profitable categories with slower-moving items to improve turnover.

* Feature these categories prominently in seasonal lookbooks and email marketing.

5.Insight: 25% of customers buy only once.
Recommendation:

* Introduce “Buy Again” reminders and second-purchase discounts.

* Offer free shipping or small rewards after 2nd purchase to increase retention.
















