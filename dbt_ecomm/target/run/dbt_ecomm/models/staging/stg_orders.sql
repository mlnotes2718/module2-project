
  
    

    create or replace table `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_orders`
      
    
    

    OPTIONS()
    as (
      -- models/staging/stg_orders.sql
SELECT
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
FROM
    `sctp-data-eng-ecomm`.`ecomm_raw`.`clean_olist_orders`
    );
  