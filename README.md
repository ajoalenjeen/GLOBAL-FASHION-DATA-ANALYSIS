# GLOBAL FASHION DATA

# Project Overview

Global Fashion represents a large-scale fashion retail operation spanning multiple regions and product categories. The dataset captures millions of transactional records across apparel segments such as outerwear, formalwear, sportswear, and casual clothing.

Despite strong overall sales performance, leadership seeks deeper insights into revenue drivers, customer behavior, retention, and returns to support data-driven decision-making in marketing, inventory planning, and customer engagement.

This project analyzes 2024 Global Fashion retail transaction data using SQL Server, Python, and Tableau to uncover actionable insights and strategic recommendations.

Insights and recommendations are provided across the following business dimensions:

* Sales Performance Analysis - Monthly revenue trends and seasonality patterns

* Top Cities & Product Performance - Identification of high-revenue cities and best-selling product categories

* Customer Insights & Segmentation - Revenue contribution by customer value tiers

* Retention & Repeat Behavior - Repeat vs one-time buyers and churn analysis

* Returns & Transaction Quality - Return rate evaluation to assess customer satisfaction

# Dataset

[here](https://www.kaggle.com/datasets/ricgomes/global-fashion-retail-stores-dataset?select=products.csv)

# Executive Summary:
## Overview of Findings:

This analysis examines 2024 fashion retail performance across sales, products, and customer behavior. Overall results indicate strong revenue growth, high customer retention, and clear concentration of value across specific products, regions, and customer segments. Seasonal demand and loyal customers are the primary drivers of performance, while early-stage churn and geographic concentration present opportunities for improvement.

<img src="https://github.com/ajoalenjeen/GLOBAL-FASHION-DATA-ANALYSIS/blob/257e5dbaf92fceccbda86de579e7525732949015/Images/Screenshot%202026-02-08%20172255.png" 
     alt="Top 20 Cities" 
     width="800">
     
Sales Performance Insights:

* Net Revenue reached $382.9M in 2024, reflecting a 25.6% year-over-year increase, driven by higher order volumes and seasonal demand.

* Total orders increased to 2.23M (+12.2%), while total quantity sold reached 3.47M units (+12.2%), indicating healthy demand growth rather than price inflation alone.

* Revenue follows a strong seasonal pattern, peaking in September–December, with December as the highest-performing month, supported by holiday shopping and promotional activity.

* Refund losses remain controlled at $22.7M (~6% of revenue), suggesting strong product-market fit and manageable return behavior.

* Sales are geographically concentrated, with China and the United States contributing the largest share of revenue, while several European markets show moderate but consistent growth.

Product Performance:

* Revenue is highly concentrated among a small set of categories:

  * Coats & Blazers ($52.0M)
 
  * Pants & Jeans ($48.5M)

  * Suits & Blazers ($40.0M)

* These categories consistently outperform others and show year-over-year growth between 22%–28%, making them the company’s strongest commercial drivers.

* Feminine and Masculine categories dominate overall revenue, while Children’s apparel contributes a smaller but fast-growing share.

* Discounted products account for ~28% of items sold, indicating that promotions play a meaningful role in driving volume without materially eroding overall revenue performance.

<img src="https://github.com/ajoalenjeen/GLOBAL-FASHION-DATA-ANALYSIS/blob/d49ec4deca067f2c8e1c01655ed2f8f1f6dc1b69/Images/Screenshot%202026-02-08%20120911.png" 
     alt="Top 20 Cities" 
     width="800">
     
Customer & Retention Insights:

* The customer base reached ~995K customers, with ~871K remaining active, resulting in a churn rate of 32.17%.

* Repeat customers account for 84.1% of total customers, highlighting strong loyalty and repeat purchasing behavior.

Revenue contribution is highly skewed:

* High-value customers generate 80.85% of revenue, despite representing a smaller share of the total customer base.

* Customer growth accelerates during year-end months, mirroring revenue trends and reinforcing the importance of seasonal acquisition and retention strategies.

# Recommendation:

1️⃣ Strengthen high-value customer retention through a VIP loyalty program with tier-based rewards, exclusive access, and early sales.

2️⃣ Reduce early-stage churn using 3–6 month re-engagement campaigns, personalized recommendations, and automated seasonal reminders.

3️⃣ Expand beyond core U.S. cities by increasing targeted marketing and partnerships in Chicago, Houston, and Phoenix.

4️⃣ Optimize the product portfolio by prioritizing top-revenue categories (Coats & Blazers, Pants & Jeans, Suits) and bundling them with slower-moving items.

5️⃣ Convert one-time buyers into repeat customers through second-purchase incentives, free shipping offers, and post-purchase follow-ups.

# Business Questions

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
<img src="https://github.com/ajoalenjeen/GLOBAL-FASHION-DATA-ANALYSIS/blob/edd46ecc067b5d8ffd3f287c900bce24de6500ff/Images/Screenshot%202026-01-02%20150418.png" 
     alt="Top 20 Cities" 
     width="400">

* Out of all customers, nearly 84.14% are repeat buyers, while 15.86% purchase only once.

* This suggests strong customer retention and loyalty, which is a positive signal for long-term growth.

### Returns & Retention:
#### Query: [return_and_retention](/return_and_retention.sql)
#### 1.Return vs Sales
<img src="https://github.com/ajoalenjeen/GLOBAL-FASHION-DATA-ANALYSIS/blob/133583e0dc74574e4616b8e0ec3ebbd71691ac1e/Images/Screenshot%202026-01-02%20161354.png" 
     alt="Top 20 Cities" 
     width="400">
     
* Out of ~2.12M total transactions in 2024, only 4.8% are returns.

* This suggests that the majority of customers are satisfied with their purchases, and return rates are within a healthy range for fashion retail.

#### 2.Churn Analysis:
<img src="https://github.com/ajoalenjeen/GLOBAL-FASHION-DATA-ANALYSIS/blob/e7381ed2a94eecba5735ecb40e2c43bf466b4858/Images/Screenshot%202026-01-02%20162018.png" 
     alt="Top 20 Cities" 
     width="400">

* 2024 Cohort: 32.17% Churn vs 67% Active.


## Recommendation:

1.Insight: High-Value customers (only ~25% of total) generate >60% of total revenue.
Recommendation:

* Launch a VIP loyalty program (exclusive discounts, early access, personal styling).

* Offer targeted rewards to retain these top spenders and encourage repeat purchases.

2.Insight: Churn is 32% in 2024 cohorts.
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

5.Insight: 16% of customers buy only once.
Recommendation:

* Introduce “Buy Again” reminders and second-purchase discounts.

* Offer free shipping or small rewards after 2nd purchase to increase retention.



















































