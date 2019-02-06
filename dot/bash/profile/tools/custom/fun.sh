alias matrix='cmatrix -b'

function randmoji {
  local -r emojis=(🚀 🌟 🎉)
  local -r num_emojis=${#emojis[*]}
  local -r idx=$(( (RANDOM % num_emojis) + 1 ))
  echo "${emojis[$idx]}"
}
