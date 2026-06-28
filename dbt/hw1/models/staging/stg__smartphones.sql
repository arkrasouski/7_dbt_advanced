{{
  config(
    materialized='view',
    schema='smartphones',
    alias='stg_smartphones',
    tags=['reference', 'products']
  )
}}

SELECT 
    brand_name,
    model,
    price,
    processor_brand,
    num_cores::int,
    processor_speed,
    battery_capacity::int
FROM {{source('seed__smartfones', 'smartphones')}}