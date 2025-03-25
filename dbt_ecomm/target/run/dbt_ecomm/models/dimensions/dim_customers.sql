
  
    

    create or replace table `sctp-data-eng-ecomm`.`ecomm_dev`.`dim_customers`
      
    
    

    OPTIONS()
    as (
      -- models/dimensions/dim_customers.sql
SELECT
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state,
    customer_zip_code_prefix
FROM `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_customers`
    );
  