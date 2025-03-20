WITH stg_sales AS (
    SELECT *
    FROM {{ ref('int_monthly_sales_metrics') }}
),
stg_products AS (
    SELECT *
    FROM {{ ref('stg_intus_product_catalogs') }}
)

SELECT
    s.year AS transaction_year,
    s.month AS transaction_month,
    p.category,
    s.unique_customers,
    s.total_revenue,
    s.total_cost
FROM stg_sales s
LEFT JOIN stg_products p ON s.product_id = p.product_id
