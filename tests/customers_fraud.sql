with registered as (
    select count(customer_id) as nb_registered, customer_name
    from {{ ref('stg_customers') }}
    group by customer_name
), fraud as (
    select customer_name
    from registered
    where nb_registered > 5
)
select count(*)
from fraud
having count(*) > 0