#!/usr/bin/env bash

set -e

echo "Deleting all dev and build artifacts"
rm -rf .venv .tox .ruff_cache *.egg-info dist .mypy_cache .pytest_cache
find . -name __pycache__ -type d -exec rm -rf {} +
