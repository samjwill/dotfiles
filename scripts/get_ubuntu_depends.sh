#!/bin/bash

apt-get update
apt-get install -y bash-completion clangd curl g++ git fd-find fzf git gzip ripgrep unzip tar wget

wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb -P /tmp/
apt-get install -y /tmp/nvim-linux64.deb || true
rm /tmp/nvim-linux64.deb
