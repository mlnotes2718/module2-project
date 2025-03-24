-- models/staging/stg_payments.sql
SELECT
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
FROM
    {{ source('ecomm_raw', 'clean_olist_order_payments') }}