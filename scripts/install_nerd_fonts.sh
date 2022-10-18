#/bin/bash

curl -fLo /tmp/Hack.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip && mkdir -p ~/.local/share/fonts/ && unzip /tmp/Hack.zip -d ~/.local/share/fonts/ && rm /tmp/Hack.zip
