if [ ! -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
brew update && brew upgrade
brew install vim --with-override-system-vi
cat ~/dotfiles/src/osx/brews.txt | xargs brew install

~/dotfiles/src/common/install_tools.sh
