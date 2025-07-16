{%- macro _convert_tz(datetime_obj, timezone=none) -%}
    {%- set converted_datetime = datetime_obj -%}

    {%- if timezone == none -%}
        {# If no target timezone, ensure the datetime is in UTC #}
        {%- set converted_datetime = datetime_obj.astimezone(modules.pytz.utc) -%}
    {%- else -%}
        {# Convert from UTC to the target timezone #}
        {%- set target_timezone = modules.pytz.timezone(timezone) -%}
        {%- set converted_datetime = datetime_obj.astimezone(target_timezone) -%}
    {%- endif -%}

    {{ return(converted_datetime) }}
{%- endmacro -%}
