#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES_DIR"

if ! command -v stow >/dev/null 2>&1; then
    printf '%s\n' \
        "Error: GNU Stow is not installed." \
        "Install it with:" \
        "  sudo pacman -S stow"
    exit 1
fi

packages=()

printf '%s\n' \
    "Welcome to TacoLover's Dotfiles" \
    "" \
    "Requirements:" \
    "  - bash or zsh" \
    "  - Hyprland" \
    "    - kitty" \
    "    - hyprpaper" \
    "  - Waybar" \
    "  - GNU Stow" \
    ""

read -rp "Install zsh dotfiles? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] && packages+=(zsh)

read -rp "Install bash dotfiles? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] && packages+=(bash)

read -rp "Install Hyprland dotfiles? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] && packages+=(hypr)

read -rp "Install Waybar dotfiles? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] && packages+=(waybar)

if (( ${#packages[@]} == 0 )); then
    printf '%s\n' "Nothing selected."
    exit 0
fi

printf '\nInstalling: %s\n' "${packages[*]}"

stow --target="$HOME" "${packages[@]}"

printf '%s\n' "Dotfiles installed successfully."
