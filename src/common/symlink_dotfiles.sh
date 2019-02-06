source ~/dotfiles/src/common/symlink_stuff.sh

# basic
# -----------------------------------------
symlink_file ~/dotfiles/dot/ctags ~/.ctags
symlink_file ~/dotfiles/dot/agignore ~/.agignore
symlink_file ~/dotfiles/dot/colordiffrc ~/.colordiffrc
symlink_file ~/dotfiles/dot/bash/dircolors ~/.dircolors
symlink_file ~/dotfiles/dot/bash/bash_profile ~/.bash_profile
symlink_file ~/dotfiles/dot/peter-notes.yml ~/.peter-notes.yml
# -----------------------------------------

# colors
# -----------------------------------------
if [ ! -d ~/.local/share/konsole ]; then
    mkdir ~/.local/share/konsole
fi
symlink_file ~/Projects/shellectric-color-scheme/Shellectric.colorscheme ~/.local/share/konsole/Shellectric.colorscheme
symlink_file ~/dotfiles/dot/konsole/Peter.profile ~/.local/share/konsole/Peter.profile
symlink_file ~/dotfiles/dot/konsole/Peter_hidpi.profile ~/.local/share/konsole/Peter_hidpi.profile
# -----------------------------------------

# git
# -----------------------------------------
symlink_file ~/dotfiles/dot/git/gitconfig ~/.gitconfig
# symlink_file ~/dotfiles/dot/git/git-completion.bash ~/.git-completion.bash  # zsh doesn't like dis
# -----------------------------------------

# python
# -----------------------------------------
symlink_dir ~/dotfiles/dot/python/ipython ~/.ipython
# -----------------------------------------

# ruby
# -----------------------------------------
symlink_file ~/dotfiles/dot/ruby/pryrc ~/.pryrc
# -----------------------------------------

# vim
# -----------------------------------------
symlink_file ~/dotfiles/dot/vim/vimrc ~/.vimrc
symlink_file ~/dotfiles/dot/vim/shellectric_airline_theme.vim ~/.vim/bundle/vim-airline/autoload/airline/themes/shellectric.vim
# -----------------------------------------

# atom
# -----------------------------------------
symlink_file ~/dotfiles/dot/atom/config.cson ~/.atom/config.cson
symlink_file ~/dotfiles/dot/atom/init.coffee ~/.atom/init.coffee
symlink_file ~/dotfiles/dot/atom/keymap.cson ~/.atom/keymap.cson
symlink_file ~/dotfiles/dot/atom/package.list ~/.atom/package.list
symlink_file ~/dotfiles/dot/atom/snippets.cson ~/.atom/snippets.cson
symlink_file ~/dotfiles/dot/atom/styles.less ~/.atom/styles.less
# -----------------------------------------

# zsh
# -----------------------------------------
mkdir -p ~/.oh-my-zsh/custom/themes
symlink_file ~/dotfiles/dot/zsh/zshrc ~/.zshrc
symlink_file ~/dotfiles/dot/zsh/shellectric.zsh-theme ~/.oh-my-zsh/custom/themes/shellectric.zsh-theme
# -----------------------------------------

# httpie
# -----------------------------------------
symlink_dir ~/dotfiles/dot/httpie ~/.httpie
# -----------------------------------------


symlink_file ~/dotfiles/dot/hyper/hyper.js ~/.hyper.js
