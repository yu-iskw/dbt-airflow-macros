{%- macro ts() -%}
    {%- set execution_date = dbt_airflow_macros.execution_date() -%}
    {{- execution_date.strftime("%Y-%m-%dT%H:%M:%S+00:00") -}}
{%- endmacro -%}
