#!/usr/bin/env bash

# Sets up the project for local development.
# Run this when you first check out the repository.

set -e

PYTHON=python3.9
VENV=.venv

echo "Creating virtual environment"
$PYTHON -m venv $VENV

echo "Activating virtual environment"
source $VENV/bin/activate

echo "Updating pip"
python -m pip install --upgrade pip

echo "Installing dev dependencies"
pip install -r requirements/dev-all.txt

echo "Installing pre-commit hook"
pre-commit install
