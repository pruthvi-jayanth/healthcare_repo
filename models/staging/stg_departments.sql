{{config(
    materialized='view',
    tags= ['staging']
)}}
with source as (
    select * from {{ source ('healthcare','raw_departments')}}
)
select
      "Department ID" as department_id,
       department
from source