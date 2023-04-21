#!/bin/bash

# Check if package manager is pacman
if [ "$(command -v pacman)" ]; then
  sudo pacman -Syu --noconfirm
  sudo pacman -S --noconfirm bash-completion curl fd fzf gcc git git-delta gzip ripgrep unzip tar wget
# Check if package manager is apt
elif [ "$(command -v apt)" ]; then
  sudo apt update
  sudo apt install -y bash-completion curl g++ gcc fd-find fzf git gzip ripgrep unzip tar wget
else
  echo "Unknown package manager"
  exit 1
fi
