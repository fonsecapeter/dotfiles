#!/usr/bin/env bash
set -eu -o pipefail
source ~/dotfiles/dot/bash/profile/colors.sh
source ~/dotfiles/dot/bash/profile/tools/printing.sh

print_init_title 'Fresh Install Automated'

print_init_step 'Installing %s' 'tools'
~/dotfiles/src/ubuntu/install_apts.sh

print_init_step 'Setting up %s' 'vim'
~/dotfiles/src/common/customize_vim.sh

print_init_step 'Setting up %s' 'rbenv'
~/dotfiles/src/kde/set_up_rbenv.sh

print_init_step 'Setting up %s with n' 'node'
~/dotfiles/src/kde/set_up_nodejs_n.sh

print_init_step 'Installing %s' 'crystal'
~/dotfiles/src/ubuntu/install_crystal.sh

print_init_step 'Installing %s' 'gui apps'
~/dotfiles/src/ubuntu/install_snaps.sh

print_init_step 'Symlinking %s' 'dotfiles'
~/dotfiles/src/common/symlink_dotfiles.sh

print_init_title 'Finished 🎉'
echo $bold
echo '    Be sure to also:'
echo '      - Go to https://www.thefanclub.co.za/overgrive'
echo '        and install overGrive'
echo $reset
echo
