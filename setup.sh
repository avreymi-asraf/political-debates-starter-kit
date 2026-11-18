#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_FILE="$SCRIPT_DIR/.env"

if [ ! -f "$ENV_FILE" ]; then
  cat <<'EOF' > "$ENV_FILE"
# Add your TwitterAPI.io key below
TWITTERAPI_KEY=
EOF
  echo "Created $ENV_FILE. Please add your TWITTERAPI_KEY to it."
fi

set -a
# shellcheck disable=SC1090
source "$ENV_FILE"
set +a

echo "Environment loaded from $ENV_FILE."
