{% macro validate_data() %}

{% set query %}
    SELECT *
    FROM {{ ref('int_monthly_sales_metrics') }}
    WHERE total_revenue < total_cost
{% endset %}

{% set results = run_query(query) %}

{% if results|length > 0 %}
    {{ exceptions.raise_compiler_error("Revenue is less than cost in some rows!") }}
{% endif %}

{% endmacro %}
