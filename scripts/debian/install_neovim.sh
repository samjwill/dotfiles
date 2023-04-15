#!/bin/bash

wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb -P /tmp/
apt-get install -y /tmp/nvim-linux64.deb || true
rm /tmp/nvim-linux64.deb

