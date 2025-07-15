{% macro test_execution_date() %}

  {# Test case 1: EXECUTION_DATE not set, no timezone #}
  {% set expected = modules.datetime.datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%S.%f') | reverse | cut(9) | reverse %}
  {% set actual = dbt_unittest.get_result("{{ dbt_airflow_macros.execution_date() }}", {"EXECUTION_DATE": "none"}) %}
  {{ dbt_unittest.assert_true(actual.startswith(expected), 'test_execution_date_utcnow_no_timezone - Expected: starts with ' ~ expected ~ ', Actual: ' ~ actual) }}

  {# Test case 2: EXECUTION_DATE not set, with timezone #}
  {% set expected_dt = modules.datetime.datetime.utcnow() %}
  {% set expected = modules.pytz.timezone("Asia/Tokyo").localize(expected_dt).strftime('%Y-%m-%dT%H:%M:%S.%f') | reverse | cut(9) | reverse %}
  {% set actual = dbt_unittest.get_result("{{ dbt_airflow_macros.execution_date(timezone=\"Asia/Tokyo\") }}", {"EXECUTION_DATE": "none"}) %}
  {{ dbt_unittest.assert_true(actual.startswith(expected), 'test_execution_date_utcnow_with_timezone - Expected: starts with ' ~ expected ~ ', Actual: ' ~ actual) }}

  {# Test case 3: EXECUTION_DATE set, no timezone in macro call #}
  {% set env_var_val = "2023-01-15T10:30:00" %}
  {% set expected = env_var_val %}
  {% set actual = dbt_unittest.get_result("{{ dbt_airflow_macros.execution_date() }}", {"EXECUTION_DATE": env_var_val}) %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_execution_date_env_var_no_timezone_macro') }}

  {# Test case 4: EXECUTION_DATE set, with timezone in macro call #}
  {% set env_var_val = "2023-01-15T10:30:00" %}
  {% set expected_dt = modules.datetime.datetime.fromisoformat(env_var_val) %}
  {% set expected = modules.pytz.timezone("America/New_York").localize(expected_dt).isoformat(timespec='seconds') %}
  {% set actual = dbt_unittest.get_result("{{ dbt_airflow_macros.execution_date(timezone=\"America/New_York\") }}", {"EXECUTION_DATE": env_var_val}) %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_execution_date_env_var_with_timezone_macro') }}

  {# Test case 5: EXECUTION_DATE set with offset, no timezone in macro call #}
  {% set env_var_val = "2023-01-15T10:30:00+09:00" %}
  {% set expected = env_var_val %}
  {% set actual = dbt_unittest.get_result("{{ dbt_airflow_macros.execution_date() }}", {"EXECUTION_DATE": env_var_val}) %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_execution_date_env_var_offset_no_timezone_macro') }}

  {# Test case 6: EXECUTION_DATE set with offset, with different timezone in macro call #}
  {% set env_var_val = "2023-01-15T10:30:00+09:00" %}
  {% set expected_dt = modules.datetime.datetime.fromisoformat(env_var_val) %}
  {% set expected = modules.pytz.timezone("Europe/London").localize(expected_dt).isoformat(timespec='seconds') %}
  {% set actual = dbt_unittest.get_result("{{ dbt_airflow_macros.execution_date(timezone=\"Europe/London\") }}", {"EXECUTION_DATE": env_var_val}) %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_execution_date_env_var_offset_with_timezone_macro') }}

{% endmacro %}
