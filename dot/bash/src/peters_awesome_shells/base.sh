alias resource='source ~/.bash_profile'
function print_step {
  printf "\n${white}-->${reset} "
  printf "Updating ${purple}%s" "$1"
  printf "${bright_black}...${reset}\n"
}

function fresh_sys {
  print_step 'System'
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew update && brew upgrade && brew cleanup
  else
    sudo apt update && sudo apt full-upgrade && sudo apt autoremove
  fi
}

function fresh_atom {
  print_step 'Atom'
  apm update --no-confirm
  apm list -bi > ~/dotfiles/dot/atom/package.list
}

function fresh_node {
  print_step 'Node'
  n latest
  npm update -g
  printf "${bright_orange}node${reset}: "
  node -v
  printf "${bright_orange}npm${reset}: "
  npm -v
}

function fresh_vim {
  print_step 'Vim'
  sudo vim \
    -c 'PluginInstall' \
    -c 'PluginUpdate' \
    -c 'qa!'
}

function fresh {
  fresh_sys
  fresh_atom
  fresh_vim
  fresh_node
  print_step 'Asdf'
  asdf update
}

# disk space usage
# alias disk_unsorted="sudo du -x -d1 -h $1"
function disk_unsorted {
  sudo du -x -d1 -h $@
}
function disk_sorted {
  disk_unsorted | sort -hr
}
alias disks=disk_sorted
alias disk='df -h /'

# port stuff
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
alias remake='make clean && make'

# nmap common
alias netmap="nmap --top-ports 1000 -T4 -sC ${@}"

function randmoji {
  local -r emojis=(🚀 🌟 🎉)
  local -r num_emojis=${#emojis[*]}
  local -r idx=$(( (RANDOM % num_emojis) + 1 ))
  echo "${emojis[$idx]}"
}
