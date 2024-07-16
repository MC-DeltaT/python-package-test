#!/usr/bin/env bash

# Installs/removes packages in the Python virtual environment to align with the requirements files.
# Useful to run after update-requirements.sh

set -e

VENV=.venv

echo "Activating virtual environment"
source $VENV/bin/activate

echo "Updating pip"
pip install --upgrade pip

echo "Syncing packages"
pip-sync requirements/dev-all.txt
