select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select product_category_name
from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_products`
where product_category_name is null



      
    ) dbt_internal_test