#!/bin/sh
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi
netinfo () {
  conntrack -L -f ipv4
  conntrack -L -f ipv6
  hwinfo --modem --netcard --network --wlan
  inxi --host --dig --ip --network-advanced --network --extra 3
  lsof -i -n 2>/dev/null | grep -E 'COMMAND|LISTEN|UDP'
  lsof -iTCP:port -sTCP:LISTEN 2>/dev/null
  lsns --output-all 2>/dev/null
  netstat -lepunt 2
  netstat -rn -6 -4
  netstat -tulp
  nft list rulesetxt
  nft --handle --numeric list chain family table chain
  route -ee -v -4 -6 txt
  ip addr
  iptables -L
  ip6tables -L
  netstat-nat
}
netinfo > "results-$(date +%s).txt"

