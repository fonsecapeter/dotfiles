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
