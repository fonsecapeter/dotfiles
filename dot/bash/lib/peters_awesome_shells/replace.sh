replace () {
  grep -rl "$1" "$3" | xargs sed -i '' "s/$1/$2/g"
}
replace_alt () {
  grep -rl "$1" "$3" | xargs sed -i '' "s|$1|$2|g"
}
alias replace-alt="replace_alt"

replace_alt_alt () {
  grep -rl "$1" "$3" | xargs sed -i '' "s@$1@$2@g"
}
alias replace-alt-alt="replace_alt_alt"
