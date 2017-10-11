function replace {
  grep -rl "$1" "$3" | xargs sed -i '' "s/$1/$2/g"
}
function replace_alt {
  grep -rl "$1" "$3" | xargs sed -i '' "s|$1|$2|g"
}
alias replace-alt="replace_alt"

function replace_alt_alt {
  grep -rl "$1" "$3" | xargs sed -i '' "s@$1@$2@g"
}
alias replace-alt-alt="replace_alt_alt"
