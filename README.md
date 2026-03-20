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


An Interactive Tableau Dashboard can be seen [here](https://public.tableau.com/app/profile/ajo.jeen5964/viz/GlobalFashionRetail/SalesPerfomance)

The SQL queries for Data Cleaning [here](/data_cleaning.sql)

The SQL queries for Creating View [here](/create_view.sql)

The SQL queries for Sales Performance [here](/sales_performance.sql)

The SQL queries for Customer Insights [here](/customer_insights.sql)

The SQL queries for Return and Retention [here](/return_and_retention.sql)

Dataset Link [here](https://www.kaggle.com/datasets/ricgomes/global-fashion-retail-stores-dataset?select=products.csv)

# ER Diagram:
<img src="https://github.com/ajoalenjeen/GLOBAL-FASHION-DATA-ANALYSIS/blob/af2320c1b0e3a724eade04ac24944d9563b2382e/Images/Screenshot%202026-03-20%20011111.png" 
     alt="Top 20 Cities" 
     width="1000">

# Executive Summary:
## Overview of Findings:

This analysis examines 2024 fashion retail performance across sales, products, and customer behavior. Overall results indicate strong revenue growth, high customer retention, and clear concentration of value across specific products, regions, and customer segments. Seasonal demand and loyal customers are the primary drivers of performance, while early-stage churn and geographic concentration present opportunities for improvement.

<img src="https://github.com/ajoalenjeen/GLOBAL-FASHION-DATA-ANALYSIS/blob/257e5dbaf92fceccbda86de579e7525732949015/Images/Screenshot%202026-02-08%20172255.png" 
     alt="Top 20 Cities" 
     width="1000">
     
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

<img src="https://github.com/ajoalenjeen/GLOBAL-FASHION-DATA-ANALYSIS/blob/57c71952b79f7e3d8cd95f077b74e19821149bec/Images/Screenshot%202026-02-09%20142054.png" 
     alt="Top 20 Cities" 
     width="1000">
     
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
































































