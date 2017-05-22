# add 1gb swap file for machine with no swap partition
sudo fallocate -l 1g /mnt/1gb.swap
sudo chmod 600 /mnt/1gb.swap
sudo mkswap /mnt/1gb.swap
sudo swapon /mnt/1gb.swap
cat /proc/swaps
echo '/mnt/1gb.swap swap swap defaults 0 0' | sudo tee -a /etc/fstab
cat /etc/fstab
free -h
reboot
