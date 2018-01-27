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

## Boot the pi
  - Eject SD Card and put it in the pi
  - Find it's ip (go to wifi website or `arp -a`)
  - `raspi-config` to change creds and expand
    - `raspi-config --expand-rootfs` if not there
    - `sudo reboot`
  - `curl -sSL https://get.docker.com | sh`

## Customize bash
  - update:
    - `vi ~/.bash_profile`
    - `sudo vi /etc/motd`
    - `touch ~/.welcome.sh`
