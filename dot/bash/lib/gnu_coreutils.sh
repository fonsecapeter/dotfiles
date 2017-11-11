# alias ll='gls --color=always --ignore=*.pyc --ignore=__pycache__ -la'

alias ll='tree -apug'  # using tree
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
# alias cat="ccat"
alias diff="colordiff -u"
alias fastping="ping -c 10 -i .2"
alias ping="ping -c 5"
