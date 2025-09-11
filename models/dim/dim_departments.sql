{{ config (materialized = 'table') }}
select distinct
    department_id,
    department
from {{ ref ('stg_departments') }}    