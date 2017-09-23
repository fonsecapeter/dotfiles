rbenv install 2.4.2
rbenv global 2.4.2

rbenv exec gem install bundler peter-notes pry colorize

rbenv rehash

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
