select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select order_id
from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_payments`
where order_id is null



      
    ) dbt_internal_test