#!/usr/bin/env bash

# Sets up the project for local development.
# Run this when you first check out the repository.

set -e

PYTHON_VERSION=python3.9
VENV=.venv
PYTHON=.venv/bin/python

echo "Creating virtual environment"
$PYTHON_VERSION -m venv $VENV

dev-scripts/install-deps.sh

echo "Installing pre-commit hook"
$VENV/bin/pre-commit install
