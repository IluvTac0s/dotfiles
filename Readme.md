# My Dotfiles

Personal Arch Linux dotfiles for a Hyprland desktop.

The setup currently includes:

- Hyprland configuration written with Lua
- Kitty terminal
- Zsh and Bash configuration
- Waybar
- Neovim as the default editor
- Git-aware Zsh prompt
- Purple/lavender color theme
- Multimedia and brightness keybindings

## Repository layout

```text
.
├── bash/
│   └── .bashrc
├── hypr/
│   └── .config/hypr/
├── kitty/
│   └── .config/kitty/kitty.conf
├── waybar/
│   └── .config/waybar/
├── zsh/
│   └── .zshrc
├── install.sh
└── Readme.md
```

## Requirements

This repository is designed for Arch Linux and uses GNU Stow.

Install the core packages:

```bash
sudo pacman -S --needed \
    git \
    stow \
    bash \
    zsh \
    neovim \
    kitty \
    hyprland \
    waybar \
    blueman\
    network-manager-applet\
    hyprpaper \
    hyprlauncher \
    btop \
    firefox \
    dolphin \
    playerctl \
    brightnessctl \
    pipewire \
    pipewire-audio \
    pipewire-pulse \
    wireplumber
```

The Hyprland configuration uses `hyprpaper` for wallpapers, `waybar` for the status bar, `kitty` as the terminal, and `hyprlauncher` as the application launcher. Several keybindings also rely on `playerctl` and `brightnessctl`.

Some packages may be in the AUR or may have different availability depending on the current Arch repositories.

## Optional recommended packages

These packages improve the overall experience:

```bash
sudo pacman -S --needed \
    man-db \
    less \
    unzip \
    p7zip \
    tar \
    gzip \
    ripgrep \
    fd \
    fzf \
    bat \
    eza \
    zoxide \
    wl-clipboard \
    mako \
    hyprlock \
    hypridle \
    hyprpicker \
    xdg-desktop-portal \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    polkit-kde-agent
```

What they provide:

| Package | Purpose |
|---|---|
| `man-db` and `less` | Manual pages and pager support |
| `ripgrep` | Fast text searching |
| `fd` | Fast alternative to `find` |
| `fzf` | Fuzzy finding in the terminal |
| `bat` | Improved `cat` replacement |
| `eza` | Improved `ls` replacement |
| `zoxide` | Smarter directory jumping |
| `wl-clipboard` | Wayland clipboard support |
| `mako` | Notifications |
| `hyprlock` | Screen locking |
| `hypridle` | Idle and suspend handling |
| `hyprpicker` | Color picker |
| `xdg-desktop-portal-*` | File pickers and desktop integration |
| `polkit-kde-agent` | Graphical authentication prompts |

Hyprland's ecosystem commonly uses `hyprlock`, `hypridle`, `hyprpaper`, `waybar`, clipboard tools, portals, and notification daemons as separate components rather than as one desktop environment. <citation src="1"></citation>

## Fonts

The Waybar configuration currently uses:

```css
font-family: "DepartureMono Nerd Font";
```

Install the font if it is available from your configured repositories or AUR helper.

For example:

```bash
yay -S nerd-fonts
```

Check whether the font is available:

```bash
fc-list | grep -i "Departure"
```

If it is not installed, change the font in:

```text
waybar/.config/waybar/style.css
```

For example:

```css
font-family: "JetBrainsMono Nerd Font";
```

Then install the replacement font:

```bash
sudo pacman -S --needed ttf-jetbrains-mono-nerd
```

## Installation

Clone the repository:

```bash
git clone <repository-url> ~/.dotfiles
cd ~/.dotfiles
```

Make the installer executable:

```bash
chmod +x install.sh
```

Run the installer:

```bash
./install.sh
```

The installer asks which packages should be installed and uses GNU Stow to create symlinks in your home directory.

You can also install packages manually:

