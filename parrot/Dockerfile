FROM parrotsec/core:rolling
ENV DEBIAN_FRONTEND noninteractive

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y install parrot-pico;apt-get -y install parrot-mini parrot-tools-cloud; rm -rf /var/lib/apt/lists/*
RUN apt-get install -y nmap ncat ndiff dnsutils netcat telnet; rm -rf /var/lib/apt/lists/*


ENTRYPOINT bash $@
