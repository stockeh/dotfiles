#!/usr/bin/env bash
set -euo pipefail

# git identity (use existing config as defaults if present)
CURRENT_NAME="$(git config --global user.name 2>/dev/null || true)"
read -rp "Git name${CURRENT_NAME:+ [$CURRENT_NAME]}: " NAME
NAME="${NAME:-$CURRENT_NAME}"

CURRENT_EMAIL="$(git config --global user.email 2>/dev/null || true)"
read -rp "Git email${CURRENT_EMAIL:+ [$CURRENT_EMAIL]}: " EMAIL
EMAIL="${EMAIL:-$CURRENT_EMAIL}"

if [ -z "$NAME" ] || [ -z "$EMAIL" ]; then
  echo "name and email are required" >&2
  exit 1
fi

git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
git config --global init.defaultBranch main
git config --global pull.rebase false

# ssh key
SSH_KEY="$HOME/.ssh/id_ed25519"
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
if [ ! -f "$SSH_KEY" ]; then
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$SSH_KEY"
fi

# ~/.ssh/config: use macOS keychain for github.com
SSH_CONFIG="$HOME/.ssh/config"
touch "$SSH_CONFIG"
chmod 600 "$SSH_CONFIG"
if ! grep -qF "Host github.com" "$SSH_CONFIG"; then
  cat >> "$SSH_CONFIG" <<EOF

Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile $SSH_KEY
EOF
fi

ssh-add --apple-use-keychain "$SSH_KEY"

# copy public key and open GitHub SSH settings
pbcopy < "${SSH_KEY}.pub"
echo "Public key copied to clipboard."
open "https://github.com/settings/ssh/new"
