select
    order_id,
    customer_id,
    product_id,
    cast(order_date as date) as order_date,
    price,
    freight_value,
    total_amount,
    order_status
from {{ ref('stg_orders') }}