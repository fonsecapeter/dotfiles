if [ ! -d ~/Projects ]; then
  mkdir -v ~/Projects
fi
# pip3 install hangups
sudo pip3 install ipython[all]
source ~/dotfiles/bin/common/install_shellectric_colors.sh

# install oh_my_zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
