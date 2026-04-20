select
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state
from {{ source('PUBLIC', 'RAW_CUSTOMERS') }}