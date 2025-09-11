{{config (materialized = 'table')}}
select distinct
    insurance_id,
    insurance_provider
from {{ ref('stg_insurance') }}