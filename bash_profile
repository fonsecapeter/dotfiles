# greeter
# -----------------------------------------
if [[ "$OSTYPE" == "darwin"* ]]; then
    ascii_colors="2 3 1 5 4"
    ascii_file="${HOME}/dotfiles/ascii_art/apple.txt"
else
    ascii_colors="15 8 9"
    ascii_file="${HOME}/dotfiles/ascii_art/tux.txt"
fi
echo
neofetch --ascii "${ascii_file}" --ascii_colors "${ascii_colors}"
# -----------------------------------------

source ~/dotfiles/bash_extras/manifest.sh
alias search=ag

# use vim as manpager
# -----------------------------------------
# export MANPAGER="vim -" is overkill, don't want to use vim for all paging...
my_man() {
    man $1 | col -b | view -
}
alias man=my_man
# -----------------------------------------

# added for jarbs
alias jarbs='~/Projects/jarbs/scripts/start.sh'

# added for ttam-buddy https://github.com/fonsecapeter/ttam_buddy/
alias ttam-buddy='~/Projects/ttam_buddy/ttam_buddy.sh'
