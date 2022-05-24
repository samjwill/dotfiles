#!/bin/bash

apt-get install -y bash-completion curl fzf git neovim ripgrep universal-ctags
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
