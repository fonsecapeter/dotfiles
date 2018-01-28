[guide](https://medium.com/@danidudas/install-raspbian-jessie-lite-and-setup-wi-fi-without-access-to-command-line-or-using-the-network-97f065af722e)

# Fresh Raspberry Pi Setup

## Flash SD Card
  - Download and install latest [rasbian light](https://www.raspberrypi.org/downloads/raspbian/)
  - Mount SD Card (with USB adapter)
  - Flash with [Etcher](https://etcher.io)

## Enable SSH
  - `touch /Volumes/boot/ssh`

## Enable Wifi
  - `cp ~/dotfiles/dot/raspberry/wpa_supplicant.conf /Volumes/boot`
  - Add password to `psk`
    - keep `"`s arround `ssid` and `psk`

## Boot the Pi
  - Eject SD Card and put it in the pi
  - Find it's ip (go to wifi website or `arp -a`)
  - `raspi-config` to change creds and expand
    - `raspi-config --expand-rootfs` if not there
    - `sudo reboot`
  - `curl -sSL https://get.docker.com | sh`

## Update System
  - `sudo apt update && sudo apt upgrade && sudo apt install vim`
  - `vim ~/.vimrc` copy from here
  - `mkdir -p .vim/colors`
  - `vim .vim/colors/noctu.vim` <= copy from [here](https://raw.githubusercontent.com/noahfrederick/vim-noctu/master/colors/noctu.vim)
  - `vim ~/.bash_profile` update from here
  - `vim ~/.dircolors` copy from common
  - `sudo vim /etc/motd` empty
  - `touch ~/.welcome.sh` copy from here

## Install Docker
  - `curl -sSL https://get.docker.com | sh`
  - `sudo usermod -aG docker pi`
