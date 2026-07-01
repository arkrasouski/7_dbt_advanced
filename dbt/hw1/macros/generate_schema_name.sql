-- {% macro generate_schema_name(custom_schema_name, node) %}
--   {% if custom_schema_name is not none %}
--     {{ return(custom_schema_name) }}
--   {% else %}
--     {{ return(target.schema) }}
--   {% endif %}
-- {% endmacro %}

{% macro generate_schema_name(custom_schema_name, node) -%}
  {%- set default_schema = target.schema -%}
  {%- if target.name == 'ci' -%}
    {{ return('dbt_ci_' ~ env_var('DBT_CI_USER', 'unknown')) }}
  {%- elif custom_schema_name is none -%}
    {{ return(default_schema) }}
  {%- else -%}
    {{ return(custom_schema_name) }}
  {%- endif -%}
{%- endmacro %}