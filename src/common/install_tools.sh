source ~/dotfiles/src/common/clone_from_git.sh
mkdir ~/Projects

# python
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

# shellectric colors
clone_from_git \
  fonsecapeter/shellectric-color-scheme \
  ~/Projects/shellectric-color-scheme

# install oh_my_zsh
# -----------------------------------------
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

readonly ZSH_CUSTOM_PLUGINS=~/.oh-my-zsh/custom/plugins

# zsh autosuggestions
clone_from_git \
  zsh-users/zsh-autosuggestions \
  $ZSH_CUSTOM_PLUGINS/zsh-autosuggestions

# zsh syntax highlighting
clone_from_git \
  zsh-users/zsh-syntax-highlighting \
  $ZSH_CUSTOM_PLUGINS/zsh-syntax-highlighting

# zsh fzf
clone_from_git junegunn/fzf $ZSH_CUSTOM_PLUGINS/fzf
$ZSH_CUSTOM_PLUGINS/fzf/install --bin
clone_from_git Treri/fzf-zsh $ZSH_CUSTOM_PLUGINS/fzf-zsh
# -----------------------------------------

# atom (commented out bc i use vscode now)
# echo "Would you like to install atom dependencies (y/n)? "
# read answer
# if [ "$answer" != "${answer#[Yy]}" ]; then
#   apm install --packages-file ~/dotfiles/dot/atom/package.list
# fi
