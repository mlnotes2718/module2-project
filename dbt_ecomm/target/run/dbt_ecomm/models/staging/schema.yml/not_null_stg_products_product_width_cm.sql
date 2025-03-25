select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select product_width_cm
from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_products`
where product_width_cm is null



      
    ) dbt_internal_test