sudo add-apt-repository ppa:fossfreedom/arc-gtk-theme-daily
sudo add-apt-repository ppa:snwh/ppa

sudo apt update && sudo apt full-upgrade
cat ~/dotfiles/src/ubuntu/pkglist \
  | grep -vE '^#' \
  | xargs sudo apt install -y

source ~/dotfiles/src/common/install_tools.sh
