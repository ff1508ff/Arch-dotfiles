# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dev/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ===== custom =====

# no duplicate comands in history
setopt hist_ignore_all_dups

# eval "$(starship init zsh)"
# eval "$(dircolors ~/.dir_colors)"

eval "$(zoxide init zsh --hook prompt)"

. "$HOME/.cargo/env"

alias v="nvim"
# Set nvim as default
export EDITOR='nvim'
export VISUAL='nvim'

# Set up ll
ll() {
  ls -al --color=auto "$@"
}

# to display Files after cd
cdll() {
  builtin cd "$*" && ll
}
alias cd='cdll'

# zoxide
zll() {
  z "$*" && ll
}
alias z='zll'

# fnm
FNM_PATH="/home/dev/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# lazygit
alias lg='lazygit'

# zellij alias
alias ze=zellij

# zellij attach [container]
function za() {
  zellij attach "$*"
}

# zellij run [command]
function zr() {
  zellij run --name "$*" -- zsh -ic "$*"
}

# zellij run floating [command]
function zrf() {
  zellij run --name "$*" --floating -- zsh -ic "$*"
}

# zellij edit file [file]
function zed() {
  zellij edit "$@"
}

# zellij attach with fzf selection
function zs() {
  sessions=$(zellij list-sessions --no-formatting --short)
  selected_session=$(echo "$sessions" | fzf --height ${FZF_TMUX_HEIGHT:-20%} --ansi)
  if [ -n "$selected_session" ]; then
    za $selected_session
  fi
}

ZELLIJ_AUTO_ATTACH=true
### this was created with "zellij setup --generate-auto-start"
if [[ -z "$ZELLIJ" ]]; then
  if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
    zs
    echo "to reattach use: zs" # add text which gets displayed when zellij fails to attach
  else
    zellij -l welcome # add -l welcome for a nice welcome screen
  fi

  if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
    exit
  fi
fi

# fnm
FNM_PATH="/home/dev/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/dev/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
