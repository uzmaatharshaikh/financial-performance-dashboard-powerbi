-- Query 1: Revenue by Country
SELECT
  Country,
  SUM(Sales) AS Total_Revenue,
  SUM(Profit) AS Total_Profit,
  ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Pct
FROM financials
GROUP BY Country
ORDER BY Total_Revenue DESC;


-- Query 2: Monthly P&L Summary
SELECT
  Month_Name,
  Month_Number,
  SUM(Sales) AS Revenue,
  SUM(COGS) AS Cost_of_Goods,
  SUM(Sales) - SUM(COGS) AS Gross_Profit,
  SUM(Profit) AS Net_Profit
FROM financials
GROUP BY Month_Name, Month_Number
ORDER BY Month_Number;


-- Query 3: Top Products by Profit
SELECT
  Product,
  Segment,
  SUM(Units_Sold) AS Total_Units,
  SUM(Sales) AS Total_Sales,
  SUM(Profit) AS Total_Profit
FROM financials
GROUP BY Product, Segment
ORDER BY Total_Profit DESC
LIMIT 10;


-- Query 4: Discount Impact Analysis
SELECT
  Discount_Band,
  COUNT(*) AS Transactions,
  SUM(Sales) AS Actual_Revenue,
  SUM(Gross_Sales) AS Pre_Discount_Revenue,
  SUM(Gross_Sales) - SUM(Sales) AS Discount_Amount,
  ROUND(AVG(Discounts), 2) AS Avg_Discount
FROM financials
GROUP BY Discount_Band
ORDER BY Discount_Amount DESC;
