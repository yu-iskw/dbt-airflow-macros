{% macro test_ts_nodash() %}
  {# Test case 1: EXECUTION_DATE is set, no timezone #}
  {% set expected = '20230101T000000' %}
  {% set actual = dbt_airflow_macros.ts_nodash() %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_ts_nodash_with_execution_date') }}

  {# Test case 2: EXECUTION_DATE is set, no timezone #}
  {% set expected = '20230101T000000' %}
  {% set actual = dbt_airflow_macros.ts_nodash() %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_ts_nodash_no_execution_date_but_set_in_shell') }}

  {# Test case 3: EXECUTION_DATE is set, with timezone #}
  {% set expected = '20230101T000000' %}
  {% set actual = dbt_airflow_macros.ts_nodash(timezone="Asia/Tokyo") %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_ts_nodash_with_timezone') }}
{% endmacro %}
