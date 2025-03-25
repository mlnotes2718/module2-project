
  
    

    create or replace table `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_products`
      
    
    

    OPTIONS()
    as (
      -- models/staging/stg_products.sql
SELECT
    product_id,
    product_category_name,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM
    `sctp-data-eng-ecomm`.`ecomm_raw`.`clean_olist_products`
    );
  