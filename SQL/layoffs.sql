-- Sales Analysis Queries
-- Total revenue by region
SELECT Region, SUM(Sales) AS Total_Revenue
FROM sales_data
GROUP BY Region
ORDER BY Total_Revenue DESC;
