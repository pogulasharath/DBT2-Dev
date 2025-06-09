{% snapshot doctor_snapshot %}
    {{
        config(
            target_schema='snapshot',
            target_database='DBT_TEST',
            unique_key='ssn',
            strategy='timestamp',
            invalidate_hard_deletes=False,
            updated_at='load_date'
        )
    }}

    select * from {{ source("bronze_dc_sales", "doctor") }}
 {% endsnapshot %}