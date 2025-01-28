function search {
  # Search by common code standards (python)
  #
  # Usage:
  #   search [--regex] something in_path
  #   search [--regex] cls something in_path
  #   search [--regex] fnc something in_path
  #   search [--regex] var something in_path
  #   search [--regex] asn something in_path
  #
  # Options:
  #   --regex  Search by regex
  local flags=('--skip-vcs-ignores' '--smart-case' '--color-line-number=1;30')
  if [[ "$1" == '--regex' ]]; then
    shift
  else
    flags[4]='--fixed-strings'
  fi

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

  ag $flags $@
}
