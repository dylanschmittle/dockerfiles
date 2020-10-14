# Print All Net Routing and Socket Info
alias net-info="sudo netstat -tulp && sudo lsof -i -n | egrep 'COMMAND|LISTEN|UDP' && sudo route -ee -v -4 -6 && sudo netstat -rn -6 -4 && sudo ip addr"

# Look For Suid Bins and Print the Linked Modules
alias get-suid="find / -type f -perm -u=s 2>/dev/null | xargs ls -1 | xargs ldd"
