with number_orders as (
    select customer_id, count(distinct order_id) as number_orders
    from {{ ref('stg_orders') }}
    group by customer_id
),
fraud as (
    select customer_id
    from number_orders
    where number_orders > 500
)
select count(*)
from fraud
having count(*) > 0