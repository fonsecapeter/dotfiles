alias resource='source ~/.bash_profile'
function fresh {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew update && brew upgrade && brew cleanup
  else
    sudo apt update && sudo apt full-upgrade && sudo apt autoremove
  fi
  sudo n latest && npm update -g
  printf "${bright_orange}node${reset}: "
  node -v
  printf "${bright_orange}npm${reset}: "
  npm -v
}


# convert all filenames in pwd to snake_case
alias snakify='for f in *\ *; do mv "$f" "${f// /_}"; done'

# gchat
# dark gray, light red, light green, light blue, light magenta, light cyan, yellow, white
# black,     dark red,  dark green,  dark blue,  dark magenta,  dark cyan,  brown,  light gray
alias chat="hangups --col-msg-self-fg 'light magenta' --col-msg-sender-fg 'dark gray' --col-msg-text-fg 'white' --col-msg-date-fg 'yellow' --col-active-tab-fg 'dark gray'"

# disk space usage
# alias disk_unsorted="sudo du -x -d1 -h $1"
function disks_unsorted {
  sudo du -x -d1 -h $@
}
function disks_sorted {
  disks_unsorted | sort -hr
}
alias disks=disks_sorted
alias disk='df -h /'
# alias disk="disk_unsorted | sort -hr"

# finding whos listening on my ports
alias localhost_ports='netstat -a | grep LISTEN | grep localhost'
alias listening='netstat -a | grep LISTEN'
function localhosts {
  if [ -z "$1" ]; then
    localhost_ports
  else
    lsof -i ":$1"
  fi
}
alias ports=localhosts

# permissions
function chmine {
  sudo chown -R $USER "${@}"
  sudo chgrp -R $(id -g -n $USER) "${@}"

}
function chmine-rw {
  chmine "${@}"
  sudo chmod 664 "${@}"
}

# ctags
alias retag='ctags -R .'

# obviously
alias matrix='cmatrix -b'

# TODO: work this into init_*.sh w/ cronjob to clean weekly
# and figure out linux vs osx
function trash { mv "${@}" ~/.Trash; }

# time
function stamp {
  printf "${orange}"
  date +"%r"
  printf "${reset}"
  $@
}
alias stampwatch='export PS1="\D{%I:%M %p}\n${PS1}"'
alias stampunwatch='export PS1=${PS1#"\D{%I:%M %p}\n"}'

# super dumn typo
alias maketart="echo '${blue}o${cyan}%${red}@${purple}8${reset}' && echo '\\__/'"
alias remake='make clean && make'

# nmap common
alias netmap="nmap --top-ports 1000 -T4 -sC ${@}"
