-- Check that all product_ids in order_items table exist in products table
select
    oi.product_id
from {{ ref('stg_order_items') }} oi
left join {{ ref('stg_products') }} p on oi.product_id = p.product_id
where p.product_id is null