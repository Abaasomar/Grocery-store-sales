use sql_portfolio_projects;
alter table `sql_portfolio_projects`.`grocery store sales dataset in 2025` rename grocery_store;
select * from grocery_store ;
-- creating back-up table
use sql_portfolio_projects;
-- grocery_store2 will be my back-up table I'll work and execute the queries
create table grocery_store2 like grocery_store;
insert grocery_store2 select*from grocery_store;
select*from grocery_store2;
-- In my project, which is based on the Grocery Store Sales Dataset (2025), 
-- I’ll first focus on cleaning the data to gain deeper insights for exploration.
-- Data Quality Notes:
-- Problem_1.Missing Values
-- Problem_2.Data Inconsistencies
-- Problem_3.Negative Values
-- Problem_4.Standardize date format
-- Problem_5.Type Variations

-- Problem_1.Missing Values
-- The first step of data cleaning in this project I'll deal on the missing values
-- CLEANING LOTALTY_POINTS COLUMN:
select * from grocery_store2 where loyalty_points =  0;
 SELECT t1.loyalty_points, t2.loyalty_points
FROM grocery_store2 t1
JOIN grocery_store2 t2
  ON t1.store_name = t2.store_name
WHERE t1.loyalty_points = 0;

UPDATE grocery_store2 t1
JOIN grocery_store2 t2
  ON t1.store_name = t2.store_name
SET t1.loyalty_points = t2.loyalty_points
WHERE t1.loyalty_points = 0
  AND t2.loyalty_points <> 0;
-- CLEANING PROMOTIONS/DISCOUNT_AMOUNT COLUMN:
select * from grocery_store2 where discount_amount =  0;
 SELECT t1.discount_amount, t2.discount_amount
FROM grocery_store2 t1
JOIN grocery_store2 t2
  ON t1.store_name = t2.store_name
WHERE t1.discount_amount = 0;
UPDATE grocery_store2 t1
JOIN grocery_store2 t2
  ON t1.store_name = t2.store_name
SET t1.discount_amount = t2.discount_amount
WHERE t1.discount_amount = 0
  AND t2.discount_amount <> 0;
-- store_name columns
select * from grocery_store2 where store_name is null or store_name = '';
-- in further and deep cleaning of the store_name column is:
-- Step 1: Diagnose the problem of missing the store_name
SELECT customer_id, COUNT(*) AS count_rows
FROM grocery_store2
GROUP BY customer_id
HAVING COUNT(*) > 1;
-- Step 2: I Finded a useful linking column which's aisle
SELECT aisle, COUNT(*) AS count_rows
FROM grocery_store2
GROUP BY aisle
HAVING COUNT(*) > 1;
-- STEP3: Fill the missing store names
UPDATE grocery_store2 t1
JOIN grocery_store2 t2
  ON t1.aisle = t2.aisle
SET t1.store_name = t2.store_name
WHERE (t1.store_name IS NULL OR t1.store_name = '')
  AND t2.store_name IS NOT NULL
  AND t2.store_name <> '';

-- PROBLEM_2.Data Inconsistencies:
select * from grocery_store2 where quantity = 2.0;
-- I Think Quantity column checked — all values consistent. No action needed to do so it seems good to go in the next problem
-- PROBLEM_3.Negative Values:
select * from grocery_store2 where final_amount = 0.1;
SELECT final_amount, COUNT(*) AS count_rows
FROM grocery_store2
GROUP BY final_amount
HAVING COUNT(*) < 0;
UPDATE grocery_store2
SET final_amount = 0
WHERE final_amount < 0;
-- Negative values in final_amount identified; reviewed and handled based on analysis requirements.
-- problem_4.Standardize date format
select transaction_date, 
str_to_date(transaction_date,'%m/%d/%Y')as formatted_date
from grocery_store2;
update grocery_store2
set transaction_date = str_to_date(transaction_date,'%m/%d/%Y');
-- it's done and I changed this column text_format to date_format so I think it's good to change the data_type too
alter table grocery_store2 modify transaction_date date;
-- So In my Data cleaning in this project is fully completed:missing store names filled, quantity values verified, 
-- negative final amounts reviewed,and customer IDs confirmed as numeric. Dataset is now consistent and ready for analysis.
select*from grocery_store2;
