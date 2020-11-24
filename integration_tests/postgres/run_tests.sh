#!/bin/bash
set -e

BASE_DIR="$(dirname "$(readlink -f "$0")")"

profiles_dir="${BASE_DIR}/profiles"
profile="integration_tests"
target="postgres"

# Install dbt packages
echo "Execute 'ebt deps'"
dbt deps \
  --profiles-dir "$profiles_dir" \
  --profile "$profiles" \
  --target "$target"

# Run dbt models
echo "Execute 'ebt run'"
dbt run \
  --profiles-dir "$profiles_dir" \
  --profile "$profiles" \
  --target "$target"

# Run dbt tests
echo "Execute 'ebt test'"
dbt test \
  --profiles-dir "$profiles_dir" \
  --profile "$profiles" \
  --target "$target"
