# export PS1="${bright_orange}\u${bright_white}@${red}\h${bright_white}:${bright_red}\W${bright_white}$ ${reset}"
my_dash () {
  if [ ! $? -eq 0 ]; then
    echo "${bright_red}xx"
    return 0
  fi
  if git rev-parse --git-dir > /dev/null 2>&1; then
    git_status=$(git status 2>&1)
    if [[ "${git_status}" =~ "interactive rebase" ]]; then
      echo -e "${purple}.."
      return 0
    elif [[ "${git_status}" =~ "Changes not staged" ]]; then
      echo -e "${red}**"
      return 0
    elif [[ "${git_status}" =~ "Untracked files" ]]; then
      echo -e "${red}**"
      return 0
    elif [[ "${git_status}" =~ "Changes to be committed" ]]; then
      echo -e "${bright_orange}++"
      return 0
    elif [[ "${git_status}" =~ "different commits" ]]; then
      echo -e "${orange}~~"
      return 0
    elif [[ "${git_status}" =~ "branch is ahead" ]]; then
      echo -e "${orange}~~"
      return 0
    elif [[ "${git_status}" =~ "branch is behind" ]]; then
      echo -e "${orange}~~"
      return 0
    fi
  fi
  echo -e "${bright_black}--"
}
dashes='echo "$(my_dash)"'
export PS1=" \`${dashes}\` ${bright_green}\W${white}$ ${reset}"
export LSCOLORS="cxBxhxDxgxhxhxhxhxfxfx"

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# test -e ~/.dircolors && \
eval `dircolors -b ~/.dircolors`
