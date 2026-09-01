-- AquaTech Enterprise FP&A Command Center
-- 05 - Forecast & Scenario Analysis
-- Purpose: Analyze forecast performance and compare
-- Base, Upside, and Downside scenarios.

-- =====================================================
-- 1. Monthly Forecast Performance
-- =====================================================

SELECT
    forecast_month,
    scenario,
    forecast_revenue,
    growth_rate
FROM forecast_revenue
ORDER BY
    forecast_month,
    scenario;


-- =====================================================
-- 2. Scenario Revenue Comparison
-- =====================================================

SELECT
    scenario,
    SUM(forecast_revenue) AS total_forecast_revenue,
    ROUND(AVG(growth_rate) * 100, 2) AS average_growth_rate_pct
FROM forecast_revenue
GROUP BY scenario
ORDER BY total_forecast_revenue DESC;


-- =====================================================
-- 3. Base Case vs Downside vs Upside
-- =====================================================

SELECT
    forecast_month,

    MAX(
        CASE
            WHEN scenario = 'Base Case'
            THEN forecast_revenue
        END
    ) AS base_case_revenue,

    MAX(
        CASE
            WHEN scenario = 'Upside'
            THEN forecast_revenue
        END
    ) AS upside_revenue,

    MAX(
        CASE
            WHEN scenario = 'Downside'
            THEN forecast_revenue
        END
    ) AS downside_revenue

FROM forecast_revenue

GROUP BY forecast_month
ORDER BY forecast_month;
