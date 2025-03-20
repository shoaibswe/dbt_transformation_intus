{% macro generate_schema_name(custom_schema_name, node) -%}

  {%- if (target.name.lower() == 'deploy' or target.name.lower() == 'prod') and custom_schema_name is not none -%} 
        {{ custom_schema_name | trim }}
    {%- else -%}
    {%- if custom_schema_name is none -%}
            {{ target.schema | trim }}
        {%- else -%}
      {{ target.schema ~ '_' ~ custom_schema_name | trim }}
    {%- endif -%}
  {%- endif -%}

{%- endmacro %}





