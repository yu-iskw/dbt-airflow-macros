#!/bin/bash
set -e

BASE_DIR="$(dirname "$(readlink -f "$0")")"

# Parameters
project_dir="${BASE_DIR}"
profiles_dir="${BASE_DIR}/profiles"
profile="integration_tests"
target="postgres"

# Change the working directory
cd "${BASE_DIR}"
echo "Current directory: $(pwd)"

# Install dbt packages
echo "Execute 'dbt deps'"
dbt deps \
  --profiles-dir "$profiles_dir" \
  --profile "$profile" \
  --target "$target"

# Run dbt models
echo "Execute 'dbt run'"
dbt run \
  --profiles-dir "$profiles_dir" \
  --profile "$profile" \
  --target "$target"

# Run dbt tests
echo "Execute 'dbt test'"
dbt test \
  --profiles-dir "$profiles_dir" \
  --profile "$profile" \
  --target "$target"
