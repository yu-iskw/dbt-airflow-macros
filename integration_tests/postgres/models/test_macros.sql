{{
    config(
        materialized="table",
    )
}}

SELECT
  TO_DATE(E'{{ dbt_airflow_macros.ds() }}', 'YYYY-MM-DD') AS ds,
  TO_DATE(E'{{ dbt_airflow_macros.ds(timezone="Asia/Tokyo") }}', 'YYYY-MM-DD') AS ds_with_timezone,
  TO_DATE(E'{{ dbt_airflow_macros.ds_nodash() }}', 'YYYYMMDD') AS ds_nodash,
  TO_DATE(E'{{ dbt_airflow_macros.ds_nodash(timezone="Asia/Tokyo") }}', 'YYYYMMDD') AS ds_nodash_with_timezone,
  TO_TIMESTAMP(E'{{ dbt_airflow_macros.ts() }}', 'YYYY-MM-DDT%HH24:MI:SS+00:00') AS ts,
  TO_TIMESTAMP(E'{{ dbt_airflow_macros.ts(timezone="Asia/Tokyo") }}', 'YYYY-MM-DDT%HH24:MI:SS+00:00') AS ts_with_timezone,
  TO_TIMESTAMP(E'{{ dbt_airflow_macros.ts_nodash() }}', 'YYYYMMDDT%HH24MISS') AS ts_nodash,
  TO_TIMESTAMP(E'{{ dbt_airflow_macros.ts_nodash(timezone="Asia/Tokyo") }}', 'YYYYMMDDT%HH24MISS') AS ts_nodash_with_timezone
