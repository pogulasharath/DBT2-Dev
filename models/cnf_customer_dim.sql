
{{ config(materialized='table')}}
select * from {{ source('dc_hc_sales', 'cnf_customer_dim') }}