{{
    config(
        materialized="incremental",
        schema="gold",
        unique_key="ssn",
        on_schema_change="sync_all_columns",
        merge_update_columns= ['speciality'],
        post_hook=[
            "update {{this}} set is_active ='N' 
        where ssn not in (select ssn from {{ source('bronze_dc_sales', 'doctor') }})"
        ],
    )
}}

with
    stg_doctor as (
        select
            ssn,
            name,
            speciality,
            year_experience,
            load_date,
            current_timestamp as dbt_updated_date,
            'Y' as is_active 
        from {{ source("bronze_dc_sales", "doctor") }}
    )
select *
from stg_doctor
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where load_date > (select max(dbt_updated_date) from {{ this }})
{% endif %}
