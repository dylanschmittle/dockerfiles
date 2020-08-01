FROM kalilinux/kali-rolling
ENV DEBIAN_FRONTEND noninteractive

# Install components
RUN apt-get update; apt-get -y dist-upgrade; apt-get install -y nmap ncat ndiff dnsutils netcat telnet; rm -rf /var/lib/apt/lists/*

ENTRYPOINT bash $@
