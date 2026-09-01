-- AquaTech FP&A
-- Budget Variance Analysis
-- Purpose: Compare actual revenue against budget
-- and identify favorable/unfavorable performance.

SELECT
    fiscal_month,
    SUM(budget_revenue) AS budget_revenue,
    SUM(actual_revenue) AS actual_revenue,

    SUM(actual_revenue - budget_revenue) AS budget_variance,

    ROUND(
        (SUM(actual_revenue) - SUM(budget_revenue))
        / NULLIF(SUM(budget_revenue), 0) * 100,
        2
    ) AS budget_variance_pct,

    CASE
        WHEN SUM(actual_revenue) >= SUM(budget_revenue)
            THEN 'Favorable'
        ELSE 'Unfavorable'
    END AS variance_status

FROM vw_monthly_performance

GROUP BY fiscal_month
ORDER BY fiscal_month;
