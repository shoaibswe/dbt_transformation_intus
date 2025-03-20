WITH source_raw_sales_trx AS (
    SELECT *
    FROM {{ ref('stg_intus_sales_transactions') }}
)
SELECT 
    user_id,
    {{ user_category_case('revenue', 'activity_score') }} AS user_segment 
FROM source_raw_sales_trx
