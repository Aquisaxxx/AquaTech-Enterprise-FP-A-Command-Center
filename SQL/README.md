# AquaTech FP&A — SQL Analysis

## Overview

This section documents the SQL analysis performed for the AquaTech Enterprise FP&A Command Center.

SQL was used to validate financial data, analyze revenue performance, compare actuals against budget, identify variance drivers, and support downstream Excel and Power BI reporting.

## Databases

- PostgreSQL
- Oracle SQL

## Business Questions

The SQL analysis focused on:

- How is actual revenue performing against budget?
- Which months have favorable or unfavorable revenue variance?
- What are the major revenue and cost trends?
- How do COGS and operating expenses impact profitability?
- Which products and regions contribute most to revenue?
- What customer and pricing metrics influence revenue performance?

## Key SQL Analysis

### 1. Actual vs Budget Revenue

Compared monthly actual revenue with budget revenue to identify performance gaps.

### 2. Revenue Variance Analysis

Calculated:

- Budget Variance
- Budget Variance %
- Favorable vs Unfavorable performance

### 3. Revenue by Product

Analyzed revenue contribution across:

- AquaCore
- AquaAI
- AquaSecure

### 4. Revenue by Region

Evaluated revenue performance across:

- East
- West
- South
- North

### 5. Profitability Analysis

Analyzed:

- Revenue
- COGS
- Gross Profit
- Gross Margin
- Operating Expenses
- Operating Profit
- Operating Margin

### 6. Customer Analysis

Used customer-level metrics to evaluate:

- New Customers
- Recurring Customers
- Total Customers
- Revenue per Customer
- Recurring Customer Rate

## SQL Techniques Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- CASE WHEN
- Aggregate Functions
- JOINs
- Common Table Expressions (CTEs)
- Subqueries
- Window Functions
- Date-based analysis
- Variance calculations

## Example Business Insight

Monthly revenue performance was below budget during the earlier months of the period, while performance improved during the later months.

SQL analysis helped identify these monthly trends and provided the foundation for the Excel financial model and Power BI executive dashboards.

## Workflow

PostgreSQL / Oracle SQL  
↓  
Data Validation & Analysis  
↓  
Excel Financial Model  
↓  
Power BI Data Model  
↓  
Executive FP&A Dashboards  
↓  
Business Insights & Decision Support

## Related Project

This SQL analysis is part of the larger:

**AquaTech Enterprise FP&A Command Center**

The complete project integrates SQL, Excel financial modeling, Power BI dashboards, forecasting, variance analysis, and executive decision support.
