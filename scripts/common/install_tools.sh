if [ ! -d ~/.Projects ]; then
  mkdir -v ~/Projects
fi
# pip3 install hangups
sudo pip3 install ipython[all]
source ~/dotfiles/scripts/common/install_shellectric_colors.sh
