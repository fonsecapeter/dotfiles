source ~/dotfiles/src/common/clone_from_git.sh
source ~/dotfiles/src/common/symlink_stuff.sh

clone_from_git VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
sudo vim -c 'PluginInstall' -c 'qa!'
