WITH monthly_sales AS (
    SELECT *
    FROM {{ ref('int_monthly_product_sales') }}
),
monthly_marketing AS (
    SELECT *
    FROM {{ ref('int_monthly_marketing_metrics') }}
)

SELECT
    sales.transaction_year,
    sales.transaction_month,
    sales.category,
    sales.unique_customers,
    sales.total_revenue,
    sales.total_cost,
    COALESCE(marketing.total_marketing_cost, 0) AS total_marketing_cost,
    COALESCE(marketing.total_marketing_events, 0) AS total_marketing_events,
    {{ calculate_ratio('sales.total_revenue', 'sales.total_cost') }} AS revenue_to_cost_ratio
FROM monthly_sales sales
LEFT JOIN monthly_marketing marketing
    ON sales.transaction_year = marketing.year
    AND sales.transaction_month = marketing.month
WHERE sales.total_revenue > 0
ORDER BY sales.transaction_year, sales.transaction_month, sales.category
