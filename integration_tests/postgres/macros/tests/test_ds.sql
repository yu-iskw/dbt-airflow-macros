{% macro test_ds() %}
  {# Test case 1: EXECUTION_DATE is set, no timezone #}
  {% set expected = '2023-01-01' %}
  {% set actual = dbt_airflow_macros.ds() %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_ds_with_execution_date') }}

  {# Test case 2: EXECUTION_DATE is not set, no timezone (defaults to UTC now) #}
  {% set expected = '2023-01-02' %}
  {% set actual = dbt_airflow_macros.ds() %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_ds_no_execution_date') }}

  {# Test case 3: EXECUTION_DATE is set, with timezone #}
  {% set expected = '2023-01-01' %}
  {% set actual = dbt_airflow_macros.ds(timezone="Asia/Tokyo") %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_ds_with_timezone') }}
{% endmacro %}
