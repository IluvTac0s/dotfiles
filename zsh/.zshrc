#Only configure interactive shells.
[[ -o interactive ]] || return

# ─────────────────────────────────────────────────────────────
# History
# ─────────────────────────────────────────────────────────────

HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
HISTSIZE=1000
SAVEHIST=1000

mkdir -p -- "${HISTFILE:h}"

setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt extended_history

# ─────────────────────────────────────────────────────────────
# Shell options
# ─────────────────────────────────────────────────────────────

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt cdable_vars
setopt interactive_comments
setopt correct
setopt prompt_subst

# ─────────────────────────────────────────────────────────────
# Completion
# ─────────────────────────────────────────────────────────────

autoload -Uz compinit

ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p -- "$ZSH_CACHE_DIR"

compinit -d "$ZSH_CACHE_DIR/zcompdump-$ZSH_VERSION"

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ─────────────────────────────────────────────────────────────
# Keybindings
# ─────────────────────────────────────────────────────────────

bindkey -e

# Use Ctrl+Left / Ctrl+Right to move by words in most terminals.
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# ─────────────────────────────────────────────────────────────
# Environment
# ─────────────────────────────────────────────────────────────

export EDITOR='nvim'
export VISUAL="$EDITOR"
export PAGER='less -R'
export LESS='-R'

# Use Neovim as the man-page pager.
if (( $+commands[nvim] )); then
    export MANPAGER='nvim +Man!'
fi

# ─────────────────────────────────────────────────────────────
# Aliases
# ─────────────────────────────────────────────────────────────

alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

alias hexedit='hexedit --color -l 16'

alias lfh='lf --command "set hidden"'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c='clear'
alias v='nvim'
alias vim='nvim'

alias reload='source ~/.zshrc'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -I'

# Safer file operations.
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -I'

# ─────────────────────────────────────────────────────────────
# Functions
# ─────────────────────────────────────────────────────────────

mkcd() {
    if (( $# != 1 )); then
        print "usage: mkcd directory"
        return 1
    fi

    mkdir -p -- "$1" && cd -- "$1"
}

extract() {
    if (( $# != 1 )); then
        print "usage: extract archive"
        return 1
    fi

    case "$1" in
        *.tar.gz|*.tgz) tar -xzf "$1" ;;
        *.tar.bz2|*.tbz2) tar -xjf "$1" ;;
        *.tar.xz|*.txz) tar -xJf "$1" ;;
        *.tar) tar -xf "$1" ;;
        *.zip) unzip "$1" ;;
        *.7z) 7z x "$1" ;;
        *.rar) unrar x "$1" ;;
        *) print "Unsupported archive: $1"; return 1 ;;
    esac
}

# ─────────────────────────────────────────────────────────────
# Git status in the prompt
# ─────────────────────────────────────────────────────────────

if (( $+commands[git] )); then
    autoload -Uz vcs_info add-zsh-hook

    zstyle ':vcs_info:git:*' enable git
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' formats ' %F{blue}[%b%f%F{yellow}%u%c%f%F{blue}]%f'
    zstyle ':vcs_info:git:*' actionformats ' %F{blue}[%b|%a%f%F{yellow}%u%c%f%F{blue}]%f'
    zstyle ':vcs_info:git:*' unstagedstr '!'
    zstyle ':vcs_info:git:*' stagedstr '+'

    _update_vcs_info() {
        vcs_info
    }

    add-zsh-hook precmd _update_vcs_info
    add-zsh-hook chpwd _update_vcs_info
fi

# ─────────────────────────────────────────────────────────────
# Prompt
# ─────────────────────────────────────────────────────────────

PROMPT='%F{red}%n%f@%F{green}%m%f %F{cyan}%~%f${vcs_info_msg_0_}%F{green}%#%f '
