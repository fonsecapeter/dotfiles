function chmine {
  sudo chown -R $USER "${@}"
  sudo chgrp -R $(id -g -n $USER) "${@}"

}

function chmine-rw {
  chmine "${@}"
  sudo chmod 664 "${@}"
}
