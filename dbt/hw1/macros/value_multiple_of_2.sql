{% test value_multiple_of_2(model, column_name) %}

select *
from {{ model }}
where {{ column_name }}::int % 2 != 0

{% endtest %}