export PS1='\[${bright_white}\]%\[${reset}\] '

# name tab by active process
PROMPT_COMMAND='printf "\033]0;%s\a" "$(basename $0)"'
function proc_title {
  printf "\033]0;%s\a" "${BASH_COMMAND}"
}
trap proc_title DEBUG
