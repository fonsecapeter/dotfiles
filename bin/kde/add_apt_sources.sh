sudo add-apt-repository ppa:jonathonf/python-3.6
sudo add-apt-repository ppa:jonathonf/vim
sudo add-apt-repository ppa:papirus/arc-kde
sudo add-apt-repository ppa:papirus/papirus
sudo add-apt-repository ppa:snwh/pulp
sudo add-apt-repository universe
sudo add-apt-repository ppa:twodopeshaggy/ccat
# neofetch
if ! type neofetch >/dev/null 2>&1; then
    echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
    curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key
fi
