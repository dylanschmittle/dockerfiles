FROM alpine:3.11

RUN set -ex \
    && echo "http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
    aws-cli \
    acmetool \
    aws-cli-zsh-completion \
    apache2-utils \
    bash \
    bind-tools \
    bird \
    bridge-utils \
    busybox-extras \
    byobu \
    conntrack-tools \
    curl \
    dhcping \
    drill \
    ethtool \
    file\
    fzf \
    fping \
    httpie \
    iftop \
    iperf \
    iproute2 \
    ipset \
    iptables \
    iptraf-ng \
    iputils \
    ipvsadm \
    jq \
    k9s \
    libc6-compat \
    liboping \
    mtr \
    mycli \
    net-snmp-tools \
    netcat-openbsd \
    nftables \
    ngrep \
    nmap \
    npm \
    nmap-nping \
    mitmproxy \
    openssl \
    py-crypto \
    py3-pip \
    pgcli \
    pdsh \
    pgbouncer \
    ripgrep \
    ranger \
    scapy \
    socat \
    strace \
    s3cmd \
    tinc \
    tmux \
    tcpdump \
    tcptraceroute \
    tshark \
    tig \
    util-linux \
    neovim \
    websocat \
    wireguard-tools \
    zsh \
    build-base \
    unzip \
    openssh-client

RUN pip3 install virtualenvwrapper

ADD ./zsh-install.sh ./zsh-install.sh
RUN chmod +x zsh-install.sh && ./zsh-install.sh \
    -p aws -p npm -p pip -p git -p helm -p python -p tig -p python \
    -p fancy-ctrl-z -p colorize -p colored-man-pages -p sudo -p virtualenvwrapper \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p https://github.com/zsh-users/zsh-history-substring-search

# apparmor issue #14140
RUN mv /usr/sbin/tcpdump /usr/bin/tcpdump
# Installing ctop - top-like container monitor
RUN wget https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64 -O /usr/local/bin/ctop && chmod +x /usr/local/bin/ctop
# Installing istioctl
ARG ISTIO_VERSION=1.6.5
RUN curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${ISTIO_VERSION} sh - && mv istio-${ISTIO_VERSION}/bin/* /usr/local/bin && rm -rf istio-*
# Installing helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

ADD ./p10k.zsh /root/.p10k.zsh
#ADD ./zshrc /root/.zshrc


ENTRYPOINT zsh $@
