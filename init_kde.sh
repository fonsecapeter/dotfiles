blue=$(tput setaf 4)
purple=$(tput setaf 5)
orange=$(tput setaf 3)
reset=$(tput sgr0)
cur_dir=$PWD

echo $orange
echo
echo '  ------------- Fresh Install Automated -------------'
echo
echo $blue
echo
echo "  --->${purple} Installing tools"
echo
echo $reset
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo add-apt-repository ppa:jonathonf/vim
sudo add-apt-repository ppa:papirus/arc-kde
sudo add-apt-repository ppa:papirus/papirus
sudo add-apt-repository ppa:snwh/pulp
sudo add-apt-repository universe
# neofetch
if ! type neofetch >/dev/null 2>&1; then
    echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
    curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key
fi

sudo apt update
sudo apt install -y git make tree vim fontforge inkscape gimp python3-pip python3.6 virtualenv xclip sqlite3 screenfetch wget curl fortune cowsay boxes neofetch cmatrix
pip3 install hangups

echo $blue
echo
echo "  --->${purple} Setting up dotfiles"
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

# TODO: make this a function... would be awesome if could pass in callback
if [ ! -d ~/.bash_profile ]; then
    ln -s dotfiles/bash_profile ~/.bash_profile
fi
if [ ! -d ~/.vimrc ]; then
    ln -s dotfiles/vimrc ~/.vimrc
fi
if [ ! -d ~/.dircolors ]; then
    ln -s dotfiles/dircolors ~/.dircolors
fi
if [ ! -d ~/.gitconfig ]; then
    ln -s dotfiles/gitconfig ~/.gitconfig
fi
if [ ! -d ~/.git-completion.bash ]; then
    ln -s ~/dotfiles/git-completion.bash ~/.git-completion.bash
fi
if [ ! -d ~/.local/share/konsole ]; then
    mkdir ~/.local/share/konsole
fi
if [ ! -d ~/.local/share/konsole/Peter.colorscheme ]; then
    ln -s ~/dotfiles/Peter.colorscheme ~/.local/share/konsole/Peter.colorscheme
fi
if [ ! -d ~/.local/share/konsole/Peter.profile ]; then
    ln -s ~/dotfiles/Peter.profile ~/.local/share/konsole/Peter.profile
fi
if [ ! -d ~/.local/share/konsole/Peter_hidpi.profile ]; then
    ln -s ~/dotfiles/Peter_hidpi.profile ~/.local/share/konsole/Peter_hidpi.profile
fi
if [ ! -d ~/.config/neofetch/config ]; then
    ln -s ~/dotfiles/neofetch_config ~/.config/neofetch/config
fi
# notes
gem install peter-notes
if [ ! -f ~/.peter-notes.yml]; then
    ln -s ~/dotfiles/peter-notes.yml ~/.peter-notes.yml
fi

echo $blue
echo
echo "  --->${purple} Setting up vim"
echo
echo $reset
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
sudo vim -c 'PluginInstall' -c 'qa!'
sudo cp ~/dotfiles/peter_fall_airline_theme.vim ~/.vim/bundle/vim-airline/autoload/airline/themes/peter_fall.vim

echo $blue
echo
echo "  --->${purple} Installing ui extensions"
echo
echo $reset
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

echo $blue
echo
echo "  --->${purple} Installing jarbs"
echo
echo $reset
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
screenfetch
