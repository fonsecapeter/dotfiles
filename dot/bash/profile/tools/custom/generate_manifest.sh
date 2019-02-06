function generate_manifest {
  local -r target_dir="${1%/}"  # relative
  local -r pwd_tilde="${PWD/#$HOME/~}"
  local -r manifest_file="${PWD}/${target_dir}/manifest.sh"
  
  printf '' > "${manifest_file}"
  for file_path in "${target_dir}/"*.sh; do
    if [ $(basename "${file_path%.*}") != 'manifest' ]; then
      printf "source ${pwd_tilde}/${file_path}\n" >> "${manifest_file}"
    fi
  done
  
  printf '\n' >> "${manifest_file}"
  for sub_dir_path in $(find "${target_dir}/"* -maxdepth 0 -type d); do
    local sub_dir_manifest_path="${PWD}/${sub_dir_path}/manifest.sh"
    if [ -f "${sub_dir_manifest_path}" ]; then
      generate_manifest "${sub_dir_path}"
      printf "source ${sub_dir_manifest_path}\n" >> "${manifest_file}"
    fi
  done
  printf "generated ${manifest_file}\n"
}
