# GLOBAL FASHION DATA

## Project Overview

This project analyzes Global Fashion retail transactions using SQL Server. The goal is to uncover insights about sales performance, customer behavior, profitability, and retention that could guide business strategy.

## Dataset
https://www.kaggle.com/datasets/ricgomes/global-fashion-retail-stores-dataset?select=products.csv

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

## Dashboard
https://public.tableau.com/app/profile/ajo.jeen5964/viz/GlobalFashionRetail/SalesPerfomance

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
<img src="https://github.com/ajoalenjeen/GLOBAL-FASHION-DATA-ANALYSIS/blob/2b8c5cccc7a02cbe2aab2966d19bc53dbb35b28a/Images/Screenshot%202025-12-30%20202855.png" 
     alt="Top 20 Cities" 
     width="800">

Revenue has seasonal peaks in September–December, with December as the strongest month in 2024.

#### 2.Top 5 city in the USA that generates the most revenue
<img src="https://github.com/ajoalenjeen/GLOBAL-FASHION-DATA-ANALYSIS/blob/f6b4a6f243a4e4866b237806a7bc47c28b9039cd/Images/Screenshot%202025-12-30%20235322.png" 
     alt="Top 20 Cities" 
     width="800">


* New York ($9.42M) and Los Angeles ($9.08M) completely dominate revenue 

#### 3.Top 10 best-selling products by revenue
<img src="https://github.com/ajoalenjeen/GLOBAL-FASHION-DATA-ANALYSIS/blob/58502ccb7d11af0c825a011ea9d9c8f153fd9ad0/Images/Screenshot%202025-12-30%20193131.png" 
     alt="Top 20 Cities" 
     width="800">

* Coats and Blazers ($51.99M) and Pants and Jeans ($48.51M) are the top sellers.

### Customer Insights:
#### Query: [customer_insights](/customer_insights.sql)
#### 1.Customer Segmentation
Assigned customers to High, Mid, and Low-value segments

![customer_segmentation](https://github.com/ajoalenjeen/GLOBAL-FASHION-DATA-ANALYSIS/blob/7d284855411eb97f77ff59e760d079895172622f/Images/Screenshot%202025-12-30%20182058.png)

Revenue Share by Segment (Pie Chart)

* High-Value customers (just ~298k people) generate 80.85% of all revenue.

* Mid-Value customers (521k people) contribute 17.58% of revenue.

* Low-Value customers (183k people) contribute only 1.57% of revenue.

Average Revenue per Customer (Bar Chart)

* High-Value: $529 per customer.

* Mid-Value: $154 per customer.

* Low-Value: just $33 per customer.

#### 2.Percentage of repeat vs one-time buyers
![%](https://github.com/ajoalenjeen/GLOBAL-FASHION-DATA-ANALYSIS/blob/edd46ecc067b5d8ffd3f287c900bce24de6500ff/Images/Screenshot%202026-01-02%20150418.png)

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


































