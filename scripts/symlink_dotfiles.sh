#!/bin/bash

FILEPATHS=(~/.gitconfig ~/.bashrc ~/.config/nvim)

for destination_filepath in "${FILEPATHS[@]}"
do
    filename=${destination_filepath##*/}
    filepath_in_repo=$(realpath "../${filename}")
    read -p "Replace $destination_filepath with a symlink pointing to $filepath_in_repo? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm -rf "${destination_filepath}" && ln -s "${filepath_in_repo}" "${destination_filepath}"
    fi
done
