#!/usr/bin/env bash
set -euo pipefail

echo "[check] node: $(node -v)"
echo "[check] npm: $(npm -v)"
echo "[check] pnpm: $(pnpm -v)"
echo "[check] python: $(python3 --version 2>&1)"
echo "[check] pip: $(pip3 --version)"

echo "[run] lint"
npm run lint >/dev/null

echo "[run] test"
npm run test >/dev/null

echo "[ok] bootstrap checks passed"
