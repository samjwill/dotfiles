#!/bin/bash

# I think this allows Packer to be cloned during the bootstrapping phase? Honestly not sure.
nvim --headless +qa

# Need to allow PackerSync to run first and then restart so that subsequent TSUpdate command is recognized...?
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless -c "TSUpdateSync" -c "MasonInstallAll" -c "quitall"

echo ""
