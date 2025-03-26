-- Check that order purchase timestamps are in the past
select
    order_id,
    order_purchase_timestamp
from {{ ref('stg_orders') }}
where order_purchase_timestamp > CAST(current_timestamp() AS DATETIME)

