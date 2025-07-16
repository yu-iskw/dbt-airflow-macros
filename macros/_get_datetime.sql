{%- macro _get_datetime() -%}
    {%- set execution_date_str = env_var('EXECUTION_DATE', "none") -%}
    {%- set final_datetime = none -%}

    {%- if execution_date_str == "none" -%}
        {# Get current UTC time and make it timezone-aware #}
        {%- set utc_now = modules.datetime.datetime.utcnow().replace(tzinfo=modules.pytz.utc) -%}
        {%- set final_datetime = utc_now -%}
    {%- else -%}
        {# Parse from string, which will be naive, then localize to UTC #}
        {%- set naive_dt = modules.datetime.datetime.fromisoformat(execution_date_str) -%}
        {%- set utc_dt = modules.pytz.utc.localize(naive_dt) -%}
        {%- set final_datetime = utc_dt -%}
    {%- endif -%}
    {{ print(final_datetime) }}

    {{ return(final_datetime) }}
{%- endmacro -%}
