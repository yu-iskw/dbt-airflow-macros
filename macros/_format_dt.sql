{%- macro _format_dt(datetime_obj) -%}
    {{ return(datetime_obj.isoformat(timespec='seconds')) }}
{%- endmacro -%}
