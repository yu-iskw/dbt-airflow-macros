{%- macro test__format_dt() -%}

  {# Test case 1: Basic datetime object #}
  {% set dt_obj_1 = modules.pytz.utc.localize(modules.datetime.datetime(2023, 1, 1, 12, 30, 45)) %}
  {% set expected_1 = "2023-01-01T12:30:45+00:00" %}
  {% set actual_1 = dbt_airflow_macros._format_dt(dt_obj_1) %}
  {{ dbt_unittest.assert_equals(expected_1, actual_1) }}

  {# Test case 2: Datetime object with milliseconds (should be truncated to seconds) #}
  {% set dt_obj_2 = modules.pytz.utc.localize(modules.datetime.datetime(2023, 1, 1, 12, 30, 45, 123456)) %}
  {% set expected_2 = "2023-01-01T12:30:45+00:00" %}
  {% set actual_2 = dbt_airflow_macros._format_dt(dt_obj_2) %}
  {{ dbt_unittest.assert_equals(expected_2, actual_2) }}

  {# Test case 3: Datetime object in a different timezone (should be formatted with its offset) #}
  {% set ny_tz = modules.pytz.timezone("America/New_York") %}
  {% set dt_obj_3 = ny_tz.localize(modules.datetime.datetime(2023, 1, 1, 12, 30, 45)) %}
  {% set expected_3 = "2023-01-01T12:30:45-05:00" %}
  {% set actual_3 = dbt_airflow_macros._format_dt(dt_obj_3) %}
  {{ dbt_unittest.assert_equals(expected_3, actual_3) }}

{% endmacro -%}
