# export PS1="${bright_orange}\u${bright_white}@${red}\h${bright_white}:${bright_red}\W${bright_white}$ ${reset}"
dashes () {
  if [ ! $? -eq 0 ]; then
    echo "${bright_red}xx"
    return 0
  fi
  if git rev-parse --git-dir > /dev/null 2>&1; then
    git_status=$(git status 2>&1)
    if [[ "${git_status}" =~ "interactive rebase" ]]; then
      echo -en "\001${purple}\002.."
      return 0
    elif [[ "${git_status}" =~ "Changes not staged" ]]; then
      echo -en "\001${red}\002**"
      return 0
    elif [[ "${git_status}" =~ "Untracked files" ]]; then
      echo -en "\001${red}\002**"
      return 0
    elif [[ "${git_status}" =~ "Changes to be committed" ]]; then
      echo -en "\001${bright_orange}\002++"
      return 0
    elif [[ "${git_status}" =~ "different commits" ]]; then
      echo -en "\001${orange}\002~~"
      return 0
    elif [[ "${git_status}" =~ "branch is ahead" ]]; then
      echo -en "\001${orange}\002~~"
      return 0
    elif [[ "${git_status}" =~ "branch is behind" ]]; then
      echo -en "\001${orange}\002~~"
      return 0
    fi
  fi
  echo -en "\001${bright_black}\002--"
}
export PS1=' $(dashes) \[${bright_green}\]\W\[${white}\]$ \[${reset}\]'
export LSCOLORS="cxBxhxDxgxhxhxhxhxfxfx"

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# test -e ~/.dircolors && \
eval `dircolors -b ~/.dircolors`
