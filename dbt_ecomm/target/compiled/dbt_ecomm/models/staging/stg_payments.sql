-- models/staging/stg_payments.sql
SELECT
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
FROM
    `sctp-data-eng-ecomm`.`ecomm_raw`.`clean_olist_order_payments`