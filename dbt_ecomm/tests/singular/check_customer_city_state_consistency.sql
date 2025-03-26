-- Check if customer city and state combinations are consistent
select
    customer_city,
    customer_state,
    count(*) as count
from {{ ref('stg_customers') }}
group by 1, 2
having count(*) > 1
