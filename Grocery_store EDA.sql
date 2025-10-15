-- ====================================================================
-- 📊 SQL PORTFOLIO PROJECT: Grocery Stores Analysis
-- Author: [Osama omar]
-- Purpose: Explore grocery_store2 dataset for transaction trends, discounts,
--          customer loyalty, product diversity, and geographic coverage
-- Tools: MySQL / SQL Workbench
-- ====================================================================

USE sql_portfolio_projects;

-- View all available data
SELECT * FROM grocery_store2;

-- Idea 1:Top 5 Average Transaction Values
-- Goal: Identify stores and products generating the highest revenue per transaction.
-- Skills: GROUP BY, AVG, ROUND, ORDER BY, LIMIT
-- Insight: Shows which product-store combinations are most valuable on average.
SELECT 
    store_name,
    product_name,
    ROUND(AVG(final_amount), 2) AS avg_transaction_value
FROM grocery_store2
GROUP BY store_name, product_name
ORDER BY avg_transaction_value DESC
LIMIT 5;

--  Idea 2: Discount Penetration
-- Goal: Understand store discount strategies and promotional effectiveness.
-- Metrics:
-- 1. avg_discount: average discount per transaction
-- 2. discounted_sales: number of transactions with a discount
-- 3. total_sales: total transactions
-- 4. discount_penetration_rate: % of transactions with a discount
-- Skills: GROUP BY, CASE, COUNT, AVG, ROUND
-- Insight: Highlights stores with aggressive discounts or frequent promotions.
SELECT 
    store_name,
    ROUND(AVG(discount_amount), 2) AS avg_discount,
    COUNT(CASE WHEN discount_amount > 0 THEN 1 END) AS discounted_sales,
    COUNT(*) AS total_sales,
    ROUND((COUNT(CASE WHEN discount_amount > 0 THEN 1 END) / COUNT(*)) * 100, 2) AS discount_penetration_rate
FROM grocery_store2
GROUP BY store_name
ORDER BY avg_discount DESC;

-- Idea 3: Customer Loyalty
-- --------------------------------------------------------------------
-- Goal: Identify which products contribute most to customer engagement.
-- Metrics:
-- 1. avg_points: average loyalty points earned per transaction
-- 2. min_points: minimum points earned
-- 3. max_points: maximum points earned
-- Skills: GROUP BY, AVG, MIN, MAX, ROUND
-- Insight: Shows products that incentivize customer loyalty the most.
SELECT 
    product_name,
    ROUND(AVG(loyalty_points), 2) AS avg_points,
    MIN(loyalty_points) AS min_points,
    MAX(loyalty_points) AS max_points
FROM grocery_store2
GROUP BY product_name
ORDER BY avg_points DESC;
-- Question 4: Product Diversity
-- --------------------------------------------------------------------
-- Goal: Explore variety of products overall and per aisle.
-- Skills: COUNT(DISTINCT), GROUP BY, ORDER BY
-- Insight: Identifies which aisles/categories have the most product options.
-- 4.1 Total unique products
SELECT COUNT(DISTINCT product_name) AS unique_products
FROM grocery_store2;

-- 4.2 Unique products per aisle
SELECT 
    aisle, 
    COUNT(DISTINCT product_name) AS num_products
FROM grocery_store2
GROUP BY aisle
ORDER BY num_products DESC;

-- 💡 Question 5: Geographic Coverage
-- --------------------------------------------------------------------
-- Goal: Analyze stores by location to understand revenue distribution and customer spending.
-- Skills: COUNT(DISTINCT), SUM, AVG, GROUP BY, ROUND, ORDER BY
-- Insight: Highlights top-performing locations and regional differences.
-- 5.1 Count of stores
SELECT COUNT(DISTINCT store_name) AS num_stores
FROM grocery_store2;

-- 5.2 Total sales per store
SELECT 
    store_name, 
    SUM(final_amount) AS total_sales
FROM grocery_store2
GROUP BY store_name
ORDER BY total_sales DESC;

-- 5.3 Average transaction value per store
SELECT 
    store_name, 
    ROUND(AVG(final_amount), 2) AS avg_transaction_value
FROM grocery_store2
GROUP BY store_name
ORDER BY avg_transaction_value DESC;
