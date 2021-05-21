#Return early if not an interactive shell.
case $- in
    *i*) ;;
      *) return;;
esac

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

alias ls='ls -F --color=auto --show-control-chars'
alias grep='grep --color=auto'

BLUE='\[\033[1;36m\]'
GREEN='\[\033[1;32m\]'
YELLOW='\[\033[1;33m\]'
NC='\[\033[0m\]'

#TODO: Make it green then blue instead of green then yellow then cyan \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$
git --version 2>&1 >/dev/null # improvement by tripleee
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE ]; then
   export PS1=${GREEN}\\u@\\h\ ${BLUE}\\w${YELLOW}\`__git_ps1\`\ ${NC}\\$\
else
   export PS1=${GREEN}\\u@\\h\ ${BLUE}\\w${YELLOW}\ ${NC}\\$\
fi

export TERM=xterm-256color
