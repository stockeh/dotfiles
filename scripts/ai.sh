#!/usr/bin/env bash
set -euo pipefail

# Claude Code (Anthropic) — native install, no Node required
if ! command -v claude >/dev/null 2>&1; then
  curl -fsSL https://claude.ai/install.sh | bash
fi
export PATH="$HOME/.local/bin:$PATH"

# interactive auth flows
echo "Logging in to Claude Code..."
claude /login

echo "Logging in to Codex..."
codex login
