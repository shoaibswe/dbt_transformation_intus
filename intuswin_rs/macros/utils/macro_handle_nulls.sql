{% macro coalesce_zero(column) %}
  COALESCE({{ column }}, 0)
{% endmacro %}
