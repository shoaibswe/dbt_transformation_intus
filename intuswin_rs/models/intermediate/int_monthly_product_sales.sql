WITH stg_sales AS (
    SELECT *
    FROM {{ ref('int_monthly_sales_metrics') }}
),
stg_products AS (
    SELECT *
    FROM {{ ref('stg_intus_product_catalogs') }}
)

SELECT
    sales.year AS transaction_year,
    sales.month AS transaction_month,
    prod.category,
    sales.unique_customers,
    sales.total_revenue,
    sales.total_cost
FROM stg_sales sales
LEFT JOIN stg_products prod 
    ON sales.product_id = prod.product_id
    