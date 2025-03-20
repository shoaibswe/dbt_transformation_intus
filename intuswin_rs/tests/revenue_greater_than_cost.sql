WITH monthly_sales AS (
    SELECT *
    FROM {{ ref('int_monthly_sales_metrics') }}
)

SELECT *
FROM monthly_sales
WHERE total_revenue < total_cost
