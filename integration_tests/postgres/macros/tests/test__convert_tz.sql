{%- macro test__convert_tz() -%}

  {# Setup a base UTC datetime object #}
  {% set base_dt_utc = modules.pytz.utc.localize(modules.datetime.datetime(2023, 3, 15, 10, 0, 0)) %}

  {# Test case 1: Convert from UTC to America/New_York #}
  {% set target_timezone_ny = "America/New_York" %}
  {% set expected_ny = base_dt_utc.astimezone(modules.pytz.timezone(target_timezone_ny)) %}
  {% set actual_ny = dbt_airflow_macros._convert_tz(base_dt_utc, target_timezone_ny) %}
  {{ dbt_unittest.assert_equals(expected_ny, actual_ny) }}

  {# Test case 2: Convert from UTC to Europe/London #}
  {% set target_timezone_london = "Europe/London" %}
  {% set expected_london = base_dt_utc.astimezone(modules.pytz.timezone(target_timezone_london)) %}
  {% set actual_london = dbt_airflow_macros._convert_tz(base_dt_utc, target_timezone_london) %}
  {{ dbt_unittest.assert_equals(expected_london, actual_london) }}

  {# Test case 3: No target timezone specified (should remain in UTC) #}
  {% set expected_utc = base_dt_utc %}
  {% set actual_utc = dbt_airflow_macros._convert_tz(base_dt_utc) %}
  {{ dbt_unittest.assert_equals(expected_utc, actual_utc) }}

  {# Test case 4: Convert a non-UTC datetime to another timezone #}
  {% set dt_in_ny = modules.pytz.timezone("America/New_York").localize(modules.datetime.datetime(2023, 3, 15, 6, 0, 0)) %}
  {% set expected_london_from_ny = dt_in_ny.astimezone(modules.pytz.timezone("Europe/London")) %}
  {% set actual_london_from_ny = dbt_airflow_macros._convert_tz(dt_in_ny, "Europe/London") %}
  {{ dbt_unittest.assert_equals(expected_london_from_ny, actual_london_from_ny) }}

{% endmacro -%}
