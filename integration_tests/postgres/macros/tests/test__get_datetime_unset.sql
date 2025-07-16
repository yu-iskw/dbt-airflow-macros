{%- macro test__get_datetime_unset() -%}

  {# Test case: EXECUTION_DATE is not set (should default to current UTC time) #}
  {# This test relies on EXECUTION_DATE NOT being set in the shell environment. #}
  {% set expected_utc_now = modules.datetime.datetime.utcnow().replace(tzinfo=modules.pytz.utc) %}
  {% set actual_dt_obj = dbt_airflow_macros._get_datetime() %}
  {# Assert that the actual datetime is close to the expected, allowing for slight execution time differences #}
  {% set time_diff = (actual_dt_obj - expected_utc_now).total_seconds() %}
  {{ dbt_unittest.assert_true(time_diff >= -1 and time_diff <= 1, "Test case failed: EXECUTION_DATE unset") }}

  {# Check if the returned value is a datetime object #}
  {{ dbt_unittest.assert_true(modules.isinstance(actual_dt_obj, modules.datetime.datetime), "Returned value is not a datetime object") }}

{% endmacro -%}
