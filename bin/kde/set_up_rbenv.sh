if [ ! -d ~/.rbenv ]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  sudo chown -R $USER ~/.rbenv
  sudo chgrp -R $(id -g -n $USER) ~/.rbenv
  ~/.rbenv/bin/rbenv init
  mkdir -vp ~/.rbenv/plugins
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  sudo chown -R $USER ~/.rbenv/plugins/ruby-build
  sudo chgrp -R $(id -g -n $USER) ~/.rbenv/plugins/ruby-build
fi
~/dotfiles/bin/common/set_up_rbenv.sh
