my_cal () {
  today=$(date +%e)
  this_month=$(date +%B | tr '[:upper:]' '[:lower:]')
  this_year=$(date +%Y | tr '[:upper:]' '[:lower:]')
  # pass in month or get current
  if [ -z "$1" ]; then
    month="${this_month}"
  else
    month=$(echo "$1" | tr '[:upper:]' '[:lower:]')
  fi
  # pass in year or get current
  if [ -z "$2" ]; then
    year="${this_year}"
  else
    year="$2"
  fi
  # need -h in linux
  if [[ "${OSTYPE}" =~ ^darwin ]]; then
    cal_text=$(command cal ${month} ${year})
  else
    cal_text=$(command cal -h ${month} ${year})
  fi
  hilight_title=$(echo "${cal_text}" | sed "1s/^[[:space:]].*/${purple}&${reset}/")
  hilight_days=$(echo "${hilight_title}" | sed "2s/^Su.*/${orange}&${reset}/")

  echo
  # highlight today if looking at present
  if [ "${month}" == "${this_month}" ] && [ "${year}" == "${this_year}" ]; then
    this_year_2d=$(date +%y)
    hilight_current_day=$(echo "${hilight_days}" | sed "s/${today}[^(?:${this_year_2d})]/${red}&${reset}/")
    echo "${hilight_current_day}"
  else
    echo "${hilight_days}"
  fi
  echo
}
alias cal='my_cal'
