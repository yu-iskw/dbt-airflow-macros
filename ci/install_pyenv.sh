#!/bin/bash
set -e

# Install pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# Set environment variables
# shellcheck disable=SC2016
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
# shellcheck disable=SC2016
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
# shellcheck disable=SC2016
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.profile
