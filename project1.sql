create database sales360;
use sales360;
CREATE TABLE sales_data (
	Row_ID varchar(20),
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(200),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Superstore_Cleaneddate.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Row_ID, Order_ID, Order_Date, Ship_Date, Ship_Mode, Customer_ID, Customer_Name, Segment, Country, City, State, Postal_Code, Region, Product_ID, Category, Sub_Category, Product_Name, Sales, Quantity, Discount, Profit);
show warnings;
ALTER TABLE sales_data
MODIFY COLUMN Sales DECIMAL(12,4),
MODIFY COLUMN Profit DECIMAL(12,4);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Superstore_Cleaneddate.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Row_ID, Order_ID, Order_Date, Ship_Date, Ship_Mode, Customer_ID, Customer_Name, Segment, Country, City, State, Postal_Code, Region, Product_ID, Category, Sub_Category, Product_Name, Sales, Quantity, Discount, Profit);
SELECT * FROM sales_data LIMIT 10;
SELECT COUNT(*) AS total_rows, 
       SUM(Sales) AS total_sales, 
       SUM(Profit) AS total_profit 
FROM sales_data;
SELECT * FROM sales_data 
WHERE Profit < 0 
LIMIT 10;

SELECT COUNT(*) AS total_rows FROM sales_data;
SELECT * FROM sales_data LIMIT 10;
DESCRIBE sales_data;
-- Total Sales and Profit
SELECT 
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(Discount), 2) AS average_discount
FROM sales_data;
SELECT ROUND(AVG(Sales), 2) AS avg_sales_per_order FROM sales_data;

SELECT COUNT(*) AS total_rows FROM sales_data;
SELECT * FROM sales_data LIMIT 10;
DESCRIBE sales_data;
-- Total Sales and Profit
SELECT 
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(Discount), 2) AS average_discount
FROM sales_data;
SELECT ROUND(AVG(Sales), 2) AS avg_sales_per_order FROM sales_data;
SELECT 
    Product_Name,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales_data
GROUP BY Product_Name
ORDER BY total_sales DESC
LIMIT 10;
SELECT 
    Product_Name,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales_data
GROUP BY Product_Name
ORDER BY total_profit DESC
LIMIT 10;
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales_data
GROUP BY Region
ORDER BY total_sales DESC;

    SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS month,
    ROUND(SUM(Sales), 2) AS monthly_sales
FROM sales_data
GROUP BY month
ORDER BY month;
SELECT 
    Segment,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales_data
GROUP BY Segment;

SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales_data
GROUP BY Category
ORDER BY total_sales DESC;
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Month
ORDER BY Month;
SELECT 
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Discount) AS Avg_Discount
FROM sales_data
GROUP BY Segment
ORDER BY Total_Profit DESC;
SELECT 
    Product_Name,
    SUM(Profit) AS Total_Profit,
    COUNT(*) AS Order_Count
FROM sales_data
GROUP BY Product_Name
HAVING Total_Profit < 0
ORDER BY Total_Profit ASC
LIMIT 10;
SELECT 
    City,
    State,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY City, State
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT 
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(*) AS Transactions
FROM sales_data
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT 
    DATEDIFF(Ship_Date, Order_Date) AS Shipping_Days,
    COUNT(*) AS Orders
FROM sales_data
GROUP BY Shipping_Days
ORDER BY Shipping_Days;

SELECT 
    ROUND(Discount, 2) AS Discount_Level,
    AVG(Profit) AS Avg_Profit
FROM sales_data
GROUP BY Discount_Level
ORDER BY Discount_Level;
SELECT 
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT 
    Product_Name,
    AVG(Discount) AS Avg_Discount,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Product_Name
HAVING Avg_Discount > 0.2 AND Total_Profit > 0
ORDER BY Total_Profit DESC
LIMIT 10;

