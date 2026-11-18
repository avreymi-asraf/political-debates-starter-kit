#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/setup.log"
exec > >(tee -a "$LOG_FILE") 2>&1
echo "--- setup.sh run at $(date -Iseconds) ---"

ENV_FILE="$SCRIPT_DIR/.env"

if [ ! -f "$ENV_FILE" ]; then
  cat <<'EOF' > "$ENV_FILE"
# Add your TwitterAPI.io key below
TWITTERAPI_KEY=
EOF
  echo "Created $ENV_FILE. Please add your TWITTERAPI_KEY to it."
fi

UPLOAD_ENV_FILE="/home/antigravity/upload/.env"

set -a
# shellcheck disable=SC1090
source "$ENV_FILE"
if [ -f "$UPLOAD_ENV_FILE" ]; then
  # shellcheck disable=SC1090
  source "$UPLOAD_ENV_FILE"
fi
set +a

echo "Environment loaded from $ENV_FILE."
if [ -f "$UPLOAD_ENV_FILE" ]; then
  echo "Environment also loaded from $UPLOAD_ENV_FILE."
fi
