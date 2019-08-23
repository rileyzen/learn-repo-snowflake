{% macro test_not_greater_than_100(model) %}

{% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}

select count(*)
from {{ model }}
where {{ column_name }} > 100

{% endmacro %}
