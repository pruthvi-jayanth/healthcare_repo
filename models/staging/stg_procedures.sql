{{config(
    materialized='view',
    tags=['staging']
) }}

with source as(
    select * from {{source('healthcare', 'raw_procedures')}}
)

select
      {{ replace_nulls_mac('Procedure ID')}} as procedure_id, 
      "Procedure"
from source      