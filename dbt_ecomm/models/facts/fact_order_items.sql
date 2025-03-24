-- models/facts/fact_order_items.sql
{{
    config(
        materialized='table'
    )
}}
SELECT
    oi.order_id,
    oi.order_item_id,
    oi.product_id,
    oi.seller_id,
    oi.shipping_limit_date,
    oi.price,
    oi.freight_value,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    c.customer_unique_id,
    c.customer_city AS customer_city,
    c.customer_state AS customer_state,
    p.payment_type,
    p.payment_installments,
    p.payment_value,
    pr.product_category_name,
    -- Calculate shipping time using a macro
    --, {{ calculate_shipping_time('o.order_approved_at', 'o.order_delivered_customer_date') }} AS actual_shipping_time
FROM
    {{ ref('stg_order_items') }} oi
LEFT JOIN
    {{ ref('stg_orders') }} o ON oi.order_id = o.order_id
LEFT JOIN
    {{ ref('dim_customers') }} c ON o.customer_id = c.customer_id
LEFT JOIN
    {{ ref('stg_payments') }} p ON o.order_id = p.order_id  -- Corrected join
LEFT JOIN
    {{ ref('dim_products') }} pr ON oi.product_id = pr.product_id