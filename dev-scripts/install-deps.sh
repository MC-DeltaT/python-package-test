#!/usr/bin/env bash

# Installs packages in the Python virtual environment to align with the requirements files.

set -e

VENV=.venv

echo "Updating pip"
$VENV/bin/python -m pip install --upgrade pip

echo "Installing dev dependencies"
$VENV/bin/pip install -c requirements/package.txt \
    -r requirements/dev-only.txt \
    -r requirements/lint-only.txt \
    -r requirements/tox-only.txt \
    -r requirements/typing-only.txt \
    -r requirements/unittest-only.txt