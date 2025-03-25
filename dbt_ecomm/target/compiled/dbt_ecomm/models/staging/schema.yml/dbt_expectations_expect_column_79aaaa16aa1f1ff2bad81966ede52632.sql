






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and freight_value >= 0
)
 as expression


    from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_order_items`
    

),
validation_errors as (

    select
        *
    from
        grouped_expression
    where
        not(expression = true)

)

select *
from validation_errors







