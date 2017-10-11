# greeter
# -----------------------------------------
function comp {
  if [[ "$OSTYPE" == "darwin"* ]]; then
      ascii_colors="2 3 1 5 4"
      ascii_file="${HOME}/dotfiles/dot/ascii_art/apple.txt"
  else
      ascii_colors="15 8 9"
      ascii_file="${HOME}/dotfiles/dot/ascii_art/tux.txt"
  fi
  echo
  neofetch --ascii "${ascii_file}" --ascii_colors "${ascii_colors}"
  echo
}