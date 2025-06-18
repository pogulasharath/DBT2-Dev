with cust_actvity as (
    select * from {{ source('AIRBNB', 'customer_activity') }}
)
select * from cust_actvity