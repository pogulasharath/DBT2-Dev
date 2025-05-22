{{ config(materialized="view", schema="sliver") }}
select d.name as docname ,d.ssn,d.speciality,p.name,p.age,p.phy_ssn,p.gender
from {{ ref("patient_v") }} as p
left join {{ source("bronze_dc_sales", "doctor") }} d on d.ssn = p.phy_ssn
