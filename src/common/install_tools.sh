source ~/dotfiles/src/common/clone_from_git.sh
mkdir ~/Projects

sudo pip3 install ipython[all]

# shellectric colors
clone_from_git \
  fonsecapeter/shellectric-color-scheme \
  ~/Projects/shellectric-color-scheme

# install oh_my_zsh
# -----------------------------------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

readonly ZSH_CUSTOM = ~/.oh-my-zsh/custom/plugins

# zsh autosuggestions
clone_from_git \
  zsh-users/zsh-autosuggestions \
  $ZSH_CUSTOM/zsh-autosuggestions

# zsh syntax highlighting
clone_from_git \
  zsh-users/zsh-syntax-highlighting \
  $ZSH_CUSTOM/zsh-syntax-highlighting

# zsh fzf
clone_from_git junegunn/fzf $ZSH_CUSTOM/fzf
$ZSH_CUSTOM/fzf/install --bin
clone_from_git Treri/fzf-zsh $ZSH_CUSTOM/fzf-zsh
# -----------------------------------------

# atom
apm install --packages-file ~/dotfiles/dot/atom/package.list

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.3


# miso
if [ ! -x "$(command -v miso)" ]; then
  clone_from_git fonsecapeter/miso-buddy ~/Projects/miso-buddy
  cur_dir=$PWD
  cd ~/Projects/miso-buddy
  make
  sudo ln -s "$(realpath ./bin/miso)" "/usr/local/bin/miso"
  cd "${PWD}"
fi
