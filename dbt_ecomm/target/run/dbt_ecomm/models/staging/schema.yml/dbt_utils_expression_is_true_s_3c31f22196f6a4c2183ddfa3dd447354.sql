select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      



select
    1
from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_orders`

where not(order_estimated_delivery_date order_estimated_delivery_date >= order_purchase_timestamp)


      
    ) dbt_internal_test