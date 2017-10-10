function dashes {
  if [ ! $? -eq 0 ]; then
    echo -en "%F{red}%Bx"
    return 0
  fi
  if git rev-parse --git-dir > /dev/null 2>&1; then
    local -r git_status=$(git status 2>&1)
    if [[ "${git_status}" =~ "interactive rebase" ]]; then
      echo -en "%F{magenta}."
      return 0
    elif [[ "${git_status}" =~ "Changes not staged" ]]; then
      echo -en "%F{red}*"
      return 0
    elif [[ "${git_status}" =~ "Untracked files" ]]; then
      echo -en "%F{red}*"
      return 0
    elif [[ "${git_status}" =~ "Changes to be committed" ]]; then
      echo -en "%F{yellow}%B+"
      return 0
    elif [[ "${git_status}" =~ "different commits" ]]; then
      echo -en "%F{yellow}~"
      return 0
    elif [[ "${git_status}" =~ "branch is ahead" ]]; then
      echo -en "%F{yellow}~"
      return 0
    elif [[ "${git_status}" =~ "branch is behind" ]]; then
      echo -en "%F{yellow}~"
      return 0
    fi
  fi
  echo -en "%F{black}%B-"
}

PROMPT=' $(dashes)%b%F{white}%B$%f%b '
RPROMPT='%F{yellow}%t%f'
TRAPALRM() {
    zle reset-prompt
}
TMOUT=8
