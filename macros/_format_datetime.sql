{%- macro _format_datetime(datetime_obj) -%}
    {{ return(datetime_obj.isoformat(timespec='seconds')) }}
{%- endmacro -%}
