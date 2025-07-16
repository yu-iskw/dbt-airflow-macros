{%- macro execution_date(timezone=none) -%}
    {%- set execution_date_str = env_var('EXECUTION_DATE', var('execution_date', "none")) -%}
    {%- set _execution_date = none -%}

    {%- if execution_date_str == "none" -%}
        {%- set _execution_date = modules.datetime.datetime.utcnow() -%}
        {{ return(_execution_date.isoformat(timespec='seconds')) }}
    {%- else -%}
        {%- set _execution_date = modules.datetime.datetime.fromisoformat(execution_date_str) -%}
    {%- endif -%}

    {%- if timezone == none -%}
        {# If no timezone is specified, assume UTC for consistency #}
        {%- set _execution_date_utc = _execution_date.astimezone(modules.pytz.utc) if _execution_date.tzinfo is not none else modules.pytz.utc.localize(_execution_date) -%}
        {{ return(_execution_date_utc.isoformat(timespec='seconds')) }}
    {%- else -%}
        {{ return(modules.pytz.timezone(timezone).localize(_execution_date).isoformat(timespec='seconds')) }}
    {%- endif -%}
{%- endmacro -%}
