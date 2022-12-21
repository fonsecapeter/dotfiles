if [ ! -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
brew update && brew upgrade
cat ~/dotfiles/src/osx/brews.txt | xargs brew install
cat ~/dotfiles/src/osx/casks.txt | xargs brew install --cask

~/dotfiles/src/common/install_tools.sh
