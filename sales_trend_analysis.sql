CREATE DATABASE online_sales;
USE online_sales;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/online_sales_data_updated.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Query to check the first 10 rows of data
SELECT * FROM orders LIMIT 10;

-- Query to analyze the sales trend by month and year
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    orders
GROUP BY 
    year, month
ORDER BY 
    year, month;

-- Query to find the top 3 months with the highest revenue
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    orders
GROUP BY 
    year, month
ORDER BY 
    total_revenue DESC
LIMIT 3;
