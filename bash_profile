# greeter
# -----------------------------------------
if [[ "$OSTYPE" == "darwin"* ]]; then
    ascii_colors="2 3 1 5 4"
    ascii_file="${HOME}/dotfiles/ascii_art/apple.txt"
else
    ascii_colors="15 8 9"
    ascii_file="${HOME}/dotfiles/ascii_art/tux.txt"
fi
echo
neofetch --ascii "${ascii_file}" --ascii_colors "${ascii_colors}"
# -----------------------------------------

# colors
# -----------------------------------------
red=$(tput setaf 1)
alias red="tput setaf 1"
green=$(tput setaf 2)
alias green="tput setaf 2"
orange=$(tput setaf 3)
alias orange="tput setaf 3"
blue=$(tput setaf 4)
alias blue="tput setaf 4"
purple=$(tput setaf 5)
alias purple="tput setaf 5"
reset=$(tput sgr0)
alias reset="tput sgr0"
# -----------------------------------------

# base shell config
# -----------------------------------------
export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;1m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;3m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"
export LSCOLORS="cxBxhxDxgxhxhxhxhxfxfx"
# -----------------------------------------

# gnu coreutils
# -----------------------------------------
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# test -e ~/.dircolors && \
eval `dircolors -b ~/.dircolors`

alias ll='gls --color=always --ignore=*.pyc --ignore=__pycache__ -la'
alias grep='grep --color=always'
alias egrep='egrep --color=always'
alias tree="tree -C -I 'node_modules|*.pyc|venv' --dirsfirst"

alias cp='cp -v'
alias ln='ln -v'
alias ls="tree -L 1"
alias mkdir="mkdir -pv"
alias mv='mv -v'
alias rm='rm -v'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias ag='ag --path-to-ignore ~/.agignore --stats'
alias cat="ccat"
alias diff="colordiff -u"
alias fastping="ping -c 10 -i .2"
alias ping="ping -c 5"
# -----------------------------------------

# git
# -----------------------------------------
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
# -----------------------------------------

# ruby
# -----------------------------------------
# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# -----------------------------------------

# python
# -----------------------------------------
# ipython
# alias ipython='ipython3'
alias activate='. venv/bin/activate'

# random django secret key generator
function django_secret() { python -c "import string,random; uni=string.ascii_letters+string.digits+string.punctuation; print repr(''.join([random.SystemRandom().choice(uni) for i in range(random.randint(45,50))]))" ;}
# -----------------------------------------

# use vim as manpager
# -----------------------------------------
# export MANPAGER="vim -" is overkill, don't want to use vim for all paging...
my_man() {
    man $1 | col -b | view -
}
alias man=my_man
# -----------------------------------------

# work aliases
# -----------------------------------------
# need this all the time
alias accounts='cat $(notes --find new_account)'

# can never remember where my docs are
alias docs='cd ~/Documents/code_base/'

# for printing through django stderr logs
alias pbprint="echo \"import sys
sys.stderr.write('\n\n' + repr(object_to_print) + '\n\n')\" | pbcopy"

# vagrant only
# ~~~~~~~~~~~~~~~~~~~
# API_PATH='/kit23/workspace/vagrant/websites/api'

# alias mapi='cd $API_PATH && make && cd ../.. && make restart && stamp'
# API_PATH='/kit23/workspace/vagrant/websites/api'
# tapi() {
#     $API_PATH/manage.py test $@ 2>&1 \
#       | sed -u "1s/F/$red&$reset/g" \
#       | sed -u "1s/E/$orange&$reset/g" \
#       | sed -u "1s/\./$green&$reset/g" \
#       | sed -u "s/.*[oO][kK]$/$green&$reset/" \
#       | sed -u "s/.*ERROR$/$orange&$reset/" \
#       | sed -u "s/^OK.*/$blue&/" \
#       | sed -u "s/.*FAIL$/$red&$reset/" \
#       | sed -u "s/^FAILED.*/$red&$reset/" \
#       | sed -u "s/^ERROR:/$orange&/" \
#       | sed -u "s/^FAIL.*/$red&/" \
#       | sed -u "s/^Ran.*tests in.*/$reset&/" \
#       | sed -u "s/^=*$/$reset&/"
#     tput cuu 2   # clear extra ' OK on second to last line'
#     echo '   '
#     echo
# }
# ~~~~~~~~~~~~~~~~~~~

