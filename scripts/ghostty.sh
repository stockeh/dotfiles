#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
CONFIG_FILE="$CONFIG_DIR/config"

mkdir -p "$CONFIG_DIR"

cat > "$CONFIG_FILE" <<'EOF'
# appearance
theme = dark:Dracula,light:Catppuccin Latte
font-family = FiraCode Nerd Font
background-opacity = 0.95
background-blur-radius = 20
macos-titlebar-style = tabs
window-height = 28
window-width = 99

# icon appearance
macos-icon = custom-style
macos-icon-frame = plastic
macos-icon-ghost-color = bdbdbd
macos-icon-screen-color = 4d4d4d

# functionality
shell-integration = zsh
quit-after-last-window-closed = false

# keybinds
keybind = super+shift+k=goto_split:top
keybind = super+shift+h=goto_split:left
keybind = super+shift+j=goto_split:bottom
keybind = super+shift+l=goto_split:right
keybind = global:opt+grave_accent=toggle_quick_terminal
EOF

echo "Wrote Ghostty config to $CONFIG_FILE"
