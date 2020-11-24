{%- macro ds(timezone=none) -%}
    {%- set execution_date = execution_date() -%}
    {{- execution_date.strftime("%Y-%m-%d") -}}
{%- endmacro -%}
