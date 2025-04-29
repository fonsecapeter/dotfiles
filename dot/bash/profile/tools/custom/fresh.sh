function print_fresh_step {
  printf "\n${white}-->${reset} "
  printf "Updating ${purple}%s" "$1"
  printf "${bright_black}...${reset}\n"
}

function fresh_sys {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew update && brew upgrade && brew cleanup
  else
    sudo apt update && sudo apt full-upgrade && sudo apt autoremove
    sudo snap refresh
  fi
}

function fresh_vim {
  vim \
    -c 'PluginInstall' \
    -c 'PluginUpdate' \
    -c 'qa!'
}

function fresh {
  print_fresh_step 'System'
  fresh_sys
  print_fresh_step 'Vim'
  fresh_vim
}
