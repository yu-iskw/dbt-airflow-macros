{%- macro ts_nodash() -%}
    {%- set execution_date = execution_date() -%}
    {{- execution_date.strftime("%Y%m%dT%H%M%S") -}}
{%- endmacro -%}
