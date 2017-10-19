source ~/dotfiles/bin/common/clone_from_git.sh
source ~/dotfiles/bin/common/symlink_stuff.sh

clone_from_git https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo vim -c 'PluginInstall' -c 'qa!'
