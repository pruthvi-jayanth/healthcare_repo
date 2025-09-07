{{config(
    materialized= 'table',
    tags=['staging']
)}}
with source as (
select * from {{source('healthcare','raw_patients')}}
)

select 
      "Patient ID" as patient_id,
      "Patient Name" as patient_name,
	  GENDER as gender,
	  AGE as age,
	  "City ID" as city_id,
	  RACE as race
from source      