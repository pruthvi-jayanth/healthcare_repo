{{config(
    materialized= 'incremental',
    unique_key= 'patient_id',
    incremental_strategy= 'merge',
    on_schema_change= 'sink_all_columns',
    tags=['staging']
)}}

with source as (
    select * from {{source('healthcare', 'raw_patients')}}
)

select
    try_cast("Patient ID"as int) as patient_id,
    "First Name" as first_name,
    "Last Name" as last_name,
    try_cast("Date of Birth" as date) as date_of_birth,
    "Gender" as gender,
    "City ID" as city_id,
    try_cast("Loaded At" as timestamp) as loaded_at,
    '{{ this.name }}' as _record_source,
    current_timestamp() as _ingested_at
from source

{% if is_incremental() %}
   where "Loaded At" > (select max("loaded_at") from {{ this }} )
{% endif %}   