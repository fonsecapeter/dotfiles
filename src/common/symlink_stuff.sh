function symlink_file {
  if [ ! -f "${2}" ]; then
    ln -sv "${1}" "${2}" || true
  fi
}

function sudo_symlink_file {
  if [ ! -f "${2}" ]; then
    sudo ln -sv "${1}" "${2}" || true
  fi
}

function symlink_dir {
  if [ ! -d "${2}" ]; then
    ln -sv "${1}" "${2}" || true
  fi
}
