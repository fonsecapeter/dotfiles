#!/usr/bin/env bash
set -eu -o pipefail
source ~/dotfiles/dot/bash/profile/colors.sh
source ~/dotfiles/dot/bash/profile/tools/printing.sh

echo
echo $bold
rule '-'
message_rule " ${red}Fresh Install Automated ${reset}${bold}" '='
rule '-'
echo
echo "--> ${purple}Installing tools"
echo $reset
echo
~/dotfiles/src/osx/install_tools.sh
echo
echo $bold
echo "--> ${purple}Setting up vim"
echo $reset
echo
~/dotfiles/src/common/customize_vim.sh
# echo
# echo $bold
# echo "--> ${purple}Setting up rbenv"
# echo $reset
# echo
# ~/dotfiles/src/common/set_up_rbenv.sh
echo
echo $bold
echo "--> ${purple}Symlinking dotfiles"
echo $reset
echo
~/dotfiles/src/common/symlink_dotfiles.sh
echo
echo $bold
rule '-'
message_rule " ${green}Finished ${reset}${bold}" '='
rule '-'
echo $reset
echo

echo "Import iterm2 keybindings from ~/dotfiles/dot/iterm2/keybindings.itermkeymap"
