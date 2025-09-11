{{config (materialized = 'table')}}
select distinct
      city_id,
      city,
      state,
      _ingested_at,
      _record_source
from {{ ref('stg_cities') }}