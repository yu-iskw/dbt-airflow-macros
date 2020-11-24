{%- macro ds_nodash() -%}
    {%- set execution_date = execution_date() -%}
    {{- execution_date.strftime("%Y%m%d") -}}
{%- endmacro -%}
