FROM archlinux

ENV EDITOR=nvim
ENV TERM=xterm-256color

RUN curl -fs https://blackarch.org/strap.sh > /root/strap.sh \
    && echo '9f770789df3b7803105e5fbc19212889674cd503 /root/strap.sh' sha1sum -c \
    && chmod +x /root/strap.sh \
    && /root/strap.sh \
    && pacman -S --noconfirm yay base-devel sudo vim zsh git net-tools bind-tools ldns htop \
    && useradd -m blackarch 

USER blackarch
WORKDIR /home/blackarch

ENTRYPOINT bash $@
