#!/bin/bash

# No idea why this is necessary? This doesn't work without it.
# I think this allows Packer to be cloned during the bootstrapping phase? Honestly not sure.
nvim --headless +qa

# Need to PackerSync first so that subsequent command is recognized...?
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless +TSUpdateSync +qa
