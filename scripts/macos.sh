#!/usr/bin/env bash
set -euo pipefail

# dock
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
defaults write com.apple.dock orientation -string left
killall Dock

# screenshots
mkdir -p "$HOME/Downloads/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Downloads/Screenshots"
killall SystemUIServer
