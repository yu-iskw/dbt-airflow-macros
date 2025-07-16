{% macro test_ds() %}
  {# Test case 1: EXECUTION_DATE is set, no timezone #}
  {% set expected = '2023-01-01' %}
  {% set actual = dbt_airflow_macros.ds() %}
  {{ dbt_unittest.assert_equals(expected, actual) }}

  {# Test case 2: EXECUTION_DATE is set, no timezone #}
  {% set expected = '2023-01-01' %}
  {% set actual = dbt_airflow_macros.ds() %}
  {{ dbt_unittest.assert_equals(expected, actual) }}

  {# Test case 3: EXECUTION_DATE is set, with timezone #}
  {% set expected = '2023-01-01' %}
  {% set actual = dbt_airflow_macros.ds(timezone="Asia/Tokyo") %}
  {{ dbt_unittest.assert_equals(expected, actual) }}
{% endmacro %}
