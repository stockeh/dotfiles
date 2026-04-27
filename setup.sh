#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$DIR/scripts/homebrew.sh"
"$DIR/scripts/ghostty.sh"
"$DIR/scripts/zsh.sh"
"$DIR/scripts/ai.sh"
"$DIR/scripts/git.sh"

mkdir -p "$HOME/Development/scratch"
