function explative {
  local swear_words=('h*ck' 'fl*p' 'f*dge')

  local -r size=${#swear_words[@]}
  index=$(($RANDOM % $size))
  echo ${swear_words[$index]}
}
