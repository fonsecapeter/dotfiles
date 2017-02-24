red=$(tput setaf 1)
alias red="tput setaf 1"
green=$(tput setaf 2)
alias green="tput setaf 2"
blue=$(tput setaf 4)
alias blue="tput setaf 4"
orange=$(tput setaf 3)
alias orange="tput setaf 3"
reset=$(tput sgr0)
alias reset="tput sgr0"

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# test -e ~/.dircolors && \ 
eval `dircolors -b ~/.dircolors`

# Git prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ <\1>/'
}
source ~/.git-completion.bash

# Peter profile
export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;1m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;3m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"

export LSCOLORS="cxBxhxDxgxhxhxhxhxfxfx"

# stop showing untracked files (shorthand for --untracket-files=no)
alias gs="git status -uno"

# ensure brew git
alias git=/usr/local/bin/git

# for colorized ls on mac
alias ls='gls --color=always --ignore=*.pyc --ignore=__pycache__'
alias grep='grep --color=always'
alias egrep='egrep --color=always'
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# for colorized tree (brew install tree) that ignores node_modules and *.pyc
alias tree="tree -C -I 'node_modules|*.pyc|venv'"

# for 23andMe endpoints, curl with pretty print and auth
alias v3=~/ttam/api_curlbuddy/v3_curlbuddy.sh
alias v2=~/ttam/api_curlbuddy/v2_curlbuddy.sh
alias v1=~/ttam/api_curlbuddy/v1_curlbuddy.sh

# for work only
alias codebase='cd ~/Documents/throwbacks/new_hire_stuff/code_base/'

# for django test printing
alias pbprint="echo \"import sys
sys.stderr.write('\n\n' + repr(object_to_print) + '\n\n')\" | pbcopy"

# dumn aliases
function trash() { mv "${@}" ~/.Trash; }
alias stamp='orange && date +"%r" && reset && $@'
alias stampwatch='export PS1="\D{%I:%M %p}\n${PS1}"'
alias stampunwatch='export PS1=${PS1#"\D{%I:%M %p}\n"}'
# for work (need to put in vm)
# colorized_django_test() {
#   ./manage.py test --verbosity=2 $@ 2>&1 \
#     | sed "s/.*[oO][kK]$/$green&$reset/" \
#     | sed "s/.*ERROR$/$orange&$reset/" \
#     | sed "s/.*FAIL$/$red&$reset/" \
#     | sed "s/^FAILED.*/$red&$reset/" \
#     | sed "s/.*skipped.*/$blue&$reset/" \
#     | sed "s/^ERROR:/$orange&/" \
#     | sed "s/^FAIL.*/$red&/" \
#     | sed "s/^Ran.*tests in.*/$reset&/" \
#     | sed "s/^=*$/$reset&/"
#   tput cuu 2   # clear extra ' OK on second to last line'
#   echo '   '
#   echo
# }
# alias test=colorized_django_test
colorized_git_last() {
  git last \
      | sed "s/^[[:space:]].*/$blue&$reset/" \
      | sed "s/^M[[:space:]].*/$orange&$reset/" \
      | sed "s/^A[[:space:]].*/$green&$reset/" \
      | sed "s/^D[[:space:]].*/$red&$reset/"
}
alias gl=colorized_git_last

# vagrant aliases for work
# API_PATH='/kit23/workspace/vagrant/websites/api'

# alias mapi='cd $API_PATH && make && cd ../.. && make restart && stamp'
# function tapi_fun() { echo $1 && cd $API_PATH && ./manage.py test $1 && cd ../.. && stamp; }
# alias tapi=tapi_fun


# docker
# alias dockclean="docker rm -v $(docker ps -a -q -f status=exited)"
# alias dockjango="docker-compose -f dev.yml run django python manage.py"

# added for jarvs-classic
alias jarvs-classic="cd /Users/pfonseca/Personal/jarvs-classic; make start"

notes_dir="${HOME}/Google Drive/Notes"
start_notes() {
  echo -n -e "\033]0;Notes\007"
  cur_dir="${PWD}"
  cd "${notes_dir}"
  vim
  cd "${cur_dir}"
  echo -n -e "\033]0;Terminal\007"
}
alias notes=start_notes
search_notes() {
  grep -ilr "${1}" "${notes_dir}" | grep -v "${notes_dir}/help/help.txt"
}
alias notesearch="search_notes"
alias notels="tree '${notes_dir}' -I help"
open_note() {
  echo -n -e "\033]0;Notes\007"
  cur_dir="${PWD}"
  cd "${notes_dir}"
  vim "${1}"
  cd "${cur_dir}"
  echo -n -e "\033]0;Terminal\007"
}
alias noteopen="open_note"
note_search_open() {
  result=$(search_notes ${1} | head -n 1)
  open_note "${result}"
}
alias notesearchopen="note_search_open"


# added for jarbs
alias jarbs="cd /Users/pfonseca/Personal/jarbs; make start"
