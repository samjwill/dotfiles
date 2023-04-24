#!/bin/bash

# Symlinks the user's dotfiles to the files as they appear in this repository.

# Project root directory.
GIT_ROOT=$(git rev-parse --show-toplevel)

# In the format of "DESTINATION_FILEPATH:SOURCE_FILEPATH"
FILEPATHS=( \
    "$HOME/.gitconfig:${GIT_ROOT}/.gitconfig" \
    "$HOME/.bashrc:${GIT_ROOT}/.bashrc" \
    "$HOME/.config/nvim:${GIT_ROOT}/.config/nvim" \
)

for filepath in "${FILEPATHS[@]}"
do
    source_filepath=$(echo "$filepath" | cut -d':' -f2)
    source_filepath=$(realpath "$source_filepath")

    destination_filepath=$(echo "$filepath" | cut -d':' -f1)

    read -p "Replace \"$destination_filepath\" with a symlink pointing to \"$source_filepath\"? [y/n]: " REPLY

    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm -rf "${destination_filepath}" && ln -s "${source_filepath}" "${destination_filepath}"
        echo "Done!"
    else
        echo "Skipping..."
    fi
done
