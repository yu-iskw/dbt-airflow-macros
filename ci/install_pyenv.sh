#!/bin/bash
set -e

# Constants
PYENV_ROOT="${HOME}/.pyenv"

# Install pyenv
git clone https://github.com/pyenv/pyenv.git "$PYENV_ROOT"

# Set environment variables
# shellcheck disable=SC2016
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
# shellcheck disable=SC2016
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
