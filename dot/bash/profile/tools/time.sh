function now() {
  echo $(date '+%A, %Y-%m-%d %I:%M %p')
}

function today() {
  echo $(date '+%A, %Y-%m-%d')
}

function stamp {
  printf "${orange}"
  now
  printf "${reset}"
  $@
}

function cowstamp {
  printf "${orange}"
  now | cowsay -e ".."
  printf "${reset}"
  $@
}
