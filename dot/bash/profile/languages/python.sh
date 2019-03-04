# pyenv
if which pyenv > /dev/null; then
  eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

# poetry
export PATH="$HOME/.poetry/bin:$PATH"
if [[ "${SHELL}" =~ 'bash' ]]; then
  poetry completions bash > /etc/bash_completion.d/poetry.bash-completion
fi

# ipython
alias py=ipython

# virtualenv
alias activate='. venv/bin/activate'

# django
alias django-secret="python manage.py shell -c 'from django.core.management import utils; print(utils.get_random_secret_key())'"

pypathify() {
  # my/file/name.py -> my.file.name
  echo "$1" |  sed "s|/|.|g" | sed "s/[.]py//"
}

unpypathify() {
  # my.file.name.py -> my/file/name.py
  slash_path="$(echo "$1" | sed "s|[.]|/|g" | sed "s|/py|.py|")"
  if [[ ${slash_path: -3} != .py ]]; then  # only works with .py files
    slash_path="${slash_path}.py"
  fi;
  echo "${slash_path}"
}
