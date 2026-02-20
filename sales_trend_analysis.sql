/* =====================================================
   TASK 6: Sales Trend Analysis Using Aggregations
   Tool: SQLite
   Objective: Analyze monthly revenue and order volume
===================================================== */

-------------------------------------------------------
-- STEP 1: Create Orders Table
-------------------------------------------------------
CREATE TABLE orders (
    order_id INTEGER,
    order_date TEXT,
    amount REAL,
    product_id INTEGER
);

-------------------------------------------------------
-- STEP 2: Insert Sample Data
-------------------------------------------------------
INSERT INTO orders VALUES
(1, '2023-01-05', 250.00, 101),
(2, '2023-01-15', 300.00, 102),
(3, '2023-02-10', 150.00, 103),
(4, '2023-02-20', 400.00, 104),
(5, '2023-03-05', 500.00, 105),
(6, '2023-03-18', 200.00, 106),
(7, '2023-04-02', 350.00, 107),
(8, '2023-04-25', 450.00, 108);

-------------------------------------------------------
-- STEP 3: View All Data
-------------------------------------------------------
SELECT * FROM orders;

-------------------------------------------------------
-- STEP 4: Extract Year and Month from order_date
-------------------------------------------------------
SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month
FROM orders;

-------------------------------------------------------
-- STEP 5: Monthly Revenue & Order Volume
-------------------------------------------------------
SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY year, month
ORDER BY year, month;

-------------------------------------------------------
-- STEP 6: Combine Year-Month into Single Column
-------------------------------------------------------
SELECT 
    strftime('%Y-%m', order_date) AS year_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY year_month
ORDER BY year_month;

-------------------------------------------------------
-- STEP 7: Filter for Specific Year (Example: 2023)
-------------------------------------------------------
SELECT 
    strftime('%Y-%m', order_date) AS year_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
WHERE strftime('%Y', order_date) = '2023'
GROUP BY year_month
ORDER BY year_month;

-------------------------------------------------------
-- STEP 8: Get Latest 3 Months Only
-------------------------------------------------------
SELECT 
    strftime('%Y-%m', order_date) AS year_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY year_month
ORDER BY year_month DESC
LIMIT 3;