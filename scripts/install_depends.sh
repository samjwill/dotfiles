#!/bin/bash

# Check if package manager is pacman
if [ "$(command -v pacman)" ]; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm bash-completion curl fd fzf gcc git git-delta gzip neovim ripgrep unzip tar wget
# Check if package manager is apt
elif [ "$(command -v apt)" ]; then
    sudo apt update
    sudo apt install -y bash-completion curl g++ gcc fd-find fzf git gzip ripgrep unzip tar wget
    # TODO: git-delta

    # Install Neovim from GitHub because package manager might grab older version.
    wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb -P /tmp/
    apt-get install -y /tmp/nvim-linux64.deb || true
    rm /tmp/nvim-linux64.deb
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

