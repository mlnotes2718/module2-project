select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select price
from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_order_items`
where price is null



      
    ) dbt_internal_test