FROM archlinux

ENV EDITOR=nvim
ENV TERM=xterm-256color

RUN curl -fs https://blackarch.org/strap.sh > /root/strap.sh \
    && echo '9f770789df3b7803105e5fbc19212889674cd503 /root/strap.sh' sha1sum -c \
    && chmod +x /root/strap.sh \
    && /root/strap.sh \
    && pacman -S --noconfirm yay wget base-devel sudo neovim zsh git net-tools bind-tools ldns htop \
    && useradd -m blackarch
ADD ./zsh-install.sh ./zsh-install.sh
RUN chmod +x zsh-install.sh && ./zsh-install.sh \
    -p aws -p npm -p pip -p git -p python -p tig -p python \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p https://github.com/zsh-users/zsh-history-substring-search
ADD ./p10k.zsh /root/.p10k.zsh
WORKDIR /home/blackarch

ENTRYPOINT zsh $@
