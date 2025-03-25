-- models/staging/stg_order_items.sql
SELECT
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value
FROM
    `sctp-data-eng-ecomm`.`ecomm_raw`.`clean_olist_order_items`