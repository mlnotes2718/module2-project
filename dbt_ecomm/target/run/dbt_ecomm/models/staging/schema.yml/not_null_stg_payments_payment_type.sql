select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select payment_type
from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_payments`
where payment_type is null



      
    ) dbt_internal_test