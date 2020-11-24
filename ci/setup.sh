#!/bin/bash
set -e

# The script validates YAML files.

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

pip3 install --no-cache-dir --force-reinstall -r "${PROJECT_DIR}/dev/requirements-dev.txt"
