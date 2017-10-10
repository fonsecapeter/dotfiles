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
~/dotfiles/bin/osx/install_tools.sh
echo $blue
echo
echo "  --->${purple} Installing jarbs"
echo
echo $reset
~/dotfiles/bin/common/install_jarbs.sh
echo $blue
echo
echo "  --->${purple} Symlinking dotfiles"
echo
echo $reset
~/dotfiles/bin/common/symlink_dotfiles.sh
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
~/dotfiles/bin/common/set_up_rbenv.sh
echo $orange
echo
echo '  -------------------- Finished ---------------------'
echo
echo $reset
