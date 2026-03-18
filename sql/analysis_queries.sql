-- ==========================
-- E-commerce SQL Analysis
-- ==========================


-- 1️⃣ Revenue by Country

SELECT 
    country,
    ROUND(SUM(quantity::numeric * unit_price::numeric),2) AS revenue
FROM retail
GROUP BY country
ORDER BY revenue DESC;



-- 2️⃣ Top Products by Revenue

SELECT 
    description,
    ROUND(SUM(quantity::numeric * unit_price::numeric),2) AS revenue
FROM retail
GROUP BY description
ORDER BY revenue DESC
LIMIT 10;



-- 3️⃣ Monthly Revenue Trend

SELECT
    DATE_TRUNC('month', invoice_date::timestamp) AS month,
    ROUND(SUM(quantity::numeric * unit_price::numeric),2) AS revenue
FROM retail
GROUP BY month
ORDER BY month;



-- 4️⃣ Top Customers

SELECT
    customer_id,
    ROUND(SUM(quantity::numeric * unit_price::numeric),2) AS revenue
FROM retail
WHERE customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY revenue DESC
LIMIT 10;