```bash
stow --target="$HOME" zsh
stow --target="$HOME" kitty
stow --target="$HOME" hypr
stow --target="$HOME" waybar
stow --target="$HOME" bash
```

After installation, verify the links:

```bash
ls -l ~/.zshrc
ls -l ~/.config/kitty/kitty.conf
ls -l ~/.config/hypr
ls -l ~/.config/waybar
```

## Shell setup

Set Zsh as the default shell:

```bash
chsh -s "$(command -v zsh)"
```

Start a new shell or reload the current configuration:

```bash
exec zsh
```

The Zsh configuration includes:

- Persistent history
- Command completion
- Vi-style or Emacs-style keymap support
- `nvim` as the default editor
- Neovim as the `man` pager
- Git branch and working-tree status in the prompt
- `mkcd` for creating and entering directories
- `extract` for unpacking common archive formats
- Safer aliases for `cp`, `mv`, and `rm`
- Convenience aliases such as `ll`, `la`, `..`, and `reload`

## Hyprland keybindings

The main modifier is the Super key.

| Keybind | Action |
|---|---|
| `Super + Q` | Open Kitty |
| `Super + W` | Open Firefox |
| `Super + E` | Open Dolphin |
| `Super + R` | Open Hyprlauncher |
| `Super + T` | Open the task manager |
| `Super + C` | Close the active window |
| `Super + V` | Toggle floating mode |
| `Super + P` | Toggle pseudo-tile mode |
| `Super + J` | Toggle split direction |
| `Super + M` | Shut down or exit Hyprland |
| `Super + Arrow keys` | Move focus |
| `Super + 1–0` | Switch workspace |
| `Super + Shift + 1–0` | Move window to workspace |
| `Super + S` | Toggle the `magic` special workspace |
| `Super + Shift + S` | Move the active window to `magic` |
| `Super + Left mouse button` | Move window |
| `Super + Right mouse button` | Resize window |
| `Volume keys` | Change or mute volume |
| `Brightness keys` | Change screen brightness |
| `Media keys` | Control media playback |

The programs launched by these bindings are configured in:

```text
hypr/.config/hypr/programs.lua
```

Current defaults:

```lua
global terminal    = "kitty"
global taskmgr     = "kitty btop"
global fileManager = "dolphin"
global menu        = "hyprlauncher"
```

## File manager plans

Dolphin is currently used as the graphical file manager.

The planned terminal file manager is `lf`.

When the migration happens, install it with:

```bash
sudo pacman -S --needed lf
```

Then update:

```lua
global fileManager = "kitty lf"
```

A better long-term arrangement may be to use a shell function or wrapper so that `lf` opens in the current terminal instead of starting a new Kitty window.

## Updating the dotfiles

Pull the latest changes:

```bash
cd ~/.dotfiles
git pull
```

Restow the packages:

```bash
stow --restow --target="$HOME" zsh kitty hypr waybar bash
```

Reload individual applications after making changes:

```bash
# Reload Zsh
exec zsh

# Reload Kitty
# Press Ctrl+Shift+F5 inside Kitty

# Reload Waybar
pkill waybar
waybar &

# Reload Hyprland
hyprctl reload
```

## Useful validation commands

Check the installer syntax:

```bash
bash -n install.sh
```

Check the Stow package without changing anything:

```bash
stow --simulate --verbose --target="$HOME" zsh kitty hypr waybar bash
```

Check whether required commands are installed:

```bash
command -v stow
command -v zsh
command -v nvim
command -v kitty
command -v hyprland
command -v waybar
command -v hyprpaper
command -v hyprlauncher
command -v btop
command -v playerctl
command -v brightnessctl
```

## Notes

This is an actively evolving configuration. The current priorities are:

- Improve the Hyprland Lua configuration
- Replace Dolphin with `lf`
- Add wallpaper, lock-screen, and idle configuration
- Improve Waybar modules
- Add notification configuration
- Add screenshots and a theme preview
- Add safer dependency checks to `install.sh`
