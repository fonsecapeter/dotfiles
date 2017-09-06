# TODO: something better than all the ifs
if [ ! -f ~/.bash_profile ]; then
  ln -sv dotfiles/bash_profile ~/.bash_profile
fi
if [ ! -f ~/.vimrc ]; then
  ln -sv dotfiles/vimrc ~/.vimrc
fi
if [ ! -f ~/.ctags ]; then
  ln -sv dotfiles/ctags ~/.ctags
fi
if [ ! -f ~/.dircolors ]; then
  ln -sv dotfiles/dircolors ~/.dircolors
fi
if [ ! -f ~/.colordiffrc ]; then
  ln -sv dotfiles/colordiffrc ~/.colordiffrc
fi
if [ ! -f ~/.gitconfig ]; then
  ln -sv dotfiles/gitconfig ~/.gitconfig
fi
if [ ! -f ~/.git-completion.bash ]; then
  ln -sv ~/dotfiles/git-completion.bash ~/.git-completion.bash
fi
if [ ! -d ~/.local/share/konsole ]; then
    mkdir ~/.local/share/konsole
fi
if [ ! -f ~/.local/share/konsole/Peter.colorscheme ]; then
  ln -sv ~/dotfiles/Peter.colorscheme ~/.local/share/konsole/Peter.colorscheme
fi
if [ ! -f ~/.local/share/konsole/Peter.profile ]; then
  ln -sv ~/dotfiles/Peter.profile ~/.local/share/konsole/Peter.profile
fi
if [ ! -f ~/.local/share/konsole/Peter_hidpi.profile ]; then
  ln -sv ~/dotfiles/Peter_hidpi.profile ~/.local/share/konsole/Peter_hidpi.profile
fi
if [ ! -f ~/.config/neofetch/config ]; then
  ln -sv ~/dotfiles/neofetch_config ~/.config/neofetch/config
fi
if [ ! -d ~/.ipython ]; then
  ln -sv ~/dotfiles/ipython ~/.ipython
fi
if [ ! -f ~/.pryrc ]; then
  ln -sv ~/dotfiles/pryrc ~/.pryrc
fi
if [ ! -f ~/.peter-notes.yml ]; then
  ln -sv ~/dotfiles/peter-notes.yml ~/.peter-notes.yml
fi
