rbenv install 2.5.1
rbenv global 2.5.1

rbenv exec gem install bundler peter-notes pry colorize
rbenv rehash
eval "$(rbenv init -)"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
