{{ config(materialized = 'table') }}
select distinct
       provider_id,
       provider_name,
       gender,
       nationality,
       age,
       image
from {{ ref('stg_providers') }}