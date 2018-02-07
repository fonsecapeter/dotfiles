if [ ! -z n ]; then
  sudo npm install -g n
  sudo n stable
  echo 'Plz symlink your new node'
  echo '(n will manage version linking for you after)'
  echo 'sudo ln -sf /usr/local/n/versions/node/<N_VERSION>/bin/node /usr/bin/nodejs'

fi
