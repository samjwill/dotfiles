bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'
bind 'set menu-complete-display-prefix on'
bind 'set completion-ignore-case on'
bind 'set colored-stats on'
bind 'set completion-query-items 0'
bind 'set page-completions off'
bind 'TAB':menu-complete
bind '"\e[Z"':menu-complete-backward
stty -ixon -ixoff #Enable Ctrl+s to forward search.

shopt -s histappend

alias ls='ls -F --color=auto --show-control-chars'
alias grep='grep --color=auto'

CYAN='\[\033[1;36m\]'
GREEN='\[\033[1;32m\]'
YELLOW='\[\033[1;33m\]'
NC='\[\033[0m\]'
export PS1=${GREEN}\\u@\\h\ ${YELLOW}\\w${CYAN}\`__git_ps1\`\ ${NC}\\$\ 
export TERM=xterm-256color
