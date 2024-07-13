#!/usr/bin/env bash

set -e

cd requirements

echo "Compiling base package requirements"
pip-compile package.in -o package.txt

echo "Compiling lint requirements"
pip-compile lint-only.in -c package.txt 

echo "Compiling static typing requirements"
pip-compile typing-only.in -c package.txt

echo "Compiling unit test requirements"
pip-compile unittest-only.in -c package.txt

echo "Compiling tox requirements"
pip-compile tox-only.in -c package.txt

echo "Compiling dev requirements"
pip-compile dev-only.in -o dev-all.txt \
    package.txt lint-only.txt typing-only.txt unittest-only.txt tox-only.txt
