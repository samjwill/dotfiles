#Return early if not an interactive shell.
case $- in
    *i*) ;;
      *) return;;
esac

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
git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1=${GREEN}\\u@\\h${NC}:${LIGHTBLUE}\\w${NC}${GREEN}'$(git_branch)'${NC}\\$\ 
#export PS1=${GREEN}\\u@\\h${NC}:${LIGHTBLUE}\\w${NC}\\$\ 

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
function cd {
    builtin cd "$@" && ls -F
}
cheat () (
    curl cheat.sh/$@
)
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
bind -x '"\C-l": clear' #Need to rebind this because `set -o vi` breaks the
                        # original binding and also because this preserves text
                        # that is currently on the screen when clearing.


if [ -r "/usr/share/doc/fzf/examples/key-bindings.bash" ]; then # Ubuntu
    source /usr/share/doc/fzf/examples/key-bindings.bash
elif [ -r "/usr/share/fzf/key-bindings.bash" ]; then # Arch
    source /usr/share/fzf/key-bindings.bash
fi

if [ -r "/etc/bash_completion" ]; then # Ubuntu (Arch auto-sources bash_completion apparently?)
    source /etc/bash_completion
fi

# Override FZF bindings for scrolling previews for consistency.
export FZF_DEFAULT_OPTS="--bind \"ctrl-y:preview-up,ctrl-e:preview-down,ctrl-b:preview-page-up,ctrl-f:preview-page-down,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,shift-up:preview-top,shift-down:preview-bottom\""

# Define custom command to read git diffs with delta and FZF
if (command -v fzf >/dev/null 2>&1) && (command -v git >/dev/null 2>&1) && (command -v delta >/dev/null 2>&1); then
    fzfdiff() {
        project_root=$(git rev-parse --show-toplevel)
        if [ -n "$project_root" ]; then
            preview="\"git diff $@ --color=always -- {-1} | delta -w ${FZF_PREVIEW_COLUMNS:-$COLUMNS}\""
            pushd "$project_root" >/dev/null
            bash -c "git diff $@ --name-only | fzf -m --ansi --preview-window=top:80% --preview $preview"
            popd >/dev/null
        fi
    }
fi
