select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select customer_city
from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_customers`
where customer_city is null



      
    ) dbt_internal_test