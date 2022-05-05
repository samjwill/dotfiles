#!/bin/bash

apt-get install -y curl git ripgrep universal-ctags vim-gtk
vim +'PlugInstall --sync' +qall > /dev/null
