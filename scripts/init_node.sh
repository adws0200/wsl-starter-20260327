#!/usr/bin/env bash
set -euo pipefail

if command -v corepack >/dev/null 2>&1; then
  if ! corepack enable >/dev/null 2>&1; then
    echo "[warn] corepack enable skipped (needs elevated permissions in this environment)"
  fi
fi

if [ -f package.json ]; then
  npm install --package-lock-only >/dev/null 2>&1 || true
fi

echo "[ok] Node environment initialized"
