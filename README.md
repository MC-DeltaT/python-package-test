# Python Package Test

A test of modern Python packaging.

Tests are with pytest and tox.

Code formatting is done by ruff. A precommit hook runs it automatically on commit. Lint checks are also run are part of tox tests.

Dependencies are compiled with pip-tools, with separate but consistent requirements files for release, development, and test running.

Package build is with setuptools_scm for dynamic versioning based on tags created by GitHub releases.

CI is orchestrated by GitHub Actions. Tests run on commits. Package publishing is done (actually just simulated) on release publish.
