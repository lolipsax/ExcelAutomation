#!/usr/bin/env bash
# Idempotent bootstrap for the ExcelAutomation development environment.
# Ensures python venv support is available, creates a project-local
# virtualenv, and installs the Python dependencies.
set -euo pipefail

cd "$(dirname "$0")/.."

PYTHON_BIN="${PYTHON_BIN:-python3}"
VENV_DIR=".venv"

# The stock base image ships Python without the `venv` module, so make sure
# it is available before we try to create the virtualenv. This is a no-op when
# python3-venv is already installed.
if ! "$PYTHON_BIN" -c "import ensurepip, venv" >/dev/null 2>&1; then
  PKG="python3-venv"
  echo "python venv support missing; installing $PKG ..."
  if command -v sudo >/dev/null 2>&1; then
    sudo apt-get update -qq && sudo apt-get install -y -qq "$PKG"
  else
    apt-get update -qq && apt-get install -y -qq "$PKG"
  fi
fi

if [ ! -d "$VENV_DIR" ]; then
  "$PYTHON_BIN" -m venv "$VENV_DIR"
fi

# shellcheck disable=SC1091
source "$VENV_DIR/bin/activate"

python -m pip install --upgrade pip
python -m pip install -r requirements.txt

python -c "import openpyxl, pandas; print('openpyxl', openpyxl.__version__, '| pandas', pandas.__version__)"
