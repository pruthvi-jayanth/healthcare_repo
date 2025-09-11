{{ config(materialized='table') }}
select distinct
      patient_id,
      patient_name,
      gender,
      age,
      city_id,
      race,
      loaded_at
from {{ ref('stg_patients') }}

