{{
    config(
        materialized="table",
    )
}}

SELECT
  E'{{ dbt_airflow_macros.ds() }}' AS ds,
  E'{{ dbt_airflow_macros.ds_nodash() }}' AS ds_nodash,
  E'{{ dbt_airflow_macros.ts() }}' AS ts,
  E'{{ dbt_airflow_macros.ts_nodash() }}' AS ts_nodash
