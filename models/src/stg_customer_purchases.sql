with cust_purchase_data as(
    select * from {{ source('AIRBNB', 'customer_purchases') }}
)
select * from cust_purchase_data