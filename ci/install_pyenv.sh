#!/bin/bash
set -e

# Constants
PYENV_ROOT="${HOME}/.pyenv"

# Install pyenv
git clone https://github.com/pyenv/pyenv.git "$PYENV_ROOT"

# Install python-build
#bash "${PYENV_ROOT}/plugins/python-build/install.sh"

# Install python 3.8 as default
"${PYENV_ROOT}"/bin/pyenv install 3.8.6
"${PYENV_ROOT}"/bin/pyenv global 3.8.6

# Set environment variables
# shellcheck disable=SC2016
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
# shellcheck disable=SC2016
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
# shellcheck disable=SC2016
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
