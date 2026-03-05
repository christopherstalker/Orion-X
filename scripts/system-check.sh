#!/usr/bin/env bash
set -euo pipefail

pnpm run --if-present lint
pnpm run --if-present test
pnpm run --if-present build

echo "system-check complete"
