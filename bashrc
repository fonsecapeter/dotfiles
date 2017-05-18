# in ubuntu, copy this to the top of ~/.bashrc

# ================================================================
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias git='sudo git'
alias apt-sources="grep -r --include '*.list' '^deb ' /etc/apt/sources.list*"
PATH=$PATH:~/.local/bin
# ================================================================

# copy this to the bottom of ~/.bashrc

# ================================================================
source ~/.bash_profile
alias ls='ls --color=always'
# ================================================================
