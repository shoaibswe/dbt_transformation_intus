WITH source_raw_product_catalogs AS (
    SELECT *
    FROM {{ ref('stg_intus_product_catalogs') }}
)
SELECT 
    product_id,
    product_name,
    category,
    {{ categorize_product('category') }} AS product_value_category
FROM source_raw_product_catalogs
