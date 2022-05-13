#!/bin/bash

apt-get install -y bash-completion curl git ripgrep universal-ctags vim-gtk
nvim +'PlugInstall --sync' +qall > /dev/null
