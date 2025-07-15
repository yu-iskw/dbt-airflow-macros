{% macro test_ts() %}
  {# Test case 1: EXECUTION_DATE is set, no timezone #}
  {% set expected = '2023-01-01T00:00:00+00:00' %}
  {% set actual = dbt_airflow_macros.ts() %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_ts_with_execution_date') }}

  {# Test case 2: EXECUTION_DATE is set, no timezone #}
  {% set expected = '2023-01-01T00:00:00+00:00' %}
  {% set actual = dbt_airflow_macros.ts() %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_ts_no_execution_date_but_set_in_shell') }}

  {# Test case 3: EXECUTION_DATE is set, with timezone #}
  {% set expected = '2023-01-01T00:00:00+00:00' %}
  {% set actual = dbt_airflow_macros.ts(timezone="Asia/Tokyo") %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_ts_with_timezone') }}
{% endmacro %}
