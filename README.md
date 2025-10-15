## 🧠 Introduction 
Dive into grocery sales analytics! 🧾  
Using SQL, this project uncovers 🥇 top-performing stores, 💰 revenue insights, and 🛍️ customer spending patterns.  
From cleaning raw data to extracting key insights — every query tells a story of business performance and growth.
---
🔍 **Want to see the SQL queries?**  
👉 Check them out here: [project_sql folder](./project_sql)
---
## Background
Driven by a quest to understand grocery store performance and customer behavior, this project was created to uncover key trends in sales, revenue, and discounts.  
The goal is to transform raw transactional data into actionable insights, helping businesses identify top-performing stores, products, and promotional strategies.
#### The questions I wanted to answer through my SQL project queries were:
---
1.Which store-product combinations generate the highest average transaction value?
1a.**goal**:Identify the most valuable products and stores in terms of revenue per transaction.
2.How frequently do stores offer discounts, and which stores have the highest average discount?
2a:**goal**:Understand promotional strategies and their impact on sales.
3.Which products earn customers the most loyalty points?
3a:**goal**Identify products that drive engagement and repeat purchases through the loyalty program.
4.How diverse is the product range overall, and which aisles have the most variety?
4a:**goal**:Explore inventory variety to understand product distribution and category depth.
5.How do revenue and transaction metrics vary across store locations?
5a:**goal**:Determine top-performing stores and regional differences in sales.

## Tools I used
---
### 🛠 Tools I Used
For my deep dive into grocery store sales, I leveraged several key tools:
- 🗄 **SQL:** The backbone of my analysis, used to query the database, clean data, and extract actionable insights.
- 🐬 **MySQL:** The database management system where the grocery store data is stored and queried.
- 🌐 **Git & GitHub:** Essential for version control, sharing SQL scripts, and maintaining a professional project portfolio.
---
### The Analysis
Each SQL query in this project was designed to investigate specific aspects of grocery store performance. Here’s how I approached each question:

---

#### 1:Top 5 Average Transaction Values
To identify the highest-value transactions, I calculated the **average transaction amount per product in each store**.  
This query highlights **which store-product combinations generate the most revenue per transaction**, helping to understand where the business earns the most value.
```sql
SELECT 
    store_name,
    product_name,
    ROUND(AVG(final_amount), 2) AS avg_transaction_value
FROM grocery_store2
GROUP BY store_name, product_name
ORDER BY avg_transaction_value DESC
LIMIT 5;
```

**Key insights:**  
-The top 5 combinations show which products are most profitable.
-Stores with consistently high transaction values may benefit from targeted promotions or stocking strategies.

#### 2:Discount Penetration

```sql
SELECT 
    store_name,
    ROUND(AVG(discount_amount), 2) AS avg_discount,
    COUNT(CASE WHEN discount_amount > 0 THEN 1 END) AS discounted_sales,
    COUNT(*) AS total_sales,
    ROUND((COUNT(CASE WHEN discount_amount > 0 THEN 1 END) / COUNT(*)) * 100, 2) AS discount_penetration_rate
FROM grocery_store2
GROUP BY store_name
ORDER BY avg_discount DESC;
```
**Key insights:**
-Some stores consistently offer higher average discounts, suggesting aggressive promotion strategies.
-The discount penetration rate highlights which stores apply discounts most frequently, helping understand marketing tactics and sales impact.

#### 3:Customer Loyalty
```sql
SELECT 
    product_name,
    ROUND(AVG(loyalty_points), 2) AS avg_points,
    MIN(loyalty_points) AS min_points,
    MAX(loyalty_points) AS max_points
FROM grocery_store2
GROUP BY product_name
ORDER BY avg_points DESC;
```
**Key insights:**
-Products with higher average loyalty points are driving repeat purchases and customer engagement.
-Min and max points show consistency in loyalty rewards across products.
-This analysis helps identify which products to promote in loyalty programs.

#### 3:Product Diversity
```sql
SELECT COUNT(DISTINCT product_name) AS unique_products
FROM groGeographic Coveragecery_store2;
SELECT 
    aisle, 
    COUNT(DISTINCT product_name) AS num_products
FROM grocery_store2
GROUP BY aisle
ORDER BY num_products DESC;
```
**Key insights:**
-Total unique products show the overall variety available across stores.
-Aisles with more products indicate where customers have the most choice, guiding inventory planning and marketing.

#### 3:Geographic Coverage
```sql
SELECT COUNT(DISTINCT store_name) AS num_stores
FROM grocery_store2;
SELECT 
    store_name, 
    SUM(final_amount) AS total_sales
FROM grocery_store2
GROUP BY store_name
ORDER BY total_sales DESC;
SELECT 
    store_name, 
    ROUND(AVG(final_amount), 2) AS avg_transaction_value
FROM grocery_store2
GROUP BY store_name
ORDER BY avg_transaction_value DESC;
```
**Key insights:**
- Counting distinct stores shows the geographic spread of the business.
- Total sales per store highlight top-performing locations and revenue concentration
- Average transaction values per store indicate differences in customer spending behavior by location.

# WHAT I LEARNED
---

Throughout this project, I strengthened my SQL skills and gained hands-on experience in real-world data analysis:

🧩 Complex Query Crafting: Mastered advanced SQL techniques, including JOINs, CTEs (WITH clauses), and nested queries for efficient and readable data workflows.
📊 Data Aggregation: Leveraged GROUP BY with aggregate functions like COUNT(), AVG(), and SUM() to summarize and extract meaningful insights from large datasets.
💡 Analytical Problem-Solving: Translated business questions into actionable SQL queries, uncovering trends, patterns, and insights that drive decision-making.

# CONCLUSIONS
### Summarized insights:
**1.Top Transaction Values:** Certain store-product combinations generate the highest average revenue per transaction, highlighting which products are the most valuable for the busines
**2.Discount Strategies:** Some stores consistently offer higher average discounts or more frequent promotions, revealing differences in marketing tactics and customer engagement strategie
**3.Customer Loyalty**:Products with higher average loyalty points drive repeat purchases and stronger customer engagement, indicating which items incentivize loyalty the most.**
**4.Product Diversity**Some aisles or categories offer a wider variety of products, helping stores understand which sections attract more customer choice and may require focused inventory strategies.
**5.Geographic Performance:** Stores differ in total sales and average transaction value, showing which locations perform best and where regional spending patterns vary.




From the analysis of the grocery store dataset, several meaningful insights emerged:

*
