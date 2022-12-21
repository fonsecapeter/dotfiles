# export TERM=xterm-16color
export LSCOLORS="bxBxhxfxdxhxhxhxhxfxfx"
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:/opt/homebrew/bin:${HOME}/.poetry/bin:${PATH}"
MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"
EDITOR=vim
eval `dircolors -b ~/.dircolors`

# stop <C-s> from halting terminal output
# bind -r '\C-s'
stty -ixon
