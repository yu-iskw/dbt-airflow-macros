# dbt-airflow-macros
[![Build Status](https://circleci.com/gh/yu-iskw/dbt-airflow-macros.svg?style=svg)](https://app.circleci.com/pipelines/github/yu-iskw/dbt-airflow-macros)

This is a dbt package to use macros inspired by Apache Airflow.
The macros are not warehouse-specific.
Those work with any warehouse.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Recommended environments](#recommended-environments)
- [Installation](#installation)
- [Environment variable](#environment-variable)
- [Macros](#macros)
- [Examples](#examples)
- [Tested environments](#tested-environments)
- [Links](#links)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Recommended environments
- Python: 3.6, 3.7 and 3.8
- dbt: >=0.17.0

## Installation
Include in `packages.yaml`
```yaml
packages:
  - git: "https://github.com/yu-iskw/dbt-airflow-macros.git"
    revision: 0.2.2
```

## Environment variable
The shell environment variable `EXECUTION_DATE` enables us to pass the date and time for the dbt macros.
The ISO 8601 format is available, because the package uses `datetime.datetime.fromisoformat` internally.
If we don't set `EXECUTION_DATE`, then it is set to the current UTC date and time.

```bash
EXECUTION_DATE="2020-01-01T01:23:45" dbt run

EXECUTION_DATE="2020-01-01" dbt run
```

## Macros
The package includes the following macros.
`timezone` is an optional argument.
When it is set to `none`, the timezone is UTC by default.

|Macro                                             |Description                                  |
|--------------------------------------------------|---------------------------------------------|
|`dbt_airflow_macros.execution_date(timezone=none)`|`datetime.datetime` object                   |
|`dbt_airflow_macros.ds(timezone=none)`            |`"%Y-%m-%d"` of execution time               |
|`dbt_airflow_macros.ds_nodash(timezone=none)`     |`"%Y%m%d"` of execution time                 |
|`dbt_airflow_macros.ts(timezone=none)`            |`"%Y-%m-%dT%H:%M:%S+00:00"` of execution time|
|`dbt_airflow_macros.ts_nodash(timezone=none)`     |`"%Y%m%dT%H%M%S"`of execution_time           |

## Examples
[`test_macros.sql`](./integration_tests/postgres/models/test_macros.sql) is a file to test the macros on PostgreSQL.
Those would be helpful to understand how to use the macros.

## Tested environments
The continuous integration tested the dbt package with the environments below.

- dbt-airflow-macros==0.2.x
  - Python: 3.6, 3.7 and 3.8
  - dbt: 0.17.2, 0.18.1, 0.19.0, 0.20.0 and 0.21.0

## Links
* [dbt_airflow_macros on dbt hub](https://hub.getdbt.com/yu-iskw/dbt_airflow_macros/latest/)
* [Use Airflow\-like macros in dbt | Medium](https://yu-ishikawa.medium.com/use-airflow-like-macros-in-dbt-4bc9fba8e21a)
