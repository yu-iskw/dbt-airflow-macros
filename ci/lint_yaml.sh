#!/bin/bash
set -e

# The script validates YAML files.

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

yamllint -c "${PROJECT_DIR}/.yamllintrc.yml" "${PROJECT_DIR}"/*.yml
yamllint -c "${PROJECT_DIR}/.yamllintrc.yml" "${PROJECT_DIR}"/macros/*.yml
