#!/usr/bin/env bash
# Idempotent bootstrap for the ExcelAutomation development environment.
# Creates a project-local virtualenv and installs Python dependencies.
set -euo pipefail

cd "$(dirname "$0")/.."

PYTHON_BIN="${PYTHON_BIN:-python3}"
VENV_DIR=".venv"

if [ ! -d "$VENV_DIR" ]; then
  "$PYTHON_BIN" -m venv "$VENV_DIR"
fi

# shellcheck disable=SC1091
source "$VENV_DIR/bin/activate"

python -m pip install --upgrade pip
python -m pip install -r requirements.txt

python -c "import openpyxl, pandas; print('openpyxl', openpyxl.__version__, '| pandas', pandas.__version__)"
