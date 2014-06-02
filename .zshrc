# We like colors
autoload -U colors && colors

# Use autocomplete
autoload -Uz compinit && compinit

# Set the prompt
autoload -Uz promptinit && promptinit
prompt adam2

# Set the default editor
export VISUAL=vim

# Enable Vim mode
bindkey -v

# History settings
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.history"

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

# Less settings
LESSCHARSET=UTF-8

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias l='ls -la'

# Up/Down arrow bindings
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

# Include any "local" settings
if [[ -f ${HOME}/.zshrc.local ]]; then
    echo "We have a local file!"
    source ${HOME}/.zshrc.local
fi
