USE grocery_project;

-- =====================================================
-- GROCERY SALES DATA - COMPLETE SQL ANALYSIS
-- =====================================================


-- 1. CHECK TOTAL NUMBER OF RECORDS
SELECT COUNT(*) AS Total_Records
FROM grocery_sales;


-- 2. VIEW ALL DATA
SELECT *
FROM grocery_sales;


-- 3. TOTAL SALES
SELECT 
    SUM(`Total Amount`) AS Total_Sales
FROM grocery_sales;


-- 4. TOTAL QUANTITY SOLD
SELECT 
    SUM(Quantity) AS Total_Quantity
FROM grocery_sales;


-- 5. TOTAL DISCOUNT
SELECT 
    SUM(`Discount Amount`) AS Total_Discount
FROM grocery_sales;


-- 6. TOTAL FINAL AMOUNT
SELECT 
    SUM(`Final Amount`) AS Total_Final_Amount
FROM grocery_sales;


-- 7. AVERAGE ORDER VALUE
SELECT 
    AVG(`Final Amount`) AS Average_Order_Value
FROM grocery_sales;


-- 8. AVERAGE QUANTITY PER TRANSACTION
SELECT 
    AVG(Quantity) AS Average_Quantity_Per_Transaction
FROM grocery_sales;


-- 9. OVERALL DISCOUNT RATE
SELECT 
    (SUM(`Discount Amount`) / SUM(`Total Amount`)) * 100 
    AS Overall_Discount_Rate
FROM grocery_sales;


-- =====================================================
-- STORE-WISE ANALYSIS
-- =====================================================


-- 10. STORE-WISE SALES
SELECT 
    StoreName,
    SUM(`Final Amount`) AS Total_Sales
FROM grocery_sales
GROUP BY StoreName
ORDER BY Total_Sales DESC;


-- 11. STORE-WISE QUANTITY SOLD
SELECT 
    StoreName,
    SUM(Quantity) AS Total_Quantity
FROM grocery_sales
GROUP BY StoreName
ORDER BY Total_Quantity DESC;


-- 12. STORE-WISE AVERAGE ORDER VALUE
SELECT 
    StoreName,
    AVG(`Final Amount`) AS Average_Order_Value
FROM grocery_sales
GROUP BY StoreName
ORDER BY Average_Order_Value DESC;


-- 13. STORE-WISE DISCOUNT
SELECT 
    StoreName,
    SUM(`Discount Amount`) AS Total_Discount
FROM grocery_sales
GROUP BY StoreName
ORDER BY Total_Discount DESC;


-- =====================================================
-- AISLE-WISE ANALYSIS
-- =====================================================


-- 14. AISLE-WISE SALES
SELECT 
    Aisle,
    SUM(`Final Amount`) AS Total_Sales
FROM grocery_sales
GROUP BY Aisle
ORDER BY Total_Sales DESC;


-- 15. AISLE-WISE QUANTITY
SELECT 
    Aisle,
    SUM(Quantity) AS Total_Quantity
FROM grocery_sales
GROUP BY Aisle
ORDER BY Total_Quantity DESC;


-- 16. AISLE-WISE AVERAGE ORDER VALUE
SELECT 
    Aisle,
    AVG(`Final Amount`) AS Average_Order_Value
FROM grocery_sales
GROUP BY Aisle
ORDER BY Average_Order_Value DESC;


-- =====================================================
-- PRODUCT ANALYSIS
-- =====================================================


-- 17. PRODUCT-WISE SALES
SELECT 
    `Product Name`,
    SUM(`Final Amount`) AS Total_Sales
FROM grocery_sales
GROUP BY `Product Name`
ORDER BY Total_Sales DESC;


-- 18. TOP 10 PRODUCTS BY SALES
SELECT 
    `Product Name`,
    SUM(`Final Amount`) AS Total_Sales
FROM grocery_sales
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;


-- 19. PRODUCT-WISE QUANTITY SOLD
SELECT 
    `Product Name`,
    SUM(Quantity) AS Total_Quantity
FROM grocery_sales
GROUP BY `Product Name`
ORDER BY Total_Quantity DESC;


-- 20. TOP 10 PRODUCTS BY QUANTITY
SELECT 
    `Product Name`,
    SUM(Quantity) AS Total_Quantity
FROM grocery_sales
GROUP BY `Product Name`
ORDER BY Total_Quantity DESC
LIMIT 10;


-- =====================================================
-- CUSTOMER ANALYSIS
-- =====================================================


-- 21. CUSTOMER-WISE SALES
SELECT 
    `Customer ID`,
    SUM(`Final Amount`) AS Total_Spending
FROM grocery_sales
GROUP BY `Customer ID`
ORDER BY Total_Spending DESC;


-- 22. TOP 10 CUSTOMERS BY SPENDING
SELECT 
    `Customer ID`,
    SUM(`Final Amount`) AS Total_Spending
FROM grocery_sales
GROUP BY `Customer ID`
ORDER BY Total_Spending DESC
LIMIT 10;


-- 23. CUSTOMER-WISE TRANSACTION COUNT
SELECT 
    `Customer ID`,
    COUNT(*) AS Number_of_Transactions
