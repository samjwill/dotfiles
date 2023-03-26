#!/bin/bash
rm -f ~/.gitconfig && ln -s $(realpath ../.gitconfig) $(realpath ~/.gitconfig)
rm -f ~/.bashrc && ln -s $(realpath ../.bashrc) $(realpath ~/.bashrc)
rm -rf ~/.config/nvim && ln -s $(realpath ../.config/nvim) $(realpath ~/.config/nvim)
