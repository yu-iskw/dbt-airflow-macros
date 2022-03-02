{%- macro ds_nodash(timezone=none) -%}
    {%- set execution_date = dbt_airflow_macros.execution_date(timezone=timezone) -%}
    {{- execution_date.strftime("%Y%m%d") -}}
{%- endmacro -%}
