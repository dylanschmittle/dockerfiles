FROM docker.io/library/alpine:3.11

RUN set -ex \
    && echo "http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
    acmetool \
    apache2-utils \
    aws-cli \
    aws-cli-zsh-completion \
    bash \
    bind-tools \
    bird \
    bridge-utils \
    build-base \
    busybox-extras \
    byobu \
    conntrack-tools \
    curl \
    dhcping \
    drill \
    ebtables \
    ethtool \
    file\
    fping \
    fzf \
    graphviz \
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
    mitmproxy \
    mtr \
    mycli \
    neovim \
    net-snmp-tools \
    netcat-openbsd \
    nftables \
    ngrep \
    nmap \
    nmap-nping \
    npm \
    openssh-client \
    openssl \
    pdsh \
    pgbouncer \
    pgcli \
    pgbouncer \
    postgresql \
    py-crypto \
    py-gnuplot \
    py3-pip \
    pyx \
    ranger \
    ripgrep \
    s3cmd \
    scapy \
    socat \
    sox \
    strace \
    tcpdump \
    tcptraceroute \
    tig \
    tinc \
    tmux \
    tshark \
    unzip \
    util-linux \
    websocat \
    wireguard-tools \
    zsh

RUN pip3 install virtualenvwrapper
# apparmor issue #14140
RUN mv /usr/sbin/tcpdump /usr/bin/tcpdump
# Installing ctop - top-like container monitor
RUN wget https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64 -O /usr/local/bin/ctop && chmod +x /usr/local/bin/ctop
# Installing istioctl
ARG ISTIO_VERSION=1.6.5
RUN curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${ISTIO_VERSION} sh - && mv istio-${ISTIO_VERSION}/bin/* /usr/local/bin && rm -rf istio-*
# Installing helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

ADD ./zsh-install.sh ./zsh-install.sh
RUN chmod +x zsh-install.sh && ./zsh-install.sh \
    -p aws -p npm -p pip -p git -p helm -p python -p tig -p python \
    -p fancy-ctrl-z -p colorize -p colored-man-pages -p sudo -p virtualenvwrapper \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p https://github.com/zsh-users/zsh-history-substring-search
ADD ./p10k.zsh /root/.p10k.zsh
ENTRYPOINT zsh $@
