#!/usr/bin/env bash

# Path to your keybinds file
KEYBINDS_FILE="$HOME/nixos-config/dotfiles/hypr/keybinds.conf"

# Format and show in wofi
grep '^bind' "$KEYBINDS_FILE" \
  | sed 's/^bind = //' \
  | sed -E 's/, ?exec, ?/\t→ /; s/, ?$//' \
  | column -t -s $'\t' \
  | wofi --dmenu --prompt "Hyprland Keybinds" --width 600 --height 500

