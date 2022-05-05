#!/bin/bash

apt-get install -y curl git ripgrep vim-gtk
vim +'PlugInstall --sync' +qall > /dev/null
