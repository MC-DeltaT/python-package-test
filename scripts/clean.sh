#!/usr/bin/env bash

set -e

echo "Deleting all dev and build artifacts"
rm -rf .venv *.egg-info
