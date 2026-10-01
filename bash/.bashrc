#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\e[91m\]\u\[\e[92m\]@\h\[\e[0m\] \[\e[96m\]\w\[\e[92m\]\$\[\e[0m\]'
