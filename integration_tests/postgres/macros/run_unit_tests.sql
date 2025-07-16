{% macro run_unit_tests() %}
  {{ integration_tests.test_execution_date() }}
  {{ integration_tests.test_ds() }}
  {{ integration_tests.test_ds_nodash() }}
  {{ integration_tests.test_ts() }}
  {{ integration_tests.test_ts_nodash() }}

  {{ print("All tests passed") }}
{% endmacro %}
