#!/bin/bash
set -e

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# Select pip command
if $(command -v pip3 &> /dev/null) ; then
  PIP=pip3
elif $(command -v pip &> /dev/null) ; then
  PIP=pip
else
  echo "pip or pip3 don't exist"
  exit 1
fi

$PIP install --no-cache-dir --force-reinstall -r "${SCRIPT_DIR}/requirements/requirements-test.txt"
