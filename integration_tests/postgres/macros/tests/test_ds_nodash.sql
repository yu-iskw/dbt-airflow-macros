{% macro test_ds_nodash() %}
  {# Test case 1: EXECUTION_DATE is set, no timezone #}
  {% set expected = '20230101' %}
  {% set actual = dbt_airflow_macros.ds_nodash() %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_ds_nodash_with_execution_date') }}

  {# Test case 2: EXECUTION_DATE is not set, no timezone (defaults to UTC now) #}
  {% set expected = '20230102' %}
  {% set actual = dbt_airflow_macros.ds_nodash() %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_ds_nodash_no_execution_date') }}

  {# Test case 3: EXECUTION_DATE is set, with timezone #}
  {% set expected = '20230101' %}
  {% set actual = dbt_airflow_macros.ds_nodash(timezone="Asia/Tokyo") %}
  {{ dbt_unittest.assert_equals(expected, actual, 'test_ds_nodash_with_timezone') }}
{% endmacro %}
