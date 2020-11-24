# dbt-airflow-macros
[![Build Status](https://circleci.com/gh/yu-iskw/dbt-airflow-macros.svg?style=svg)](https://app.circleci.com/pipelines/github/yu-iskw/dbt-airflow-macros)


This is a dbt package to use macros inspired by Apache Airflow.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Installation](#installation)
- [Usage](#usage)
- [Macros](#macros)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Installation
Include in `packages.yaml`
```yaml
packages:
  - git: "https://github.com/yu-iskw/dbt-airflow-macros.git"
    revision: 0.1.0
```

## Usage
The shell environment variable `EXECUTION_DATE` enables us to pass the date and time for the dbt macros.
The ISO 8601 format is available, because the package uses `datetime.datetime.fromisoformat` internally.
If we don't set `EXECUTION_DATE`, then it is set to the system local time no matter what time zone it uses.

```bash
EXECUTION_DATE="2020-01-01T01:23:45" dbt run

EXECUTION_DATE="2020-01-01" dbt run
```


## Macros

|Macro           |Description                                  |
|----------------|---------------------------------------------|
|`execution_date`|`datetime.datetime` object                   |
|`ds`            |`"%Y-%m-%d"` of execution time               |
|`ds_nodash`     |`"%Y%m%d"` of execution time                 |
|`ts`            |`"%Y-%m-%dT%H:%M:%S+00:00"` of execution time|
|`ts_nodash`     |`"%Y%m%dT%H%M%S"`of execution_time           |
