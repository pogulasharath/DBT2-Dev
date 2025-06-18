{{
    config(
        materialized='table',
        
    )
}}
select
customer_id,  
CASE
WHEN total_spent > 1000 THEN 'High-value'
WHEN total_spent > 500 THEN 'Medium-value'
ELSE 'Low-value'
END as customer_segment
from {{ ref("stg_customer_purchases") }}
where purchase_date >= '2023-01-01'
