#Return early if not an interactive shell.
case $- in
    *i*) ;;
      *) return;;
esac

set -o vi
bind '"\C-L": clear-screen' #Need to rebind this because `set -o vi` breaks the original binding.

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

#TODO: Check if vim is even a valid command before attempting this.

#Somewhat complex vim client-server alias.
#Allows for easy opening of files from within vim terminal emulator.
#First, check if clientserver feature is enabled.
if [ $(vim --version | grep +clientserver | wc -l) = 1 ]; then

   #Alias to allow for executing "\vim" if we don't want to run the function.
   alias vim='vimFunc'

   vimFunc () {
      #Don't want to break existing functionality with non-filepath args so do this...
      #Iterate over arguments in arg list ($@)
      for ARGUMENT in "$@"
      do
         #If any of the arguments start with - or +, it's not a filepath.
         if [ "${ARGUMENT:0:1}" == "-" ] || [ "${ARGUMENT:0:1}" == "+" ]; then
            #TODO: Maybe come up with something clever here?
            YELLOW='\033[0;33m'
            NC='\033[0m'
            echo -e "${YELLOW}Warning: Non-filepath arguments found. Not executing \"vim\" alias defined in .bashrc...${NC}"
            \vim $@
            return
         fi
      done

      #If no vim instance with a server with the default server name is already running
      if [ $(ps x | grep "\-\-servername VIM" | wc -l) = 0 ]; then
         #Make a vim instance with the default server name
         \vim --servername VIM $@
         return
      fi

      #Otherwise, if there were no arguments passed
      if [ -z "$1" ]; then
         #Open a new buffer in the vim server instance
         \vim --remote-send "<C-\><C-N>:tabedit<CR>"
         return
      fi

      #TODO: If there are multiple filepaths, may want to emulate a more standard way of doing this (with vanilla, you use :next/:prev). See :h arge
      for ARGUMENT in "$@"
      do
         #Convert it to a full filepath
         ARGUMENT=$(realpath $ARGUMENT)
         #Open the requested file in new tab
         \vim --remote-send "<C-\><C-N>:tabedit $ARGUMENT<CR>"
      done
   }
fi

#Add keybindings and completion from FZF from their default location in Ubuntu
if [ -r "/usr/share/doc/fzf/examples/key-bindings.bash" ]; then
   source /usr/share/doc/fzf/examples/key-bindings.bash
fi
if [ -r "/usr/share/doc/fzf/examples/completion.bash" ]; then
   source /usr/share/doc/fzf/examples/completion.bash
fi