# docker
# alias dockclean="docker rm -v $(docker ps -a -q -f status=exited)"
# alias dockjango="docker-compose -f dev.yml run django python manage.py"
# -----------------------------------------

# added for jarbs
alias jarbs='~/Projects/jarbs/scripts/start.sh'

# added for ttam-buddy https://github.com/fonsecapeter/ttam_buddy/
alias ttam-buddy='~/Projects/ttam_buddy/ttam_buddy.sh'

# peter's awesome aliases
# -----------------------------------------
alias refresh="source ~/.bash_profile"
# search () {
#   search_help_message="
#  ${green}-- Recursively Search For Text Accross Files --${reset}
#
#  usage: ${green}search ${purple}<regex> <optional-path>${reset}
#
#  ex 1: search for ${blue}TODO${reset} within a project
#    ${green}search ${purple}\"TODO\" ./Projects/time_machine${reset}
#
#  ex 2: search for lines starting with ${blue}I do declare.${reset} within ${blue}pwd${reset}
#    ${green}search ${purple}\"^I do declare[.]\"${reset}
# "
#   if [ -z "$1" ]; then
#     echo
#     echo "${orange} !! No search regex given !!${reset}"
#     echo "${search_help_message}"
#     return 1
#   else
#     search_regex="$1"
#   fi
#   if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "HALP" ]; then
#     echo "${search_help_message}"
#     return 1
#   fi
#   if [ -z "$2" ]; then
#     search_path="./"
#   else
#     search_path="$2"
#   fi
#
#   grep --color=always -rn "${search_regex}" "${search_path}" | tee /dev/tty | echo "${purple}$(wc -l) ${orange}matches${reset}"
# }
alias search='ag'
replace () {
  grep -rl "$1" "$3" | xargs sed -i '' "s/$1/$2/g"
}
replace_alt () {
  grep -rl "$1" "$3" | xargs sed -i '' "s|$1|$2|g"
}
alias replace-alt="replace_alt"
replace_alt_alt () {
  grep -rl "$1" "$3" | xargs sed -i '' "s@$1@$2@g"
}
alias replace-alt-alt="replace_alt_alt"

