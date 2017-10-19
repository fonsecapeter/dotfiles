#!/usr/bin/env bash
set -eu -o pipefail
source ~/dotfiles/dot/bash/lib/colors.sh

echo $orange
echo
echo '  ------------- Fresh Install Automated -------------'
echo
echo $blue
echo
echo "  --->${purple} Installing tools"
echo
echo $reset
~/dotfiles/bin/kde/install_tools.sh
echo $blue
echo
echo "  --->${purple} Setting up vim"
echo
echo $reset
~/dotfiles/bin/common/customize_vim.sh
echo $blue
echo
echo "  --->${purple} Setting up rbenv"
echo
echo $reset
~/dotfiles/bin/kde/set_up_rbenv.sh
echo $blue
echo
echo "  --->${purple} Installing ui extensions"
echo
echo $reset
~/dotfiles/bin/kde/install_ui_extensions.sh
echo $blue
echo
echo "  --->${purple} Symlinking dotfiles"
echo
echo $reset
~/dotfiles/bin/common/symlink_dotfiles.sh
echo $orange
echo
echo '  -------------------- Finished ---------------------'
echo
echo $blue
echo '    Be sure to also:'
echo '      - Open dotfiles/bashrc and follow directions'
echo '      - Go to https://www.thefanclub.co.za/overgrive'
echo '        and install overGrive'
echo '      - Change your themes'
echo
echo $reset
