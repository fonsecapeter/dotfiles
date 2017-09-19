source ~/dotfiles/bash_extras/colors.sh
cur_dir=$PWD
# or forget about ppa and install with
# wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/arc-kde/master/install-arc-kde-home.sh | sh
# or
# wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/arc-kde/master/install-arc-kde-root.sh | sh
# and remove with
# wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/arc-kde/master/remove-arc-kde.sh | sh
sudo apt install -y arc-kde kvantum papirus-icon-theme paper-cursor-theme
if [ ! -d ~/Projects ]; then
    mkdir ~/Projects
fi

if [ ! -d ~/Projects/peter_mono ]; then
    sudo git clone https://github.com/fonsecapeter/peter_mono ~/Projects/peter_mono
    sudo chown -R $USER ~/Projects/peter_mono
    sudo chgrp -R $(id -g -n $USER) ~/Projects/peter_mono
    cd ~/Projects/peter_mono
    sudo git checkout extras
    sudo git pull origin extras
    make init
    make build
    make install
    cd $cur_dir
else
    echo $orange
    echo
    echo "       Peter Mono already installed!"
    echo
    echo $reset
fi
