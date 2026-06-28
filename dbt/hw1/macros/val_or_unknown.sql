{% macro val_or_unknown(val, default_val='Unknown') %}
    COALESCE(
        {{val}}, 
        '{{default_val}}'
        )
{% endmacro %}