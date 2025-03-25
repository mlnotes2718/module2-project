select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select order_id as from_field
    from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_order_items`
    where order_id is not null
),

parent as (
    select order_id as to_field
    from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_orders`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test