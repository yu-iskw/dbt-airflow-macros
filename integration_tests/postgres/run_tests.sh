#!/bin/bash
set -e

BASE_DIR="$(dirname "$(readlink -f "$0")")"

# Parameters
project_dir="${BASE_DIR}"
profiles_dir="${BASE_DIR}/profiles"
profile="integration_tests"
target="postgres"

# Install dbt packages
echo "Execute 'dbt deps'"
dbt deps \
  --project-dir "$project_dir" \
  --profiles-dir "$profiles_dir" \
  --profile "$profile" \
  --target "$target"

# Run dbt unit tests
echo "Execute 'dbt run-operation run_unit_tests'"
EXECUTION_DATE="2023-01-01T00:00:00" dbt run-operation run_unit_tests \
  --project-dir "$project_dir" \
  --profiles-dir "$profiles_dir" \
  --profile "$profile" \
  --target "$target"
