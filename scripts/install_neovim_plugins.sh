#!/bin/bash

# Need to PackerSync first so that subsequent command is recognized...?
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless +TSUpdateSync +qa
