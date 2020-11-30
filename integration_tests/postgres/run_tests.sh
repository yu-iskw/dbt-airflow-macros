#!/bin/bash
set -e

BASE_DIR="$(dirname "$(readlink -f "$0")")"

# Parameters
project_dir="${BASE_DIR}"
profiles_dir="${BASE_DIR}/profiles"
profile="integration_tests"
target="postgres"

# Install dbt packages
echo "Execute 'dbt debug'"
dbt debug \
  --project-dir "$project_dir" \
  --profiles-dir "$profiles_dir" \
  --profile "$profile" \
  --target "$target"

# Install dbt packages
echo "Execute 'dbt deps'"
dbt deps \
  --project-dir "$project_dir" \
  --profiles-dir "$profiles_dir" \
  --profile "$profile" \
  --target "$target"

# Run dbt models
echo "Execute 'dbt run'"
dbt run \
  --project-dir "$project_dir" \
  --profiles-dir "$profiles_dir" \
  --profile "$profile" \
  --target "$target"

# Run dbt tests
echo "Execute 'dbt test'"
dbt test \
  --project-dir "$project_dir" \
  --profiles-dir "$profiles_dir" \
  --profile "$profile" \
  --target "$target"

# Run dbt docs generate
echo "Execute 'dbt docs generate'"
dbt docs generate \
  --project-dir "$project_dir" \
  --profiles-dir "$profiles_dir" \
  --profile "$profile" \
  --target "$target"
