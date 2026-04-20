select
    product_id,
    product_category_name as category
from {{ source('PUBLIC', 'RAW_PRODUCTS') }}