{%- macro test__get_datetime_set() -%}

  {# Test case: EXECUTION_DATE is set #}
  {# This test relies on EXECUTION_DATE being set externally by the shell environment #}
  {% set env_var_val = env_var('EXECUTION_DATE') %}
  {% set expected_dt_set = modules.pytz.utc.localize(modules.datetime.datetime.fromisoformat(env_var_val)) %}
  {% set actual_dt_obj_set = dbt_airflow_macros._get_datetime() %}
  {{ dbt_unittest.assert_equals(expected_dt_set, actual_dt_obj_set, "Test case failed: EXECUTION_DATE set") }}

  {# Check if the returned value is a datetime object #}
  {{ dbt_unittest.assert_true(modules.isinstance(actual_dt_obj_set, modules.datetime.datetime), "Returned value is not a datetime object") }}

{% endmacro -%}
