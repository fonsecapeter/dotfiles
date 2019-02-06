alias localhost_ports='netstat -a | grep LISTEN | grep localhost'
alias listening='netstat -a | grep LISTEN'
alias netmap="nmap --top-ports 1000 -T4 -sC ${@}"

alias ports=localhosts
function localhosts {
  if [ -z "$1" ]; then
    localhost_ports
  else
    lsof -i ":$1"
  fi
}
