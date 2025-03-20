WITH source_raw_sales_trx AS (
    SELECT *
    FROM {{ ref('stg_intus_sales_transactions') }}
)
SELECT 
    {{ extract_year_month('transaction_timestamp') }},
    product_id,
    COUNT(DISTINCT user_id) AS unique_customers,
    {{ coalesce_zero('SUM(revenue)') }} AS total_revenue,
    {{ coalesce_zero('SUM(cost)') }} AS total_cost
FROM source_raw_sales_trx
GROUP BY year, month, product_id
