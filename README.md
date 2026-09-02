# ExcelAutomation

Working data and tooling for automating construction quantity-survey (Metraj /
Hakediş) Excel workbooks.

## Contents

- `Yapay Zeka Çalışması/` — source Excel (`.xlsx`) workbooks and reference PDFs.
- `scripts/` — Python utilities for reading and processing the workbooks.

## Development setup

Requires Python 3.12+. On Debian/Ubuntu the bootstrap script installs the
`python3-venv` package automatically if it is missing (uses `sudo apt-get`).

```bash
# One-time / idempotent bootstrap: creates .venv and installs dependencies.
bash .cursor/install.sh

# Activate the environment for subsequent commands.
source .venv/bin/activate
```

Dependencies are declared in `requirements.txt` (`openpyxl`, `pandas`).

## Usage

Summarize every workbook in the repository (sheet names, dimensions, headers):

```bash
python scripts/inspect_workbooks.py
```
