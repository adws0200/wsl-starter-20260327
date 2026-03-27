#!/usr/bin/env bash
set -euo pipefail

NODE_PORT="${SMOKE_NODE_PORT:-3100}"
PY_PORT="${SMOKE_PY_PORT:-8100}"

cleanup() {
  if [[ -n "${NODE_PID:-}" ]] && kill -0 "$NODE_PID" 2>/dev/null; then
    kill "$NODE_PID" 2>/dev/null || true
  fi
  if [[ -n "${PY_PID:-}" ]] && kill -0 "$PY_PID" 2>/dev/null; then
    kill "$PY_PID" 2>/dev/null || true
  fi
}
trap cleanup EXIT

wait_health() {
  local url="$1"
  local max_attempts=30
  local delay=0.2

  for ((i=1; i<=max_attempts; i++)); do
    if curl -fsS "$url" >/dev/null 2>&1; then
      return 0
    fi
    sleep "$delay"
  done

  echo "[smoke] timeout waiting for: $url" >&2
  return 1
}

echo "[smoke] starting Node server on :$NODE_PORT"
PORT="$NODE_PORT" npm run serve >/tmp/wsl-starter-node-smoke.log 2>&1 &
NODE_PID=$!
wait_health "http://127.0.0.1:${NODE_PORT}/health"
NODE_HEALTH=$(curl -fsS "http://127.0.0.1:${NODE_PORT}/health")
echo "[smoke] node health: $NODE_HEALTH"

echo "[smoke] starting Python server on :$PY_PORT"
PY_PORT="$PY_PORT" npm run py:serve >/tmp/wsl-starter-py-smoke.log 2>&1 &
PY_PID=$!
wait_health "http://127.0.0.1:${PY_PORT}/health"
PY_HEALTH=$(curl -fsS "http://127.0.0.1:${PY_PORT}/health")
echo "[smoke] py health: $PY_HEALTH"

echo "[smoke] passed"
