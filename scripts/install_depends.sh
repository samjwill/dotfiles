#!/bin/bash

# Check if package manager is pacman
if [ "$(command -v pacman)" ]; then
    sudo pacman -Syu --noconfirm
    # Package names as they appear on Arch's default repositories.
    sudo pacman -S --noconfirm bash-completion curl fd fzf gcc git git-delta neovim ripgrep unzip
# Check if package manager is apt
else
    echo "Unknown package manager"
    exit 1
fi

# Install nerd font to fonts directory in home folder.
curl -fLo /tmp/Hack.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip && \
    mkdir -p ~/.local/share/fonts/ && \
    unzip -o /tmp/Hack.zip -d ~/.local/share/fonts/ && \
    rm /tmp/Hack.zip && \
    echo "Success!"

