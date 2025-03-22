{% test date_consistency(model, column_name, start_date, end_date) %}

SELECT *
FROM {{ model }}
WHERE {{ column_name }} < '{{ start_date }}'
   OR {{ column_name }} > '{{ end_date }}'

{% endtest %}