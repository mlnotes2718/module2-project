select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select order_estimated_delivery_date
from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_orders`
where order_estimated_delivery_date is null



      
    ) dbt_internal_test