WITH monthly_sales AS (
    SELECT
        year AS transaction_year,
        month AS transaction_month,
        product_id,
        unique_customers,
        total_revenue,
        total_cost
    FROM {{ ref('int_monthly_sales_metrics') }}
),
monthly_product_sales AS (
    SELECT
        transaction_year,
        transaction_month,
        category,
        unique_customers,
        total_revenue,
        total_cost
    FROM {{ ref('int_monthly_product_sales') }}
),
monthly_marketing AS (
    SELECT
        year AS transaction_year,
        month AS transaction_month,
        SUM(total_marketing_cost) AS total_marketing_cost,
        SUM(total_marketing_events) AS total_marketing_events
    FROM {{ ref('int_monthly_marketing_metrics') }}
    GROUP BY 1, 2
)

SELECT
    sales.transaction_year,
    sales.transaction_month,
    prod.category,
    prod.unique_customers,
    prod.total_revenue,
    prod.total_cost,
    marketing.total_marketing_cost,
    marketing.total_marketing_events,
    {{ calculate_ratio('sales.total_revenue', 'sales.total_cost') }} AS revenue_to_cost_ratio
FROM monthly_sales sales
LEFT JOIN monthly_product_sales prod
    ON sales.transaction_year = prod.transaction_year
    AND sales.transaction_month = prod.transaction_month
LEFT JOIN monthly_marketing marketing
    ON sales.transaction_year = marketing.transaction_year
    AND sales.transaction_month = marketing.transaction_month
ORDER BY sales.transaction_year, sales.transaction_month, prod.category
