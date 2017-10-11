alias refresh="source ~/.bash_profile"

# convert all filenames in pwd to snake_case
alias snakify='for f in *\ *; do mv "$f" "${f// /_}"; done'

# gchat
# dark gray, light red, light green, light blue, light magenta, light cyan, yellow, white
# black,     dark red,  dark green,  dark blue,  dark magenta,  dark cyan,  brown,  light gray
alias chat="hangups --col-msg-self-fg 'light magenta' --col-msg-sender-fg 'dark gray' --col-msg-text-fg 'white' --col-msg-date-fg 'yellow' --col-active-tab-fg 'dark gray'"

# disk space usage
# alias disk_unsorted="sudo du -x -d1 -h $1"
function disk_unsorted {
    sudo du -x -d1 -h $@
}
function disk_sorted {
    disk_unsorted | sort -hr
}
alias disk=disk_sorted
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

# makes my ansii art look cool
# function centercat() { clear && echo && echo && echo && echo && echo && cat "${@}" |  awk '{ z = '$(tput cols)' - length; y = int(z / 2); x = z - y; printf "%*s%s%*s\n", x, "", $0, y, ""; }' && echo && echo && echo && echo && echo ;}
function centercat {
  clear
  echo && echo && echo && echo && echo
  cat "${@}" |  awk '{ z = '$(tput cols)' - length; y = int(z / 2); x = z - y; printf "%*s%s%*s\n", x, "", $0, y, ""; }'
  echo && echo && echo && echo && echo
}

# TODO: work this into init_*.sh w/ cronjob to clean weekly
# and figure out linux vs osx
function trash { mv "${@}" ~/.Trash; }

# time
function stamp {
    orange
    date +"%r"
    reset
    $@
}
alias stampwatch='export PS1="\D{%I:%M %p}\n${PS1}"'
alias stampunwatch='export PS1=${PS1#"\D{%I:%M %p}\n"}'

# super dumn typo
alias maketart="echo '${blue}o${cyan}%${red}@${purple}8${reset}' && echo '\\__/'"
