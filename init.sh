blue=$(tput setaf 4)
green=$(tput setaf 2)
reset=$(tput sgr0)
cur_dir=$PWD
echo $green
echo
echo '------------- Fresh Install Automated -------------'
echo '================== (assumes kde) =================='
echo
echo $blue
echo
echo '---> Installing tools'
echo
echo $reset
sudo add-apt-repository -y ppa:jonathonf/vim
sudo add-apt-repository -y ppa:papirus/arc-kde
sudo add-apt-repository -y ppa:papirus/papirus
sudo add-apt-repository -y ppa:snwh/pulp
sudo add-apt-repository -y universe
sudo apt update
sudo apt install -y git make tree vim fontforge inkscape python3-pip
pip3 install hangups
if [ ! -d /usr/local/bin/fontforge ]; then
    ln -s /usr/bin/fontforge /usr/local/bin/fontforge
fi
if [ ! -d /usr/local/bin/git ]; then
    ln -s /usr/bin/git /usr/local/bin/git
fi
echo $blue
echo
echo '---> Setting up dotfiles'
echo
echo $reset
if [ ! -d ~/dotfiles ]; then
    sudo git clone https://www.github.com/fonsecapeter/dotfiles ~/dotfiles
fi
if [ ! -d ~/.bash_profile ]; then
    ln -s dotfiles/bash_profile ~/.bash_profile
fi
if [ ! -d ~/.vimrc ]; then
    ln -s dotfiles/vimrc ~/.vimrc
fi
if [ ! -d ~/.dircolors ]; then
    ln -s dotfiles/dircolors ~/.dircolors
fi
if [! -d ~/.gitconfig ]; then
    ln -s dotfiles/gitconfig ~/.gitconfig
fi
if [ ! -d ~/.local/share/konsole ]; then
    mkdir ~/.local/share/konsole
fi
if [ ! -d ~/.local/share/konsole/PeterFall.colorscheme ]; then
    ln -s ~/dotfiles/PeterFall.colorscheme ~/.local/share/konsole/PeterFall.colorscheme
fi
if [ ! -d ~/.local/share/konsole/PeterFall.profile ]; then
    ln -s ~/dotfiles/PeterFall.profile ~/.local/share/konsole/PeterFall.profile
fi
echo $blue
echo
echo '---> Setting up vim'
echo
echo $reset
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
sudo vim -c 'PluginInstall' -c 'qa!'
sudo cp ~/dotfiles/peter_fall_airline_theme.vim ~/.vim/bundle/vim-airline/autoload/airline/themes/peter_fall.vim
echo $blue
echo
echo '---> Setting up ui'
echo
echo $reset
# or forget about ppa and install with
# wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/arc-kde/master/install-arc-kde-home.sh | sh
# or
# wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/arc-kde/master/install-arc-kde-root.sh | sh
# and remove with
# wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/arc-kde/master/remove-arc-kde.sh | sh
sudo apt install -y arc-kde kvantum papirus-icon-theme paper-icon-theme
if [ ! -d ~/Projects]; then
    mkdir ~/Projects
fi
if [ ! -d ~/Projects/peter_mono ]; then
    sudo git clone https://github.com/fonsecapeter/peter_mono ~/Projects/peter_mono
fi
cd ~/Projects/peter_mono
make init
make build
make install
cd $cur_dir

echo $green
echo
echo '==================================================='
echo '                    Finished'
echo '==================================================='
echo $blue
echo 'Be sure to also:'
echo '  - Open dotfiles/bashrc and follow directions'
echo '  - Go to https://www.thefanclub.co.za/overgrive'
echo '    and install overGrive'
echo '  - Change your themes'
echo
echo $reset

