#!/bin/bash

apt-get install -y bash-completion curl git ripgrep universal-ctags neovim
nvim +'PlugInstall --sync' +qall > /dev/null
