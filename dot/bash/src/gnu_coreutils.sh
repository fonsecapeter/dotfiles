alias grep='grep --color=always'
alias egrep='egrep --color=always'
alias tree="tree -C -I 'node_modules|*.pyc|venv' --dirsfirst"
alias treee='tree -L 3'
# ctrl-t to insert file to cmd
# ctrl-r to search through history
export FZF_DEFAULT_OPTS='--color=16'

alias ln='ln -v'
alias ls='"ls" --color=always --group-directories-first'
alias ll='"ls" -lah --color=always --group-directories-first'
alias la='ll'
alias l='ls'
alias ts='tree -L 1'
alias t='ts'
alias tt='tree -aphug -L 1'
alias tl='tt'
alias ta='tt'

alias cp='cp -v'
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
alias search=ag
alias diff="colordiff -u"
alias fastping="ping -c 10 -i .2"
alias ping="ping -c 5"
alias vi=vim
