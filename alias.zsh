# Print All Net Routing and Socket Info
alias net-info="sudo netstat -tulp 2>/dev/null && sudo lsof -i -n 2>/dev/null | egrep 'COMMAND|LISTEN|UDP' && sudo route -ee -v -4 -6 2>/dev/null && sudo netstat -rn -6 -4 2>/dev/null && sudo ip addr 2>/dev/null"

# Look For Suid Bins and Print the Linked Modules
alias get-suid="find / -type f -perm -u=s 2>/dev/null | xargs ls -1 | xargs ldd 2>/dev/null"
