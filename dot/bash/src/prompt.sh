# function git-dash {
#   if [ ! $? -eq 0 ]; then
#     echo "${bright_red}x"
#     return 0
#   fi
#   if git rev-parse --git-dir > /dev/null 2>&1; then
#     git_status=$(git status 2>&1)
#     if [[ "${git_status}" =~ "interactive rebase" ]]; then
#       echo -en "\001${purple}\002."
#       return 0
#     elif [[ "${git_status}" =~ "Changes not staged" ]]; then
#       echo -en "\001${red}\002*"
#       return 0
#     elif [[ "${git_status}" =~ "Untracked files" ]]; then
#       echo -en "\001${red}\002*"
#       return 0
#     elif [[ "${git_status}" =~ "Changes to be committed" ]]; then
#       echo -en "\001${bright_orange}\002+"
#       return 0
#     elif [[ "${git_status}" =~ "different commits" ]]; then
#       echo -en "\001${orange}\002~"
#       return 0
#     elif [[ "${git_status}" =~ "branch is ahead" ]]; then
#       echo -en "\001${orange}\002~"
#       return 0
#     elif [[ "${git_status}" =~ "branch is behind" ]]; then
#       echo -en "\001${orange}\002~"
#       return 0
#     fi
#   fi
#   echo -en "\001${bright_black}\002 "
# }
#
# export PS1='$(git-dash)\[${bright_white}\]$\[${reset}\] '
export PS1='\[${bright_white}\]$\[${reset}\] '

# name tab by active process
PROMPT_COMMAND='printf "\033]0;%s\a" "$(basename $0)"'
function proc_title {
  printf "\033]0;%s\a" "${BASH_COMMAND}"
}
trap proc_title DEBUG
