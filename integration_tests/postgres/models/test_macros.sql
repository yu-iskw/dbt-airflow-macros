{{
    config(
        materialized="table",
    )
}}

SELECT
  TO_DATE(E'{{ dbt_airflow_macros.ds() }}', 'YYYY-MM-DD') AS ds,
  TO_DATE(E'{{ dbt_airflow_macros.ds_nodash() }}', 'YYYYMMDD') AS ds_nodash,
  TO_TIMESTAMP(E'{{ dbt_airflow_macros.ts() }}', 'YYYY-MM-DDT%HH24:MI:SS+00:00') AS ts,
  TO_TIMESTAMP(E'{{ dbt_airflow_macros.ts_nodash() }}', 'YYYYMMDDT%HH24MISS') AS ts_nodash
