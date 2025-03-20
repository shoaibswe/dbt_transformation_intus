{% macro categorize_product(category) %}
  CASE
    WHEN {{ category }} = 'Electronics' THEN 'High Value'
    WHEN {{ category }} = 'Apparel' THEN 'Medium Value'
    ELSE 'Low Value'
  END
{% endmacro %}
