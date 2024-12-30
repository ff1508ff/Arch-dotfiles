# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

eval "$(starship init bash)"
eval "$(dircolors ~/.dir_colors)"

alias v="nvim"
# Set nvim as default
export EDITOR='nvim'
export VISUAL='nvim'

# to display Files after cd
cdll() {
	builtin cd "$*" && ll
}
alias cd='cdll'

# zoxide
zll() {
	builtin z "$*" && ll
}
alias z='zll'
eval "$(zoxide init bash --hook prompt --no-aliases)"

. "$HOME/.cargo/env"

# fnm
FNM_PATH="/home/dev/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
	export PATH="$FNM_PATH:$PATH"
	eval "$(fnm env)"
fi