explative () {
  array[0]="h*ck"
  array[1]="fl*p"
  array[2]="f*dge"

  size=${#array[@]}
  index=$(($RANDOM % $size))
  echo ${array[$index]}
}

my_tarball () {
  if [ -z "$1" ]; then
    echo "What the $(explative) am i supposed to call the tarball?"
    return
  fi
  out_name=$(echo "$1" | sed -e "s/[.]gz$//" | sed -e "s/[.]tar$//")
  shift
  if [ -z "$1" ]; then
    # ball up pwd by default
    in_stuff="./"
  else
    in_stuff=$@
  fi
  eval "tar -cvzf \"${out_name}.tar.gz\" ${in_stuff}"
}
alias tarball=my_tarball

untarball () {
  if [ -z "$1" ]; then
    echo "What the $(explative) am i supposed to untarball?"
    return
  fi
  if [ -z "$2" ]; then
    # unpack to pwd by default
    tar -xvzf "$1"
  fi
  tar -xvzf "$1" -C "$2"
}

# convert all filenames in pwd to snake_case
alias snakify='for f in *\ *; do mv "$f" "${f// /_}"; done'

pypathify() {
  # my/file/name.py -> my.file.name
  echo "$1" |  sed "s|/|.|g" | sed "s/[.]py//"
}
unpypathify() {
  # my.file.name.py -> my/file/name.py
  slash_path="$(echo "$1" | sed "s|[.]|/|g" | sed "s|/py|.py|")"
  if [[ ${slash_path: -3} != .py ]]; then  # only works with .py files
    slash_path="${slash_path}.py"
  fi;
  echo "${slash_path}"
}

# gchat
# dark gray, light red, light green, light blue, light magenta, light cyan, yellow, white
# black,     dark red,  dark green,  dark blue,  dark magenta,  dark cyan,  brown,  light gray
alias chat="hangups --col-msg-self-fg 'light magenta' --col-msg-sender-fg 'dark gray' --col-msg-text-fg 'light cyan' --col-msg-date-fg 'yellow' --col-active-tab-fg 'dark gray'"

# disk space usage
# alias disk_unsorted="sudo du -x -d1 -h $1"
disk_unsorted() {
    sudo du -x -d1 -h $@
}
disk_sorted() {
    disk_unsorted | sort -hr
}
alias disk=disk_sorted
# alias disk="disk_unsorted | sort -hr"

# finding whos listening on my ports
alias localhost_ports="netstat -a | grep LISTEN | grep localhost"
alias listening="netstat -a | grep LISTEN"
localhosts() {
  if [ -z "$1" ]; then
    localhost_ports
  else
    lsof -i ":$1"
  fi
}
alias ports=localhosts

# permissions
chmine () {
    sudo chown -R $USER "${@}"
    sudo chgrp -R $(id -g -n $USER) "${@}"

}
chmine-rw () {
    chmine "${@}"
    sudo chmod 664 "${@}"
}

# ctags
alias retag="ctags -R ."

# obviously
alias matrix="cmatrix -b"

# makes my ansii art look cool
function centercat() { clear && echo && echo && echo && echo && echo && cat "${@}" |  awk '{ z = '$(tput cols)' - length; y = int(z / 2); x = z - y; printf "%*s%s%*s\n", x, "", $0, y, ""; }' && echo && echo && echo && echo && echo ;}

# TODO: work this into init_*.sh w/ cronjob to clean weekly
# and figure out linux vs osx
function trash() { mv "${@}" ~/.Trash; }

# time
stamp() {
    orange
    date +"%r"
    reset
    $@
}
alias stampwatch='export PS1="\D{%I:%M %p}\n${PS1}"'
alias stampunwatch='export PS1=${PS1#"\D{%I:%M %p}\n"}'
my_cal () {
    # use <<< because single line | is too much
    echo
    today=$(date +%e)
    this_month=$(date +%B | tr '[:upper:]' '[:lower:]')
    this_year=$(date +%Y | tr '[:upper:]' '[:lower:]')
    if [ -z "$1" ]; then
        month="${this_month}"
    else
        month=$(echo "$1" | tr '[:upper:]' '[:lower:]')
    fi
    if [ -z "$2" ]; then
        year="${this_year}"
    else
        year="$2"
    fi

    if [[ "${OSTYPE}" =~ ^darwin ]]; then
        cal_text=$(command cal ${month} ${year})
    else
        cal_text=$(command cal -h ${month} ${year})
    fi
    hilight_title=$(sed "1s/^[[:space:]].*/${purple}&${reset}/" <<< "${cal_text}")
    hilight_days=$(sed "2s/^Su.*/${orange}&${reset}/" <<< "${hilight_title}")
    if [ "${month}" == "${this_month}" ] && [ "${year}" == "${this_year}" ]; then
        hilight_current_day=$(sed "1,/${today}/ s/${today}/${red}&${reset}/" <<< "${hilight_days}")
        echo "${hilight_current_day}"
    else
        echo "${hilight_days}"
    fi
    echo
}
alias cal='my_cal'

# super dumn typo
alias maketart="echo '${blue}o${cyan}%${red}@${purple}8${reset}' && echo '\\__/'"
# -----------------------------------------
