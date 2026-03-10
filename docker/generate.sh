#!/bin/sh
set -e

echo "[generate] Running icomoon-cli..."
ICONS=$(ls /app/Font/*.svg | tr '\n' ',' | sed 's/,$//')
icomoon-cli \
  --selection /app/icomoon.json \
  --icons "$ICONS" \
  --output /app/output-mount/icomoon

echo "[generate] Transforming output to dist/..."
node /app/transform.js

echo "[generate] Done."
