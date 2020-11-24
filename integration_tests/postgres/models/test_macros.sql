{{
    config(
        materialized="table",
    )
}}

SELECT
  {{ ds() }} AS ds,
  {{ ds_nodash() }} AS ds_nodash,
  {{ ts() }} AS ts,
  {{ ts_nodash() }} AS ts_nodash
