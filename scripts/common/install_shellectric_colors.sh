source ~/dotfiles/bash_extras/colors.sh
if [ ! -d ~/Projects/shellectric-color-scheme ]; then
    sudo git clone https://github.com/fonsecapeter/shellectric-color-scheme ~/Projects/shellectric-color-scheme
    sudo chown -R $USER ~/Projects/shellectric-color-scheme
    sudo chgrp -R $(id -g -n $USER) ~/Projects/shellectric-color-scheme
else
    echo $orange
    echo
    echo "       Shellectric colors already installed!"
    echo
    echo $reset
fi
