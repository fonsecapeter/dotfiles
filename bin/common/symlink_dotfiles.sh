# TODO: something better than all the ifs
if [ ! -f ~/.bash_profile ]; then
  ln -sv dotfiles/dot/bash/bash_profile ~/.bash_profile
fi
if [ ! -f ~/.vimrc ]; then
  ln -sv dotfiles/dot/vim/vimrc ~/.vimrc
fi
if [ ! -f ~/.ctags ]; then
  ln -sv dotfiles/dot/ctags ~/.ctags
fi
if [ ! -f ~/.dircolors ]; then
  ln -sv dotfiles/dot/bash/dircolors ~/.dircolors
fi
if [ ! -f ~/.colordiffrc ]; then
  ln -sv dotfiles/dot/colordiffrc ~/.colordiffrc
fi
if [ ! -f ~/.gitconfig ]; then
  ln -sv dotfiles/dot/git/gitconfig ~/.gitconfig
fi
if [ ! -f ~/.git-completion.bash ]; then
  ln -sv ~/dotfiles/dot/git/git-completion.bash ~/.git-completion.bash
fi
if [ ! -d ~/.local/share/konsole ]; then
    mkdir ~/.local/share/konsole
fi
if [ ! -f ~/.local/share/konsole/Shellectric.colorscheme ]; then
  ln -sv ~/Projects/shellectric-color-scheme/Shellectric.colorscheme ~/.local/share/konsole/Shellectric.colorscheme
fi
if [ ! -f ~/.local/share/konsole/Peter.colorscheme ]; then
  ln -sv ~/dotfiles/dot/konsole/Peter.colorscheme ~/.local/share/konsole/Peter.colorscheme
fi
if [ ! -f ~/.local/share/konsole/Peter.profile ]; then
  ln -sv ~/dotfiles/dot/konsole/Peter.profile ~/.local/share/konsole/Peter.profile
fi
if [ ! -f ~/.local/share/konsole/Peter_hidpi.profile ]; then
  ln -sv ~/dotfiles/dot/konsole/Peter_hidpi.profile ~/.local/share/konsole/Peter_hidpi.profile
fi
if [ ! -f ~/.config/neofetch/config ]; then
  ln -sv ~/dotfiles/dot/neofetch_config ~/.config/neofetch/config
fi
if [ ! -d ~/.ipython ]; then
  ln -sv ~/dotfiles/dot/python/ipython ~/.ipython
fi
if [ ! -f ~/.pryrc ]; then
  ln -sv ~/dotfiles/dot/ruby/pryrc ~/.pryrc
fi
if [ ! -f ~/.peter-notes.yml ]; then
  ln -sv ~/dotfiles/dot/peter-notes.yml ~/.peter-notes.yml
fi
if [ ! -f ~/.agignore ]; then
  ln -sv ~/dotfiles/dot/agignore ~/.agignore
fi
if [ ! -f ~/.zshrc ]; then
  ln -sv ~/dotfiles/dot/zsh/zshrc ~/.zshrc
fi
if [ ! -f ~/.oh-my-zsh/themes/shellectric.zsh-theme ]; then
  ln -sv ~/dotfiles/dot/zsh/shellectric.zsh-theme ~/.oh-my-zsh/themes/shellectric.zsh-theme
fi
if [ ! -f ~/.oh-my-zsh/themes/shellectric-verbose.zsh-theme ]; then
  ln -sv ~/dotfiles/dot/zsh/shellectric-verbose.zsh-theme ~/.oh-my-zsh/themes/shellectric-verbose.zsh-theme
fi
