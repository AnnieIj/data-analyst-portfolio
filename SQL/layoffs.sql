-- Sales_Analysis.sql
-- Comprehensive Sales Analysis Queries

-- 1. Total revenue and total quantity sold by region
SELECT 
    Region, 
    SUM(Sales) AS Total_Revenue, 
    SUM(Quantity) AS Total_Quantity
FROM sales_data
GROUP BY Region
ORDER BY Total_Revenue DESC;

-- 2. Top 5 best-selling products
SELECT 
    Product, 
    SUM(Quantity) AS Total_Quantity_Sold, 
    SUM(Sales) AS Total_Revenue
FROM sales_data
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC
LIMIT 5;

-- 3. Monthly sales trends for each category
SELECT
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    Category,
    SUM(Sales) AS Total_Revenue,
    SUM(Quantity) AS Total_Quantity
FROM sales_data
GROUP BY Month, Category
ORDER BY Month ASC, Category ASC;

-- 4. Average order value by region
SELECT 
    Region, 
    AVG(Sales/Quantity) AS Avg_Order_Value
FROM sales_data
GROUP BY Region
ORDER BY Avg_Order_Value DESC;

-- 5. Percentage contribution of each region to total revenue
SELECT 
    Region,
    SUM(Sales) AS Region_Revenue,
    ROUND(SUM(Sales)/ (SELECT SUM(Sales) FROM sales_data) * 100, 2) AS Revenue_Percentage
FROM sales_data
GROUP BY Region
ORDER BY Revenue_Percentage DESC;
