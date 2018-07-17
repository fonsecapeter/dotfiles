alias docker-clean='docker system prune -af'
alias docker-kill-all='docker kill $(docker ps -q)'
alias docker-rm-all-containers='docker rm $(docker ps -a -q)'
alias docker-rm-all-images='docker image rm $(docker images -q)'
