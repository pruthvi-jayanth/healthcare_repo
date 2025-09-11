{{config(
    materialized= 'view',
    tags=['staging']
)}}

with source as (
    select * from {{source('healthcare','raw_providers')}}
)

select
      "Provider ID" as provider_id,
      "Provider Name" as provider_name,
      {{transform_gender('GENDER')}} as gender,
      {{replace_nulls_mac('NATIONALITY')}} as nationality,
      AGE as age,
      IMAGE as image
from source

     