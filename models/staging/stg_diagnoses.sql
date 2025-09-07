{{config(
    materialized='view',
    tags= ['staging']
)}}
with source as (
    select * from {{source('healthcare', 'raw_diagnoses')}}
)
select 
      "Diagnosis ID" as diagnosis_id,
      diagnosis
from source      