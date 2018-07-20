source ~/dotfiles/src/common/symlink_stuff.sh

if [ ! -x "$(command -v vim)" ]; then
  sudo_symlink_file "$(which vi)" /usr/local/bin/vim
fi
~/dotfiles/src/common/customize_vim.sh
