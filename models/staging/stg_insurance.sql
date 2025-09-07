{{config(
    materialized='table',
    tags=['staging']
)}}

with source as(
    select * from {{source('healthcare','raw_insurance')}}
)

select
      "Insurance ID" as insurance_id,
      "Insurance Provider" as insurance_provider
from source      