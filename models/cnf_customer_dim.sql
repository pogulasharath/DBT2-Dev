
{{ config(materialized='table')}}
select * from {{ source('bronze_dc_sales', 'cnf_customer_dim') }}