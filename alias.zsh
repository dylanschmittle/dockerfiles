alias net-info="sudo netstat -tulp && sudo lsof -i -n | egrep 'COMMAND|LISTEN|UDP' && sudo route -ee -v -4 -6 && sudo netstat -rn -6 -4 && sudo ip addr"
