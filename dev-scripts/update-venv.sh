#!/usr/bin/env bash

set -e

VENV=.venv

echo "Activating virtual environment"
source $VENV/bin/activate

echo "Updating pip"
pip install --upgrade pip

echo "Syncing packages"
pip-sync requirements/dev-all.txt
