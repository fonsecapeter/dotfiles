source ~/.git-completion.bash
alias gs="git status"
colorized_git_last() {
  git last \
      | sed "s/^commit[[:space:]].*/$orange&$reset/" \
      | sed "5s/^[[:space:]].*/$green&$reset/" \
      | sed "s/^M[[:space:]].*/$orange&$reset/" \
      | sed "s/^A[[:space:]].*/$green&$reset/" \
      | sed "s/^D[[:space:]].*/$red&$reset/"
      # | cat | tr '\n' '\f' | sed -e "s/a^Author:\f\f[[:space:]].*/$(tput setaf 2)&$(tput sgr0)/" | tr '\f' '\n'
      # | cat | tr '\n' '\f' | sed -e "s/a^Author:\f\f[[:space:]].*/$green&$reset/"  \
}
alias gl=colorized_git_last

rebase_onto() {
  git rebase -i --onto "$1" "$2~1"
}
alias gr=rebase_onto

pull_rebase() {
  git pull $@ --rebase
}
alias gp=pull_rebase

git-squash() {
  if [ -z "$1" ]; then
    echo 'How many commits to squash???'
    return 1
  fi
  git rebase -i "HEAD~$1"
}
