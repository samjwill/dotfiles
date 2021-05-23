#Return early if not an interactive shell.
case $- in
    *i*) ;;
      *) return;;
esac

bind 'set bell-style none'
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

#Ignore duplicate entries and entries that start with spaces.
HISTCONTROL=ignoreboth

#Append to history file instead of overwriting.
shopt -s histappend

#Resize after commands executed
shopt -s checkwinsize

GREEN='\[\033[1;32m\]'
CYAN='\[\033[01;36m\]'
YELLOW='\[\033[1;93m\]'
NC='\[\033[0m\]'

if [ "$(type -t __git_ps1)" = 'function' ]; then
   export PS1=${GREEN}\\u@\\h\ ${CYAN}\\w${YELLOW}\`__git_ps1\`\ ${NC}\\$\ 
else
   export PS1=${GREEN}\\u@\\h\ ${CYAN}\\w${YELLOW}\ ${NC}\\$\ 
fi

export TERM=xterm-256color

alias ls='ls -F --color=auto --show-control-chars'
alias grep='grep --color=auto'

