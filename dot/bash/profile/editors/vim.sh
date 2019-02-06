# ctags
alias retag='ctags -R .'

# use vim as manpager
alias man=my_man
function my_man {
  man $1 | col -b | view -
}
