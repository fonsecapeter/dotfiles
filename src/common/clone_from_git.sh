function clone_from_git {
  if [ ! -d "${2}" ]; then
    git clone "git@github.com:${1}.git" "${2}"
    sudo chown -R $USER "${2}"
    sudo chgrp -R $(id -g -n $USER) "${2}"
  fi
}
