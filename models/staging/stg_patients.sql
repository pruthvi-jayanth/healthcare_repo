{{ config(
    materialized='incremental',
    unique_key='patient_id',
    incremental_strategy='merge',
    on_schema_change='append_new_columns'
) }}

select
    coalesce("Patient ID", 'unknown') as patient_id,
    coalesce("Patient Name", 'unknown') as patient_name,
    case lower("GENDER")
        when 'male' then 'M'
        when 'm' then 'M'
        when 'female' then 'F'
        when 'f' then 'F'
        else 'others'
    end as gender,
    age,
    trim("City ID") as city_id,
    race,
    current_timestamp() as loaded_at
from {{ source('healthcare', 'raw_patients') }}

{% if is_incremental() %}
    -- Instead of filtering on LOADED_AT (which doesn’t exist in the source),
    -- filter based on new patient_ids not already in the target table
    where "Patient ID" not in (
        select patient_id from {{ this }}
    )
{% endif %}
