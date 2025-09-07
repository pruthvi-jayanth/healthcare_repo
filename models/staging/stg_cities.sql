{{config(
    materialized='view',
    tags=['staging']
)}}
with source as (
select * from {{source('healthcare', 'raw_cities')}}
),
renamed as (
    select
          try_cast(nullif("City ID",'') as integer) as city_id,
          initcap(trim("City")) as city,
          upper(trim("State")) as state,
          current_timestamp() as _ingested_at,
          '{{ this.name }}' as _record_source
    from source

),

deduplicated as (
    select distinct * 
    from renamed
    where city_id is not null
)

select * from deduplicated