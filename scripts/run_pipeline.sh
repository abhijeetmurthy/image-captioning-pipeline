#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

MODE="${1:-validate}"

if ! python3 - <<'PY'
import importlib.util
import sys
required = ["numpy", "pandas", "PIL", "tensorflow"]
missing = [pkg for pkg in required if importlib.util.find_spec(pkg) is None]
if missing:
    print("Missing Python package(s): " + ", ".join(missing))
    print("Install with: python3 -m pip install -r requirements.txt")
    sys.exit(1)
PY
then
  exit 1
fi

case "$MODE" in
  validate)
    echo "Dependency validation passed."
    echo "Legacy training script is main.py (expects local Flickr8k/Glove paths)."
    echo "Run with: ./scripts/run_pipeline.sh legacy"
    ;;
  legacy)
    python3 main.py
    ;;
  *)
    echo "Unknown mode: $MODE"
    echo "Usage: ./scripts/run_pipeline.sh [validate|legacy]"
    exit 1
    ;;
esac
