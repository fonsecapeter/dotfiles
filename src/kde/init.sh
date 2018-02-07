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
~/dotfiles/src/kde/install_tools.sh
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
~/dotfiles/src/kde/set_up_rbenv.sh
echo
echo $bold
echo "--> ${purple}Setting up node with n"
echo $reset
echo
~/dotfiles/src/kde/set_up_nodejs_n.sh
echo

echo $bold
echo "--> ${purple}Installing ui extensions"
echo $reset
echo
~/dotfiles/src/kde/install_ui_extensions.sh
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
echo
echo $bold
echo '    Be sure to also:'
echo '      - Open dotfiles/bashrc and follow directions'
echo '      - Go to https://www.thefanclub.co.za/overgrive'
echo '        and install overGrive'
echo '      - Change your themes'
echo $reset
echo
