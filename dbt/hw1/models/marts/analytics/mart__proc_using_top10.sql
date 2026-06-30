{{
  config(
     materialized = 'table',
     schema = 'smartphones',
     alias='mart_proc_using_top10'
   )
}}
SELECT
    processor_brand,
    num_cores,
    processor_speed
FROM {{ ref('int__smartphones_combination') }}
GROUP BY 
    processor_brand,
    num_cores,
    processor_speed
ORDER BY SUM(combination_count) DESC
LIMIT 10