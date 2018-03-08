# ipython
# alias ipython='ipython3'
# export MYPYPATH=~/Projects/mypy-django
alias py=ipython3
alias py3=py
alias py2=ipython

alias activate='. venv/bin/activate'

# random django secret key generator
function django_secret() { python -c "import string,random; uni=string.ascii_letters+string.digits+string.punctuation; print repr(''.join([random.SystemRandom().choice(uni) for i in range(random.randint(45,50))]))" ;}

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
