-- AquaTech Enterprise FP&A Command Center
-- 04 - Customer Analysis
-- Purpose: Analyze customer growth, recurring customers,
-- revenue per customer, and recurring customer rate.

-- =====================================================
-- 1. Monthly Customer Performance
-- =====================================================

SELECT
    month,
    SUM(new_customers) AS new_customers,
    SUM(recurring_customers) AS recurring_customers,
    SUM(total_customers) AS total_customers,

    ROUND(
        SUM(revenue) / NULLIF(SUM(total_customers), 0),
        2
    ) AS revenue_per_customer,

    ROUND(
        SUM(recurring_customers)
        / NULLIF(SUM(total_customers), 0) * 100,
        2
    ) AS recurring_customer_rate_pct

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


-- =====================================================
-- 2. Customer Performance by Region
-- =====================================================

SELECT
    region,
    SUM(new_customers) AS new_customers,
    SUM(recurring_customers) AS recurring_customers,
    SUM(total_customers) AS total_customers,

    ROUND(
        SUM(revenue) / NULLIF(SUM(total_customers), 0),
        2
    ) AS revenue_per_customer,

    ROUND(
        SUM(recurring_customers)
        / NULLIF(SUM(total_customers), 0) * 100,
        2
    ) AS recurring_customer_rate_pct

FROM fact_sales

GROUP BY region

ORDER BY total_customers DESC;


-- =====================================================
-- 3. Customer Performance by Product
-- =====================================================

SELECT
    product,
    SUM(new_customers) AS new_customers,
    SUM(recurring_customers) AS recurring_customers,
    SUM(total_customers) AS total_customers,

    ROUND(
        SUM(revenue) / NULLIF(SUM(total_customers), 0),
        2
    ) AS revenue_per_customer,

    ROUND(
        SUM(recurring_customers)
        / NULLIF(SUM(total_customers), 0) * 100,
        2
    ) AS recurring_customer_rate_pct

FROM fact_sales

GROUP BY product

ORDER BY revenue_per_customer DESC;
