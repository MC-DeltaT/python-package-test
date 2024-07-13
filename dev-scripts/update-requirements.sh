#!/usr/bin/env bash

# Recompile Python package requirements .txt files based on the .in requirements files.

set -e

# Note we compile the requirements in the project root directory, since most tooling operates in the root.
# Particularly, the package editable mode install uses a relative path.
# That path must align with the root directory for it to be pip-install'ed in the root directory later.

echo "Compiling base package requirements"
pip-compile requirements/package.in -o requirements/package.txt

echo "Compiling lint requirements"
pip-compile requirements/lint-only.in -c requirements/package.txt 

echo "Compiling static typing requirements"
pip-compile requirements/typing-only.in -c requirements/package.txt

echo "Compiling unit test requirements"
pip-compile requirements/unittest-only.in -c requirements/package.txt

echo "Compiling tox requirements"
pip-compile requirements/tox-only.in -c requirements/package.txt

echo "Compiling dev requirements"
pip-compile requirements/dev-only.in -o requirements/dev-all.txt \
    requirements/package.txt \
    requirements/lint-only.txt requirements/typing-only.txt \
    requirements/unittest-only.txt requirements/tox-only.txt