FROM grocery_sales
GROUP BY `Customer ID`
ORDER BY Number_of_Transactions DESC;


-- =====================================================
-- MONTHLY ANALYSIS
-- =====================================================


-- 24. MONTH-WISE SALES
SELECT 
    MONTH(`Transaction Date`) AS Month_Number,
    MONTHNAME(`Transaction Date`) AS Month_Name,
    SUM(`Final Amount`) AS Total_Sales
FROM grocery_sales
GROUP BY 
    MONTH(`Transaction Date`),
    MONTHNAME(`Transaction Date`)
ORDER BY Month_Number;


-- 25. MONTH-WISE QUANTITY
SELECT 
    MONTH(`Transaction Date`) AS Month_Number,
    MONTHNAME(`Transaction Date`) AS Month_Name,
    SUM(Quantity) AS Total_Quantity
FROM grocery_sales
GROUP BY 
    MONTH(`Transaction Date`),
    MONTHNAME(`Transaction Date`)
ORDER BY Month_Number;


-- 26. MONTH-WISE DISCOUNT
SELECT 
    MONTH(`Transaction Date`) AS Month_Number,
    MONTHNAME(`Transaction Date`) AS Month_Name,
    SUM(`Discount Amount`) AS Total_Discount
FROM grocery_sales
GROUP BY 
    MONTH(`Transaction Date`),
    MONTHNAME(`Transaction Date`)
ORDER BY Month_Number;


-- =====================================================
-- DATE ANALYSIS
-- =====================================================


-- 27. DAILY SALES
SELECT 
    `Transaction Date`,
    SUM(`Final Amount`) AS Daily_Sales
FROM grocery_sales
GROUP BY `Transaction Date`
ORDER BY `Transaction Date`;


-- 28. HIGHEST SALES DAY
SELECT 
    `Transaction Date`,
    SUM(`Final Amount`) AS Daily_Sales
FROM grocery_sales
GROUP BY `Transaction Date`
ORDER BY Daily_Sales DESC
LIMIT 1;


-- =====================================================
-- PRICE ANALYSIS
-- =====================================================


-- 29. AVERAGE UNIT PRICE
SELECT 
    AVG(`Unit Price`) AS Average_Unit_Price
FROM grocery_sales;


-- 30. HIGHEST UNIT PRICE
SELECT 
    MAX(`Unit Price`) AS Highest_Unit_Price
FROM grocery_sales;


-- 31. LOWEST UNIT PRICE
SELECT 
    MIN(`Unit Price`) AS Lowest_Unit_Price
FROM grocery_sales;


-- =====================================================
-- LOYALTY ANALYSIS
-- =====================================================


-- 32. TOTAL LOYALTY POINTS
SELECT 
    SUM(`Loyalty Points`) AS Total_Loyalty_Points
FROM grocery_sales;


-- 33. AVERAGE LOYALTY POINTS
SELECT 
    AVG(`Loyalty Points`) AS Average_Loyalty_Points
FROM grocery_sales;


-- 34. CUSTOMER-WISE LOYALTY POINTS
SELECT 
    `Customer ID`,
    SUM(`Loyalty Points`) AS Total_Loyalty_Points
FROM grocery_sales
GROUP BY `Customer ID`
ORDER BY Total_Loyalty_Points DESC;


-- =====================================================
-- TOP PERFORMING STORE
-- =====================================================

-- 35. TOP STORE BY SALES
SELECT 
    StoreName,
    SUM(`Final Amount`) AS Total_Sales
FROM grocery_sales
GROUP BY StoreName
ORDER BY Total_Sales DESC
LIMIT 1;


-- =====================================================
-- TOP PERFORMING AISLE
-- =====================================================

-- 36. TOP AISLE BY SALES
SELECT 
    Aisle,
    SUM(`Final Amount`) AS Total_Sales
FROM grocery_sales
GROUP BY Aisle
ORDER BY Total_Sales DESC
LIMIT 1;


-- =====================================================
-- TOP CUSTOMER
-- =====================================================

-- 37. TOP CUSTOMER BY SPENDING
SELECT 
    `Customer ID`,
    SUM(`Final Amount`) AS Total_Spending
FROM grocery_sales
GROUP BY `Customer ID`
ORDER BY Total_Spending DESC
LIMIT 1;


-- =====================================================
-- TOP PRODUCT
-- =====================================================

-- 38. TOP PRODUCT BY SALES
SELECT 
    `Product Name`,
    SUM(`Final Amount`) AS Total_Sales
FROM grocery_sales
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 1;


-- =====================================================
-- FINAL BUSINESS SUMMARY
-- =====================================================

-- 39. OVERALL BUSINESS SUMMARY
SELECT
    COUNT(*) AS Total_Transactions,
    SUM(Quantity) AS Total_Quantity,
    SUM(`Total Amount`) AS Total_Sales,
    SUM(`Discount Amount`) AS Total_Discount,
    SUM(`Final Amount`) AS Total_Final_Amount,
    AVG(`Final Amount`) AS Average_Order_Value
FROM grocery_sales;
