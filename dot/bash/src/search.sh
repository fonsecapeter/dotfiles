function search {
  # Search by common code standards
  #   => python
  if [[ "$1" == 'cls' ]]; then
    shift
    set -- "class $1" "$2"
  elif [[ "$1" == 'fnc' ]]; then
    shift
    set -- "def $1" "$2"
  elif [[ "$1" == 'var' ]]; then
    shift
    set -- "$1 = " "$2"
  elif [[ "$1" == 'asn' ]]; then
    shift
    set -- "= $1" "$2"
  fi

  ag --skip-vcs-ignores $@
}
