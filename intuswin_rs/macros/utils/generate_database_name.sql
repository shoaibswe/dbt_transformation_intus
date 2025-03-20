{% macro generate_database_name(custom_database_name, node) -%} 

  {%- if (target.name.lower() == 'deploy' or target.name.lower() == 'prod') and custom_database_name is not none -%} 
        {{ custom_database_name | trim }}
    {%- else -%}      
    {%- if custom_database_name is none -%}
            {{ target.database | trim }}
        {%- else -%}     
      {{ custom_database_name ~ '_DEV'| trim }}
    {%- endif -%}
  {%- endif -%}

{%- endmacro %}

