# TASK-6_Sales_Trend_Analysis
## Sales Trend Analysis Using SQLite

## Project Overview
This project analyzes monthly revenue and order volume using SQL aggregation techniques. The goal is to identify sales trends, revenue patterns, and order distribution over time.

## Objective
- Calculate total monthly revenue
- Calculate monthly order volume
- Identify sales trends across different months

## Tools Used
- SQLite
- VS Code
- GitHub

## Dataset Description
Table Name: orders

Columns:
- order_id (INTEGER) – Unique identifier for each order
- order_date (TEXT) – Date when the order was placed
- amount (REAL) – Revenue generated from the order
- product_id (INTEGER) – Product identifier

## Key SQL Concepts Applied
- strftime() for extracting year and month
- SUM() for calculating total revenue
- COUNT(DISTINCT) for calculating order volume
- GROUP BY for monthly aggregation
- ORDER BY for sorting results
- LIMIT for restricting output

## Main Query Used

SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY year, month
ORDER BY year, month;

## Output
The query produces:
- Monthly total revenue
- Monthly total order volume

## Insights
- Helps identify high-performing months
- Detects seasonal sales trends
- Supports revenue growth analysis

## Author - Jayanth B
