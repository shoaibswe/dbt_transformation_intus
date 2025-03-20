with source_raw_product_catalogs (
    select
    *
    from
         {{ source('intus','product_catalog') }}
)

select 
    product_id, 
    product_name, 
    category
from source_raw_product_catalogs
