#!/bin/bash

apt-get install -y bash-completion curl git neovim ripgrep universal-ctags
nvim --headless +PlugInstall +qall
