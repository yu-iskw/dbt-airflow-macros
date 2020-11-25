{{
    config(
        materialized="table",
    )
}}

SELECT
  '{{ dbt_airflow_macros.ds() }}' AS ds,
  '{{ dbt_airflow_macros.ds_nodash() }}' AS ds_nodash,
  '{{ dbt_airflow_macros.ts() }}' AS ts,
  '{{ dbt_airflow_macros.ts_nodash() }}' AS ts_nodash
