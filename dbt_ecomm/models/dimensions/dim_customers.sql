-- models/dimensions/dim_customers.sql
SELECT
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state,
    customer_zip_code_prefix
FROM {{ ref('stg_customers') }}