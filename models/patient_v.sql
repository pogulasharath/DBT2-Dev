{{ config(materialized='view')}}
select * from {{ source('bronze_dc_sales', 'patient') }}