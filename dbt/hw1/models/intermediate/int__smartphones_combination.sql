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
   {{val_or_unknown('processor_brand')}} as processor_brand,
   {{val_or_unknown('num_cores', -1)}} as num_cores,
   {{val_or_unknown('processor_speed', -1)}} as processor_speed,
   {{val_or_unknown('battery_capacity', -1)}} as battery_capacity,
   COUNT(*) as combination_count 
FROM {{ ref('stg__smartphones') }}
GROUP BY processor_brand,
         num_cores,
         processor_speed,
         battery_capacity