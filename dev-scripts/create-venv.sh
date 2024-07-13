#!/usr/bin/env bash

set -e

PYTHON=python3.9

echo "Creating virtual environment"
$PYTHON -m venv .venv

echo "Activating virtual environment"
source .venv/bin/activate

echo "Updating pip"
python -m pip install --upgrade pip

echo "Installing dev dependencies"
pip install -r requirements/dev-all.txt
pip install -e .

echo "Installing pre-commit hook"
pre-commit install
