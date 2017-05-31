if type archey >/dev/null 2>&1; then
    archey
elif type neofetch >/dev/null 2>&1; then
    echo
    neofetch
else
    echo
    screenfetch
fi
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
# alias gs="git status -uno"
alias gs="git status"

# ensure brew git
# alias git=/usr/local/bin/git

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
# for work
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

# vagrant aliases for work
# API_PATH='/kit23/workspace/vagrant/websites/api'

# alias mapi='cd $API_PATH && make && cd ../.. && make restart && stamp'
# ctapi_fun() {
#   $API_PATH/manage.py test $@ 2>&1 \
#       | sed "s/.*[oO][kK]$/$green&$reset/" \
#       | sed "s/.*ERROR$/$orange&$reset/" \
#       | sed "s/.*FAIL$/$red&$reset/" \
#       | sed "s/^FAILED.*/$red&$reset/" \
#       | sed "s/.*skipped.*/$blue&$reset/" \
#       | sed "s/^ERROR:/$orange&/" \
#       | sed "s/^FAIL.*/$red&/" \
#       | sed "s/^Ran.*tests in.*/$reset&/" \
#       | sed "s/^=*$/$reset&/"
#   tput cuu 2   # clear extra ' OK on second to last line'
#   echo '   '
#   echo
# }
# alias test=colorized_django_test
# function tapi_fun() { $API_PATH/manage.py test $1 && stamp; }
# alias tapi=ctapi_fun

# docker
# alias dockclean="docker rm -v $(docker ps -a -q -f status=exited)"
# alias dockjango="docker-compose -f dev.yml run django python manage.py"

# added for jarvs-classic
alias jarvs-classic="cd /Users/pfonseca/Personal/jarvs-classic; make start"

notes_dir="${HOME}/GoogleDrive/Notes"
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

# dark gray, light red, light green, light blue, light magenta, light cyan, yellow, white
# black,     dark red,  dark green,  dark blue,  dark magenta,  dark cyan,  brown,  light gray
alias chat="hangups --col-msg-self-fg 'light magenta' --col-msg-sender-fg 'dark gray' --col-msg-text-fg 'light cyan' --col-msg-date-fg 'yellow' --col-active-tab-fg 'dark gray'"

# disk space usage
alias disk_unsorted="sudo du -x -d1 -h $1"
alias disk="disk_unsorted | sort -hr"

chmine () {
  sudo chown $USER "${@}"
  sudo chgrp $(id -g -n $USER) "${@}"
  sudo chmod 664 "${@}"
}

# added for jarbs
alias jarbs='~/Projects/jarbs/scripts/start.sh'

