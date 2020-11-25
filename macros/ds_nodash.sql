{%- macro ds_nodash() -%}
    {%- set execution_date = dbt_airflow_macros.execution_date() -%}
    {{- execution_date.strftime("%Y%m%d") -}}
{%- endmacro -%}
