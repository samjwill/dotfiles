#!/bin/bash

apt-get install -y bash-completion curl fzf git neovim ripgrep universal-ctags
# TODO: Not sure why this doesn't work...: nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
