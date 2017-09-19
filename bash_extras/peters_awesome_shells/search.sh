search () {
  search_help_message="
 ${green}-- Recursively Search For Text Accross Files --${reset}

 usage: ${green}search ${purple}<regex> <optional-path>${reset}

 ex 1: search for ${blue}TODO${reset} within a project
   ${green}search ${purple}\"TODO\" ./Projects/time_machine${reset}

 ex 2: search for lines starting with ${blue}I do declare.${reset} within ${blue}pwd${reset}
   ${green}search ${purple}\"^I do declare[.]\"${reset}
"
  if [ -z "$1" ]; then
    echo
    echo "${orange} !! No search regex given !!${reset}"
    echo "${search_help_message}"
    return 1
  else
    search_regex="$1"
  fi
  if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "HALP" ]; then
    echo "${search_help_message}"
    return 1
  fi
  if [ -z "$2" ]; then
    search_path="./"
  else
    search_path="$2"
  fi

  grep --color=always -rn "${search_regex}" "${search_path}" | tee /dev/tty | echo "${purple}$(wc -l) ${orange}matches${reset}"
}
