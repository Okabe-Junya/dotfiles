#!/usr/bin/env zsh

# macOS system preferences managed via `defaults write`
# Intended for Apple Silicon Macs running macOS Sequoia or later

set -euo pipefail

echo "Applying macOS system preferences..."

# =============================================================================
# Appearance
# =============================================================================

# Dark mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# =============================================================================
# Dock
# =============================================================================

# Icon size (pixels)
defaults write com.apple.dock tilesize -int 64

# =============================================================================
# Finder
# =============================================================================

# Default view style: list view
# Nlsv = list, icnv = icon, clmv = column, glyv = gallery
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# =============================================================================
# Keyboard
# =============================================================================

# Key repeat rate (lower = faster, default: 6)
defaults write NSGlobalDomain KeyRepeat -int 2

# Delay until key repeat (lower = shorter, default: 25)
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# =============================================================================
# Hot Corners
# =============================================================================

# Bottom-right corner: Quick Note (14)
#   0: no action, 2: Mission Control, 3: App Windows,
#   4: Desktop, 5: Screen Saver (start), 6: Screen Saver (disable),
#   10: Put Display to Sleep, 11: Launchpad, 12: Notification Center,
#   13: Lock Screen, 14: Quick Note
defaults write com.apple.dock wvous-br-corner -int 14
defaults write com.apple.dock wvous-br-modifier -int 0

# =============================================================================
# Apply changes
# =============================================================================

killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true
killall SystemUIServer 2>/dev/null || true

echo "macOS system preferences applied!"
