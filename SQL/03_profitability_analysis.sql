-- AquaTech Enterprise FP&A Command Center
-- 03 - Profitability Analysis
-- Purpose: Analyze revenue, COGS, operating expenses,
-- gross profit, and operating profit.

-- =====================================================
-- 1. Monthly Profitability Performance
-- =====================================================

SELECT
    month,
    SUM(revenue) AS total_revenue,
    SUM(cogs) AS total_cogs,
    SUM(gross_profit) AS gross_profit,
    SUM(opex) AS operating_expenses,
    SUM(operating_profit) AS operating_profit,

    ROUND(
        SUM(gross_profit) / NULLIF(SUM(revenue), 0) * 100,
        2
    ) AS gross_margin_pct,

    ROUND(
        SUM(operating_profit) / NULLIF(SUM(revenue), 0) * 100,
        2
    ) AS operating_margin_pct

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
-- 2. Profitability by Product
-- =====================================================

SELECT
    product,
    SUM(revenue) AS total_revenue,
    SUM(cogs) AS total_cogs,
    SUM(gross_profit) AS gross_profit,
    SUM(operating_profit) AS operating_profit,

    ROUND(
        SUM(gross_profit) / NULLIF(SUM(revenue), 0) * 100,
        2
    ) AS gross_margin_pct

FROM fact_sales

GROUP BY product

ORDER BY gross_profit DESC;


-- =====================================================
-- 3. Profitability by Region
-- =====================================================

SELECT
    region,
    SUM(revenue) AS total_revenue,
    SUM(cogs) AS total_cogs,
    SUM(opex) AS operating_expenses,
    SUM(gross_profit) AS gross_profit,
    SUM(operating_profit) AS operating_profit,

    ROUND(
        SUM(operating_profit) / NULLIF(SUM(revenue), 0) * 100,
        2
    ) AS operating_margin_pct

FROM fact_sales

GROUP BY region

ORDER BY operating_profit DESC;
