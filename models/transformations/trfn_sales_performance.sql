-- models/sales_performance.sql
WITH monthly_sales AS (
    SELECT
        region,
        DATE_TRUNC('month', sale_date) AS month,
        SUM(sale_amount) AS total_sales
    FROM {{ ref('stg_sales_data') }}
    GROUP BY region, month
)
SELECT
    region,
    month,
    total_sales,
    LAG(total_sales) OVER (PARTITION BY region ORDER BY month) AS previous_month_sales,
    (total_sales - previous_month_sales) / previous_month_sales * 100 AS sales_growth
FROM monthly_sales