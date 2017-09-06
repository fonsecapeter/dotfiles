# TODO: something better than all the ifs
if [ ! -f ~/.bash_profile ]; then
    ln -s dotfiles/bash_profile ~/.bash_profile
fi
if [ ! -f ~/.vimrc ]; then
    ln -s dotfiles/vimrc ~/.vimrc
fi
if [ ! -f ~/.ctags ]; then
    ln -s dotfiles/ctags ~/.ctags
fi
if [ ! -f ~/.dircolors ]; then
    ln -s dotfiles/dircolors ~/.dircolors
fi
if [ ! -f ~/.colordiffrc ]; then
    ln -s dotfiles/colordiffrc ~/.colordiffrc
fi
if [ ! -f ~/.gitconfig ]; then
    ln -s dotfiles/gitconfig ~/.gitconfig
fi
if [ ! -f ~/.git-completion.bash ]; then
    ln -s ~/dotfiles/git-completion.bash ~/.git-completion.bash
fi
if [ ! -d ~/.local/share/konsole ]; then
    mkdir ~/.local/share/konsole
fi
if [ ! -f ~/.local/share/konsole/Peter.colorscheme ]; then
    ln -s ~/dotfiles/Peter.colorscheme ~/.local/share/konsole/Peter.colorscheme
fi
if [ ! -f ~/.local/share/konsole/Peter.profile ]; then
    ln -s ~/dotfiles/Peter.profile ~/.local/share/konsole/Peter.profile
fi
if [ ! -f ~/.local/share/konsole/Peter_hidpi.profile ]; then
    ln -s ~/dotfiles/Peter_hidpi.profile ~/.local/share/konsole/Peter_hidpi.profile
fi
if [ ! -f ~/.config/neofetch/config ]; then
    ln -s ~/dotfiles/neofetch_config ~/.config/neofetch/config
fi
if [ ! -d ~/.ipython ]; then
    ln -s ~/dotfiles/ipython ~/.ipython
fi
if [ ! -d ~/.pryrc ]; then
    ln -s ~/dotfiles/pryrc ~/.pryrc
fi
if [ ! -f ~/.peter-notes.yml ]; then
    ln -s ~/dotfiles/peter-notes.yml ~/.peter-notes.yml
fi
