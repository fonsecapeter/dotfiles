source ~/dotfiles/bin/common/clone_from_git.sh
mkdir ~/Projects

sudo pip3 install ipython[all]

# shellectric colors
clone_from_git https://github.com/fonsecapeter/shellectric-color-scheme ~/Projects/shellectric-color-scheme

# install oh_my_zsh
# -----------------------------------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh autosuggestions
clone_from_git https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# zsh syntax highlighting
clone_from_git https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# -----------------------------------------

# miso
if [ ! -x "$(command -v miso)" ]; then
  clone_from_git https://github.com/fonsecapeter/miso-buddy ~/Projects/miso-buddy
  cur_dir=$PWD
  cd ~/Projects/miso-buddy
  make
  sudo ln -s "$(realpath ./bin/miso)" "/usr/local/bin/miso"
  cd "${PWD}"
fi
