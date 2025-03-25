select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select order_purchase_timestamp
from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_orders`
where order_purchase_timestamp is null



      
    ) dbt_internal_test