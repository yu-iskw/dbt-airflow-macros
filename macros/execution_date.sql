{%- macro execution_date(timezone=none) -%}
    {%- set execution_date_str = env_var('EXECUTION_DATE', "none") -%}
    {%- set _execution_date = none -%}

    {%- if execution_date_str == "none" -%}
        {%- set _execution_date = modules.datetime.datetime.utcnow() -%}
        {{ return(_execution_date.isoformat(timespec='seconds')) }}
    {%- else -%}
        {%- set _execution_date = modules.datetime.datetime.fromisoformat(execution_date_str) -%}
    {%- endif -%}

    {%- if timezone == none -%}
        {{ return(_execution_date.isoformat(timespec='seconds')) }}
    {%- else -%}
        {{ return(modules.pytz.timezone(timezone).localize(_execution_date).isoformat(timespec='seconds')) }}
    {%- endif -%}
{%- endmacro -%}
