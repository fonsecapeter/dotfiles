#!/usr/bin/env bash
set -eu -o pipefail
source ~/dotfiles/dot/bash/src/colors.sh
source ~/dotfiles/dot/bash/src/printing.sh

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
echo
echo $bold
echo "--> ${purple}Setting up rbenv"
echo $reset
echo
~/dotfiles/src/common/set_up_rbenv.sh
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
