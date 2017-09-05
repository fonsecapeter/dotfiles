source ~/dotfiles/colors.sh
cur_dir=$PWD
if [ ! -d ~/Projects/jarbs ]; then
    sudo git clone https://github.com/fonsecapeter/jarbs ~/Projects/jarbs
    sudo chown -R $USER ~/Projects/jarbs
    sudo chgrp -R $(id -g -n $USER) ~/Projects/jarbs
    cd ~/Projects/jarbs
    make
    cd $cur_dir
else
    echo $orange
    echo
    echo "       Jarbs already installed!"
    echo
    echo $reset
fi
