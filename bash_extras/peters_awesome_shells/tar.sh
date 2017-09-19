my_tarball () {
  if [ -z "$1" ]; then
    echo "What the $(explative) am i supposed to call the tarball?"
    return
  fi
  out_name=$(echo "$1" | sed -e "s/[.]gz$//" | sed -e "s/[.]tar$//")
  shift
  if [ -z "$1" ]; then
    # ball up pwd by default
    in_stuff="./"
  else
    in_stuff=$@
  fi
  eval "tar -cvzf \"${out_name}.tar.gz\" ${in_stuff}"
}
alias tarball=my_tarball

untarball () {
  if [ -z "$1" ]; then
    echo "What the $(explative) am i supposed to untarball?"
    return
  fi
  if [ -z "$2" ]; then
    # unpack to pwd by default
    tar -xvzf "$1"
  fi
  tar -xvzf "$1" -C "$2"
}
alias tarunball=untarball
