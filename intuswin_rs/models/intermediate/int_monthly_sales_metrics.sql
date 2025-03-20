WITH stg_sales AS (
    SELECT *
    FROM {{ ref('stg_intus_sales_transactions') }}
)

SELECT
    {{ extract_year_month('transaction_timestamp') }},
    product_id,
    COUNT(DISTINCT user_id) AS unique_customers,
    SUM(revenue) AS total_revenue,
    SUM(cost) AS total_cost
FROM stg_sales
GROUP BY 1, 2, 3
