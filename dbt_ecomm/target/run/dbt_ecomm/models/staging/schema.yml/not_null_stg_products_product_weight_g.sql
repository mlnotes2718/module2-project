select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select product_weight_g
from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_products`
where product_weight_g is null



      
    ) dbt_internal_test