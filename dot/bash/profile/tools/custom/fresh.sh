function print_fresh_step {
  printf "\n${white}-->${reset} "
  printf "Updating ${purple}%s" "$1"
  printf "${bright_black}...${reset}\n"
}

function fresh_sys {
  print_fresh_step 'System'
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew update && brew upgrade && brew cleanup
  else
    sudo apt update && sudo apt full-upgrade && sudo apt autoremove
    sudo snap refresh
  fi
}

function fresh_atom {
  print_fresh_step 'Atom'
  apm update --no-confirm
  apm list -bi > ~/dotfiles/dot/atom/package.list
}

function fresh_vim {
  print_fresh_step 'Vim'
  sudo vim \
    -c 'PluginInstall' \
    -c 'PluginUpdate' \
    -c 'qa!'
}

function fresh_asdf {
  print_fresh_step 'Asdf'
  asdf update
}

function fresh_node {
  print_fresh_step 'Node'
  n latest
  npm i -g npm
  printf "${bright_orange}node${reset}: "
  node -v
  printf "${bright_orange}npm${reset}: "
  npm -v
}

function fresh {
  fresh_sys
  fresh_atom
  fresh_vim
  fresh_node
  fresh_asdf
}
