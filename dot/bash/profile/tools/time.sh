function now() {
  echo $(date '+%A, %x %I:%M %p')
}

function today() {
  echo $(date '+%A, %x')
}

function stamp {
  printf "${orange}"
  date +"%r"
  printf "${reset}"
  $@
}
