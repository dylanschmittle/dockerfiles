#!/bin/sh
chmod +x zsh-install.sh && ./zsh-install.sh \
 -p aws -p npm -p pip -p git -p python -p tig -p python \
 -p https://github.com/zsh-users/zsh-autosuggestions \
 -p https://github.com/zsh-users/zsh-completions \
 -p https://github.com/zsh-users/zsh-syntax-highlighting \
 -p https://github.com/zsh-users/zsh-history-substring-search
