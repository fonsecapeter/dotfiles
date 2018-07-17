# source ~/.git-completion.bash
alias gut=git
alias got=git
alias gs="git shorty"
colorized_git_last() {
  git last \
    | sed "s/^commit[[:space:]].*/$orange&$reset/" \
    | sed "5s/^[[:space:]].*/$green&$reset/" \
    | sed "s/^M[[:space:]].*/$orange&$reset/" \
    | sed "s/^A[[:space:]].*/$green&$reset/" \
    | sed "s/^D[[:space:]].*/$red&$reset/" \
    | sed "s/^R[0-9].*/$purple&$reset/"
}
alias gl=colorized_git_last

rebase_onto() {
  git rebase -i --preserve-merges --onto "${1}" "${2}~1"
}
pull_and_rebase_onto() {
  pull_on "${1}"
  rebase_onto "${1}" "${2}"
}
alias gr='pull_and_rebase_onto'

pull_rebase() {
  git pull $@ --rebase
}
alias gp=pull_rebase

alias gm='git merc'

git-squash() {
  if [ -z "$1" ]; then
    echo 'How many commits to squash???'
    return 1
  fi
  git rebase -i "HEAD~$1"
}

pull_on() {
  current_branch=$(gs | sed 's/## //' | sed 's/[.][.][.].*//')
  git checkout "${1}"
  git pull
  git checkout "${current_branch}"
}
