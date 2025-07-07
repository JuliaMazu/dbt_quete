with invalid_name as (
    select *
    from {{ ref('stg_customers') }}
    where CHAR_LENGTH(customer_name) < 10
)
select count(*)
from invalid_name
having count(*) > 0