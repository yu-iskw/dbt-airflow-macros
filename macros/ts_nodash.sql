{%- macro ts_nodash(timezone=none) -%}
    {%- set execution_date_str = dbt_airflow_macros.execution_date(timezone=timezone) -%}
    {%- set execution_date = modules.datetime.datetime.fromisoformat(execution_date_str) -%}
    {# Ensure the datetime object is in UTC before formatting #}
    {%- set execution_date_utc = execution_date.astimezone(modules.pytz.utc) -%}
    {{ return(execution_date_utc.strftime("%Y%m%dT%H%M%S")) }}
{%- endmacro -%}
