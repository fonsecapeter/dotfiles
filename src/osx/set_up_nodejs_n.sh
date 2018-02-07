if [ ! -x "$(command -v n)" ]; then
  brew uninstall node
  sudo rm -rf /usr/local/lib/node_modules
  sudo rm -rf /usr/lib/node_modules
  curl -L -o /tmp/n-install-script https://git.io/n-install
  bash /tmp/n-install-script -y
  exec $SHELL # To re-initialize the PATH variable
fi
