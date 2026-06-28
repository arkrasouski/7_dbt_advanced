{{
  config(
     materialized = 'table',
     schema = 'smartphones',
     alias='int_smartphones_brands',
     unique_key = 'brand_name',
   )
}}

SELECT DISTINCT
  brand_name
FROM {{ ref('stg__smartphones') }}