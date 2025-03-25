
    
    

with dbt_test__target as (

  select product_id as unique_field
  from `sctp-data-eng-ecomm`.`ecomm_dev`.`stg_products`
  where product_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


