#!/bin/bash
set -e

# The script validates YAML files.

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

yamllint "${PROJECT_DIR}"/*.yml
yamllint "${PROJECT_DIR}"/macros/*.yml
