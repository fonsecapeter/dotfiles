# run from flashdrive root
blue=$(tput setaf 4)
purple=$(tput setaf 5)
orange=$(tput setaf 3)
reset=$(tput sgr0)
echo $blue
echo
echo "  --->${purple}Installing dotfiles"
echo
echo $reset
if [ ! -d ~/dotfiles ]; then
    sudo git clone https://www.github.com/fonsecapeter/dotfiles ~/dotfiles
    sudo chown -R $USER ~/dotfiles
    sudo chgrp -R $(id -g -n $USER) ~/dotfiles
else
    echo $orange
    echo
    echo "       Dotfiles already installed!"
    echo
    echo $reset
fi
echo $blue
echo
echo "  --->${purple}Running init.sh"
echo
echo $reset
~/dotfiles/src/kde/add_apt_source.sh
~/dotfiles/bin/init-kde
