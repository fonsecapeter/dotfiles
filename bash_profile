# Git prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ <\1>/'
}
# export PS1="@:\w\[\033[34m\]\$(parse_git_branch)\[\033[00m\]$ "
source ~/.git-completion.bash

# Peter profile
export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;1m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;3m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"

export LSCOLORS="cxBxhxDxgxhxhxhxhxfxfx"

# stop showing untracked files (shorthand for --untracket-files=no)
alias gs="git status -uno"

# ensure brew git
alias git=/usr/local/bin/git

# for colorized ls on mac
alias ls='ls -G'
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# for colorized tree (brew install tree) that ignores node_modules and *.pyc
alias tree="tree -C -I 'node_modules|*.pyc|venv'"

# for 23andMe endpoints, curl with pretty print and auth
alias v3=~/ttam/api_curlbuddy/v3_curlbuddy.sh
alias v2=~/ttam/api_curlbuddy/v2_curlbuddy.sh
alias v1=~/ttam/api_curlbuddy/v1_curlbuddy.sh

# for django test printing
alias pbprint="echo \"import sys
sys.stderr.write('\n\n' + repr(object_to_print) + '\n\n')\" | pbcopy"

# dumn aliases
alias stamp='date +"%r"'
alias stampwatch='export PS1="\D{%I:%M %p}\n${PS1}"'
alias stampunwatch='export PS1=${PS1#"\D{%I:%M %p}\n"}'
# for work (need to put in vm)
alias test='tput setaf 2 && date +"%r" && tput sgr0 && ./manage.py test --verbosity=2'

# docker
# alias dockclean="docker rm -v $(docker ps -a -q -f status=exited)"
alias dockjango="docker-compose -f dev.yml run django python manage.py"
