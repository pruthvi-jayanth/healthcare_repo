{{config (materialized = 'table')}}

select distinct
    diagnosis_id,
    diagnosis
from {{ ref('stg_diagnoses') }}