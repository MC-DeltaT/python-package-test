#!/usr/bin/env bash

set -e

echo "Activating virtual environment"
source .venv/bin/activate

echo "Updating pip"
pip install --upgrade pip

echo "Syncing packages"
pip-sync requirements/dev-all.txt
