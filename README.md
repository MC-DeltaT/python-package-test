# Python Package Test

A test of modern Python development, packaging, and CI.

## Goals

- Efficient developer workflow;
- No reinventing the wheel;
- Code safety enforced by default;
- Simple and flexible CI setup.

The project targets Python >=3.9 on Linux. Windows could be supported too, although the developer setup has only been tuned for Linux in this example.

## Package Dependencies

Python package dependencies are managed with requirements files and pip-tools. The goal with dependencies is to ensure consistency across multiple environments - development, testing, CI, and deployment - without inefficiently lumping all requirements together.

The core package dependencies are specified in `package.in`. These are the dependencies that are required when users install the published package. Additional dependencies required in specific scenarios are provided in other files: for example, `unittest-only.in` for unit testing. Finally, `dev-all.txt` compiles all dependencies required in all scenarios to ensure developers can run everything locally.

Notably, additional dependencies are not provided as "optional dependencies" on the package (e.g. `pip install python-package-test[dev]`). This is because I don't believe one should be installing the package to, for example, run tests - check out the project source instead.

## Linting

All Python code is linted and autoformatted to reduce developer cognitive load thinking about code style. Linting and formatting is done with Ruff.

The formatting style in this project is mostly out-of-the-box Ruff. It could easily be configured differently as desired.

Autoformatting is run as a pre-commit hook. This ensures formatting is always done and reduces the chance of accidentally ending up with lint check errors.

## Testing

All tests and code checks are managed by Tox, for ease of use, consistency, and ability to run tests in multiple Python versions.

Tests include:

- Linting with Ruff;
- Static typing with MyPy;
- Unit tests with Pytest
  - On all compatible Python versions.

By default, Tox runs all tests for safety.

Labelled groups are provided for subsets of tests, if waiting for all tests is too slow. These can be invoked with `tox -m`:

- `dev`: Linting, stating typing, and Python 3.9 unit tests.
- `unittest`: Unit tests on all Python versions.

## Development Setup

All local development is contained within a Python virtual environment. Virtual environments allow development of the project independent to whatever other Python setup exists on your system. They help with consistent development and behaviour across different systems.

Scripts are provided in `dev-scripts` to assist with development steps, such as:

- Creating the virtual environment;
- Recompiling Python dependencies;
- Cleaning build artifacts.

Shell scripts are preferred to Makefiles for simplicity, since nothing requires the recipe-based nature of Make.

## CI

GitHub Actions is used for CI building, testing, and deployment. On commits, Tox tests are run as described previously. Additional quality assurance tests run for development workflow steps.

## Release and Versioning

Package release is done via GitHub releases and GitHub Actions. Upon creating a release, an Action builds the package for publishing to PyPi. (Publishing is not actually implemented here, but could be added easily.)

Package versioning is handled by setuptools_scm, which determines the version string from the Git tag created during the release process.
