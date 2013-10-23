#
autoload -U colors && colors

# The left prompt
PROMPT="%{$fg_no_bold[cyan]%}[%{$fg_bold[white]%}%n%{$fg_bold[red]%}@%{$fg_bold[white]%}%m %1~%{$fg_no_bold[cyan]%}]%# %{$reset_color%}"

# The right prompt
RPROMPT="%{$fg_no_bold[cyan]%}[%{$fg_bold[white]%}%?%{$fg_no_bold[cyan]%}]%{$reset_color%}"

export VISUAL=vim

# History
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.history"

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias l='ls -la'
