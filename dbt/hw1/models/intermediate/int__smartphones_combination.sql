{{
  config(
     materialized = 'table',
     schema = 'smartphones',
     alias='int_smartphones_combination',
     indexes = [
        {'columns': ['processor_brand', 'num_cores', 'processor_speed'], 'type': 'btree'},
        {'columns': ['combination_count'], 'type': 'btree'}
     ]
   )
}}

SELECT
    processor_brand,
    num_cores,
    processor_speed,
    battery_capacity,
    count(*) as combination_count 
FROM {{ ref('stg__smartphones') }}
GROUP BY processor_brand,
         num_cores,
         processor_speed,
         battery_capacity