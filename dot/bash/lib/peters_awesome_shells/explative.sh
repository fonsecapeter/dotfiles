explative () {
  array[0]="h*ck"
  array[1]="fl*p"
  array[2]="f*dge"

  size=${#array[@]}
  index=$(($RANDOM % $size))
  echo ${array[$index]}
}
