{{config (materialized= 'table')}}
select distinct
    procedure_id,
    "Procedure" as procedure_name,
from {{ref ('stg_procedures') }}