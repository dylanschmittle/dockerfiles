FROM kalilinux/kali-rolling
ENV DEBIAN_FRONTEND noninteractive

# Install components
RUN apt-get update && apt-get install -y nmap wget apt-utils zsh ncat ndiff dnsutils netcat telnet && apt-get -y dist-upgrade && rm -rf /var/lib/apt/lists/*

ADD ./zsh-install.sh ./zsh-install.sh
RUN chmod +x zsh-install.sh && ./zsh-install.sh \
    -p aws -p npm -p pip -p git -p python -p tig -p python \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p https://github.com/zsh-users/zsh-history-substring-search
ADD ./p10k.zsh /root/.p10k.zsh


ENTRYPOINT zsh $@
