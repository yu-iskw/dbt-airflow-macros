{%- macro ds(timezone=none) -%}
    {%- set execution_date_str = dbt_airflow_macros.execution_date(timezone=timezone) -%}
    {%- set execution_date = modules.datetime.datetime.fromisoformat(execution_date_str) -%}
    {{ return(execution_date.strftime("%Y-%m-%d")) }}
{%- endmacro -%}
