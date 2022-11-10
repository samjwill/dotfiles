#!/bin/bash

# No idea if this is necessary?
# I think this allows Packer to be cloned during the bootstrapping phase? Honestly not sure.
nvim --headless +qa

# Need to PackerSync first so that subsequent command is recognized...?
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless -c "TSUpdateSync" -c "quitall"
nvim --headless -c "MasonInstall clangd" -c "quitall" # If updating this, update the ensure_installed in Neovim init.lua
