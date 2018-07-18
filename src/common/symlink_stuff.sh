function symlink_file {
  local -r source=$(realpath "$1")
  local -r pointer=$(realpath "$2")
  if [ ! -f "${pointer}" ]; then
    ln -sv "${source}" "${pointer}" || true
  fi
}

function symlink_dir {
  local -r source=$(realpath "$1")
  local -r pointer=$(realpath "$2")
  if [ ! -d "${pointer}" ]; then
    ln -sv "${source}" "${pointer}" || true
  fi
}
