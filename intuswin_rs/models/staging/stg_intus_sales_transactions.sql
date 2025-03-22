{{ config(
    materialized='incremental', --made it incremental for better performance
    unique_key='transaction_id',
    incremental_strategy='insert_overwrite'
) }}

with source_raw_sales_trx as (
    select
    *
    from
         {{ source('intus','sales_transactions') }}
)

select 
    transaction_id, 
    product_id, 
    user_id,
    transaction_timestamp, 
    revenue, 
    cost
from source_raw_sales_trx

{% if is_incremental() %}
    WHERE transaction_timestamp > (SELECT max(transaction_timestamp) FROM {{ this }})
{% endif %}
