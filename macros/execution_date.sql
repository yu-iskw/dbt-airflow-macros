{%- macro execution_date(timezone=none) -%}
    {%- set datetime_obj = dbt_airflow_macros._get_datetime() -%}
    {%- set converted_datetime = dbt_airflow_macros._convert_tz(datetime_obj, timezone) -%}
    {{ return(dbt_airflow_macros._format_dt(converted_datetime)) }}
{%- endmacro -%}
