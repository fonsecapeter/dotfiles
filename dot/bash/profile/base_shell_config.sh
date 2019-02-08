# export TERM=xterm-16color
export LSCOLORS="cxBxhxDxgxhxhxhxhxfxfx"
PATH="${HOME}/.poetry/bin:/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
EDITOR=vim
eval `dircolors -b ~/.dircolors`

# stop <C-s> from halting terminal output
# bind -r '\C-s'
stty -ixon
