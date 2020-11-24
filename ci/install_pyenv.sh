#!/bin/bash
set -e

# Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Set environment variables
# shellcheck disable=SC2016
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
# shellcheck disable=SC2016
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile

# Update pyenv database
pyenv update
