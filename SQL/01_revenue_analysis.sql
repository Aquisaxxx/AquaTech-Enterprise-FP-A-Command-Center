-- AquaTech Enterprise FP&A Command Center
-- 01 - Revenue Analysis
-- Purpose: Analyze revenue performance by month, product, and region.

-- =========================================================
-- 1. Monthly Revenue Performance
-- =========================================================

SELECT
    month,
    SUM(revenue) AS total_revenue,
    SUM(units) AS total_units,
    AVG(average_price) AS avg_price
FROM fact_sales
GROUP BY month
ORDER BY
    CASE month
        WHEN 'Jan' THEN 1
        WHEN 'Feb' THEN 2
        WHEN 'Mar' THEN 3
        WHEN 'Apr' THEN 4
        WHEN 'May' THEN 5
        WHEN 'Jun' THEN 6
        WHEN 'Jul' THEN 7
        WHEN 'Aug' THEN 8
        WHEN 'Sep' THEN 9
        WHEN 'Oct' THEN 10
        WHEN 'Nov' THEN 11
        WHEN 'Dec' THEN 12
    END;


-- =========================================================
-- 2. Revenue by Product
-- =========================================================

SELECT
    product,
    SUM(revenue) AS total_revenue,
    SUM(units) AS total_units,
    AVG(average_price) AS avg_price
FROM fact_sales
GROUP BY product
ORDER BY total_revenue DESC;


-- =========================================================
-- 3. Revenue by Region
-- =========================================================

SELECT
    region,
    SUM(revenue) AS total_revenue,
    SUM(units) AS total_units
FROM fact_sales
GROUP BY region
ORDER BY total_revenue DESC;


-- =========================================================
-- 4. Monthly Revenue by Product
-- =========================================================

SELECT
    month,
    product,
    SUM(revenue) AS total_revenue
FROM fact_sales
GROUP BY month, product
ORDER BY
    CASE month
        WHEN 'Jan' THEN 1
        WHEN 'Feb' THEN 2
        WHEN 'Mar' THEN 3
        WHEN 'Apr' THEN 4
        WHEN 'May' THEN 5
        WHEN 'Jun' THEN 6
        WHEN 'Jul' THEN 7
        WHEN 'Aug' THEN 8
        WHEN 'Sep' THEN 9
        WHEN 'Oct' THEN 10
        WHEN 'Nov' THEN 11
        WHEN 'Dec' THEN 12
    END,
    total_revenue DESC;


-- =========================================================
-- 5. Revenue per Customer
-- =========================================================

SELECT
    month,
    region,
    product,
    SUM(revenue) / NULLIF(SUM(total_customers), 0)
        AS revenue_per_customer
FROM fact_sales
GROUP BY month, region, product
ORDER BY month, revenue_per_customer DESC;
