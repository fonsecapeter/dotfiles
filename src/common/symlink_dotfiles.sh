source ~/dotfiles/src/common/symlink_stuff.sh

# basic
# -----------------------------------------
symlink_file "${HOME}/dotfiles/dot/ctags" "${HOME}/.ctags"
symlink_file "${HOME}/dotfiles/dot/agignore" "${HOME}/.agignore"
symlink_file "${HOME}/dotfiles/dot/colordiffrc" "${HOME}/.colordiffrc"
symlink_file "${HOME}/dotfiles/dot/bash/dircolors" "${HOME}/.dircolors"
symlink_file "${HOME}/dotfiles/dot/bash/bash_profile" "${HOME}/.bash_profile"
symlink_file "${HOME}/dotfiles/dot/peter-notes.yml" "${HOME}/.peter-notes.yml"
# -----------------------------------------

# colors
# -----------------------------------------

# git
# -----------------------------------------
symlink_file "${HOME}/dotfiles/dot/git/gitconfig" "${HOME}/.gitconfig"
# symlink_file "${HOME}/dotfiles/dot/git/git-completion.bash" "${HOME}/.git-completion.bash"  # zsh doesn't like this
# -----------------------------------------

# python
# -----------------------------------------
symlink_dir "${HOME}/dotfiles/dot/python/ipython" "${HOME}/.ipython"
# -----------------------------------------

# ruby
# -----------------------------------------
symlink_file "${HOME}/dotfiles/dot/ruby/pryrc" "${HOME}/.pryrc"
# -----------------------------------------

# vim
# -----------------------------------------
symlink_file "${HOME}/dotfiles/dot/vim/vimrc" "${HOME}/.vimrc"
sudo_symlink_file "${HOME}/dotfiles/dot/vim/shellectric_airline_theme.vim" "${HOME}/.vim/bundle/vim-airline/autoload/airline/themes/shellectric.vim"
# -----------------------------------------

# atom (commented out bc i use vscode now)
# -----------------------------------------
# symlink_file "${HOME}/dotfiles/dot/atom/config.cson" "${HOME}/.atom/config.cson"
# symlink_file "${HOME}/dotfiles/dot/atom/init.coffee" "${HOME}/.atom/init.coffee"
# symlink_file "${HOME}/dotfiles/dot/atom/keymap.cson" "${HOME}/.atom/keymap.cson"
# symlink_file "${HOME}/dotfiles/dot/atom/package.list" "${HOME}/.atom/package.list"
# symlink_file "${HOME}/dotfiles/dot/atom/snippets.cson" "${HOME}/.atom/snippets.cson"
# symlink_file "${HOME}/dotfiles/dot/atom/styles.less" "${HOME}/.atom/styles.less"
# -----------------------------------------

# zsh
# -----------------------------------------
if [ ! -d "${HOME}/.oh-my-zsh/custom/themes" ]; then
    mkdir -p "${HOME}/.oh-my-zsh/custom/themes"
fi
symlink_file "${HOME}/dotfiles/dot/zsh/zshrc" "${HOME}/.zshrc"
symlink_file "${HOME}/dotfiles/dot/zsh/shellectric.zsh-theme" "${HOME}/.oh-my-zsh/custom/themes/shellectric.zsh-theme"
# -----------------------------------------

# httpie
# -----------------------------------------
symlink_dir "${HOME}/dotfiles/dot/httpie" "${HOME}/.httpie"
# -----------------------------------------


symlink_file "${HOME}/dotfiles/dot/hyper/hyper.js" "${HOME}/.hyper.js"
