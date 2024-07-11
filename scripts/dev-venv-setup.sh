#!/usr/bin/env bash

set -e

echo "Creating virtual environment"
python3.9 -m venv .venv

echo "Activating virtual environment"
source .venv/bin/activate

echo "Updating pip"
python3.9 -m pip install --upgrade pip

echo "Installing dev dependencies"
pip install -r requirements/dev-all.txt
