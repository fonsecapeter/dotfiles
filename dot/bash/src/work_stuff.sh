# need this all the time
alias accounts='cat $(notes --find new_account)'

# can never remember where my docs are
alias docs='cd ~/Documents/code_base/'

# for printing through django stderr logs
alias pbprint="echo \"import sys
sys.stderr.write('\n\n' + repr(object_to_print) + '\n\n')\" | pbcopy"

# docker
alias dockclean="docker rm -v $(docker ps -a -q -f status=exited)"
alias dockjango="docker-compose -f dev.yml run django python manage.py"
