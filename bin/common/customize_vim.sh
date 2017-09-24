if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
sudo vim -c 'PluginInstall' -c 'qa!'
sudo ln -sv ~/dotfiles/dot/vim/peter_fall_airline_theme.vim ~/.vim/bundle/vim-airline/autoload/airline/themes/peter_fall.vim
