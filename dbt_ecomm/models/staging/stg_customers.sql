-- models/staging/stg_customers.sql
SELECT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM
    {{ source('ecomm_raw', 'clean_olist_customers') }}