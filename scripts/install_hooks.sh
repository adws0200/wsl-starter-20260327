#!/usr/bin/env bash
set -euo pipefail

git config core.hooksPath .githooks
echo "[ok] Git hooks path set to .githooks"
