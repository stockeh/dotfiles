#!/usr/bin/env bash
set -uo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PASSED=""
FAILED=""

run() {
  local name="$1" script="$2"
  printf "\n==> %s\n" "$name"
  if "$script"; then
    printf "    OK\n"
    PASSED+="$name "
  else
    printf "    FAILED\n"
    FAILED+="$name "
    return 1
  fi
}

# homebrew is required for the rest
if ! run "homebrew" "$DIR/scripts/homebrew.sh"; then
  echo
  echo "homebrew is required; aborting."
  exit 1
fi

# remaining steps are independent — log failures but continue
run "ghostty" "$DIR/scripts/ghostty.sh" || true
run "zsh"     "$DIR/scripts/zsh.sh"     || true
run "ai"      "$DIR/scripts/ai.sh"      || true
run "git"     "$DIR/scripts/git.sh"     || true
run "macos"   "$DIR/scripts/macos.sh"   || true

mkdir -p "$HOME/Development/scratch"

echo
echo "==> summary"
echo "    passed: ${PASSED:-none}"
echo "    failed: ${FAILED:-none}"
