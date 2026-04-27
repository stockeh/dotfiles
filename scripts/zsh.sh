#!/usr/bin/env bash
set -euo pipefail

# install oh-my-zsh non-interactively (don't auto-chsh, don't drop into zsh)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=no \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
ZSHRC="$HOME/.zshrc"

# eza aliases
cat > "$ZSH_CUSTOM/aliases.zsh" <<'EOF'
alias ls='eza'
alias l='eza --long --group-directories-first --icons=always'
alias la='eza --long --all --group --group-directories-first'
alias lt='eza --tree --level=2 --color=always --group-directories-first --icons=always'
alias l.="eza -a | grep -E '^\.'"
EOF

# plugins
sed -i '' 's/^plugins=.*/plugins=(git macos z)/' "$ZSHRC"
