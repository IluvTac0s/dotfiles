#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES_DIR"

if ! command -v stow >/dev/null 2>&1; then
    echo "Error: GNU Stow is not installed."
    echo "Install it with your package manager, for example:"
    echo "  sudo pacman -S stow"
    exit 1
fi

packages=()
echo "Welcome to TacoLover's DotFiles"
read -rp "Install bash dotfiles? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] && packages+=(bash)

read -rp "Install Hyprland dotfiles? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] && packages+=(hypr)

read -rp "Install Waybar dotfiles? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] && packages+=(waybar)

if (( ${#packages[@]} == 0 )); then
    echo "Nothing selected."
    exit 0
fi

echo
echo "Installing: ${packages[*]}"
stow --target="$HOME" "${packages[@]}"

echo "Dotfiles installed successfully."

