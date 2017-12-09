if [ ! -x "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update && brew upgrade
brew install vim --with-override-system-vi
brew install neofetch tree coreutils cmatrix python3 ctags colordiff rbenv ag zsh httpie crystal

~/dotfiles/src/common/install_tools.sh
