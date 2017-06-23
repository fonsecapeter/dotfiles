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

alias ls='gls --color=always --ignore=*.pyc --ignore=__pycache__'
alias grep='grep --color=always'
alias egrep='egrep --color=always'
# ignore stuff in tree
alias tree="tree -C -I 'node_modules|*.pyc|venv'"
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
# -----------------------------------------

# rbenv
# -----------------------------------------
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# -----------------------------------------

# use vim as manpager
# -----------------------------------------
# export MANPAGER="vim -" is overkill, don't want to use vim for all paging...
my_man() {
    man $1 | col -b | view -
}
alias man=my_man
# -----------------------------------------

# peter's awesome google-drive-tracked-vim-operated notes
# -----------------------------------------
notes_dir="${HOME}/GoogleDrive/Notes"
open_note() {
    note_file_name=$(echo "$1" | sed "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g") # remove colors/escape sequenses
    echo -n -e "\033]0;Notes\007"
    cur_dir="${PWD}"
    cd "${notes_dir}"
    vim "${note_file_name}"
    cd "${cur_dir}"
    echo -n -e "\033]0;Terminal\007"
}

alias notefind="find ${notes_dir} -name $1"

notes() {
    if [[ -z "${1}" ]]; then
        result="./"
    else
        result=$(notefind "$1")
    fi
    open_note "${result}"
}

alias notels="tree '${notes_dir}' -I help"

search_notes_just_file_name() {
    grep -ilr "${1}" "${notes_dir}" | grep -v "${notes_dir}/help/help.txt"
}
search_notes() {
    grep -r "${notes_dir}" -e $@ | grep -v "${notes_dir}/help/help.txt"
}
alias notesearch="search_notes"

note_search_open() {
    result=$(search_notes_just_file_name ${1} | head -n 1)
    open_note "${result}"
}
alias notesearchopen="note_search_open"

# -----------------------------------------

# work aliases
# -----------------------------------------
# can never remember where my docs are
alias docs='cd ~/Documents/throwbacks/new_hire_stuff/code_base/'

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
# gchat
# dark gray, light red, light green, light blue, light magenta, light cyan, yellow, white
# black,     dark red,  dark green,  dark blue,  dark magenta,  dark cyan,  brown,  light gray
alias chat="hangups --col-msg-self-fg 'light magenta' --col-msg-sender-fg 'dark gray' --col-msg-text-fg 'light cyan' --col-msg-date-fg 'yellow' --col-active-tab-fg 'dark gray'"

# disk space usage
alias disk_unsorted="sudo du -x -d1 -h $1"
alias disk="disk_unsorted | sort -hr"

# permissions
chmine () {
    sudo chown -R $USER "${@}"
    sudo chgrp -R $(id -g -n $USER) "${@}"

}
chmine-rw () {
    chmine "${@}"
    sudo chmod 664 "${@}"
}

# random django secret key generator
function django_secret() { python -c "import string,random; uni=string.ascii_letters+string.digits+string.punctuation; print repr(''.join([random.SystemRandom().choice(uni) for i in range(random.randint(45,50))]))" ;}

# obviously
alias matrix="cmatrix -b"

# makes my ansii art look cool
function centercat() { clear && echo && echo && echo && echo && echo && cat "${@}" |  awk '{ z = '$(tput cols)' - length; y = int(z / 2); x = z - y; printf "%*s%s%*s\n", x, "", $0, y, ""; }' && echo && echo && echo && echo && echo ;}

# TODO: work this into init_*.sh w/ cronjob to clean weekly
function trash() { mv "${@}" ~/.Trash; }

# timestamp
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
    if [[ "${OSTYPE}" =~ ^darwin ]]; then
        cal_text=$(command cal)
    else
        cal_text=$(command cal -h)
    fi
    hilight_title=$(sed "1s/^[[:space:]].*/${purple}&${reset}/" <<< "${cal_text}")
    hilight_days=$(sed "2s/^Su.*/${orange}&${reset}/" <<< "${hilight_title}")
    hilight_current_day=$(sed "1,/${today}/ s/${today}/${red}&${reset}/" <<< "${hilight_days}")
    echo "${hilight_current_day}"
    echo
}
alias cal='my_cal'
# -----------------------------------------


