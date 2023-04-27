#!/bin/bash

# Check if package manager is pacman
if [ "$(command -v pacman)" ]; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm bash-completion curl fd fzf gcc git git-delta gzip neovim ripgrep unzip tar wget
# Check if package manager is apt
elif [ "$(command -v apt)" ]; then
    sudo apt update
    sudo apt install -y bash-completion curl g++ gcc fd-find fzf git gzip neovim ripgrep unzip tar wget
    # TODO: git-delta
else
    echo "Unknown package manager"
    exit 1
fi

# Install nerd font to fonts directory in home folder.
curl -fLo /tmp/Hack.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip && \
    mkdir -p ~/.local/share/fonts/ && \
    unzip -o /tmp/Hack.zip -d ~/.local/share/fonts/ && \
    rm /tmp/Hack.zip && \
    echo "Success!"

