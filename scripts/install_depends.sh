#!/bin/bash

# A script to install the programs that my dotfiles expect to be present on the system.

# Exit on error.
set -e

# Check if package manager is pacman
if [ "$(command -v pacman)" ]; then
    # Perform a system update
    sudo pacman -Syu --noconfirm

    # Package names as they appear on Arch's default repositories.
    sudo pacman -S --noconfirm --needed \
        bash-completion \
        curl \
        fd \
        fzf \
        gcc \
        git \
        git-delta \
        mpv \
        neovim \
        ripgrep \
        unzip
else
    echo "Unsupported package manager"
    exit 1
fi

