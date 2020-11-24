# dbt-airflow-macros
[![Build Status](https://img.shields.io/circleci/project/https://github.com/yu-iskw/dbt-airflow-macros/master.svg)](https://circleci.com/gh/https://github.com/yu-iskw/dbt-airflow-macros)

This is a dbt package to use macros inspired by Apache Airflow.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Installation](#installation)
- [Usage](#usage)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Installation
`packages.yaml`
```yaml
packages:
  - git: "https://github.com/yu-iskw/dbt-airflow-macros.git"
    revision: 0.1.0
```

## Usage
The shell environment variable `EXECUTION_DATE` enables us to pass the date and time for the dbt macros.
The ISO 8601 format is available, because the package uses `datetime.datetime.fromisoformat` internally.

```bash
EXECUTION_DATE="2020-01-01T01:23:45" dbt run

EXECUTION_DATE="2020-01-01" dbt run
```
