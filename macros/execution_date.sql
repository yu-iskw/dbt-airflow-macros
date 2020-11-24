{%- macro execution_date() -%}
    {%- set execution_date_str = env_var('EXECUTION_DATE', "none") -%}

    {%- if execution_date_str == "none" -%}
        {{ return(modules.datetime.datetime.now()) }}
    {%- else -%}
        {{ return(modules.datetime.datetime.fromisoformat(execution_date_str)) }}
    {%- endif -%}
{%- endmacro -%}
