# http://brettterpstra.com/2015/02/20/shell-trick-printf-rules/

# print a horizontal rule
function rule {
	printf -v _hr "%*s" $(tput cols) && echo ${_hr// /${1--}}
}

# print horizontal ruler with message
function message_rule  {
	if [ $# -eq 0 ]; then
		echo "Usage: message_rule MESSAGE [RULE_CHARACTER]"
		return 1
	fi
	# Fill line with ruler character ($2, default "-"), reset cursor, move 2 cols right, print message
	printf -v _hr "%*s" $(tput cols) && echo -en ${_hr// /${2--}} && echo -e "\r\033[2C$1"
}

# prints init steps
# $1: format, main sentence with %s in it
# $2: subject, to be interpolated into the format
function print_init_step {
  printf \
    "\n${bright_black}  -->  ${white}${1}${bright_black}...${reset}\n\n" \
    "${bright_red}${2}${white}"
}

# prints init steps
# $1: message, to be printed
function print_init_title {
  printf \
    "\n${bright_black}  ==> ${green}${1}${reset}\n\n"
}

# print right-aligned
alias message_right="printf '%*s' $(tput cols)"

# makes ascii art look cool
function centercat {
  clear
  echo && echo && echo && echo && echo
  cat "${@}" \
    |  awk '{ z = '$(tput cols)' - length; y = int(z / 2); x = z - y; printf "%*s%s%*s\n", x, "", $0, y, ""; }'
  echo && echo && echo && echo && echo
}
