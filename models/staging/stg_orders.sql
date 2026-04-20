with orders as (
    select * from {{ source('PUBLIC', 'RAW_ORDERS') }}
),
items as (
    select * from {{ source('PUBLIC', 'RAW_ORDER_ITEMS') }}
)
select
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp as order_date,
    i.product_id,
    i.price,
    i.freight_value,
    (i.price + i.freight_value) as total_amount
from orders o
join items i on o.order_id = i.order_id