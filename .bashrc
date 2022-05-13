#Return early if not an interactive shell.
case $- in
    *i*) ;;
      *) return;;
esac

# TODO: Make this more portable? vvv
source /etc/bash_completion

set -o vi

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

#Enable Ctrl+s to forward search.
stty -ixon -ixoff

#Ignore duplicate entries and entries that start with spaces. Erase duplicates that existed previously.
HISTCONTROL=ignoreboth:erasedups

#Maximum history lines to store in memory for an active terminal session.
HISTSIZE=1000000000

#Maximum lines in history file.
HISTFILESIZE=1000000000

#Append to history file instead of overwriting.
shopt -s histappend

#Command that will auto-execute to read in any changes that have occurred to the history file, and append the additional history to the current session.
#We still execute ${PROMPT_COMMAND} in case that variable is populated before we get to this point.
#Note that writes to the history file still only occur on terminal exit.
PROMPT_COMMAND="history -n; ${PROMPT_COMMAND}"

#Resize after commands executed
shopt -s checkwinsize

#Colors used below
GREEN='\[\033[01;32m\]'
LIGHTBLUE='\[\033[01;34m\]'
NC='\[\033[00m\]'

#TODO: Warn if return code of last command was non-zero
#PS1
export PS1=${GREEN}\\u@\\h${NC}:${LIGHTBLUE}\\w${NC}\\$\ 

#TODO: Is this even necessary?
if [ "$TERM" == "xterm" ]; then
   export TERM=xterm-256color
fi

#TODO: Maybe move aliases to different file?
#Aliases
alias less='less -R' #Adds color support
alias ls='ls -F --color=auto --show-control-chars'
alias grep='grep --color=auto' #Highlights match in output
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias vim='nvim'


# We install FZF as a plugin for Neovim, and it pulls the binaries down to this
# directory. Let's just use these binaries for the shell as well to avoid
# versioning weirdness associated with also installing FZF through the package
# manager
export FZF_ROOT="$HOME/.local/share/nvim/plugged/fzf"
if [ -d "$FZF_ROOT/bin" ] ; then
      PATH="$PATH:$FZF_ROOT/bin"
fi
#Add keybindings and completion from FZF
if [ -r "$FZF_ROOT/shell/key-bindings.bash" ]; then
   source $FZF_ROOT/shell/key-bindings.bash
fi
if [ -r "$FZF_ROOT/shell/completion.bash" ]; then
   source $FZF_ROOT/shell/completion.bash
fi

clear() (
   if [ "$#" -ne 0 ]; then
      command clear "$@"
      exit
   fi
   h="$(tput lines 2>/dev/null)"
   if [ "$?" -eq 0 ]; then
      until [ "$h" -le 1 ]; do
         printf '\n'
         h=$((h-1))
      done
   fi
   command clear -x
)

bind -x '"\C-l": clear' #Need to rebind this because `set -o vi` breaks the original binding and also because this preserves text that is currently on the screen when clearing.
bind '"\C-m": "\C-l\C-j"' #Clear before entering new commands
function cd {
    builtin cd "$@" && ls -F
}
